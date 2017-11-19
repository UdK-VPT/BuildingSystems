within BuildingSystems.Technologies.ElectricalStorages.Data.LithiumIon;
  record  LithiumIonAquion = BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses.ElectricBatteryGeneral(
    E_nominal = 25.9*1000*3600,
    U_nominal = 48.0,
    SOC_min = 0.0,
    c = 0.4,
    kstar = 8.0/3600.0,
    etaCharge = 0.93,
    etaLoad = 0.93,
    fDis = 0.1/(30.*24.0*3600.0),
    PLoad_max = 11700.0,
    PCharge_max = 11700.0)
    "Lithium Ion Aquion: 25.9 kWh"
    annotation(Documentation(info ="<html>Source: PolySun version 10.0.11 except loss factor fDis after http://www.batteryeducation.com<br/></html>"));
