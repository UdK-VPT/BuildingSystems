within BuildingSystems.Buildings.Data.Constructions.Thermal;
record IntermediateWallSingle2014 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=3,
  thickness={0.015,0.1,0.015},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Plasterboard(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.WoodFibreInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Plasterboard()})
  "Intermediate wall construction for single-family house EnEV 2014";
