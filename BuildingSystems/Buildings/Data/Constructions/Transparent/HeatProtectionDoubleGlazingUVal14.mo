within BuildingSystems.Buildings.Data.Constructions.Transparent;
record HeatProtectionDoubleGlazingUVal14 = BuildingSystems.Buildings.Data.Constructions.TransparentConstruction(
  final nPanes=2,
  thickness={0.003,0.003},
  UValGla = 1.4,
  UValFra = 1.5,
  g = 0.58)
 "Heat protection double glazing with UValGla = 1.4 W/(m2.K) and g = 0.58";
