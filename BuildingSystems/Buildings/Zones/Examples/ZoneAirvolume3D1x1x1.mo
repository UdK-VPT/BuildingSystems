within BuildingSystems.Buildings.Zones.Examples;
model ZoneAirvolume3D1x1x1
  "Zone with 1 x 1 x 1 air elements"
  extends BuildingSystems.Buildings.Zones.ZoneTemplateAirvolume3D(
  nSurfaces = 6,
  nAirElements = 1,
  redeclare BuildingSystems.Buildings.Airvolumes.Examples.Airvolume3D1x1x1 airvolume);

  annotation();
end ZoneAirvolume3D1x1x1;
