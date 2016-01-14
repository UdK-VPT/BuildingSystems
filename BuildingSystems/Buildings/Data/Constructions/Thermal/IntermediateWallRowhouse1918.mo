within BuildingSystems.Buildings.Data.Constructions.Thermal;
record IntermediateWallRowhouse1918 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=3,
  thickness={0.015,0.2,0.02},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.ReinforcementPlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Brick(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.ReinforcementPlaster()})
  "Intermediate wall construction for rowhouse before 1918 (based on IWU building typology)";
