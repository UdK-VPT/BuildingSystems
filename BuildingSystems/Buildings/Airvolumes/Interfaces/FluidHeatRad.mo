within BuildingSystems.Buildings.Airvolumes.Interfaces;
connector FluidHeatRad
  "HeatPort + A"
  //General variables
  Modelica.SIunits.Area A;
  Modelica.SIunits.Temp_K T;
  flow Modelica.SIunits.HeatFlowRate Q_flow;
end FluidHeatRad;
