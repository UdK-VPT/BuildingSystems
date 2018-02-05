within BuildingSystems.Buildings.Airvolumes.FlowConnections;
model FlowConnectionY
  "Flow connection from center of FV1 to center of FV2 in Y-direction"
  extends BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnection;
  parameter Boolean gravity = true;
  Modelica.Blocks.Sources.Ramp rampe(duration = 60, height = 1);
  //rampe.y
  // flowConnection "from center of FV1 to center of FV2"
  Modelica.SIunits.Length deltay=abs(port_1.pos[2] - port_2.pos[2])
    annotation (HideResult=true);
  Modelica.SIunits.Length deltayy = 0.5* (port_1.pos[2] + port_2.pos[2])
    annotation (HideResult=true);
  // joint area between two zones, depends on the size (parameterization) of the FV
  Modelica.SIunits.Length dx= 0.5 * (port_1.dim[1] + port_2.dim[1])
    annotation (HideResult=true);
  Modelica.SIunits.Length dz= 0.5 * (port_1.dim[3] + port_2.dim[3])
    annotation (HideResult=true);
  final parameter Real LayFacBC = (if BCwall_east or BCwall_west then LayFac else 1)*(if BCwall_north or BCwall_south then LayFac else 1);
  Modelica.SIunits.Length dist=sqrt((port_2.pos[2] - port_1.pos[2])^2);
  Real Fm_tmp(start = 0);

equation
  // Velocity ​​values: Pressure forces + Impulse forces + Viscose forces
  // Type momentum equation (with parameterization)
  // Problem Fg: (if time < 1 then time else 1)* Modelica.Constants.g_n*dyGravity
  // Problem Fg: homotopy(actual=  Modelica.Constants.g_n*dyGravity, simplified=  0)
  // Problem Fg: Modelica.Constants.g_n*deltay * tanh(time)
  //
  Fp = - 1/(0.5*(port_1.rho + port_2.rho))*dP;
  Fm_tmp = - (port_2.vVec[2]^2 - port_1.vVec[2]^2);
  Fm = - (if (sign(Fp) == sign(Fm_tmp)) then - sign(Fp) else sign(Fp))*abs(Fm_tmp);
  Fv = - 0.5*(port_1.ForceVF + port_2.ForceVF);
  Fb = - sign(v)*v^2;
  Fg = - (if gravity then (Modelica.Constants.g_n*deltayy * tanh(rampe.y)) else 0);

  deltay * der(v) =  Fp + Fm + Fg + 0.5*(ParVis * Fv + LosFac *LayFacBC* Fb);

  port_1.m_flow = (0.5*(port_1.rho + port_2.rho))*(dx*dz)*v;
  port_1.m_flow + port_2.m_flow = 0;

  // Gradients for the viscous force
  port_1.visgr1 = (port_2.vVec[1] - port_1.vVec[1])/dist;//dudy
  port_2.visgr1 = (port_2.vVec[1] - port_1.vVec[1])/dist;//dudy
  port_1.visgr2 = (port_2.vVec[3] - port_1.vVec[3])/dist;//dwdy
  port_2.visgr2 = (port_2.vVec[3] - port_1.vVec[3])/dist;//dwdy

  annotation(Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Line(points={{0,30},{0,-30}},color={255,170,85},arrow={Arrow.Filled,Arrow.Filled},thickness=1)}),
Documentation(info=""));
end FlowConnectionY;
