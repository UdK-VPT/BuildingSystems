within BuildingSystems.Buildings.Functions;
function TAir
  "Height dependent air temperature"
  input Modelica.SIunits.Temp_K TAirRef
    "Air temperature on reference height";
  input Modelica.SIunits.Height z
    "Height over ground";
  input Modelica.SIunits.Height zRefTAir
    "Reference height air temperature measurement";
  input Real gamma(unit = "K/m")
    "Temperature gradient of the planetary boundary layer in K/m";
  output Modelica.SIunits.Temp_K value "Height dependent air temperature";
algorithm
  // Vertical air temperature profile (assumption: polytrop atmosphere (linear decreasing air temperature)
  value := TAirRef - gamma * (z - zRefTAir);

  annotation (Documentation(info="<html>
  <p>
  This function outputs the ambient air temperature dependent on
  the height.
  </p>
  </html>", revisions="<html>
  <ul>
  <li>
  January 1, 2016, by Christoph Nytsch-Geusen:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end TAir;
