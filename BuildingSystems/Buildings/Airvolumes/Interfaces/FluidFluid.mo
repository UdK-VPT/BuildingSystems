within BuildingSystems.Buildings.Airvolumes.Interfaces;
connector FluidFluid
  "Connector FlowConnectionXYZ <-> AirElement or Boundary <-> AirElement"
  // Air volume
  Modelica.SIunits.Length[3] pos
    annotation (HideResult=true);
  Modelica.SIunits.Length[3] dim
    annotation (HideResult=false);

  // Movement and thermal
  Modelica.SIunits.Pressure p;
  Modelica.SIunits.Velocity[3] vVec;
  flow Modelica.SIunits.MassFlowRate m_flow;
  stream Modelica.SIunits.Density rho;
  stream Modelica.SIunits.SpecificEnthalpy h;

  // Hygro-Port
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidMoist moist;

  // Gradients/composed Gradients for the viscous force
  Real visgr1;
  Real visgr2;
  Real ForceVF;
end FluidFluid;
