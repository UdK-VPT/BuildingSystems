within BuildingSystems.Buildings.Data.Constructions.Transparent;
record DoubleGlazing = BuildingSystems.Buildings.Data.Constructions.TransparentConstruction(
  final nPanes=2,
  thickness={0.003,0.003},
  UValGla = 3.0,
  UValFra = 2.8,
  g = 0.8)
 "Double glazing with UValGla = 3.0 W/(m2.K) and g = 0.8";
