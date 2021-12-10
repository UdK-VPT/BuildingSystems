within BuildingSystems.Buildings.Airvolumes.Interfaces;
model Boundary
  "Boundary model for finite volume (FV) air element"
  package Medium = BuildingSystems.Media.Air;
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid PortF
    "Fluid port to the finite volume air element"
    annotation (Placement(transformation(extent={{0,-8},{20,12}}),
      iconTransformation(extent={{0,-8},{20,12}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a PortHeat
    "Heat port to the finite volume air element
    (heat conduction within the air and heat transfer to the boundary)"
    annotation (Placement(transformation(extent={{0,-50},{20,-30}}),
      iconTransformation(extent={{0,-50},{20,-30}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPort surfaceToAirPort
    "Interface port to the surface model"
    annotation (Placement(transformation(extent={{-20,-50},{0,-30}}),
      iconTransformation(extent={{-20,-50},{0,-30}})));
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
  parameter Modelica.SIunits.Area A = 1.0
    "Area opening"
      annotation (Evaluate=true, Dialog(tab = "General", group = "Opening"));
  parameter Real CD = 0.5
    "Discharge coefficent"
      annotation (Evaluate=true, Dialog(tab = "General", group = "Opening"));
  BuildingSystems.Airflow.Multizone.Orifice ori(
    redeclare package Medium = Medium,
    forceErrorControlOnFlow=true,
    A=A,
    CD=CD)
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a(
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-20,-8},{0,12}}),
      iconTransformation(extent={{-20,-8},{0,12}})));
  BuildingSystems.Fluid.Sources.Boundary_pT bou(
    redeclare package Medium = Medium,
    use_Xi_in=true,
    use_p_in=true,
    use_T_in=true,
    nPorts=1)
    annotation (Placement(transformation(extent={{68,32},{52,48}})));
  Modelica.Blocks.Sources.RealExpression pAir(y=PortF.p)
    annotation (Placement(transformation(extent={{86,44},{76,58}})));
  Modelica.Blocks.Sources.RealExpression TAir(y=PortHeat.T)
    annotation (Placement(transformation(extent={{98,36},{88,50}})));
  Modelica.Blocks.Sources.RealExpression xAir(y=PortF.moist.x)
    annotation (Placement(transformation(extent={{86,30},{76,44}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTem(
    m_flow_nominal=0.1,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{28,30},{48,50}})));
equation
  if opening then
    if (location == BuildingSystems.Buildings.Types.OrientationType.East or
        location == BuildingSystems.Buildings.Types.OrientationType.West) then
      PortHeat.Q_flow = lambdaAir*((PortF.dim[2]*PortF.dim[3])/abs(PortF.pos[1] - posX))
        * (PortHeat.T - senTem.T);
    elseif (location == BuildingSystems.Buildings.Types.OrientationType.Roof or
            location == BuildingSystems.Buildings.Types.OrientationType.Floor) then
      PortHeat.Q_flow = lambdaAir*((PortF.dim[1]*PortF.dim[3])/abs(PortF.pos[2] - posY))
        * (PortHeat.T - senTem.T);
    elseif (location == BuildingSystems.Buildings.Types.OrientationType.North or
            location == BuildingSystems.Buildings.Types.OrientationType.South) then
      PortHeat.Q_flow = lambdaAir*((PortF.dim[1]*PortF.dim[2])/abs(PortF.pos[3] - posZ))
        * (PortHeat.T - senTem.T);
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
  elseif (location == BuildingSystems.Buildings.Types.OrientationType.Roof or
          location == BuildingSystems.Buildings.Types.OrientationType.Floor) then
    PortF.visgr1 = (2*PortF.vVec[1])/(PortF.dim[2]/2);
    PortF.visgr2 = (2*PortF.vVec[3])/(PortF.dim[2]/2);
  elseif (location == BuildingSystems.Buildings.Types.OrientationType.North or
          location == BuildingSystems.Buildings.Types.OrientationType.South) then
    PortF.visgr1 = (2*PortF.vVec[1])/(PortF.dim[3]/2);
    PortF.visgr2 = (2*PortF.vVec[2])/(PortF.dim[3]/2);
  else
    PortF.visgr1 = 0.0;
    PortF.visgr2 = 0.0;
    PortF.m_flow = 0.0;
  end if;

  PortF.rho = rhoAir;
  PortF.moist.m_flow = 0.0;
  if opening then
    PortF.m_flow = ori.port_b.m_flow;
    PortF.h = cp*senTem.T;
  else
    PortF.h = 0.0;
    PortF.m_flow = 0.0;
  end if;

  connect(port_a, ori.port_a)
    annotation (Line(points={{-10,2},{-6,2},{-6,40},{0,40}},
                                               color={0,127,255}));
  connect(bou.Xi_in[1], xAir.y) annotation (Line(points={{69.6,36.8},{72.8,36.8},
          {72.8,37},{75.5,37}}, color={0,0,127}));
  connect(bou.T_in, TAir.y) annotation (Line(points={{69.6,43.2},{78.8,43.2},{78.8,
          43},{87.5,43}}, color={0,0,127}));
  connect(bou.p_in, pAir.y) annotation (Line(points={{69.6,46.4},{72.8,46.4},{72.8,
          51},{75.5,51}}, color={0,0,127}));

  connect(ori.port_b, senTem.port_a)
    annotation (Line(points={{20,40},{28,40}}, color={0,127,255}));
  connect(bou.ports[1], senTem.port_b)
    annotation (Line(points={{52,40},{48,40}}, color={0,127,255}));

  annotation (HideResult=true,HideResult=false,HideResult=true,HideResult=true,
                      Icon(graphics={
    Rectangle(extent={{-10,80},{10,-80}},fillColor={215,215,215},
      fillPattern=FillPattern.Solid,pattern=LinePattern.None),
    Text(extent={{-44,-88},{48,-116}}, lineColor={0,0,255},fillColor={230,230,230},
      fillPattern = FillPattern.Solid,textString="%name"),
      Line(points={{-40,0},{-30,10}}, color={28,108,200},thickness=1),
      Line(points={{-40,0},{-30,-10}},color={28,108,200},thickness=1),
      Line(points={{-40,0},{40,0}},  color={28,108,200},thickness=1),
      Rectangle(extent={{-10,20},{10,-20}},
                                          lineColor={28,108,200},
        lineThickness=1,fillColor={28,108,200},fillPattern = FillPattern.Solid),
      Line(points={{30,10},{40,0}}, color={28,108,200},thickness=1),
      Line(points={{30,-10},{40,0}},color={28,108,200},thickness=1)}),
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
