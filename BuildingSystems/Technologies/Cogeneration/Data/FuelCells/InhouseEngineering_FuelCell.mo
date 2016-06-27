within BuildingSystems.Technologies.Cogeneration.Data.FuelCells;
record  InhouseEngineering_FuelCell = BuildingSystems.Technologies.Cogeneration.Data.BaseClasses.CogenerationUnitGeneral(
  Q_flow_nominal = 7500.0,
  QCon_flow_nominal = 7500.0,
  P_nominal = 4200.0,
  etaEl = {{0.0,0.0},{0.499,0.0},{0.5,0.280},{0.6,0.292},{0.7,0.304},{0.8,0.316},{0.9,0.328},{1.0,0.34}},
  etaTh = {{0.0,0.0},{0.499,0.0},{0.5,0.570},{0.6,0.572},{0.7,0.574},{0.8,0.576},{0.9,0.578},{1.0,0.58}},
  length = 1.550,
  width = 0.740,
  height = 1.159,
  m = 380.0)
  "Inhouse Engineering (fuel cell stack): 4.5 kW el/7.5 kW th"
  annotation(Documentation(info ="<html>Source: Datenblatt Brennstoffzellen-Heizgerät inhouse5000+<br/></html>"));
