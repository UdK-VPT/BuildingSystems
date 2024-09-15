within BuildingSystems.HAM.Data.MaterialProperties.BaseClasses;
record MaterialHygroThermalGeneral
  extends MaterialGeneral;
  parameter Modelica.Units.SI.Density rho "Density";
  parameter Modelica.Units.SI.SpecificHeatCapacity c "Specific heat capacity";
  parameter BuildingSystems.Types.RelativeHumidity sorTabX[:]
    "Relative humidity of the porous material(table)";
  parameter Modelica.Units.SI.MassConcentration sorTabY[:]
    "Water content of the porous material (table)";
  parameter BuildingSystems.Types.RelativeHumidity myTabX[:]
    "Relative humdity of the porous material (table)";
  parameter BuildingSystems.Types.WaterVapourDiffusionResistance myTabY[:]
    "Water vapour diffusion of the porous material (table)";
  parameter Modelica.Units.SI.MassConcentration lambdaTabX[:]
    "Water content of the porous material (table)";
  parameter Modelica.Units.SI.ThermalConductivity lambdaTabY[:]
    "Heat conductivity of the porous material (table)";
  parameter Modelica.Units.SI.MassConcentration dwwTabX[:]
    "Water content of the porous material (table)";
  parameter BuildingSystems.Types.CoefficientOfLiquidTransport dwwTabY[:]
    "Liquid transport coefficient for redistribution of the porous material (table)";
  parameter Modelica.Units.SI.MassConcentration dwsTabX[:]
    "Water content of the porous material (table)";
  parameter BuildingSystems.Types.CoefficientOfLiquidTransport dwsTabY[:]
    "Liquid transport coefficient for suction of the porous material (table)";
  parameter Modelica.Units.SI.ThermalConductivity lambdaDry
    "Heat conductivity of the dry porous material";
  parameter Modelica.Units.SI.MassConcentration w80
    "Water content by 80 %";
  parameter Modelica.Units.SI.MassConcentration w95
    "Water content by 95 %";
  parameter Modelica.Units.SI.MassConcentration wF
    "Free water saturation";
  parameter BuildingSystems.Types.Porosity porosity
    "Porosity of the layer [-]";
  parameter Real A
    "Water absorption coefficient[kg/m^2*s^0.5]";
  parameter BuildingSystems.Types.WaterVapourDiffusionResistance myDry
    "Water vapour diffusion resistance factor of a dry building material [-]";
  parameter BuildingSystems.Types.WaterVapourDiffusionResistance myMoistF
    "Fictitious water vapour diffusion resistance factor of a moist building material [-]";
  parameter Real moistSup
    "Moisture-related thermal conductivity supplement[-]";
end MaterialHygroThermalGeneral;
