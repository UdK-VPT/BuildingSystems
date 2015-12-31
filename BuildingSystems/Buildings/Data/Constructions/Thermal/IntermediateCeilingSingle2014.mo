within BuildingSystems.Buildings.Data.Constructions.Thermal;
record IntermediateCeilingSingle2014 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=1,
  thickness={0.16},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()})
  "Intermediate ceiling construction for single-family house EnEV 2014";
