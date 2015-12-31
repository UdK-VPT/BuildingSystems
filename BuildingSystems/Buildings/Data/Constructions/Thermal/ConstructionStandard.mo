within BuildingSystems.Buildings.Data.Constructions.Thermal;
record ConstructionStandard = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=2,
  thickness={0.1,0.1},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()})
  "Standard construction";
