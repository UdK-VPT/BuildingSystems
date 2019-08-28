within BuildingSystems.Technologies.ElectricalStorages.Data.LeadAcid;
record LeadAcidGeneric =
    BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses.ElectricBatteryGeneral
    (
  E_nominal = 2.88*1000*3600,
  U_nominal = 12.0,
  SOC_min = 0.5,
  c = 0.315,
  k = 1.24/3600.0,
  etaCharge = 0.92736,
  etaLoad = 0.92736,
  fDis = 0.05/(30*24.0*3600.0),
  PLoad_max = 23520.0,
  PCharge_max = 864.0,
  p = 1.3,
  a_mcr = 0.96/3600.0,
  R_int = 10/1000,
  A = -0.1,
  C = -0.05)
  "Lead Acid generic: 2.88 kWh"
  annotation(Documentation(info= "<html>Source: PolySun version 9.2.9 except loss factor fDis after http://www.batteryeducation.com<br/></html>"));
