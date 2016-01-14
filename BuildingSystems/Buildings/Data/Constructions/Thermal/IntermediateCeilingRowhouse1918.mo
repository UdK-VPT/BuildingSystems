within BuildingSystems.Buildings.Data.Constructions.Thermal;
record IntermediateCeilingRowhouse1918 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=3,
  thickness={0.02,0.06,0.02},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.OakWood(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.WoodFibreInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.OakWood()})
  "Intermediate ceiling construction for rowhouse before 1918 (based on IWU building typology)";
