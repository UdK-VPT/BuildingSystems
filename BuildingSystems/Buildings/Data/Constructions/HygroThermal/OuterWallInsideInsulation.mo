within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record OuterWallInsideInsulation =
    BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction
    (
  final nLayers=2,
  thickness={0.1,0.12},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.WoodFibreInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Brick()})
  "Outer wall construction with inside wood fibre insulation";
