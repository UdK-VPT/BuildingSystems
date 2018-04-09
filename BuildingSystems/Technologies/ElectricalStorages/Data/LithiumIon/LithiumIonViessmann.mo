within BuildingSystems.Technologies.ElectricalStorages.Data.LithiumIon;
  record  LithiumIonViessmann = BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses.ElectricBatteryGeneral(
    E_nominal = 4.7*1000*3600,
    U_nominal = 52.0,
    SOC_min = 0.2,
    c = 0.4,
    k = 8.0/3600.0,
    etaCharge = 0.93,
    etaLoad = 0.93,
    fDis = 0.1/(30.*24.0*3600.0),
    PLoad_max = 2850.0,
    PCharge_max = 2850.0)
    "Lithium Ion Viessmann: 4.7 kWh"
    annotation(Documentation(info ="<html>Source: PolySun version 10.0.11 except loss factor fDis after http://www.batteryeducation.com<br/></html>"));
