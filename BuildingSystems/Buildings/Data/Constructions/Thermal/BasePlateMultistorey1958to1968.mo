within BuildingSystems.Buildings.Data.Constructions.Thermal;
record BasePlateMultistorey1958to1968 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=3,
  thickness={0.05,0.02,0.2},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.FlaxInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()})
 "Base plate construction for multistorey building 1958 - 1968 (based on IWU building typology)";
