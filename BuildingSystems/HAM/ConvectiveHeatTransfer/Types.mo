within BuildingSystems.HAM.ConvectiveHeatTransfer;
package Types
  "Package with new types for convective heat transfer"
  extends Modelica.Icons.TypesPackage;
  type Convection = enumeration(
    free "Free convection",
    forced "Forced convection",
    const "Constant alpha value");
end Types;
