within BuildingSystems.Technologies.ElectricalStorages.Data.LithiumIon;
  record  LithiumIonTeslaPowerwall2 = BuildingSystems.Technologies.ElectricalStorages.Data.BaseClasses.ElectricBatteryGeneral(
    E_nominal = 13.5*1000*3600,
    U_nominal = 400.0,
    SOC_min = 0.0,
    c = 0.4,
    kstar = 8.0,
    etaCharge = 0.92,
    etaLoad = 0.92,
    fDis = 0.1/(30.*24.0*3600.0),
    PLoad_max = 4600.0,
    PCharge_max = 4600.0)
    "Lithium Ion Tesla Powerwall 2: 13.5 kWh"
    annotation(Documentation(info ="<html>Source: PolySun version 10.0.11 and Tesla except loss factor fDis after http://www.batteryeducation.com<br/></html>"));
