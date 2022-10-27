within BuildingSystems.Buildings.Geometries.Viewfactors.Examples;
model ParallelRectangularEqualSurfaces
  "View factor calculation of two parallel equal rectangular surfaces with the edge lengths W1 and W2 and the distance H"
  extends Modelica.Icons.Example;
  Modelica.Units.SI.Length W1;
  parameter Modelica.Units.SI.Length W2 = 1.0;
  parameter Modelica.Units.SI.Length H = 1.0;
  parameter Modelica.Units.SI.Length vertex1[3] = {0.0,0.0,0.0};
  Modelica.Units.SI.Length vertex2[3] = {W1,0.0,0.0};
  Modelica.Units.SI.Length vertex3[3] = {W1,W2,0.0};
  parameter Modelica.Units.SI.Length vertex4[3] = {0.0,W2,0.0};
  Modelica.Units.SI.Length vertex5[3] = {W1,0.0,H};
  Modelica.Units.SI.Length vertex6[3] = {W1,W2,H};
  parameter Modelica.Units.SI.Length vertex7[3] = {0.0,W2,H};
  parameter Modelica.Units.SI.Length vertex8[3] = {0.0,0.0,H};
  // surface1 = vertex1, vertex2, vertex3, vertex4
  // surface2 = vertex8, vertex7, vertex6, vertex5
  parameter Integer nRect = 2;
  Real a1[nRect] = {vertex1[1],vertex8[1]};
  Real a2[nRect] = {vertex1[2],vertex8[2]};
  Real a3[nRect] = {vertex1[3],vertex8[3]};
  Real b1[nRect] = {vertex2[1],vertex7[1]};
  Real b2[nRect] = {vertex2[2],vertex7[2]};
  Real b3[nRect] = {vertex2[3],vertex7[3]};
  Real c1[nRect] = {vertex3[1],vertex6[1]};
  Real c2[nRect] = {vertex3[2],vertex6[2]};
  Real c3[nRect] = {vertex3[3],vertex6[3]};
  Real d1[nRect] = {vertex4[1],vertex5[1]};
  Real d2[nRect] = {vertex4[2],vertex5[2]};
  Real d3[nRect] = {vertex4[3],vertex5[3]};
  parameter Integer r[nRect] = {1,1};
  parameter Integer z[nRect]={10 for i in 1:nRect};
  Real viewFac[nRect,nRect] = BuildingSystems.Buildings.Geometries.Viewfactors.Functions.PhiRect(nRect,a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3,r,z,false);
  // Analytical solution
  Real x = W1/H;
  Real y = W2/H;
  Real x1 = sqrt(1.0+x^2);
  Real y1 = sqrt(1.0+y^2);
  Real F12 = 1.0/(Modelica.Constants.pi*x*y)*(Modelica.Math.log((x1^2*y1^2)/(x1^2+y1^2-1.0))
             +2.0*x*(y1*Modelica.Math.atan(x/y1)-Modelica.Math.atan(x))
             +2.0*y*(x1*Modelica.Math.atan(y/x1)-Modelica.Math.atan(y)));
equation
  W1 = 0.00001 + time;

  annotation(experiment(StartTime=0, StopTime=1),
        __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Geometries/Viewfactors/Examples/ParallelRectangularEqualSurfaces.mos" "Simulate and plot"),
        Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-6,-46},{6,-58}},
          textColor={0,0,0},
          textString="1"),
        Ellipse(
          extent={{-82,62},{-78,58}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-22,62},{-18,58}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{58,-38},{62,-42}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{58,82},{62,78}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-22,-58},{-18,-62}},
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
          extent={{54,-46},{66,-58}},
          textColor={0,0,0},
          textString="2"),
        Text(
          extent={{54,96},{66,84}},
          textColor={0,0,0},
          textString="3"),
        Text(
          extent={{-86,76},{-74,64}},
          textColor={0,0,0},
          textString="5"),
        Text(
          extent={{-6,96},{6,84}},
          textColor={0,0,0},
          textString="4"),
        Text(
          extent={{92,-46},{-96,-130}},
          textColor={0,0,0},
            textString="View factor calculation of two parallel equal rectangular surfaces
  with the edge lengths W1 and W2 and the distance H.
  W1 varies with the time from 0 to 1."),
        Text(
          extent={{18,72},{42,54}},
          textColor={0,0,0},
          textString="surface1"),
        Text(
          extent={{-64,52},{-40,34}},
          textColor={0,0,0},
          textString="surface2"),
        Rectangle(
          extent={{0,80},{60,-40}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Rectangle(
          extent={{-80,60},{-20,-60}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Text(
          extent={{-26,76},{-14,64}},
          textColor={0,0,0},
          textString="6"),
        Text(
          extent={{-96,10},{-84,-2}},
          textColor={0,0,0},
            textString="W2"),
        Text(
          extent={{-56,-64},{-44,-76}},
          textColor={0,0,0},
            textString="W1"),
        Text(
          extent={{-16,24},{-4,12}},
          textColor={28,108,200},
            textString="H"),
        Ellipse(
          extent={{-2,82},{2,78}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-2,-38},{2,-42}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Text(
          extent={{-86,-64},{-74,-76}},
          textColor={0,0,0},
            textString="7"),
        Text(
          extent={{-26,-64},{-14,-76}},
          textColor={0,0,0},
            textString="8"),
        Text(
          extent={{26,-44},{38,-56}},
          textColor={0,0,0},
            textString="W1"),
        Text(
          extent={{62,30},{74,18}},
          textColor={0,0,0},
            textString="W2"),
        Ellipse(
          extent={{-52,2},{-48,-2}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{28,22},{32,18}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
          Line(
            points={{-50,0},{30,20}},
            color={28,108,200},
            thickness=0.5,
            pattern=LinePattern.Dash)}),
Documentation(info="<html>
<p>
Example that calculates the view factors of two parallel
equal rectangular surfaces with the edge lengths W1 and W2 and the distance H.
W1 varies with the time from 0 to 1.
</p>
</html>",
revisions="<html>
<ul>
<li>
April 28, 2022, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ParallelRectangularEqualSurfaces;
