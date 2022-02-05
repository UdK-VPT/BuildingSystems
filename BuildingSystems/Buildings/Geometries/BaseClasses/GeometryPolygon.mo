within BuildingSystems.Buildings.Geometries.BaseClasses;
record GeometryPolygon
  "3D representation of a polygon"
  Modelica.Units.SI.Length vertex1[3];
  Modelica.Units.SI.Length vertex2[3];
  Modelica.Units.SI.Length vertex3[3];
  Modelica.Units.SI.Length vertex4[3];
  Modelica.Units.SI.Length width "Width of the rectangle";
  Modelica.Units.SI.Length height "Height of the rectangle";
  Modelica.Units.SI.Length zMean "Mean vertical position";
  Modelica.Units.NonSI.Angle_deg angleDegAzi "Azimuth angle";
  Modelica.Units.NonSI.Angle_deg angleDegTil "Tilt angle";
end GeometryPolygon;
