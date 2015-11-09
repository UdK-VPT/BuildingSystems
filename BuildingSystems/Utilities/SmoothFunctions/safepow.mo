within BuildingSystems.Utilities.SmoothFunctions;
function safepow "Safe pow() with x < 0.0 catching"
  input Real x;
  input Real e;
  output Real y;
algorithm
    y := sign(x) * x^e;
end safepow;
