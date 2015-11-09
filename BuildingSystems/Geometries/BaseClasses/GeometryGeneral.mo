within BuildingSystems.Geometries.BaseClasses;
record GeometryGeneral
  "Abstract 3D representation of a geometry"
  parameter Integer nPoints
    "Number of points, which represent the 3D geometry";
  BuildingSystems.Geometries.BaseClasses.Point point[nPoints]
    "Individual points of a geometry";
end GeometryGeneral;
