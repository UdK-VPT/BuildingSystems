within BuildingSystems.Buildings.Data.Constructions.Thermal;
record RoofSingle2014 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=3,
  thickness={0.0125,0.0005,0.255},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Plasterboard(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.PolyamidFoil(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.WoodFibreInsulation()})
  "Roof construction for single-family house EnEV 2014";
