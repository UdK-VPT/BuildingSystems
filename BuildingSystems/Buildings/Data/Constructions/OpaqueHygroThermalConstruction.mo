within BuildingSystems.Buildings.Data.Constructions;
record OpaqueHygroThermalConstruction
  "Template for opaque hygro.thermal layered constructions"
  extends BuildingSystems.Buildings.Data.Constructions.OpaqueConstruction;
  parameter
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
                                                                                                material[nLayers];
end OpaqueHygroThermalConstruction;
