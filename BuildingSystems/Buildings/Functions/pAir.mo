within BuildingSystems.Buildings.Functions;
function pAir
  "Height dependent static air pressure"
  input Modelica.SIunits.Pressure pAirRef
    "Static air pressure on reference height";
  input Modelica.SIunits.Temp_K TAirRef
    "Air temperature on reference height";
  input Modelica.SIunits.Height z
    "Height over ground";
  input Modelica.SIunits.Height zRefTAir
    "Reference height air temperature measurement";
  input Real gamma(unit = "K/m")
    "Temperature gradient of the planetary boundary layer in K/m";
  output Modelica.SIunits.Pressure value
    "Height dependent static air pressure";
protected
  constant Real RAir = 288.0
    "Gas constant dry air in J/(kg.K)";
algorithm
  // Vertical air pressure profile in the polytrop atmosphere
  value := pAirRef * (BuildingSystems.Buildings.Functions.TAir(TAirRef,z,zRefTAir,gamma) / TAirRef)^(Modelica.Constants.g_n / (gamma * RAir));

  annotation (Documentation(info="<html>
<p>
This function outputs the ambient air pressure dependent on the height.
</p>
</html>", revisions="<html>
<ul>
<li>
January 1, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end pAir;
