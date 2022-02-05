within BuildingSystems.Buildings.Airvolumes.Interfaces;
connector FluidFluid
  "Connector FlowConnectionXYZ <-> AirElement or Boundary <-> AirElement"
  Modelica.Units.SI.Length[3] pos "Position of the air element";
  Modelica.Units.SI.Length[3] dim "Dimension of the air element";
  Modelica.Units.SI.Pressure p "Pressure of the air element";
  Modelica.Units.SI.Velocity[3] vVec "Velocity components of the air element";
  flow Modelica.Units.SI.MassFlowRate m_flow
    "Incoming/outgoing mass flow rate of the air element";
  stream Modelica.Units.SI.Density rho "Air density of the air element";
  stream Modelica.Units.SI.SpecificEnthalpy h "Air enthalpy of the air element";
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidMoist moist
    "Moisture port of the air element";

  // Gradients/composed Gradients for the viscous force
  Real visgr1;
  Real visgr2;
  Real ForceVF;
end FluidFluid;
