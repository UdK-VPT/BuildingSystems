within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record BasePlateRowhouse1918 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=3,
  thickness={0.05,0.06,0.18},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.HighGradePlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.InsulatingBrick()})
  "Base plate construction for rowhouse before 1918 (based on IWU building typology)";
