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
  value := vWindRef * (z / zRefvWind)^P;
end vWind;
