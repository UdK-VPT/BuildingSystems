within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record IntermediateCeilingMultistorey1958to1968 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=3,
  thickness={0.02,0.06,0.2},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.OakWood(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.WoodFibreInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.InsulatingBrick()})
  "Intermediate ceiling construction for multistorey building 1958 - 1968 (based on IWU building typology)";
