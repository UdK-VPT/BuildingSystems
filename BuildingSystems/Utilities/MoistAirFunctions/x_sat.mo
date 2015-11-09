within BuildingSystems.Utilities.MoistAirFunctions;
function x_sat "Absolute humidity at saturation"
  input Modelica.SIunits.Pressure p;
  input Modelica.SIunits.Pressure p_sat;
  output Modelica.SIunits.MassFraction  value;
algorithm
    value := 0.622 * 1.0 / (p / p_sat - 1.0);
end x_sat;
