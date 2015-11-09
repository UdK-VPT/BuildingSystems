within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;

function deltaL
  "Calculates the water vapour permeability"
  input Modelica.SIunits.Temp_K T;
  output BuildingSystems.Types.WaterVapourPermeability value;
protected
  Modelica.SIunits.Pressure pL=101300;

algorithm
  value := 2.0e-7 * T^0.81 / pL;
end deltaL;
