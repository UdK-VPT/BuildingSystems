within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record RoofRowhouse1918 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=2,
  thickness={0.02,0.011},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.ReinforcementPlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.FlaxInsulation()})
  "Roof construction for rowhouse before 1918 (based on IWU building typology)";
