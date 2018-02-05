within BuildingSystems.Buildings.Airvolumes.Examples;
model Airvolume3D1x1x1
  extends BuildingSystems.Buildings.Airvolumes.Airvolume3DTemplate(
    nSurfaces = 6,
    nAirElements = 1,
    surfaceAdapter.posX = {
      // Left border
      0.0,
      // Upper border
      0.5,
      // Right border
      1.0,
      // Lower border
      0.5,
      // Front side
      0.5,
      // Back side
      0.5},
    surfaceAdapter.posY = {
    // Left border
    0.5,
    // Upper border
    1.0,
    // Right border
    0.5,
    // Lower border
    0.0,
    // Front side
    0.5,
    // Back side
    0.5},
    surfaceAdapter.posZ = {
    // Left border
    0.5,
    // Upper border
    0.5,
    // Right border
    0.5,
    // Lower border
    0.5,
    // Front side
    0.0,
    // Back side
    1.0},
    surfaceAdapter.location = {
    // Left border
    "south",
    // Upper border
    "roof",
    // Right border
    "north",
    // Lower border
    "floor",
    // Front side
    "east",
    // Back side
    "west"});
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle111(
    BCwall_east=true,
    BCwall_south=true,
    BCwall_west=true,
    BCwall_floor=true,
    posX=0.5,
    posY=0.5,
    posZ=0.5,
    scalF={1,1,1},
    BCwall_north=true,
    BCwall_roof=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
equation
  // left border
  connect(surfaceAdapter[1].PortHeat, airEle111.heatPort_extern);
  connect(surfaceAdapter[1].PortF, airEle111.flowPort_X1);
  // Upper border
  connect(surfaceAdapter[2].PortHeat, airEle111.heatPort_extern);
  connect(surfaceAdapter[2].PortF, airEle111.flowPort_Y2);
  // Right border
  connect(surfaceAdapter[3].PortHeat, airEle111.heatPort_extern);
  connect(surfaceAdapter[3].PortF, airEle111.flowPort_X2);
  // Lower border
  connect(surfaceAdapter[4].PortHeat, airEle111.heatPort_extern);
  connect(surfaceAdapter[4].PortF, airEle111.flowPort_Y1);
  // Front side
  connect(surfaceAdapter[5].PortHeat, airEle111.heatPort_extern);
  connect(surfaceAdapter[5].PortF, airEle111.flowPort_Z1);
  // Back side
  connect(surfaceAdapter[6].PortHeat, airEle111.heatPort_extern);
  connect(surfaceAdapter[6].PortF, airEle111.flowPort_Z2);

  // Temperatures of all air elements
  airEle111.fluid.T = T[1];

  // Absolute moisture of all air elements
  airEle111.fluid.Xi = x[1];

  // Air velocity (magnitude) of all air elements
  airEle111.velMag = v[1];

  annotation (Diagram(coordinateSystem(initialScale=0.1)), Icon(
        coordinateSystem(initialScale=0.1)));
end Airvolume3D1x1x1;
