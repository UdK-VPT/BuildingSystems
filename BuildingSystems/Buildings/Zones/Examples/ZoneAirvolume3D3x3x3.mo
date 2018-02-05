within BuildingSystems.Buildings.Zones.Examples;
model ZoneAirvolume3D3x3x3
  "Zone with 3 x 3 air elements"
  extends BuildingSystems.Buildings.Zones.ZoneTemplateAirvolume3D(
  nSurfaces = 54,
  nAirElements = 27,
  redeclare BuildingSystems.Buildings.Zones.Examples.Airvolume3D3x3x3 airvolume);

  annotation();
end ZoneAirvolume3D3x3x3;
