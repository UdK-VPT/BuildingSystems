  within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;

  function lambdaMoist
    "Calculates the thermal conductivity dependent on the moisture content"
    input Modelica.SIunits.MassConcentration lambdaTabX[:];
    input Modelica.SIunits.ThermalConductivity lambdaTabY[:];
    input Modelica.SIunits.ThermalConductivity lambdaDry;
    input Modelica.SIunits.MassConcentration w;
    output Modelica.SIunits.ThermalConductivity value;
  algorithm
    if w < 0.0 then
      value := lambdaDry;
    else
      //value := Modelica.Math.Vectors.interpolate(lambdaTabX,lambdaTabY,w);
      value := BuildingSystems.HAM.HeatAndMoistureTransport.Functions.interpol(w,lambdaTabX,lambdaTabY,1);
    end if;
  end lambdaMoist;
