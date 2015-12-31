within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record IntermediateCeilingSingle2014 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=1,
  thickness={0.16},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Concrete()})
  "Intermediate ceiling construction for single-family house EnEV 2014";
