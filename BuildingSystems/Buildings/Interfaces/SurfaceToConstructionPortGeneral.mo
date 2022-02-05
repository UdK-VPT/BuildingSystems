within BuildingSystems.Buildings.Interfaces;
connector SurfaceToConstructionPortGeneral
  "Port for heat and moisture transport between a surface and the adjacent construction (complex connector type)"
  BuildingSystems.Buildings.Geometries.BaseClasses.GeometryPolygon geo
    "3D geometry representation of the connected surface";
  BuildingSystems.Interfaces.HeatPort heatPort
    "Port for heat transfer";
  BuildingSystems.Interfaces.MoisturePort moisturePort
    "Port for moisture transfer";
  BuildingSystems.Interfaces.RadiationPort radiationPort_out
    "Radiation port for outgoing short wave radiation";
  BuildingSystems.Interfaces.RadiationPort radiationPort_in
    "Radiation port for incoming short wave radiation";
  Modelica.Units.SI.Area A "Surface area";
  Modelica.Units.SI.Emissivity epsilon "Long-wave emittance of the surface";
  BuildingSystems.Types.Absorptance abs
    "Short-wave absorptance of the surface";

  annotation (
Documentation(info="<html>
<p>
General connector model for heat and moisture transport between a surface and the adjacent construction.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SurfaceToConstructionPortGeneral;
