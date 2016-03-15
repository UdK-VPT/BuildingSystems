within BuildingSystems.Buildings.Data.Constructions;
record OpaqueThermalConstruction
  "Template for opaque thermal layered constructions"
  extends BuildingSystems.Buildings.BaseClasses.OpaqueConstruction;
  parameter BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral material[nLayers];
end OpaqueThermalConstruction;
