within BuildingSystems.Buildings.Airvolumes.Interfaces;
model Boundary
  "Boundary model for finite volume (FV) air element"
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid PortF
    "Fluid port to the finite volume air element"
    annotation (Placement(transformation(extent={{0,-10},{20,10}}),
      iconTransformation(extent={{0,-10},{20,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a PortHeat
    "Heat port to the finite volume air element (heat conduction within the air)"
    annotation (Placement(transformation(extent={{0,-50},{20,-30}}),
      iconTransformation(extent={{0,-50},{20,-30}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPort surfaceToAirPort
    "Interface port to the surface model"
    annotation (Placement(transformation(extent={{-20,-10},{0,10}}),
      iconTransformation(extent={{-20,-10},{0,10}})));
  parameter BuildingSystems.Buildings.Types.OrientationType location = BuildingSystems.Buildings.Types.OrientationType.West
    "Orientation of the boundary: south, north, west, east, floor, roof"
    annotation (Evaluate=true, Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length posX
    "Boundary-FV-connection absolut central position X"
    annotation (Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length posY
    "Boundary-FV-connection absolut central position Y"
     annotation (Evaluate=true, Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length posZ
    "Boundary-FV-connection absolut central position Z"
     annotation (Evaluate=true, Dialog(tab = "General", group = "Geometry"));
  final parameter Modelica.SIunits.Velocity[3] vVec = {0,0,0};
  final parameter Modelica.SIunits.Density rhoAir = 1.2
    annotation (HideResult=true);
  constant Modelica.SIunits.SpecificHeatCapacity cp = 1005.00;
  // water vaper from moisture transfer of surfaces - default/ start value
  constant Modelica.SIunits.MassFraction x_constant = 0.005
    "Air moisture";
  constant Modelica.SIunits.Velocity vAir_constant = 0.0
    "Air velocity";
  constant Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAir_constant = 0.0
    "Direction of the air flow";
  // about the air
  constant Modelica.SIunits.ThermalConductivity lambdaAir=0.0262;
  parameter Boolean opening = false
    "Flag for opening: true -> opening and false ->solid surface"
    annotation (Evaluate=true, Dialog(tab = "General", group = "Opening"));
  parameter Modelica.SIunits.Temp_K TAmb = 273.15 + 20.0
    "Ambient air temperature (if opening == true)"
    annotation (Evaluate=true, Dialog(tab = "General", group = "Opening"));
  parameter Modelica.SIunits.MassFlowRate m_flow = 0.0
    "Air mass flow through the opening (if opening == true)"
     annotation (Evaluate=true, Dialog(tab = "General", group = "Opening"));
equation
  if opening then
    if (location == BuildingSystems.Buildings.Types.OrientationType.East or
        location == BuildingSystems.Buildings.Types.OrientationType.West) then
      PortHeat.Q_flow = lambdaAir*((PortF.dim[2]*PortF.dim[3])/abs(PortF.pos[1] - posX)) * (PortHeat.T - TAmb);
    elseif (location == BuildingSystems.Buildings.Types.OrientationType.Roof or
            location == BuildingSystems.Buildings.Types.OrientationType.Floor) then
      PortHeat.Q_flow = lambdaAir*((PortF.dim[1]*PortF.dim[3])/abs(PortF.pos[2] - posY)) * (PortHeat.T - TAmb);
    elseif (location == BuildingSystems.Buildings.Types.OrientationType.North or
            location == BuildingSystems.Buildings.Types.OrientationType.South) then
      PortHeat.Q_flow = lambdaAir*((PortF.dim[1]*PortF.dim[2])/abs(PortF.pos[3] - posZ)) * (PortHeat.T - TAmb);
    else
      PortHeat.Q_flow = 0.0;
    end if;
    surfaceToAirPort.heatPort.T = 273.15 + 20.0; // dummy value
  else
    connect(PortHeat,surfaceToAirPort.heatPort);
  end if;

  surfaceToAirPort.angleDegAir = angleDegAir_constant;
  surfaceToAirPort.vAir = vAir_constant;
  surfaceToAirPort.moisturePort.x = x_constant;

  if (location == BuildingSystems.Buildings.Types.OrientationType.East or
      location == BuildingSystems.Buildings.Types.OrientationType.West) then
    PortF.visgr1 = (2*PortF.vVec[2])/(PortF.dim[1]/2);
    PortF.visgr2 = (2*PortF.vVec[3])/(PortF.dim[1]/2);
    if opening then
      PortF.m_flow = m_flow*tanh(time/120);
    else
      PortF.m_flow = rhoAir*(PortF.dim[2]*PortF.dim[3])*vVec[1];
    end if;
  elseif (location == BuildingSystems.Buildings.Types.OrientationType.Roof or
          location == BuildingSystems.Buildings.Types.OrientationType.Floor) then
    PortF.visgr1 = (2*PortF.vVec[1])/(PortF.dim[2]/2);
    PortF.visgr2 = (2*PortF.vVec[3])/(PortF.dim[2]/2);
    if opening then
      PortF.m_flow = m_flow*tanh(time/120);
    else
      PortF.m_flow = rhoAir*(PortF.dim[1]*PortF.dim[3])*vVec[2];
    end if;
  elseif (location == BuildingSystems.Buildings.Types.OrientationType.North or
          location == BuildingSystems.Buildings.Types.OrientationType.South) then
    PortF.visgr1 = (2*PortF.vVec[1])/(PortF.dim[3]/2);
    PortF.visgr2 = (2*PortF.vVec[2])/(PortF.dim[3]/2);
    if opening then
      PortF.m_flow = m_flow*tanh(time/120);
    else
      PortF.m_flow = rhoAir*(PortF.dim[1]*PortF.dim[2])*vVec[3];
    end if;
  else
    PortF.visgr1 = 0.0;
    PortF.visgr2 = 0.0;
    PortF.m_flow = 0.0;
  end if;

  PortF.rho = rhoAir;
  PortF.moist.m_flow = 0.0;
  if opening then
    PortF.h = cp*TAmb;
  else
    PortF.h = 0.0;
  end if;

  annotation (HideResult=true,HideResult=false,HideResult=true,HideResult=true,
    Diagram(graphics),Icon(graphics={
    Rectangle(extent={{-10,80},{10,-80}},fillColor={215,215,215},
      fillPattern=FillPattern.Solid,pattern=LinePattern.None),
    Text(extent={{-44,-88},{48,-116}}, lineColor={0,0,255},fillColor={230,230,230},
      fillPattern = FillPattern.Solid,textString="%name"),
      Line(points={{-40,40},{-30,50}},color={28,108,200},thickness=1),
      Line(points={{-40,40},{-30,30}},color={28,108,200},thickness=1),
      Line(points={{-40,40},{40,40}},color={28,108,200},thickness=1),
      Rectangle(extent={{-10,60},{10,20}},lineColor={28,108,200},
        lineThickness=1,fillColor={28,108,200},fillPattern = FillPattern.Solid),
      Line(points={{30,50},{40,40}},color={28,108,200},thickness=1),
      Line(points={{30,30},{40,40}},color={28,108,200},thickness=1)}),
Documentation(info="<html>
<p>
This is a model of an boundary (solid surface or opening) of a discretized air volume model.
</p>
</html>", revisions="<html>
<ul>
November 8, 2021, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Boundary;
