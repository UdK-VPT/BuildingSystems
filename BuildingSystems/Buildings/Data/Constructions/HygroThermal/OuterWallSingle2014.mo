within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record OuterWallSingle2014 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=6,
  thickness={0.01,0.24,0.02,0.005,0.16,0.005},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Plasterboard(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Brick(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.HighGradePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.ReinforcementPlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.WoodFibreInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.ReinforcementPlaster()})
  "Outer wall construction for single-family house EnEV 2014";
