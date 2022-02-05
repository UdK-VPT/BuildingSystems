within BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses;
record ElectricBatteryGeneral
  parameter Modelica.Units.SI.Energy E_nominal "Nominal capacity";
  parameter Modelica.Units.SI.Voltage U_nominal "Nominal voltage";
  parameter Real SOC_min
    "Minimal accepted charge level (SOC)";
  parameter Real c(unit="1")
    "Capacity relation available to bound energy";
  parameter Real k(unit="1/s")
    "Battery rate";
  parameter Modelica.Units.SI.Efficiency etaCharge "Charge efficiency";
  parameter Modelica.Units.SI.Efficiency etaLoad "Load efficiency";
  parameter Real fDis
    "Self-discharge factor (percentage per day)";
  parameter Modelica.Units.SI.Power PLoad_max "Maximal discharging power";
  parameter Modelica.Units.SI.Power PCharge_max "Maximal charging power";
  parameter Real p(unit="1")
    "Peukert coefficient";
  parameter Real a_mcr(unit="W/J")
    "Maximum charge rate parameter";
end ElectricBatteryGeneral;
