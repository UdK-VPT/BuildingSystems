within BuildingSystems.Buildings.Data.Constructions.Thermal;
record OuterWallMultistorey1958to1968 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=3,
  thickness={0.005,0.3,0.005},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.ReinforcementPlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.PumiceConcrete(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.HighGradePlaster()})
  "Outer wall construction for multistorey building 1958 - 1968 (based on IWU building typology)";
