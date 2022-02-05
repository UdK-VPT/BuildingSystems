within BuildingSystems.Buildings.Geometries.BaseClasses;
record GeometryCircle
  "3D representation of a circle"
  parameter Integer nVertices(min=3)
    "Number of vertices, which represent the circle";
  BuildingSystems.Buildings.Geometries.BaseClasses.Vertex3D vertex[nVertices];
  parameter Integer nSeg(min=3)
   "Number of vertices, which represent the circle";
  parameter Modelica.Units.SI.Length diameter=1.0 "Diameter of the circle";
  Modelica.Units.SI.Length zMean "Mean vertical position";
  Modelica.Units.NonSI.Angle_deg angleDegAzi "Azimuth angle";
  Modelica.Units.NonSI.Angle_deg angleDegTil "Tilt angle";
end GeometryCircle;
