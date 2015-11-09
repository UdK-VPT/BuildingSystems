within BuildingSystems.Utilities.SmoothFunctions;
function powerLinearized
  "Power function that is linearized below a user-defined threshold"
 input Real x "Abscissa value";
 input Real n "Exponent";
 input Real x0 "Abscissa value below which linearization occurs";
 output Real y "Function value";
algorithm
  if x > x0 then
   y := x^n;
  else
   y := x0^n * (1-n) + n * x0^(n-1) * x;
  end if;
  annotation (smoothOrder=1, Inline=true);
end powerLinearized;
