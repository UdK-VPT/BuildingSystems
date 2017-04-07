within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ThermalModels;
model ThermalModelSimple
  "Simplified thermal model based on a empirical equation for the cell temperature"
  parameter Real f(unit="K.m2/W")
    "Empirical temperature factor";
  BuildingSystems.Interfaces.Temp_KInput TAmb
    "Ambient temperature"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=0,origin={-68,20}), iconTransformation(extent={{-80,14},{-60,34}})));
  BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput ITot
    "Total irradiation in module plane"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=0,origin={-68,-40}), iconTransformation(extent={{-80,-30},{-60,-10}})));
  BuildingSystems.Interfaces.Temp_KOutput TCel
    "Cell temperature"
     annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=0,origin={80,0}), iconTransformation(extent={{60,-10},{80,10}})));
equation
  TCel = TAmb + f * ITot;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-60,60},{60,-60}}, lineColor={0,0,255})}),
Documentation(info="<html>
<p>
Simplified thermal model that calculates the cell temperature based on a empirical equation.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ThermalModelSimple;
