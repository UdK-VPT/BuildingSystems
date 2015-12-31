within BuildingSystems.Buildings.Data.Constructions.Thermal;
record RoofRowhouse1918 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=2,
  thickness={0.02,0.011},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.ReinforcementPlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.FlaxInsulation()})
  "Roof construction for rowhouse before 1918 (based on IWU building typology)";
