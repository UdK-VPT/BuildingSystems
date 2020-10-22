within BuildingSystems.Utilities.SmoothFunctions;
function softcut_lower "Softly cuts to lower limit"
  input Real x;
  input Real x_llimit;
  input Real r;
  output Real y;

algorithm
  y :=     if x <= x_llimit + r - r*sqrt(2) then x_llimit
       elseif x >= x_llimit + r - r/sqrt(2) then x
       else x_llimit + r - sqrt(r*r - (x - x_llimit - r + r*sqrt(2))^2);

  annotation (Inline=true, smoothOrder=1);
end softcut_lower;
