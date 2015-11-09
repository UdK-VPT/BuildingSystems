within BuildingSystems.Buildings.Interfaces;
connector SurfaceToConstructionPortGeneral
  "Port for heat and moisture transport between a surface and the adjacent construction (complex connector type)"
  BuildingSystems.Geometries.BaseClasses.GeometryRectangle geo
    "3D geometry representation of the connected surface";
  parameter Integer nY
    "Number of surface elements in the y dimension";
  parameter Integer nZ
    "Number of surface elements in the z dimension";
  BuildingSystems.Interfaces.HeatPort heatPort[nY,nZ]
    "Port for heat transfer";
  BuildingSystems.Interfaces.MoisturePort moisturePort[nY,nZ]
    "Port for moisture transfer";
  BuildingSystems.Interfaces.RadiationPort radiationPort_out[nY,nZ]
    "Radiation port for outgoing short wave radiation";
  BuildingSystems.Interfaces.RadiationPort radiationPort_in[nY,nZ]
    "Radiation port for incoming short wave radiation";
  Modelica.SIunits.Area A[nY,nZ]
    "Surface area";
  Modelica.SIunits.Emissivity epsilon[nY,nZ]
    "Long-wave emittance of the surface";
  BuildingSystems.Types.Absorptance abs[nY,nZ]
    "Short-wave absorptance of the surface";
end SurfaceToConstructionPortGeneral;
