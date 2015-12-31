within BuildingSystems.Buildings.Data.Constructions.Thermal;
record BasePlateSingle2014 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=4,
  thickness={0.04,0.02,0.16,0.119},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.WoodFibreInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.FlaxInsulation()})
  "Base plate construction for single-family house EnEV 2014";
