within BuildingSystems.Buildings.Constructions.Shadowing;
model Embrasure
  "Model of an embrasure"
  extends BuildingSystems.Buildings.BaseClasses.ShadowingElementGeneral;
  parameter Modelica.Units.SI.Length depth=0.0 "Depth of the embrasure";
equation
  SC = BuildingSystems.Buildings.Constructions.Shadowing.Functions.embrasure(
    height_internal,
    width_internal,
    depth,
    angleDegAzi,
    radiationPort_in.angleDegAziSun,
    radiationPort_in.angleDegHeightSun);

annotation (Placement(transformation(extent={{-10,-70},{-30,-50}}),
  iconTransformation(extent={{-10,-70},{-30,-50}})),
  defaultComponentName="embrasure",Icon(graphics={
  Polygon(points={{20,60},{40,80},{40,-80},{20,-60},{20,60}}, lineColor={0,0,0},
    fillColor={215,215,215},fillPattern=FillPattern.Solid),
  Polygon(points={{-40,80},{-20,60},{20,60},{40,80},{-40,80}}, lineColor={
    0,0,0},fillColor={215,215,215},fillPattern=FillPattern.Solid),
  Polygon(points={{-40,80},{-20,60},{-20,-60},{-40,-80},{-40,80}},
    lineColor={0,0,0},fillColor={215,215,215},fillPattern=FillPattern.Solid),
  Polygon(points={{-40,-80},{-20,-60},{20,-60},{40,-80},{-40,-80}},
    lineColor={0,0,0},fillColor={215,215,215},fillPattern=FillPattern.Solid),
  Text(extent={{20,-78},{136,-142}}, lineColor={0,0,255},textString="%name")}),
Documentation(info="<html>
<p>
This is a model of an embrasure.
</p>
</html>", revisions="<html>
<ul>
<li>
September 29, 2019 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Embrasure;
