within BuildingSystems.Buildings.Constructions.Windows;
model Window
  "Model of a window"
  extends BuildingSystems.Buildings.BaseClasses.WindowGeneral(
  ope(
    final wOpe = width,
    final hOpe = height),
  radTra1to2(final areaRatioUnglazed = 0.0),
  radTra2to1(final areaRatioUnglazed = 0.0));
  annotation (defaultComponentName="window", Icon(coordinateSystem(preserveAspectRatio=false,
    extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-10,80},{10,-80}},lineColor={230,230,230},fillColor={230,230,230},
      fillPattern = FillPattern.Solid),
    Rectangle(extent={{6,80},{10,-80}},lineColor={170,255,255},fillColor={170,255,255},
      fillPattern = FillPattern.Solid),
    Rectangle(extent={{-10,80},{-6,-80}}, lineColor={170,255,255},fillColor={170,255,255},
      fillPattern = FillPattern.Solid),
    Rectangle(extent={{-20,80},{20,60}},lineColor={175,175,175},fillColor={175,175,175},
      fillPattern = FillPattern.Solid),
    Rectangle(extent={{-20,-60},{20,-80}},lineColor={175,175,175},fillColor={175,175,175},
      fillPattern = FillPattern.Solid),
    Line(points={{-10,60},{-10,-60}},color={0,0,255},smooth=Smooth.None,thickness=0.5)}),
Documentation(info="<html>
<p>
This is a  model of a window.
</p>
</html>", revisions="<html>
<ul>
<li>
March 19, 2019 by Christoph Nytsch-Geusen:<br/>
Adaptation to the BuildingSystems.Airflow package.
</li>
<li>
January 14, 2018 by Christoph Nytsch-Geusen:<br/>
Now model is inherited by WindowGeneral.
</li>
<li>
July 27, 2017 by Christoph Nytsch-Geusen:<br/>
Introduction of an external shadowing coefficient (GSC).
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Window;
