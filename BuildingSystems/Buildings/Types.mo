within BuildingSystems.Buildings;
package Types
  "Package with new types for building models"
  extends Modelica.Icons.TypesPackage;
  type DataSource = enumeration(
    File "Use data from file",
    Parameter "Use parameter",
    Input "Use input connector")
    "Enumeration to select data source";

  type ThermalBoundaryCondition = enumeration(
    Ambient "Ambient climate",
    Adiabatic "Adiabatic boundary condition",
    Constant "Constant temperature")
    "Enumeration of thermal boundary conditions";
end Types;
