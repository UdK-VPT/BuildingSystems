within BuildingSystems.Buildings.Geometries.Viewfactors.Examples;
model PerpendicularSquareToRectangularSurface
  "View factor calculation of two perpendicular rectangular surfaces with the common edge length L and the individual edge lengths W and H"
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
  // Analycital solution
  Real h = H/W;
  Real h1 = sqrt(1+h^2);
  Real h2 = h1^4/(h^2*(2.0+h^2));
  Real F12 = 0.25 + 1.0/Modelica.Constants.pi*(h*Modelica.Math.atan(1.0/h)
                                               -h1*Modelica.Math.atan(1.0/h1)
                                               -h^2/4.0*Modelica.Math.log(h2));
equation
  H = 0.00001 + time;
end PerpendicularSquareToRectangularSurface;
