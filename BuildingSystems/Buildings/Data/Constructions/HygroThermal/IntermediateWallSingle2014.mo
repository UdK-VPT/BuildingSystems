within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record IntermediateWallSingle2014 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=3,
  thickness={0.015,0.1,0.015},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Plasterboard(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.WoodFibreInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Plasterboard()})
  "Intermediate wall construction for single-family house EnEV 2014";
