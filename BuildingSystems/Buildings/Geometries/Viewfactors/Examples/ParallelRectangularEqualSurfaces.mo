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
  // Analycital solution
  Real x = W1/H;
  Real y = W2/H;
  Real x1 = sqrt(1.0+x^2);
  Real y1 = sqrt(1.0+y^2);
  Real F12 = 1.0/(Modelica.Constants.pi*x*y)*(Modelica.Math.log((x1^2*y1^2)/(x1^2+y1^2-1.0))
             +2.0*x*(y1*Modelica.Math.atan(x/y1)-Modelica.Math.atan(x))
            +2.0*y*(x1*Modelica.Math.atan(y/x1)-Modelica.Math.atan(y)));
equation
  W1 = 0.00001 + time;
end ParallelRectangularEqualSurfaces;
