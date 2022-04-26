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
  Real viewFacSum(start=0);
algorithm
  for i in 1:nRect loop
    viewFacSum := viewFacSum + viewFac[nRect,i];
  end for;
equation
  C = 3.0 + time;
end RectangularCuboidSurfaces;
