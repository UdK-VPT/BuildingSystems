within BuildingSystems.Buildings.Constructions.Shadowing;
model OverhangElement
  "Model of a horizontal overhang"
  BuildingSystems.Interfaces.RadiationPort radiationPort_in
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}}),
      iconTransformation(extent={{-50,-10},{-30,10}})));
  BuildingSystems.Buildings.Constructions.Shadowing.Overhang overhang(
    depthOH = depthOH,
    heightOH = heightOH,
    height = heightWin)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Interfaces.RealOutput SC
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={0,-90}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=-90,origin={0,-90})));
  parameter Modelica.Units.SI.Length depthOH=0.0 "Depth of the overhang";
  parameter Modelica.Units.SI.Length heightOH=0.0 "Height of the overhang";
  parameter Modelica.Units.SI.Length heightWin=0.0 "Height of the window";
equation
  connect(radiationPort_in, overhang.radiationPort_in)
    annotation (Line(points={{-40,0},{-4,0}}, color={0,0,0}));
  connect(overhang.SC, SC)
      annotation (Line(points={{0,-9},{0,-90}}, color={0,0,127}));

  annotation (Placement(transformation(extent={{-10,-70},{-30,-50}}),
    iconTransformation(extent={{-10,-70},{-30,-50}})),
    defaultComponentName="overhang",Icon(graphics={
    Rectangle(extent={{-40,80},{40,-80}}, lineColor={0,0,0}),
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
end OverhangElement;
