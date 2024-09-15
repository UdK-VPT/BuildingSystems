within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;
function wSor
  "Calculates the water content of a porous material"
  input Modelica.Units.SI.MassConcentration sorTabX[:];
  input BuildingSystems.Types.RelativeHumidity sorTabY[:];
  input Modelica.Units.SI.MassConcentration phi;
  input Modelica.Units.SI.MassConcentration wF;
  input BuildingSystems.Types.Porosity por;
  output Modelica.Units.SI.MassConcentration value;
protected
  Modelica.Units.SI.Density rhoH2O=1000.0;
  BuildingSystems.Types.RelativeHumidity phiMax=1.01;
  Modelica.Units.SI.MassConcentration wMax=por*rhoH2O;
  Real[size(sorTabX,1)] d(each fixed=false) =
    BuildingSystems.Utilities.Math.Functions.splineDerivatives(
      x=sorTabX,
      y=sorTabY,
      ensureMonotonicity=false);
algorithm
  if phi < 0.0 then
    value := 0.0;
  elseif phi>= 0.0 and phi <= phiMax then
    value := BuildingSystems.Utilities.Math.Functions.interpolate(u=phi,xd=sorTabX,yd=sorTabY,d=d);
  else
    value := wMax;
  end if;

  annotation (Documentation(info="<html>
<p>This function outputs the water content of a porous material.</p>
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
end wSor;
