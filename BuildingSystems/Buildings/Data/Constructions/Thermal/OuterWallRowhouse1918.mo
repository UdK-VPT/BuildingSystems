within BuildingSystems.Buildings.Data.Constructions.Thermal;
record OuterWallRowhouse1918 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=3,
  thickness={0.015,0.4,0.02},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.HighGradePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Brick(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.HighGradePlaster()})
  "Outer wall construction for rowhouse before 1918 (based on IWU building typology)";
