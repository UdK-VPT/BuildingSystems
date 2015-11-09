within BuildingSystems.Utilities.SmoothFunctions;
function safereciprocal
  "Calculates 1/x without zeros between a user defined intervall from -delta to +delta"
  input Real x;
  input Real delta;
  output Real y;
protected
            Real delta2, delta3, delta5, delta7;
algorithm
  if abs(x) > delta then
    y :=  1 / x;
  else
    delta2 := delta * delta;
    delta3 := delta * delta * delta;
    delta5 := delta * delta * delta * delta;
    delta7 := delta * delta * delta * delta * delta * delta * delta;
    y := x / delta2 + x * abs(2.0 / delta3 * x - 3.0 / delta5 * x * x * x + 1.0 / delta7 * x * x * x * x * x);
  end if;
end safereciprocal;
