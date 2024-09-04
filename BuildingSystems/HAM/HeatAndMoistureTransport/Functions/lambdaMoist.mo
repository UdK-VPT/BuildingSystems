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
      ensureMonotonicity=true);
algorithm
  if w < 0.0 then
    value := lambdaDry;
  else
    value := BuildingSystems.Utilities.Math.Functions.interpolate(u=w,xd=lambdaTabX,yd=lambdaTabY,d=d);
  end if;
end lambdaMoist;
