within BuildingSystems.Buildings.Constructions.Shadowing;
model Overhang
  "Model of a horizontal overhang"
  extends BuildingSystems.Buildings.BaseClasses.ShadowingElementGeneral;
  parameter Modelica.SIunits.Length depthOH = 0.0
    "Depth of the overhang";
  parameter Modelica.SIunits.Length heightOH = 0.0
    "Height of the overhang";
equation
  SC = BuildingSystems.Buildings.Constructions.Shadowing.Functions.overhang(
    height_internal,
    heightOH,
    depthOH,
    angleDegAzi,
    radiationPort_in.angleDegAziSun,
    radiationPort_in.angleDegHeightSun);

 annotation (Placement(transformation(extent={{-10,-70},{-30,-50}}),
   iconTransformation(extent={{-10,-70},{-30,-50}})),
   defaultComponentName="overhang",Icon(graphics={
   Polygon(points={{-40,92},{-80,52},{0,52},{40,92},{-40,92}},lineColor={
   0,0,0},fillColor={215,215,215},fillPattern=FillPattern.Solid),
   Text(extent={{20,-78},{136,-142}}, lineColor={0,0,255},textString="%name")}),
Documentation(info="<html>
<p>
This is a model of a horizontal overhang.
</p>
</html>", revisions="<html>
<ul>
<li>
September 29, 2019 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Overhang;
