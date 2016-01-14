within BuildingSystems.Buildings.Data.Constructions.Thermal;
record BasePlateRowhouse1918 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=3,
  thickness={0.05,0.06,0.18},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.HighGradePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.InsulatingBrick()})
  "Base plate construction for rowhouse before 1918 (based on IWU building typology)";
