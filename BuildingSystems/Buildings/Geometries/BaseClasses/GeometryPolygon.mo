within BuildingSystems.Buildings.Geometries.BaseClasses;
record GeometryPolygon
  "3D representation of a polygon"
  Modelica.SIunits.Length vertex1[3];
  Modelica.SIunits.Length vertex2[3];
  Modelica.SIunits.Length vertex3[3];
  Modelica.SIunits.Length vertex4[3];
  Modelica.SIunits.Length width
    "Width of the rectangle";
  Modelica.SIunits.Length height
    "Height of the rectangle";
  Modelica.SIunits.Length zMean
    "Mean vertical position";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAzi
    "Azimuth angle";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegTil
    "Tilt angle";
end GeometryPolygon;
