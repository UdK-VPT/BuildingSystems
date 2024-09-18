within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record ConstructionStandard =
    BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction
    (
  final nLayers=2,
  thickness={0.24,0.10},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Brick(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.WoodFibreInsulation()})
  "Standard construction";
