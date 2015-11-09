within BuildingSystems.Utilities.SmoothFunctions;
function softfabs "Softly approximate fabs()"
  input Real x;
  input Real delta;
  output Real y;
algorithm
  y := x * safetanh(x*0.28/delta);
end softfabs;
