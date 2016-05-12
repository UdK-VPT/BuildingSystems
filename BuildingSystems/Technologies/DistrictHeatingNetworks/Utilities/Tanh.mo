within BuildingSystems.Technologies.DistrictHeatingNetworks.Utilities;
model Tanh
parameter Real factor = 0.55
  "Un- or smooth the tanh function according to: tanh((InSignal-SetValue)/factor): tanh(1)=0.7616 tanh(2)=0.9640, tanh(3)=0.9951";
parameter Real Max_value = 1
  "Maximum value of the output signal";
parameter Real Min_value = 0
  "Minimum value of the output signal";
parameter Boolean PositivSloop = false;
Modelica.Blocks.Interfaces.RealOutput y
  annotation (Placement(transformation(extent={{80,-22},{120,18}})));
Modelica.Blocks.Interfaces.RealInput SetValue
  "Value at which outsignal becomes 0.5"
  annotation (Placement(transformation(extent={{-120,-70},{-80,-30}})));
Modelica.Blocks.Interfaces.RealInput u "InputSignal "
  annotation (Placement(transformation(extent={{-120,10},{-80,50}})));
equation
  if PositivSloop == true then
    y = Min_value + ((Max_value-Min_value)/2) + ((Max_value-Min_value)/2)*tanh((u-SetValue)/factor);
  else
    y = Min_value + ((Max_value-Min_value)/2) - ((Max_value-Min_value)/2)*tanh((u-SetValue)/factor);
  end if;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
    graphics), Icon(coordinateSystem(preserveAspectRatio=false,
    extent={{-100,-100},{100,100}}), graphics={Line(
    points={{-80,-80},{-30,-70},{-10,-30},{0,0},{10,30},{30,70},{80,80}},color={0,0,255},
    smooth=Smooth.None), Rectangle(extent={{-100,100},{100,-98}},lineColor={0,0,255})}));
end Tanh;
