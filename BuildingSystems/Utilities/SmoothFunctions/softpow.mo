within BuildingSystems.Utilities.SmoothFunctions;
function softpow "Pow() with x -> 0.0 smoothing"
  input Real x;
  input Real e;
  input Real r;
  output Real y;
algorithm
    y := softcut_lower(x, 0.0, r)^e;
end softpow;
