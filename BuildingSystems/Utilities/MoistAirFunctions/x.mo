within BuildingSystems.Utilities.MoistAirFunctions;
function x
  "Absolute humidity dependent on air pressure, saturation pressure and relative humidity"
  input Modelica.SIunits.Pressure p;
  input Modelica.SIunits.Pressure p_sat;
  input BuildingSystems.Types.RelativeHumidity phi;
  output Modelica.SIunits.MassFraction  value;
algorithm
    value := 0.622 * phi * p_sat / (p - phi * p_sat);
end x;
