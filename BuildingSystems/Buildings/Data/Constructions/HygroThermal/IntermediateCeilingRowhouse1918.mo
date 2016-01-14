within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record IntermediateCeilingRowhouse1918 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=3,
  thickness={0.02,0.06,0.02},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.OakWood(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.WoodFibreInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.OakWood()})
  "Intermediate ceiling construction for rowhouse before 1918 (based on IWU building typology)";
