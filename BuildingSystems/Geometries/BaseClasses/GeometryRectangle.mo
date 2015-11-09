within BuildingSystems.Geometries.BaseClasses;
record GeometryRectangle
  "3D representation of a rectangle"
  extends BuildingSystems.Geometries.BaseClasses.GeometryGeneral(
  nPoints=4);
  Modelica.SIunits.Length width
    "Width of the rectangle";
  Modelica.SIunits.Length height
    "Height of the rectangle";
  Modelica.SIunits.Length zMean
    "Mean vertical position";
  BuildingSystems.Types.Angle_deg angleDegAzi
    "Azimuth angle of the rectangle";
  BuildingSystems.Types.Angle_deg angleDegTil
    "Tilt angle of the rectangle";
end GeometryRectangle;
