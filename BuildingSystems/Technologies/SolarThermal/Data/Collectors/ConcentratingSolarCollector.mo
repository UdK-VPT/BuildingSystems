within BuildingSystems.Technologies.SolarThermal.Data.Collectors;
record ConcentratingSolarCollector =BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial(
  final IAMC=0.5,
  final V_A=1/0.1/980,
  final C_0=0.775,
  final C_1=3.7,
  final C_2=0.02,
  A = 1.0)
  "Typical data of solar thermal concentrating collector";
