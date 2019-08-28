within BuildingSystems.Technologies.ElectricalStorages.Data.LithiumIon;
record LithiumIonTeslaPowerwall1 =
    BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses.ElectricBatteryGeneral
    (
  E_nominal = 6.4*1000*3600,
  U_nominal = 400.0,
  SOC_min = 0.0,
  c = 0.4,
  k = 8.0/3600.0,
  etaCharge = 0.92,
  etaLoad = 0.92,
  fDis = 0.1/(30.*24.0*3600.0),
  PLoad_max = 3300.0,
  PCharge_max = 3300.0,
  p = 1.05,
  a_mcr = 0.96/3600.0,
  A = 0.0,
  C = 0.0)
  "Lithium Ion Tesla Powerwall 1: 6.4 kWh"
  annotation(Documentation(info= "<html>Source: PolySun version 10.0.11 and Tesla except loss factor fDis after http://www.batteryeducation.com<br/></html>"));
