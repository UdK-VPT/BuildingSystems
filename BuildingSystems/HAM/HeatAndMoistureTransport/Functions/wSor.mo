within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;

function wSor
  "Calculates the water content of a porous material"
  input Modelica.SIunits.MassConcentration sorTabX[:];
  input BuildingSystems.Types.RelativeHumidity sorTabY[:];
  input Modelica.SIunits.MassConcentration phi;
  input Modelica.SIunits.MassConcentration wF;
  input BuildingSystems.Types.Porosity por;
  output Modelica.SIunits.MassConcentration value;
protected
  Modelica.SIunits.Density rhoH2O=1000.0;
  BuildingSystems.Types.RelativeHumidity phiMax=1.01;
  Modelica.SIunits.MassConcentration wMax = por * rhoH2O;

algorithm
  if phi < 0.0 then
    value := 0.0;
  elseif phi>= 0.0 and phi <= phiMax then
    //value := Modelica.Math.Vectors.interpolate(sorTabX,sorTabY,phi);
    value := BuildingSystems.HAM.HeatAndMoistureTransport.Functions.interpol(phi,sorTabX,sorTabY,1);
  else
    value := wMax;
  end if;
end wSor;
