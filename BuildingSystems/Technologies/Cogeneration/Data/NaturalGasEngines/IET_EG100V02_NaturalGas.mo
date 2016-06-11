within BuildingSystems.Technologies.Cogeneration.Data.NaturalGasEngines;
record IET_EG100V02_NaturalGas = BuildingSystems.Technologies.Cogeneration.Data.BaseClasses.CogenerationUnitGeneral(
  Q_flow_nominal = 135000.0,
  QCon_flow_nominal = 270000.0,
  P_nominal = 100000.0,
  etaEl = {{0.0,0.0},{0.999,0.370},{1.0,0.370}},
  etaTh = {{0.0,0.0},{0.999,0.500},{1.0,0.500}},
  length = 3.300,
  width = 1.00,
  height = 2.200,
  m = 3300.0)
  "IET EG 100 V02 (natural gas engine): 100 kW el/135 kW th"
  annotation(Documentation(info="<html>Source: ASUE BHKW-Kenndaten 2011, www.asue.de<br/></html>"));
