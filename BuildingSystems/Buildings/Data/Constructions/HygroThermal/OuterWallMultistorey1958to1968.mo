within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record OuterWallMultistorey1958to1968 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=3,
  thickness={0.005,0.3,0.005},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.ReinforcementPlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.PumiceConcrete(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.HighGradePlaster()})
  "Outer wall construction for multistorey building 1958 - 1968 (based on IWU building typology)";
