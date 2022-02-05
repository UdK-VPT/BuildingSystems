within BuildingSystems.Buildings.Data.Constructions.Thermal;
record ConstructionConcrete =
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
  final nLayers=2,
  thickness={0.2,0.1},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()})
  "Concrecte construction";
