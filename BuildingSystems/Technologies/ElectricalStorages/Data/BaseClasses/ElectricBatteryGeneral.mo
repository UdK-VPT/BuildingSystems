within BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses;
record ElectricBatteryGeneral
  parameter Modelica.SIunits.Energy E_nominal
    "Nominal capacity";
  parameter Modelica.SIunits.Voltage U_nominal
    "Nominal voltage";
  parameter Real SOC_min
    "Minimal accepted charge level (SOC)";
  parameter Real c(unit="1")
    "Capacity relation available to bound energy";
  parameter Real k(unit="1/s")
    "Battery rate";
  parameter Modelica.SIunits.Efficiency etaCharge
    "Charge efficiency";
  parameter Modelica.SIunits.Efficiency etaLoad
    "Load efficiency";
  parameter Real fDis
    "Self-discharge factor (percentage per day)";
  parameter Modelica.SIunits.Power PLoad_max
    "Maximal discharging power";
  parameter Modelica.SIunits.Power PCharge_max
    "Maximal charging power";
  parameter Real p(unit="1")
    "Peukert coefficient";
  parameter Real a_mcr(unit="W/J")
    "Maximum charge rate parameter";
end ElectricBatteryGeneral;
