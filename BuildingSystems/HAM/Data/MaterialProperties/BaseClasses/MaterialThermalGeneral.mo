within BuildingSystems.HAM.Data.MaterialProperties.BaseClasses;
record MaterialThermalGeneral
  extends MaterialGeneral;
  parameter Modelica.SIunits.ThermalConductivity lambda
    "Heat conductivity";
  parameter Modelica.SIunits.SpecificHeatCapacity c
    "Specific heat capacity";
  parameter Modelica.SIunits.Density rho
    "Density";
end MaterialThermalGeneral;
