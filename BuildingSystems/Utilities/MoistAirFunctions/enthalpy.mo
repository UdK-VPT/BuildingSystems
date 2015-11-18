within BuildingSystems.Utilities.MoistAirFunctions;
function enthalpy
  "Specific enthalpy dependent on temperature, absolute moisture and absolute moisture at saturation"
  /* Enthalpy of moisture air h1+x consisting of 1 kg dry air and x kg water vapour. 
     Zero position at 0 C > Usage of temperature in computations in C  > - 273.15
     Enthalpy in [kJ/kg dry air], temperature in [K], x in [kg/kg]
     x_satt in [kg/kg] for phi = 1.0 */
  input Modelica.SIunits.Temp_K T;
  input Modelica.SIunits.MassFraction x;
  input Modelica.SIunits.MassFraction x_sat;
  output Modelica.SIunits.SpecificEnthalpy value;
protected
            Real theta, y1, y2, y3, y4;
algorithm
    theta := T - 273.15;
    /* unsaturated air */
    y1 := 1.006 * theta + x * (2500.0 + 1.86 * theta);
    /* fog region */
    y2 := 1.006 * theta + x_sat * (2500. + 1.86 * theta) + 4.187 * theta * (x - x_sat);
    /* ice fog region */
    y3 := 1.006 * theta + x_sat * (2500. + 1.86 * theta) + (2.05 * theta - 333.5) * (x - x_sat);
    /* complete function */
  y4 := BuildingSystems.Utilities.SmoothFunctions.softswitch(
    theta,
    0.0,
    y3,
    y2,
    0.1);
  value := BuildingSystems.Utilities.SmoothFunctions.softswitch(
    x,
    x_sat,
    y1,
    y4,
    0.01);
end enthalpy;
