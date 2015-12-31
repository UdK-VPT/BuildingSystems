within BuildingSystems.Buildings.Data.Constructions.Thermal;
record RoofMultistorey1958to1968 = BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
  final nLayers=4,
  thickness={0.015,0.16,0.06,0.01},
  material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.ReinforcementPlaster(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.PumiceConcrete(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.FlaxInsulation(),
            BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.WeatherResistantLayer()})
  "Roof construction for multistorey building 1958 - 1968 (based on IWU building typology)";
