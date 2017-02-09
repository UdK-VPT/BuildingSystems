within BuildingSystems.Buildings.Interfaces;
connector SurfaceToConstructionPortGeneral
  "Port for heat and moisture transport between a surface and the adjacent construction (complex connector type)"
  BuildingSystems.Geometries.BaseClasses.GeometryRectangle geo
    "3D geometry representation of the connected surface";
  BuildingSystems.Interfaces.HeatPort heatPort
    "Port for heat transfer";
  BuildingSystems.Interfaces.MoisturePort moisturePort
    "Port for moisture transfer";
  BuildingSystems.Interfaces.RadiationPort radiationPort_out
    "Radiation port for outgoing short wave radiation";
  BuildingSystems.Interfaces.RadiationPort radiationPort_in
    "Radiation port for incoming short wave radiation";
  Modelica.SIunits.Area A
    "Surface area";
  Modelica.SIunits.Emissivity epsilon
    "Long-wave emittance of the surface";
  BuildingSystems.Types.Absorptance abs
    "Short-wave absorptance of the surface";
end SurfaceToConstructionPortGeneral;
