within BuildingSystems.Technologies.Chillers.Data.CompressionChillers;
record TurboCoreTT350 = BuildingSystems.Technologies.Chillers.Data.CompressionChillers.CompressionChillerGeneral(
  P_nominal = 63636.0,
  TCon_nominal = 273.15 + 35.0,
  TEva_nominal = 273.15 + 7.0,
  COP_nominal={{0.0,0.0},{0.1,0.0},{0.2,0.0},{0.249,0.0},{0.25,10.0},{0.3,10.1},{0.4,10.3},{0.45,10.4},{0.5,10.2},{0.6,9.2},{0.7,7.9},{0.8,6.9},{0.9,6.2},{1.0,5.5}})
  "TurboCoreTT350: Q_flow_eva = 350 kW";
  // Q_flow_chiller=Q_flow_eva=350kW, nominal conditions for water/water systems according to DIN EN 14511-2:2013-12, Table 11, discharge temperatures
