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
  Real[size(sorTabX,1)] d(each fixed=false) =
    BuildingSystems.Utilities.Math.Functions.splineDerivatives(
      x=sorTabY,
      y=sorTabX,
      ensureMonotonicity=true);
algorithm
  if w < 0.0 then
    value := 0.0;
  elseif w >= 0.0 and w <= wMax then
    value := BuildingSystems.Utilities.Math.Functions.interpolate(u=w,xd=sorTabY,yd=sorTabX,d=d);
  else
    value := phiMax;
  end if;
end phiSor;
