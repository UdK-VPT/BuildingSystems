within BuildingSystems.Utilities.SmoothFunctions;
function softswitch
  "Softly switches between y0 and y1 at x=x_switch with smoothing f"
  input Real x;
  input Real x_switch;
  input Real y0;
  input Real y1;
  input Real f;
  output Real y;
protected
            Real tmp;
algorithm
  tmp := (0.5 + 0.5 * safetanh((x-x_switch)/f));
  y := ((1.0 - tmp) * y0) + tmp * y1;
end softswitch;
