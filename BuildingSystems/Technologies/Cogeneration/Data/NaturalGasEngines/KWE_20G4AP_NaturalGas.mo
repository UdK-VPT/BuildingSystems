within BuildingSystems.Technologies.Cogeneration.Data.NaturalGasEngines;
record KWE_20G4AP_NaturalGas = BuildingSystems.Technologies.Cogeneration.Data.BaseClasses.CogenerationUnitGeneral(
  Q_flow_nominal = 42000.0,
  QCon_flow_nominal = 68000.0,
  P_nominal = 20000.0,
  etaEl = {{0.0,0.0},{0.999,0.294},{1.0,0.294}},
  etaTh = {{0.0,0.0},{0.999,0.610},{1.0,0.610}},
  length = 1.500,
  width = 0.810,
  height = 1.270,
  m = 870.0)
  "KWE 20G4 AP (natural gas engine): 20 kW el/42 kW th"
  annotation(Documentation(info="<html>Source: ASUE BHKW-Kenndaten 2011, www.asue.de<br/></html>"));
