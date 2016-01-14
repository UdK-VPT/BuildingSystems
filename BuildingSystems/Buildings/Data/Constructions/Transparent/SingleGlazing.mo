within BuildingSystems.Buildings.Data.Constructions.Transparent;
record SingleGlazing = BuildingSystems.Buildings.Data.Constructions.TransparentConstruction(
  final nPanes=1,
  thickness={0.003},
  UValGla = 5.8,
  UValFra = 2.8,
  g = 0.92)
 "Single glazing with UValGla = 5.8 W/(m2.K) and g = 0.92";
