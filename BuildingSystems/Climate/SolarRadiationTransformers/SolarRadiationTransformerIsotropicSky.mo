within BuildingSystems.Climate.SolarRadiationTransformers;
model SolarRadiationTransformerIsotropicSky
  "Solar radiation calculation on a tilted surface (isotropic sky model)"
  extends SolarRadiationTransformerGeneral;
equation

  IrrTotTil = radiationPort.IrrDir + 0.5 * (1.0 + cosAngleTil) * IrrDifHor + 0.5 * (1.0 - cosAngleTil) * rhoAmb * IrrTotHor;

  annotation (defaultComponentName="solRadTra", Icon(graphics={
    Rectangle(extent={{-80,80},{80,-80}}, lineColor={170,213,255},fillPattern = FillPattern.Solid,fillColor={170,213,255}),
    Ellipse(extent={{-60,62},{20,-18}},lineColor={255,128,0},fillColor={255,128,0},fillPattern = FillPattern.Solid),
    Line(points={{72,-8},{8,-72}},color={0,0,0},smooth=Smooth.None,thickness=2),
    Line(points={{12,-12},{32,-32}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{22,-2},{42,-22}}, color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{32,8},{52,-12}}, color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{-8,-32},{12,-52}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{2,-22},{22,-42}},color={255,128,0},thickness=1,smooth=Smooth.None)}),
Documentation(info="<html>
<p>
This model calculates the diffuse solar radiation on a tilted surface after the isotropic sky model of Liu-Jordan and the total incident radation on a tilted surface.
</p>
<code>
IrrTotTil = IrrDirTil + 0.5 * (1.0 + cosAngleTil) * IrrDifHor + 0.5 * (1.0 - cosAngleTil) * rhoAmb * IrrTotHor
</code>
<p>
where  <code>IrrDirTil</code> stands for the total direct radiation on the tilted surface.
cosAngleTil is the cosinus of the tilt angle, the angle formated by the tilted surface and
the horizontal ground. <code>IrrDifHor</code> is the total diffuse radiation on a horizontal surface,
<code>IrrTotHor</code> is the total radiation on the horizonal surface and <code>rhoAmb</code>
is the reflexion factor of the surroundings.
</p>
<h4>References</h4>
<p>
Nikolai. V. Khartchenko. Thermische Solaranlagen Grundlagen, Planung und Auslegung, Springer ISBN 3-540-58300-9
</p>
</html>",revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SolarRadiationTransformerIsotropicSky;
