within BuildingSystems.Buildings.Functions;
function pAir "Height dependent static air pressure"
  input Modelica.SIunits.Pressure pAirRef
    "Static air pressure on reference height";
  input Modelica.SIunits.Temp_K TAirRef "Air temperature on reference height";
  input Modelica.SIunits.Height z "Height over ground";
  input Modelica.SIunits.Height zRefTAir
    "Reference height air temperature measurement";
  input Real gamma(unit = "K/m")
    "Temperature gradient of the planetary boundary layer in K/m";
  output Modelica.SIunits.Pressure value "Height dependent static air pressure";
protected
  constant Real RAir = 288.0 "Gas constant dry air in J/(kg.K)";
algorithm
  // Vertical air pressure profile in the polytrop atmosphere
  value := pAirRef * (TAir(TAirRef,z,zRefTAir,gamma) / TAirRef)^(Modelica.Constants.g_n / (gamma * RAir));
end pAir;
