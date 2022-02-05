within BuildingSystems.Utilities.MoistAirFunctions;
function x_sat "Absolute humidity at saturation"
  input Modelica.Units.SI.Pressure p;
  input Modelica.Units.SI.Pressure p_sat;
  output Modelica.Units.SI.MassFraction value;
algorithm
    value := 0.622 * 1.0 / (p / p_sat - 1.0);
end x_sat;
