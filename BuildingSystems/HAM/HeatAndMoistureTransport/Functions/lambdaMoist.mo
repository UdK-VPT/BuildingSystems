within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;
function lambdaMoist
  "Calculates the thermal conductivity dependent on the moisture content"
  input Modelica.Units.SI.MassConcentration lambdaTabX[:];
  input Modelica.Units.SI.ThermalConductivity lambdaTabY[:];
  input Modelica.Units.SI.ThermalConductivity lambdaDry;
  input Modelica.Units.SI.MassConcentration w;
  output Modelica.Units.SI.ThermalConductivity value;
algorithm
  if w < 0.0 then
    value := lambdaDry;
  else
    //value := Modelica.Math.Vectors.interpolate(lambdaTabX,lambdaTabY,w);
    value := BuildingSystems.HAM.HeatAndMoistureTransport.Functions.interpol(w,lambdaTabX,lambdaTabY,1);
  end if;
end lambdaMoist;
