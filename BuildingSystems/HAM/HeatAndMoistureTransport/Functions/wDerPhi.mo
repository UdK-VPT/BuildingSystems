within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;
function wDerPhi
  "Calculates the derivative of the water content"
  input Modelica.Units.SI.MassConcentration w;
  input Modelica.Units.SI.MassConcentration sorTabX[:];
  input BuildingSystems.Types.RelativeHumidity sorTabY[:];
  input Modelica.Units.SI.MassConcentration wF;
  input BuildingSystems.Types.RelativeHumidity phi;
  input BuildingSystems.Types.Porosity por;
  output Modelica.Units.SI.MassConcentration value;
protected
  Modelica.Units.SI.Density rhoH2O=1000.0;
  BuildingSystems.Types.RelativeHumidity phiMax=1.01;
  Real wMax = por * rhoH2O;
  Real phiNext;
  Real wNext;
  Real deltaW=1e-4;
algorithm
  if w < 0.0 or phi < 0.0 then
    value := Modelica.Constants.small;
  elseif phi >= 0.0 and phi <= phiMax then
    // Derivative of w according to phi
    wNext := w + deltaW;
    phiNext := BuildingSystems.HAM.HeatAndMoistureTransport.Functions.phiSor(sorTabX,sorTabY,wNext,wF,por);
    if phiNext <> phi then
      value := (wNext - w)/(phiNext - phi);
    else
      value := Modelica.Constants.small;
    end if;
  else
    value := Modelica.Constants.small;
  end if;

  annotation (Documentation(info="<html>
<p>This function outputs the derivative of the water content of a porous material.</p>
</html>", revisions="<html>
<ul>
<li>March 3, 2015, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end wDerPhi;
