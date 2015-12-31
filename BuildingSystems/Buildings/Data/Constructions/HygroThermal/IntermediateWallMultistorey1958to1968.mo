within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record IntermediateWallMultistorey1958to1968 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=3,
  thickness={0.025,0.05,0.025},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Plasterboard(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.FlaxInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Plasterboard()})
  "Intermediate wall construction for multistorey building 1958 - 1968 (based on IWU building typology)";
