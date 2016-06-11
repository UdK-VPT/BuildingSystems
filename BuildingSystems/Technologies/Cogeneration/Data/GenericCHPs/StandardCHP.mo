within BuildingSystems.Technologies.Cogeneration.Data.GenericCHPs;
record  StandardCHP = BuildingSystems.Technologies.Cogeneration.Data.BaseClasses.CogenerationUnitGeneral(
  Q_flow_nominal = 8000.0,
  QCon_flow_nominal = 8500.0,
  P_nominal = 4000.0,
  etaEl = {{0.0,0.0},{0.499,0.0},{0.5,0.32},{0.6,0.33},{0.7,0.34},{0.8,0.34},{0.9,0.31},{1.0,0.30}},
  etaTh = {{0.0,0.0},{0.499,0.0},{0.5,0.60},{0.6,0.59},{0.7,0.58},{0.8,0.58},{0.9,0.60},{1.0,0.60}},
  length = 1.0,
  width = 1.0,
  height = 1.0,
  m = 1.0)
  "Standard cogeneration unit"
  annotation(Documentation(info ="<html>Typical small CHP<br/></html>"));
