within BuildingSystems.Buildings.Airvolumes.AirElements;
record FluidProp
  "Fluid properties for the air element"
  Modelica.SIunits.Temp_K T;
  Modelica.SIunits.Pressure p;
  Modelica.SIunits.Density rho;
  Modelica.SIunits.SpecificEnthalpy h;
  // Absolut Moisture
  Modelica.SIunits.MassFraction x;
  annotation (
Documentation(info="<html>
<p>
This model defines the fluid properties for the air element.
</p>
</html>", revisions="<html>
<ul>
<li>
February 21, 2017, by Christoph Nytsch-Geusen:<br/>
Re-integration into the BuildingSystems library.
</li>
<li>
October 31, 2016, by Katharina Mucha:<br/>
First implementation.
</li>
</ul>
</html>"));
end FluidProp;
