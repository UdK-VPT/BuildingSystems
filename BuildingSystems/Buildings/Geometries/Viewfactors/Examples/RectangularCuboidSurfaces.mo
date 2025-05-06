within BuildingSystems.Buildings.Geometries.Viewfactors.Examples;
model RectangularCuboidSurfaces
  "View factor calculation of the six surfaces of a rectangular cuboid"
  extends Modelica.Icons.Example;
  parameter Modelica.Units.SI.Length A = 3.0;
  parameter Modelica.Units.SI.Length B = 3.0;
  Modelica.Units.SI.Length C;
  parameter Modelica.Units.SI.Length vertex1[3] = {0.0,0.0,0.0};
  parameter Modelica.Units.SI.Length vertex2[3] = {A,0.0,0.0};
  parameter Modelica.Units.SI.Length vertex3[3] = {A,B,0.0};
  parameter Modelica.Units.SI.Length vertex4[3] = {0.0,B,0.0};
  Modelica.Units.SI.Length vertex5[3] = {A,0.0,C};
  Modelica.Units.SI.Length vertex6[3] = {A,B,C};
  Modelica.Units.SI.Length vertex7[3] = {0.0,B,C};
  Modelica.Units.SI.Length vertex8[3] = {0.0,0.0,C};
  // rectangle1 = vertex1, vertex2, vertex3, vertex4
  // rectangle2 = vertex1, vertex4, vertex7, vertex8
  // rectangle3 = vertex4, vertex3, vertex6, vertex7
  // rectangle4 = vertex3, vertex2, vertex5, vertex6
  // rectangle5 = vertex2, vertex1, vertex8, vertex5
  // rectangle6 = vertex8, vertex7, vertex6, vertex5
  parameter Integer nRect = 6;
  Real a1[nRect] = {vertex1[1],vertex1[1],vertex4[1],vertex3[1],vertex2[1],vertex8[1]};
  Real a2[nRect] = {vertex1[2],vertex1[2],vertex4[2],vertex3[2],vertex2[2],vertex8[2]};
  Real a3[nRect] = {vertex1[3],vertex1[3],vertex4[3],vertex3[3],vertex2[3],vertex8[3]};
  Real b1[nRect] = {vertex2[1],vertex4[1],vertex3[1],vertex2[1],vertex1[1],vertex7[1]};
  Real b2[nRect] = {vertex2[2],vertex4[2],vertex3[2],vertex2[2],vertex1[2],vertex7[2]};
  Real b3[nRect] = {vertex2[3],vertex4[3],vertex3[3],vertex2[3],vertex1[3],vertex7[3]};
  Real c1[nRect] = {vertex3[1],vertex7[1],vertex6[1],vertex5[1],vertex8[1],vertex6[1]};
  Real c2[nRect] = {vertex3[2],vertex7[2],vertex6[2],vertex5[2],vertex8[2],vertex6[2]};
  Real c3[nRect] = {vertex3[3],vertex7[3],vertex6[3],vertex5[3],vertex8[3],vertex6[3]};
  Real d1[nRect] = {vertex4[1],vertex8[1],vertex7[1],vertex6[1],vertex5[1],vertex5[1]};
  Real d2[nRect] = {vertex4[2],vertex8[2],vertex7[2],vertex6[2],vertex5[2],vertex5[2]};
  Real d3[nRect] = {vertex4[3],vertex8[3],vertex7[3],vertex6[3],vertex5[3],vertex5[3]};
  parameter Integer r[nRect] = {1,1,1,1,1,1};
  parameter Integer z[nRect]={10 for i in 1:nRect};
  Real viewFac[nRect,nRect] = BuildingSystems.Buildings.Geometries.Viewfactors.Functions.PhiRect(nRect,a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3,r,z,true);
  Real viewFacSum1(start=0);
  Real viewFacSum2(start=0);
  Real viewFacSum3(start=0);
  Real viewFacSum4(start=0);
  Real viewFacSum5(start=0);
  Real viewFacSum6(start=0);

algorithm
  for i in 1:nRect loop
    viewFacSum1 := viewFacSum1 + viewFac[1,i];
    viewFacSum2 := viewFacSum2 + viewFac[2,i];
    viewFacSum3 := viewFacSum3 + viewFac[3,i];
    viewFacSum4 := viewFacSum4 + viewFac[4,i];
    viewFacSum5 := viewFacSum5 + viewFac[5,i];
    viewFacSum6 := viewFacSum6 + viewFac[6,i];
  end for;
equation
  C = 3.0 + time;

  annotation(experiment(StartTime=0, StopTime=1),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Geometries/Viewfactors/Examples/RectangularCuboidSurfaces.mos" "Simulate and plot"),
Documentation(info="<html>
<p>
Example that calculates the view factors of the six surfaces of a rectangular cuboid
surfaces with the different edge lengths A, B and C.
C varies with the time from 3 to 4.
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
end RectangularCuboidSurfaces;
