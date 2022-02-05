within BuildingSystems.HAM.Data.MaterialProperties.BaseClasses;
record MaterialThermalGeneral
  extends MaterialGeneral;
  parameter Modelica.Units.SI.ThermalConductivity lambda=1.0
    "Heat conductivity";
  parameter Modelica.Units.SI.SpecificHeatCapacity c=1000.0
    "Specific heat capacity";
  parameter Modelica.Units.SI.Density rho=1000.0 "Density";
end MaterialThermalGeneral;
