within BuildingSystems.Buildings.Constructions.Windows;
model SlidingWindow
  "Model of a sliding window"
  extends BuildingSystems.Buildings.BaseClasses.OpeningDiscretizedOperable(
    final wOpe = widthOpen,
    final hOpe = height,
    redeclare package Medium = BuildingSystems.Media.Air);
  extends BuildingSystems.Buildings.BaseClasses.WindowGeneral(
  toSurfacePort_2(A=AFix+AOpe),
  toSurfacePort_1(A=AFix+AOpe),
  radTra1to2(areaRatioUnglazed = widthOpen/width*y),
  radTra2to1(areaRatioUnglazed = widthOpen/width*y));
  final parameter Modelica.SIunits.Area AFix = height * (width - widthOpen)
    "Fixe area of the sliding window"
    annotation(Dialog(enable = false, tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length widthOpen = 0.5
    "Max. width of the open part (full opened postion)"
    annotation(Dialog(tab = "General", group = "Geometry"));

  annotation (defaultComponentName="slidingWindow", Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-10,80},{10,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid),
    Rectangle(extent={{6,60},{10,-4}}, lineColor={170,255,255},fillColor={170,255,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-20,80},{20,60}},lineColor={175,175,175},fillColor={175,175,175},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-20,-60},{20,-80}},lineColor={175,175,175},fillColor={175,175,175},fillPattern = FillPattern.Solid),
    Line(points={{-10,60},{-10,-60}},color={0,0,255},smooth=Smooth.None,thickness=0.5),
    Rectangle(extent={{-9,20},{-5,-40}},lineColor={170,255,255},fillColor={170,255,255},fillPattern = FillPattern.Solid),
    Line(points={{0,20},{0,-40}}, color={0,0,0}),
    Polygon(points={{-2,16},{0,20},{2,16},{-2,16}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),
    Polygon(points={{-2,-2},{0,2},{2,-2},{-2,-2}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid,origin={0,-38},rotation=180)}),
Documentation(info="<html>
<p>
This is a model of a sliding window.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
<li>
July 27, 2017 by Christoph Nytsch-Geusen:<br/>
Introduction of an external shadowing coefficient (GSC).
</li>
li>
January 14, 2018 by Christoph Nytsch-Geusen:<br/>
Now model is inherited by WindowGeneral.
</li>
</ul>
</html>"));
end SlidingWindow;
