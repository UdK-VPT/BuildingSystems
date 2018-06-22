within BuildingSystems.Technologies.ElectricalStorages.Data.LeadAcid;
record Long7Ah =
    BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses.ElectricBatteryGeneral
    (
  E_nominal = 86.4*3600,
  U_nominal = 12.0,
  SOC_min = 0.01,
  c = 0.315,
  k = 1.24/3600.0,
  etaCharge = 0.92736,
  etaLoad = 0.92736,
  fDis = 0.2/(182.5*24.0*3600.0),
  PLoad_max = 1296.0,
  PCharge_max = 25.9)
  "Lead acid 'WP7.2-12': 86.4 Wh"
  annotation(Documentation(info= "<html>Source: Datasheet for Long WP7.2-12, https://www.kunglong.com/product_pdf/en/WP7.2-12.pdf<br/></html>"));