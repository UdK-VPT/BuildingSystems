within BuildingSystems.Utilities.Psychrometrics.Functions;
function partialPressure
  "Partial pressure of water vapor"
  extends Modelica.Icons.Function;
  input Modelica.SIunits.MassFraction x
    "Absolute moisture";
  input Modelica.SIunits.Pressure pAir
    "Saturation temperature";
  output Modelica.SIunits.AbsolutePressure pVap
     "Saturation pressure";

algorithm
  pVap := pAir / (0.622 / x + 1.0);
  annotation(Inline=false,
    smoothOrder=5,
    Documentation(info="<html>
<p>
Partial pressure of water vapor, computed from total air pressure
and the absolute moisture.
</p>
</html>",
revisions="<html>
<ul>
<li>
June 23, 2016 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end partialPressure;
