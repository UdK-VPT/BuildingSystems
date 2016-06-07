within BuildingSystems.Technologies.Chillers.Data.CompressionChillers;
record TurboCoreTT500 = BuildingSystems.Technologies.Chillers.Data.CompressionChillers.CompressionChillerGeneral(
  P_nominal = 113393.0,
  TCon_nominal = 273.15 + 35.0,
  TEva_nominal = 273.15 + 7.0,
  COP_nominal={{0.0,0.0},{0.1,0.0},{0.2,0.0},{0.249,0.0},{0.25,10.8},{0.3,10.8},{0.4,10.9},{0.45,10.8},{0.5,10.6},{0.6,9.6},{0.7,8.3},{0.8,7.2},{0.9,6.4},{1.0,5.6}})
  "TurboCoreTT500: Q_flow_eva = 635 kW";
  //Q_chiller=Q_flow_eva=635kW, nominal conditions for water/water systems according to DIN EN 14511-2:2013-12, Table 11, discharge temperatures
