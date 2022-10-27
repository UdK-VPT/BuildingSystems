within BuildingSystems.Technologies.Chillers.Data.CompressionChillers;
record StandardChiller1000W =
    BuildingSystems.Technologies.Chillers.Data.CompressionChillers.CompressionChillerGeneral
    (
  P_nominal = 1000.0,
  TCon_nominal = 273.15 + 35.0,
  TEva_nominal = 273.15 + 7.0,
  COP_nominal={{0.0,3.0},{1.0,3.0}})
  "Generic chiller: Q_flow_eva = 3 kW";
