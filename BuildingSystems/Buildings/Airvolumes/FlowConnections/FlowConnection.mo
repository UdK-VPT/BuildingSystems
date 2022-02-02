within BuildingSystems.Buildings.Airvolumes.FlowConnections;
partial model FlowConnection
  "Flow connecting element between two FV elements calculating the velocity. X, Y and Z - direction"
  // Relative Position in space (near-wall (parallel to wall) or inside)
  parameter Boolean BCwall_north = false
    annotation (HideResult=true);
  parameter Boolean BCwall_east = false
    annotation (HideResult=true);
  parameter Boolean BCwall_south = false
    annotation (HideResult=true);
  parameter Boolean BCwall_west = false
    annotation (HideResult=true);
  parameter Boolean BCwall_floor = false
    annotation (HideResult=true);
  parameter Boolean BCwall_roof = false
    annotation (HideResult=true);
    /////////////     PARAMETER     ///////////////////////
  final parameter Real ParVis =  BuildingSystems.Buildings.Airvolumes.Parameter.f_pv annotation (HideResult=true);
  final parameter Real LayFac = BuildingSystems.Buildings.Airvolumes.Parameter.f_lay annotation (HideResult=true);
  final parameter Real LosFac = BuildingSystems.Buildings.Airvolumes.Parameter.f_loss annotation (HideResult=true);

  // Ports
  Modelica.SIunits.Velocity v(start = 0, fixed = true);
  Modelica.SIunits.Pressure dP(start=0);

  Real Fp(start = 0);
  Real Fm(start = 0);
  Real Fv(start = 0);
  Real Fb(start = 0);
  Real Fg(start = 0);

  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid port_1
    annotation (Placement(transformation(extent={{-58,-10},{-38,10}}), iconTransformation(extent={{-58,-10},{-38,10}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid port_2 annotation (Placement(transformation(
    extent={{36,-10},{56,10}}), iconTransformation(extent={{36,-10},{56,10}})));
equation
  dP=(port_2.p - port_1.p);
  // 'flowConnection' - bridging, FV1-FV2
  // streams
  port_1.rho = inStream(port_2.rho);
  port_2.rho = inStream(port_1.rho);
  port_1.h = inStream(port_2.h);
  port_2.h = inStream(port_1.h);
  // flow
  port_1.moist.m_flow = port_2.moist.x*port_1.m_flow;
  port_2.moist.m_flow = port_1.moist.x*port_2.m_flow;
  annotation (Icon(graphics={Ellipse(extent={{-44,44},{44,-44}},fillColor={255,255,170},
    fillPattern=FillPattern.Solid,pattern=LinePattern.None)}),
Documentation(info=""));
end FlowConnection;
