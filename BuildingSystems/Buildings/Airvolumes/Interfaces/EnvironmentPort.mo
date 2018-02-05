within BuildingSystems.Buildings.Airvolumes.Interfaces;
connector EnvironmentPort
  "Outside - Window/Wall"
  Modelica.SIunits.Temp_K T;
  Real HumRel;
  Modelica.SIunits.RadiantEnergyFluenceRate I;
end EnvironmentPort;
