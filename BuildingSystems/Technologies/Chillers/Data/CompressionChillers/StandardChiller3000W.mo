within BuildingSystems.Technologies.Chillers.Data.CompressionChillers;
record  StandardChiller3000W = BuildingSystems.Technologies.Chillers.Data.CompressionChillers.CompressionChillerGeneral(
  P_nominal = 3000.0,
  TCon_nominal = 273.15 + 35.0,
  TEva_nominal = 273.15 + 7.0,
  COP_nominal={{0.0,3.0},{1.0,3.0}})
  "Generic chiller: Q_flow_eva = 9 kW";
  // Q_flow_chiller = Q_flow_eva = 9 kW, nominal conditions for water/water systems according to DIN EN 14511-2:2013-12, Table 11, discharge temperatures
