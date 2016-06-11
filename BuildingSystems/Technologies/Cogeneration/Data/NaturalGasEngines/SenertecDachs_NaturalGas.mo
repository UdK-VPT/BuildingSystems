within BuildingSystems.Technologies.Cogeneration.Data.NaturalGasEngines;
record  SenertecDachs_NaturalGas = BuildingSystems.Technologies.Cogeneration.Data.BaseClasses.CogenerationUnitGeneral(
  Q_flow_nominal = 12500.0,
  QCon_flow_nominal = 21000.0,
  P_nominal = 6000.0,
  etaEl = {{0.0,0.0},{0.999,0.268},{1.0,0.268}},
  etaTh = {{0.0,0.0},{0.999,0.610},{1.0,0.610}},
  length = 1.070,
  width = 0.720,
  height = 1.000,
  m = 530.0)
  "Senertec Dachs HKA G5.5 (natural gas engine): 6 kW el/12.3 kW th"
  annotation(Documentation(info="<html>Source: ASUE BHKW-Kenndaten 2011, www.asue.de<br/></html>"));
