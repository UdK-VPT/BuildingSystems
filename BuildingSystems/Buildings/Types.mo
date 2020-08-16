within BuildingSystems.Buildings;
package Types
  "Package with new types for building models"
  extends Modelica.Icons.TypesPackage;
  type DataSource = enumeration(
    Calculation "Calculated value",
    Parameter "Constant value",
    Input "External input")
    "Enumeration to select data sources";

  type GeometryType = enumeration(
    Fixed "Fixed",
    Flexible "Flexible")
    "Enumeration to select the geometry type";

  type GeometryShape = enumeration(
    Rectangle "Rectangle",
    Triangle "Triangle",
    Circle "Circle")
    "Enumeration to select the geometry shape";

  type CoordinateType = enumeration(
    Local "Local coordinates",
    Global "Global coordinates")
    "Enumeration to select the coordinate type";

  type ThermalBoundaryCondition = enumeration(
    Ambience "Ambience climate",
    Adiabatic "Adiabatic boundary condition",
    Constant "Constant temperature")
    "Enumeration of thermal boundary conditions";

  type NumericalResolution = enumeration(
    Low "Low resolution: 1 node per layer",
    Medium "Medium resolution: 2 nodes per layer",
    High "High resolution: 4 nodes per layer")
    "Enumeration of numerical resolution";

  type ThermalBuildingCapacity = enumeration(
    Low "Light construction: 25 kJ/(m2.K)",
    Medium "Medium construction: 65 kJ/(m2.K)",
    High "Heavy construction: 105 kJ/(m2.K)")
    "Enumeration of thermal capacity";
end Types;
