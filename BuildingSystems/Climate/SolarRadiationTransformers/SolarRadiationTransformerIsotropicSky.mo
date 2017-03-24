within BuildingSystems.Climate.SolarRadiationTransformers;
model SolarRadiationTransformerIsotropicSky
  "Solar radiation calculation on a tilted surface (isotropic sky model)"
  extends SolarRadiationTransformerGeneral;
equation
  R = BuildingSystems.Utilities.SmoothFunctions.softcut_upper(cosAngleInc/cosAngleZen,5.0,0.001);

  radiationPort.IrrDir = R * IrrDirHor;

  // softcut for the limit of the solar constant = 1341 W/m^2
  IrrTotTil = BuildingSystems.Utilities.SmoothFunctions.softcut_upper(R * IrrDirHor + 0.5 * (1.0 + cosAngleTil) * IrrDifHor,1341.0,0.01)
    + 0.5 * (1.0 - cosAngleTil) * rhoAmb * IrrTotHor;

  annotation (Icon(graphics={
    Rectangle(extent={{-80,80},{80,-80}}, lineColor={170,213,255},fillPattern = FillPattern.Solid,fillColor={170,213,255}),
    Ellipse(extent={{-60,62},{20,-18}},lineColor={255,128,0},fillColor={255,128,0},fillPattern = FillPattern.Solid),
    Line(points={{72,-8},{8,-72}},color={0,0,0},smooth=Smooth.None,thickness=2),
    Line(points={{12,-12},{32,-32}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{22,-2},{42,-22}}, color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{32,8},{52,-12}}, color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{-8,-32},{12,-52}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{2,-22},{22,-42}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Text(extent={{-32,-78},{36,-104}}, lineColor={0,0,255},textString="%name")}),
Documentation(info="<html>
This model calculates the solar radiation on a tilted surface after the isotropic sky model.
<p>
The direct solar radiation forms an angle with the vector normal to the earth <code>Zen</code>.
The same direct solar radiation forms an angle with the normal vector of a tilted surface <code>Inc</code>.
</p>
<p>
Based on trigonometric relations, the model calculates a <code>R</code>,
a conversion factor which calculates the amount of direct solar radiation incident
on a tilted surface from the value of the total direct solar radiation on a horizontal surface.
</p>
<p>
The total solar radiation on a tilted surface <code>IrrTotTil</code> is calculated with the following equation:
</p>
<code>
IrrTotTil = R * IrrDirHor + 0.5 * (1.0 + cosAngleTil) * IrrDifHor + 0.5 * (1.0 - cosAngleTil) * rhoAmb * IrrTotHor
</code>
<p>
where  <code>R*IDirHor</code> stands for the total direct radiation on the tilted surface.
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
