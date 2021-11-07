within BuildingSystems.Buildings.Airvolumes.Interfaces;
model Opening
  "Inlet, Outlet with given massflow (fix)"
  parameter Modelica.SIunits.Length posX
   "Boundary-FV-connection absolut central position X"
    annotation (HideResult=true);
  parameter Modelica.SIunits.Length posY
   "Boundary-FV-connection absolut central position Y"
    annotation (HideResult=true);
  parameter Modelica.SIunits.Length posZ
    "Boundary-FV-connection absolut central position Z"
    annotation (HideResult=true);
  parameter Real scalF[3] = {1,1,1}
    annotation (HideResult=true);
  // about the air
  constant Modelica.SIunits.SpecificHeatCapacity cp = 1005.00;
  constant Modelica.SIunits.ThermalConductivity lambdaAir=0.0262;
  constant Modelica.SIunits.Density rho = 1.2;
  //south, north, west, east, floor, roof
  parameter String location = " "
    "south, north, west, east, floor, roof"
  annotation (HideResult=false);
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid PortF
    annotation (Placement(transformation(extent={{0,-10},{20,10}}),
      iconTransformation(extent={{0,-10},{20,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a PortHeat
    annotation (Placement(transformation(extent={{0,-50},{20,-30}}),
      iconTransformation(extent={{0,-50},{20,-30}})));
  parameter Modelica.SIunits.Temp_K T = 273.15 + 20.0;
  parameter Modelica.SIunits.MassFlowRate m_flow = 0.0;
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidHeatRad PortRad;
algorithm
  PortRad.T :=PortHeat.T;
  if (location == "east" or location == "west") then
    PortHeat.Q_flow := lambdaAir*((PortF.dim[2]*PortF.dim[3])/abs(PortF.pos[1] - posX)) * (PortHeat.T - T);
    PortRad.A := PortF.dim[2]*PortF.dim[3];
  elseif (location == "roof" or location == "floor") then
    PortHeat.Q_flow := lambdaAir*((PortF.dim[1]*PortF.dim[3])/abs(PortF.pos[2] - posY)) * (PortHeat.T - T);
    PortRad.A := PortF.dim[1]*PortF.dim[3];
  elseif (location == "north" or location == "south") then
    PortHeat.Q_flow := lambdaAir*((PortF.dim[1]*PortF.dim[2])/abs(PortF.pos[3] - posZ)) * (PortHeat.T - T);
    PortRad.A := PortF.dim[1]*PortF.dim[2];
  else
    PortHeat.Q_flow :=0.0;
    PortRad.A := 0.0;
  end if;

equation
  if (location == "east" or location == "west") then
    PortF.m_flow = m_flow*tanh(time/120);
    PortF.visgr1 = 2*(2*PortF.vVec[2])/(PortF.dim[1]/2);
    PortF.visgr2 = 2*(2*PortF.vVec[3])/(PortF.dim[1]/2);
  elseif (location == "roof" or location == "floor") then
    PortF.m_flow = m_flow*tanh(time/120);
    PortF.visgr1 = 2*(2*PortF.vVec[1])/(PortF.dim[2]/2);
    PortF.visgr2 = 2*(2*PortF.vVec[3])/(PortF.dim[2]/2);
  elseif (location == "north" or location == "south") then
    PortF.m_flow = m_flow*tanh(time/120);
    PortF.visgr1 = 2*(2*PortF.vVec[1])/(PortF.dim[3]/2);
    PortF.visgr2 = 2*(2*PortF.vVec[2])/(PortF.dim[3]/2);
  else
    PortHeat.Q_flow = 0.0;
    PortF.m_flow = 0.0;
    PortF.visgr1 = 0.0;
    PortF.visgr2 = 0.0;
  end if;

  PortF.rho = rho;
  PortF.h = cp*T;
  PortF.moist.m_flow = 0.0;

  annotation (HideResult=true,
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
      Rectangle(extent={{-10,80},{10,-80}},fillColor={215,215,215},fillPattern=FillPattern.Solid,pattern=LinePattern.None),
      Line(points={{-40,40},{40,40}},color={28,108,200},thickness=1),
      Line(points={{-40,40},{-30,50}},color={28,108,200},thickness=1),
      Line(points={{-40,40},{-30,30}},color={28,108,200},thickness=1),
      Line(points={{30,50},{40,40}},color={28,108,200},thickness=1),
      Line(points={{30,30},{40,40}},color={28,108,200},thickness=1),
      Rectangle(extent={{-10,60},{10,20}},lineColor={28,108,200},lineThickness=1,fillColor={28,108,200},fillPattern=FillPattern.Solid)}),
Documentation(info="<html>
<p>
This is a model of an opening of a discretized air volume model.
</p>
</html>", revisions="<html>
<ul>
November 10, 2021, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Opening;
