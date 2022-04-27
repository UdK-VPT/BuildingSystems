within BuildingSystems.Buildings.Geometries.Viewfactors.Examples;
model PerpendicularSquareToRectangularSurface
  "View factor calculation from a square with an edge length of W to a perpendicular rectangular surfaces with the common edge length W and the edge length H"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Length W = 1.0;
  Modelica.Units.SI.Length H;
  parameter Modelica.Units.SI.Length vertex1[3] = {0.0,0.0,0.0};
  parameter Modelica.Units.SI.Length vertex2[3] = {W,0.0,0.0};
  parameter Modelica.Units.SI.Length vertex3[3] = {W,W,0.0};
  parameter Modelica.Units.SI.Length vertex4[3] = {0.0,W,0.0};
  Modelica.Units.SI.Length vertex5[3] = {0.0,W,H};
  Modelica.Units.SI.Length vertex6[3] = {0.0,0.0,H};
  // surface1 = vertex1, vertex2, vertex3, vertex4
  // surface2 = vertex1, vertex4, vertex5, vertex6
  parameter Integer nRect = 2;
  Real a1[nRect] = {vertex1[1],vertex1[1]};
  Real a2[nRect] = {vertex1[2],vertex1[2]};
  Real a3[nRect] = {vertex1[3],vertex1[3]};
  Real b1[nRect] = {vertex2[1],vertex4[1]};
  Real b2[nRect] = {vertex2[2],vertex4[2]};
  Real b3[nRect] = {vertex2[3],vertex4[3]};
  Real c1[nRect] = {vertex3[1],vertex5[1]};
  Real c2[nRect] = {vertex3[2],vertex5[2]};
  Real c3[nRect] = {vertex3[3],vertex5[3]};
  Real d1[nRect] = {vertex4[1],vertex6[1]};
  Real d2[nRect] = {vertex4[2],vertex6[2]};
  Real d3[nRect] = {vertex4[3],vertex6[3]};
  parameter Integer r[nRect] = {1,1};
  parameter Integer z[nRect]={10 for i in 1:nRect};
  Real viewFac[nRect,nRect] = BuildingSystems.Buildings.Geometries.Viewfactors.Functions.PhiRect(nRect,a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3,r,z,false);
  // Analytical solution
  Real h = H/W;
  Real h1 = sqrt(1+h^2);
  Real h2 = h1^4/(h^2*(2.0+h^2));
  Real F12 = 0.25 + 1.0/Modelica.Constants.pi*(h*Modelica.Math.atan(1.0/h)
                                               -h1*Modelica.Math.atan(1.0/h1)
                                               -h^2/4.0*Modelica.Math.log(h2));
equation
  H = 0.00001 + time;

  annotation(experiment(StartTime=0, StopTime=1),
      __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Geometries/Viewfactors/Examples/PerpendicularSquareToRectangularSurface.mos" "Simulate and plot"),
      Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
      Text(
        extent={{-46,-62},{-34,-74}},
        textColor={0,0,0},
        textString="1"),
      Ellipse(
        extent={{-82,62},{-78,58}},
        lineThickness=0.5,
        fillColor={238,46,47},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None),
      Ellipse(
        extent={{-42,62},{-38,58}},
        lineThickness=0.5,
        fillColor={238,46,47},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None),
      Ellipse(
        extent={{78,-58},{82,-62}},
        lineThickness=0.5,
        fillColor={238,46,47},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None),
      Ellipse(
        extent={{78,62},{82,58}},
        lineThickness=0.5,
        fillColor={238,46,47},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None),
      Ellipse(
        extent={{-42,-58},{-38,-62}},
        lineThickness=0.5,
        fillColor={238,46,47},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None),
      Ellipse(
        extent={{-82,-58},{-78,-62}},
        lineThickness=0.5,
        fillColor={238,46,47},
        fillPattern=FillPattern.Solid,
        pattern=LinePattern.None),
      Text(
        extent={{74,-62},{86,-74}},
        textColor={0,0,0},
        textString="2"),
      Text(
        extent={{74,72},{86,60}},
        textColor={0,0,0},
        textString="3"),
      Text(
        extent={{-86,72},{-74,60}},
        textColor={0,0,0},
        textString="5"),
      Text(
        extent={{-46,72},{-34,60}},
        textColor={0,0,0},
        textString="4"),
      Text(
        extent={{94,-62},{-102,-114}},
        textColor={0,0,0},
        textString="  View factor calculation from a square with an edge length of W
to a perpendicular rectangular surfaces with the common edge
length W and the edge length H."),
      Text(
        extent={{8,10},{32,-8}},
        textColor={0,0,0},
        textString="surface1"),
      Text(
        extent={{-72,10},{-48,-8}},
        textColor={0,0,0},
        textString="surface2"),
      Rectangle(
        extent={{-80,60},{-40,-60}},
        lineColor={0,0,0},
        lineThickness=0.5),
      Rectangle(
        extent={{-40,60},{80,-60}},
        lineColor={0,0,0},
        lineThickness=0.5),
      Text(
        extent={{-86,-62},{-74,-74}},
        textColor={0,0,0},
        textString="6"),
      Text(
        extent={{12,72},{24,60}},
        textColor={0,0,0},
          textString="W"),
      Text(
        extent={{-38,6},{-26,-6}},
        textColor={0,0,0},
          textString="W"),
      Text(
        extent={{-66,72},{-54,60}},
        textColor={0,0,0},
          textString="H")}),
Documentation(info="<html>
<p>
Example that calculates the view factors of two perpendicular rectangular
surfaces with the common edge length L and the individual edge lengths W and H.
</p>
</html>",
revisions="<html>
<ul>
<li>
April 26, 2022, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end PerpendicularSquareToRectangularSurface;
