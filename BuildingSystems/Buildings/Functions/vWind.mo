within BuildingSystems.Buildings.Functions;
function vWind
  "Height dependent wind speed"
  input Modelica.SIunits.Velocity vWindRef
    "Wind speed on reference height";
  input Modelica.SIunits.Height z
    "Height over ground";
  input Modelica.SIunits.Height zRefvWind
    "Reference height for wind measurement";
  input Real P
    "Roughness exponent for wind profil calculation";
  output Modelica.SIunits.Velocity value
    "Height dependent wind speed";
algorithm
  // Vertical wind speed profile:
  value := vWindRef * max(0.0,z/zRefvWind)^P;

  annotation (Documentation(info="<html>
<p>
This function outputs the vertical wind speed dependent on the height.
</p>
</html>", revisions="<html>
<ul>
<li>
September 21, 2021, by Christoph Nytsch-Geusen:<br/>
Numerical stability improved.
</li>
<li>
January 1, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end vWind;
