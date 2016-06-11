within BuildingSystems.Technologies.Cogeneration.Data.NaturalGasEngines;
record JMS_208GSNLCC01_NaturalGas = BuildingSystems.Technologies.Cogeneration.Data.BaseClasses.CogenerationUnitGeneral(
  Q_flow_nominal = 400000.0,
  QCon_flow_nominal = 785000.0,
  P_nominal = 300000.0,
  etaEl = {{0.0,0.0},{0.999,0.382},{1.0,0.382}},
  etaTh = {{0.0,0.0},{0.999,0.510},{1.0,0.510}},
  length = 4.900,
  width = 1.700,
  height = 2.000,
  m = 5700.0)
  "JMS 208 GS-N.LC C01 (natural gas engine): 300 kW el/400 kW th"
  annotation(Documentation(info="<html>Source: ASUE BHKW-Kenndaten 2011, www.asue.de<br/></html>"));
