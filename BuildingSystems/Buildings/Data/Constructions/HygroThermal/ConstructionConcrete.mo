within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record ConstructionConcrete = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=2,
  thickness={0.1,0.1},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton()})
  "Concrete construction";
