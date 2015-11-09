within BuildingSystems.Utilities.SmoothFunctions;
function softcut_lower "Softly cuts to lower limit"
  input Real x;
  input Real x_llimit;
  input Real r;
  output Real y;
protected
  Real x_start;
  Real x_end;
  Real help;
  Real SQRT_TWO = 1.4142135624;
algorithm
    x_end := x_llimit + r * (1.0-1.0/SQRT_TWO);
    x_start := x_end - r/SQRT_TWO;
    if x <= x_start then
      y := x_llimit;
    elseif x >= x_end then
      y := x;
    else
      help := x - x_llimit - r * (1.0 - SQRT_TWO);
      y := x_llimit + r - sqrt(r*r - help*help);
    end if;
end softcut_lower;
