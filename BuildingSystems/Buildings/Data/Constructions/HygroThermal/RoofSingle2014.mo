within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record RoofSingle2014 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=3,
  thickness={0.0125,0.0005,0.255},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Plasterboard(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.PolyamidFoil(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.WoodFibreInsulation()})
  "Roof construction for single-family house EnEV 2014";
