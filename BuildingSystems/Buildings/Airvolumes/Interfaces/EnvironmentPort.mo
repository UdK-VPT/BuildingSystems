within BuildingSystems.Buildings.Airvolumes.Interfaces;
connector EnvironmentPort
  "Outside - Window/Wall"
  Modelica.Units.SI.Temperature T;
  Real HumRel;
  Modelica.Units.SI.RadiantEnergyFluenceRate I;
end EnvironmentPort;
