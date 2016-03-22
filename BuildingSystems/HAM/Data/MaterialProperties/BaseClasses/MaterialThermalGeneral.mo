within BuildingSystems.HAM.Data.MaterialProperties.BaseClasses;
record MaterialThermalGeneral
  extends MaterialGeneral;
  parameter Modelica.SIunits.ThermalConductivity lambda = 1.0
    "Heat conductivity";
  parameter Modelica.SIunits.SpecificHeatCapacity c = 1000.0
    "Specific heat capacity";
  parameter Modelica.SIunits.Density rho = 1000.0
    "Density";
end MaterialThermalGeneral;
