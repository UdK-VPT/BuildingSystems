within BuildingSystems.Buildings.Data.Constructions.HygroThermal;
record RoofMultistorey1958to1968 = BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
  final nLayers=4,
  thickness={0.015,0.16,0.06,0.01},
  material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.ReinforcementPlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.PumiceConcrete(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.FlaxInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea.WeatherResistantLayer()})
  "Roof construction for multistorey building 1958 - 1968 (based on IWU building typology)";
