within BuildingSystems.Buildings.Geometries.Viewfactors.Examples;
model TetraederSurfaces
  "View factor calculation of the surfaces of a non regular tetraeder with a dynamic changing geometry"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Length A = 1.0;
  parameter Modelica.Units.SI.Length B = 1.0;
  Modelica.Units.SI.Length C;
  parameter Modelica.Units.SI.Length vertex1[3] = {0.0,0.0,0.0};
  parameter Modelica.Units.SI.Length vertex2[3] = {A,0.0,0.0};
  parameter Modelica.Units.SI.Length vertex3[3] = {A,B,0.0};
  Modelica.Units.SI.Length vertex4[3] = {A,B,C};
  // surface1 = vertex1, vertex2, vertex3
  // surface2 = vertex1, vertex3, vertex4
  // surface3 = vertex4, vertex2, vertex1
  // surface4 = vertex4, vertex3, vertex2
  parameter Integer nTri = 4;
  Real a1[nTri] = {vertex1[1],vertex1[1],vertex4[1],vertex4[1]};
  Real a2[nTri] = {vertex1[2],vertex1[2],vertex4[2],vertex4[2]};
  Real a3[nTri] = {vertex1[3],vertex1[3],vertex4[3],vertex4[3]};
  parameter Real b1[nTri] = {vertex2[1],vertex3[1],vertex2[1],vertex3[1]};
  parameter Real b2[nTri] = {vertex2[2],vertex3[2],vertex2[2],vertex3[2]};
  parameter Real b3[nTri] = {vertex2[3],vertex3[3],vertex2[3],vertex3[3]};
  Real c1[nTri] = {vertex3[1],vertex4[1],vertex1[1],vertex2[1]};
  Real c2[nTri] = {vertex3[2],vertex4[2],vertex1[2],vertex2[2]};
  Real c3[nTri] = {vertex3[3],vertex4[3],vertex1[3],vertex2[3]};
  parameter Integer r[nTri] = {1,1,1,1};
  parameter Integer z[nTri]={10 for i in 1:nTri};
  Real viewFacUncompensated[nTri,nTri] = BuildingSystems.Buildings.Geometries.Viewfactors.Functions.PhiTri(nTri,a1,a2,a3,b1,b2,b3,c1,c2,c3,r,z,false);
  Real viewFac[nTri,nTri] = BuildingSystems.Buildings.Geometries.Viewfactors.Functions.PhiTri(nTri,a1,a2,a3,b1,b2,b3,c1,c2,c3,r,z,true);
  Real viewFacSum(start=0);
algorithm
  for i in 1:nTri loop
    viewFacSum := viewFacSum + viewFac[nTri,i];
  end for;
equation
  C = 0.000001 + time;
  annotation(experiment(StartTime=0, StopTime=1),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Geometries/Viewfactors/Examples/TetraederSurfaces.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
        Polygon(
          points={{0,40},{0,0},{-40,0},{0,40}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Polygon(
          points={{-40,0},{-40,40},{0,40},{-40,0}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Polygon(
          points={{0,0},{0,40},{42,40},{0,0}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Polygon(
          points={{-40,0},{0,0},{0,-40},{-40,0}},
          lineColor={0,0,0},
          lineThickness=0.5),
        Text(
          extent={{-54,0},{-42,-12}},
          textColor={0,0,0},
          textString="1"),
        Ellipse(
          extent={{-42,2},{-38,-2}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-2,42},{2,38}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{-2,2},{2,-2}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Ellipse(
          extent={{40,42},{44,38}},
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
        Ellipse(
          extent={{-42,42},{-38,38}},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Text(
          extent={{0,2},{12,-10}},
          textColor={0,0,0},
          textString="2"),
        Text(
          extent={{-4,54},{8,42}},
          textColor={0,0,0},
          textString="3"),
        Text(
          extent={{-52,54},{-40,42}},
          textColor={0,0,0},
          textString="4"),
        Text(
          extent={{40,52},{52,40}},
          textColor={0,0,0},
          textString="4"),
        Text(
          extent={{2,-36},{14,-48}},
          textColor={0,0,0},
          textString="4"),
        Text(
          extent={{98,-58},{-98,-110}},
          textColor={0,0,0},
          textString="View factor calculation for a non regular tetraeder,
the position of vertex 4 varies between 0 and 1 with the time."),
        Text(
          extent={{-26,18},{-2,0}},
          textString="surface1",
          textColor={0,0,0}),
        Text(
          extent={{2,38},{26,20}},
          textColor={0,0,0},
          textString="surface4"),
        Text(
          extent={{-38,38},{-14,20}},
          textColor={0,0,0},
          textString="surface2"),
        Text(
          extent={{-26,-2},{-2,-20}},
          textColor={0,0,0},
          textString="surface3")}),
Documentation(info="<html>
<p>
Example that calculates the view factors of the surfaces of
a non regular tetraeder with a dynamic changing geometry.
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
end TetraederSurfaces;
