within BuildingSystems.Technologies.SolarThermal.Data.Collectors;
record FlatSolarCollector1 =
    BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial
    (
  final IAMC=0.88,
  final V_A=1.5/1.8/980,
  final C_0=0.775,
  final C_1=3.75,
  final C_2=0.02,
  A = 1.0)
  "Average data of flat collector with good efficiency";
