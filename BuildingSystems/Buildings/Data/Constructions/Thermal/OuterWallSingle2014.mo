within BuildingSystems.Buildings.Data.Constructions.Thermal;
record OuterWallSingle2014 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=6,
  thickness={0.01,0.24,0.02,0.005,0.16,0.005},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Plasterboard(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Brick(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.HighGradePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.ReinforcementPlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.WoodFibreInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.ReinforcementPlaster()})
  "Outer wall construction for single-family house EnEV 2014";
