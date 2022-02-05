within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;
function phiSor
  "Calculation of the relative humdity of a porous material"
  input Modelica.Units.SI.MassConcentration sorTabX[:];
  input BuildingSystems.Types.RelativeHumidity sorTabY[:];
  input Modelica.Units.SI.MassConcentration w "Water content";
  input Modelica.Units.SI.MassConcentration wF "Free water saturation";
  input BuildingSystems.Types.Porosity por
    "Porosity";
  output BuildingSystems.Types.RelativeHumidity value;
protected
  Modelica.Units.SI.Density rhoH2O=1000.0;
  BuildingSystems.Types.RelativeHumidity phiMax = 1.01;
  Modelica.Units.SI.MassConcentration wMax=por*rhoH2O;

algorithm
  if w < 0.0 then
    value := 0.0;
  elseif w >= 0.0 and w <= wMax then
    //value := Modelica.Math.Vectors.interpolate(sorTabY,sorTabX,w);
    value := BuildingSystems.HAM.HeatAndMoistureTransport.Functions.interpol(w,sorTabY,sorTabX,1);
  else
    value := phiMax;
  end if;
end phiSor;
