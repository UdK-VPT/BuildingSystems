within BuildingSystems.Technologies.SolarThermal.Data.Collectors;
record FlatSolarCollector2 =
    BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial
    (
  final IAMC=0.88,
  final V_A=1.5/1.8/980,
  final C_0=0.825,
  final C_1=3.15,
  final C_2=0.01,
  A = 1.0)
  "Average data of flat collector with very good efficiency";
