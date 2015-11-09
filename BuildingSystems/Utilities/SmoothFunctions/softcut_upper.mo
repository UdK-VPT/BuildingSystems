within BuildingSystems.Utilities.SmoothFunctions;
function softcut_upper "Softly cuts to upper limit"
  input Real x;
  input Real x_ulimit;
  input Real r;
  output Real y;
protected
  Real x_start;
  Real x_end;
  Real help;
  Real SQRT_TWO = 1.4142135624;
algorithm
    x_start := x_ulimit - r * (1.0-1.0/SQRT_TWO);
    x_end := x_start + r/SQRT_TWO;
    if x <= x_start then
      y := x;
    elseif x >= x_end then
      y := x_ulimit;
    else
      help := x_ulimit - x - r * (1.0 - SQRT_TWO);
      y := x_ulimit - r + sqrt(r*r - help*help);
    end if;
end softcut_upper;
