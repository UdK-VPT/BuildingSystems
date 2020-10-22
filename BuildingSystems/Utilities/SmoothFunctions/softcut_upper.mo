within BuildingSystems.Utilities.SmoothFunctions;
function softcut_upper "Softly cuts to upper limit"
  input Real x;
  input Real x_ulimit;
  input Real r;
  output Real y;

algorithm
  y :=     if x <= x_ulimit - r + r/sqrt(2) then x
       elseif x >= x_ulimit - r + r*sqrt(2) then x_ulimit
       else x_ulimit - r + sqrt(r*r - (x_ulimit - x - r + r*sqrt(2))^2);

  annotation (Inline=true, smoothOrder=1);
end softcut_upper;
