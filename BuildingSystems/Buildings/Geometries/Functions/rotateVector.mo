within BuildingSystems.Buildings.Geometries.Functions;
function rotateVector
  "Calculates the coordinates of a rotated 3D vector"
  input Modelica.SIunits.Length v[3]
    "Original Bector";
  input Modelica.SIunits.Length axis[3]
    "Vector of the rotation";
  input Modelica.SIunits.Angle theta
    "Rotation angle";
  output Modelica.SIunits.Length vr[3]
    "Rotated vector";
protected
  Real x, a, b, c, d;
  Real mat[3,3];
algorithm
  x := sqrt(axis[1] * axis[2] + axis[3] * axis[2] + axis[3] * axis[3]);
  a := cos(theta / 2.0);
  b := -(axis[1] / x) * sin(theta / 2.0);
  c := -(axis[2] / x) * sin(theta / 2.0);
  d := -(axis[3] / x) * sin(theta / 2.0);

  mat[1,1] := a * a + b * b - c * c - d * d;
  mat[1,2] := 2.0 * (b * c - a * d);
  mat[1,3] := 2.0 * (b * d + a * c);

  mat[2,1] := 2.0 * (b * c + a * d);
  mat[2,2] := a * a + c * c - b * b - d * d;
  mat[2,3] := 2.0 * (c * d - a * b);

  mat[3,1] := 2.0 * (b * d - a * c);
  mat[3,2] := 2.0 * (c * d + a * b);
  mat[3,3] := a * a + d * d - b * b - c * c;

  vr := v * mat;
end rotateVector;
