within BuildingSystems.Buildings.Airvolumes.FlowConnections;
model FlowConnectionZ
  "Flow connection from center of FV1 to center of FV2 in Z-direction"
  extends BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnection;
  Modelica.SIunits.Length deltaz=abs(port_1.pos[3] - port_2.pos[3])
    annotation (HideResult=true);
  // joint area between two zones, depends on the size (parameterization) of the FV
  Modelica.SIunits.Length dx= 0.5 * (port_1.dim[1] + port_2.dim[1])
    annotation (HideResult=true);
  Modelica.SIunits.Length dy= 0.5 * (port_1.dim[2] + port_2.dim[2])
    annotation (HideResult=true);
  final parameter Real LayFacBC = (if BCwall_east or BCwall_west then LayFac else 1)*(if BCwall_roof or BCwall_floor then LayFac else 1);
  Modelica.SIunits.Length dist=sqrt((port_2.pos[3] - port_1.pos[3])^2);
  Real Fm_tmp(start = 0);

equation
  // Velocity values: Pressure forces + Impulse forces + Viscose forces
  // Type momentum equation, with parameterization:
  //
  Fp = - 1/(0.5*(port_1.rho + port_2.rho))*dP;
  Fm_tmp = - (port_2.vVec[3]^2 - port_1.vVec[3]^2);
  Fm = - (if (sign(Fp) == sign(Fm_tmp)) then - sign(Fp) else sign(Fp))*abs(Fm_tmp);
  Fv = - 0.5*(port_1.ForceVF + port_2.ForceVF);
  Fb = - sign(v)*v^2;
  Fg = 0;

  deltaz * der(v) =  Fp + Fm + 0.5*(ParVis * Fv + LosFac *LayFacBC* Fb);

  port_1.m_flow = (0.5*(port_1.rho + port_2.rho))*(dy*dx)*v;
  port_1.m_flow + port_2.m_flow = 0;

  // Gradients for the viscous force
  port_1.visgr1 = (port_2.vVec[1] - port_1.vVec[1])/dist;//dudz
  port_2.visgr1 = (port_2.vVec[1] - port_1.vVec[1])/dist;//dudz
  port_1.visgr2 = (port_2.vVec[2] - port_1.vVec[2])/dist;//dvdz
  port_2.visgr2 = (port_2.vVec[2] - port_1.vVec[2])/dist;//dvdz

  annotation (Diagram(graphics={
    Ellipse(extent={{34,38},{-34,-30}},lineColor={0,0,255},fillColor={255,255,170},
            fillPattern =                                                                      FillPattern.Solid),
    Text(extent={{12,20},{26,24}},lineColor={0,0,255},textString="Port 2",fontSize=16),
    Text(extent={{-22,-18},{-8,-14}},lineColor={0,0,255},fontSize=16,textString
            =                                                                   "Port 1")}),
    Icon(graphics={Line(points={{-20,-26},{20,26}},color={255,170,85},arrow={Arrow.Filled,Arrow.Filled},thickness=1)}),
Documentation(info=""));
end FlowConnectionZ;
