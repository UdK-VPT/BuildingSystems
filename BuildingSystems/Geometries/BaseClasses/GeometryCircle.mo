within BuildingSystems.Geometries.BaseClasses;
record GeometryCircle
  "3D representation of a circle"
  extends BuildingSystems.Geometries.BaseClasses.GeometryGeneral(
  nPoints=nSeg);
  parameter Integer nSeg(min=3)
   "Number of points, which represent the circle";
  parameter Modelica.SIunits.Length diameter = 1.0
   "Diameter of the circle";
  Modelica.SIunits.Length zMean
    "Mean vertical position";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAzi
    "Azimuth angle of the rectangle";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegTil
    "Tilt angle of the rectangle";
end GeometryCircle;
