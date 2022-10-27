within BuildingSystems.Utilities.MoistAirFunctions;
function x
  "Absolute humidity dependent on air pressure, saturation pressure and relative humidity"
  input Modelica.Units.SI.Pressure p;
  input Modelica.Units.SI.Pressure p_sat;
  input BuildingSystems.Types.RelativeHumidity phi;
  output Modelica.Units.SI.MassFraction value;
algorithm
    value := 0.622 * phi * p_sat / (p - phi * p_sat);
end x;
