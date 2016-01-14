within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record IntermediateWallRowhouse1918 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=3,
  thickness={0.015,0.2,0.02},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.ReinforcementPlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Brick(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.ReinforcementPlaster()})
  "Intermediate wall construction for rowhouse before 1918 (based on IWU building typology)";
