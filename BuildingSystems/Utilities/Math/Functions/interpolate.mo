within BuildingSystems.Utilities.Math.Functions;
function interpolate
  "Function for cubic hermite spline interpolation of table data"
  extends Modelica.Icons.Function;

  input Real u "Independent variable";
  input Real[:] xd "x-axis support points";
  input Real[size(xd, 1)] yd "y-axis support points";
  input Real[size(xd, 1)] d "Derivatives at the support points";

  output Real z "Dependent variable with monotone interpolation";

protected
  Integer i "Integer to select data interval";

algorithm
  i := 1;
  for j in 1:size(xd, 1) - 1 loop
    if u > xd[j] then
      i := j;
    end if;
  end for;

  z :=BuildingSystems.Utilities.Math.Functions.cubicHermiteLinearExtrapolation(
      x=u,
      x1=xd[i],
      x2=xd[i + 1],
      y1=yd[i],
      y2=yd[i + 1],
      y1d=d[i],
      y2d=d[i + 1]);

  annotation (smoothOrder = 1,
    Documentation(info="<html>
<p>
This function returns the value on a cubic hermite spline through the given support points
and provided spline derivatives at these points.
The spline derivatives at the support points can be computed using
<a href=\"modelica://BuildingSystems.Utilities.Math.Functions.splineDerivatives\">
BuildingSystems.Utilities.Math.Functions.splineDerivatives</a>.
The support points must be monotonically increasing.
Outside the provided support points, the function returns a linear extrapolation with
the same slope as the cubic spline has at the respective support point.
</p>
<p>
A similar model is also used in the CONTAM software (Dols and Walton, 2015).
</p>
<p>
This function is used in
<a href=\"modelica://BuildingSystems.Airflow.Multizone.Table_m_flow\">
BuildingSystems.Airflow.Multizone.Table_m_flow</a> and <a href=\"modelica://BuildingSystems.Airflow.Multizone.Table_V_flow\">
BuildingSystems.Airflow.Multizone.Table_V_flow</a>
</p>
<h4>
References
</h4>
<ul>
<li>
<b>W. S. Dols and B. J. Polidoro</b>,<b>2015</b>. <i>CONTAM User Guide and Program Documentation Version 3.2</i>,
National Institute of Standards and Technology, NIST TN 1887, Sep. 2015. doi:
<a href=\"https://doi.org/10.6028/NIST.TN.1887\">10.6028/NIST.TN.1887</a>.
</li>
</ul>
</html>", revisions="<html>
<ul>
<li>
February 29, 2024, by Hongxiang Fu:<br/>
Moved to
<a href=\"modelica://BuildingSystems.Utilities.Math.Functions\">
BuildingSystems.Utilities.Math.Functions</a>
from
<a href=\"modelica://BuildingSystems.Airflow.Multizone.BaseClasses\">
BuildingSystems.Airflow.Multizone.BaseClasses</a>.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1844\">IBPSA, #1844</a>.
</li>
<li>
February 26, 2024, by Hongxiang Fu:<br/>
Correct implementation to make it smooth.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1840\">IBPSA, #1840</a>.
</li>
<li>
February 2, 2022, by Michael Wetter:<br/>
Revised implementation.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1436\">IBPSA, #1436</a>.
</li>
<li>
Apr 6, 2021, by Klaas De Jonge:<br/>
First Implementation.
</li>
</ul>
</html>"));
end interpolate;
