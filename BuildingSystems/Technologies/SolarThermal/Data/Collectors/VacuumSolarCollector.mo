within BuildingSystems.Technologies.SolarThermal.Data.Collectors;
record VacuumSolarCollector = BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial(
  final IAMC=1,
  final V_A=1/1.3/980,
  final C_0=0.675,
  final C_1=2.05,
  final C_2=0.01,
  A = 1.0)
  "Typical data of vacuum collector";
