within BuildingSystems.Buildings.Data.Constructions.Transparent;
record HeatProtectionTripleGlazingUVal07 = BuildingSystems.Buildings.Data.Constructions.TransparentConstruction(
  final nPanes=3,
  thickness={0.003,0.003,0.003},
  UValGla = 0.7,
  UValFra = 0.7,
  g = 0.51)
 "Heat protection triple glazing with UValGla = 0.7 W/(m2.K) and g = 0.51";
