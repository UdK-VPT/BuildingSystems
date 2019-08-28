within BuildingSystems.Technologies.ElectricalStorages.Data.LeadAcid;
record Chloride200Ah =
    BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses.ElectricBatteryGeneral
    (
  E_nominal = 2.4*1000*3600,
  U_nominal = 12.0,
  SOC_min = 0.5,
  c = 0.315,
  k = 1.24/3600.0,
  etaCharge = 0.92736,
  etaLoad = 0.92736,
  fDis = 0.01/(7*24.0*3600.0),
  PLoad_max = 8400.0,
  PCharge_max = 336.0,
  p = 1.17,
  a_mcr = 0.96/3600.0,
  R_int = 2.7/1000,
  A = -0.06419,
  C = -0.16467)
  "Lead acid 'CLH12-200': 2.4 kWh"
  annotation(Documentation(info= "<html>Source: Datasheet for Chloride 'Lighthouse' CLH12-200, www.chloride-batteries.com<br/></html>"));
