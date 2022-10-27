within BuildingSystems.Utilities.MoistAirFunctions;
function p_sat "Saturation vapor pressure dependent on temperature"
  input Modelica.Units.SI.Temperature T;
  output Modelica.Units.SI.Pressure value;
protected
  Real a;
  Real theta;
  Real theta_0;
algorithm
    theta := T - 273.15;
    if theta < 0 then
      a := 22.44;
      theta_0 := 272.44;
    else
      a := 17.08;
      theta_0 := 234.18;
    end if;
    value := 611.0 * Modelica.Math.exp(a * theta / (theta_0 + theta));
end p_sat;
