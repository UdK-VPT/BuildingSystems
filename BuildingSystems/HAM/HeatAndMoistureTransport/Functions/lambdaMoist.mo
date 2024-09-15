within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;
function lambdaMoist
  "Calculates the thermal conductivity dependent on the moisture content"
  input Modelica.Units.SI.MassConcentration lambdaTabX[:];
  input Modelica.Units.SI.ThermalConductivity lambdaTabY[:];
  input Modelica.Units.SI.ThermalConductivity lambdaDry;
  input Modelica.Units.SI.MassConcentration w;
  output Modelica.Units.SI.ThermalConductivity value;
protected
  Real[size(lambdaTabX,1)] d(each fixed=false) =
    BuildingSystems.Utilities.Math.Functions.splineDerivatives(
      x=lambdaTabX,
      y=lambdaTabY,
      ensureMonotonicity=false);
algorithm
  if w < 0.0 then
    value := lambdaDry;
  else
    value := BuildingSystems.Utilities.Math.Functions.interpolate(u=w,xd=lambdaTabX,yd=lambdaTabY,d=d);
  end if;

  annotation (Documentation(info="<html>
<p>This function outputs the thermal conductivity dependent on the moisture content of a porous material.</p>
</html>", revisions="<html>
<ul>
<li>March 3, 2015, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
<li>September 15, 2024, by Christoph Nytsch-Geusen:<br/>
Use of the function BuildingSystems.Utilities.Math.Functions.interpolate.
</li>
</ul>
</html>"));
end lambdaMoist;
