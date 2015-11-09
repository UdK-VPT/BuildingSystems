within BuildingSystems.Utilities.SmoothFunctions;
function softcut "softly cuts to upper and lower limit"
  input Real x;
  input Real x_llimit;
  input Real x_ulimit;
  input Real r;
  output Real y;
algorithm
    if x > 0.5 * (x_llimit + x_ulimit) then
      y := softcut_upper(x, x_ulimit, r);
    else
      y := softcut_lower(x, x_llimit, r);
    end if;
end softcut;
