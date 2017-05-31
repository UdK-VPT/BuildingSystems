within BuildingSystems.Technologies.ElectricalStorages.Data.LeadAcid;
record  LeadAcidGeneric = BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses.ElectricBatteryGeneral(
  E_nominal = 2.88*1000*3600,
  U_nominal = 12.0,
  SOC_min = 0.3,
  c = 0.315,
  kstar = 1.24/3600.0,
  etaCharge = 0.92736,
  etaLoad = 0.92736,
  fDis = 0.1/24.0/3600.0,
  PLoad_max = 23520.0,
  PCharge_max = 864.0)
  "Lead Acid generic: 2.88 kWh"
  annotation(Documentation(info ="<html>Source: PolySun version 9.2.9<br/></html>"));
