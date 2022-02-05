within BuildingSystems.Buildings.Airvolumes.Interfaces;
connector FluidHeatRad
  "HeatPort + A"
  //General variables
  Modelica.Units.SI.Area A;
  Modelica.Units.SI.Temperature T;
  flow Modelica.Units.SI.HeatFlowRate Q_flow;
end FluidHeatRad;
