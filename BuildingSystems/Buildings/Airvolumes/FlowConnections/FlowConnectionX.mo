within BuildingSystems.Buildings.Airvolumes.FlowConnections;
model FlowConnectionX
  "Flow connecting element from center of FV1 to center of FV2 in X-direction"
  extends BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnection;
  Modelica.Units.SI.Length deltax=abs(port_1.pos[1] - port_2.pos[1])
    annotation (HideResult=true);
  // joint area between two zones, depends on the size (parameterization) of the FV
  Modelica.Units.SI.Length dy=0.5*(port_1.dim[2] + port_2.dim[2])
    annotation (HideResult=true);
  Modelica.Units.SI.Length dz=0.5*(port_1.dim[3] + port_2.dim[3])
    annotation (HideResult=true);
  final parameter Real LayFacBC = (if BCwall_floor or BCwall_roof then LayFac else 1)*(if BCwall_north or BCwall_south then LayFac else 1);
  Modelica.Units.SI.Length dist=sqrt((port_2.pos[1] - port_1.pos[1])^2);
  Real Fm_tmp(start = 0);

equation
  // Velocity values: Pressure forces + Impulse forces + Viscose forces
  // Type momentum equation (with parameterization)
  //
  Fp = - 1/(0.5*(port_1.rho + port_2.rho))*dP;
  Fm_tmp = - (port_2.vVec[1]^2 - port_1.vVec[1]^2);
  Fm = - (if (sign(Fp) == sign(Fm_tmp)) then - sign(Fp) else sign(Fp))*abs(Fm_tmp);
  Fv = - 0.5*(port_1.ForceVF + port_2.ForceVF);
  Fb = - sign(v)*v^2;
  Fg = 0;

  deltax * der(v) =  Fp + Fm + 0.5*(ParVis * Fv + LosFac *LayFacBC* Fb);

  port_1.m_flow = (0.5*(port_1.rho + port_2.rho))*(dy*dz)*v;
  port_1.m_flow + port_2.m_flow = 0;

  // Gradients for the viscous force
  port_1.visgr1 = (port_2.vVec[2] - port_1.vVec[2])/dist;//dvdx
  port_2.visgr1 = (port_2.vVec[2] - port_1.vVec[2])/dist;//dvdx
  port_1.visgr2 = (port_2.vVec[3] - port_1.vVec[3])/dist;//dwdx
  port_2.visgr2 = (port_2.vVec[3] - port_1.vVec[3])/dist;//dwdx

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Line(points={{-32,-2},{22,-2},{-42,72},{38,58}}, pattern=LinePattern.None),
    Line(points={{-56,78},{0,60},{10,64}}, pattern=LinePattern.None),
    Line(points={{-34,0},{32,0}},color={255,170,85},arrow={Arrow.Filled,Arrow.Filled},thickness=1)}),
Documentation(info=""));
end FlowConnectionX;
