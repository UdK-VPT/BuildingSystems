within BuildingSystems.Buildings.Airvolumes.Examples;
model AirvolumeThermal1x1x1
  extends BuildingSystems.Buildings.Airvolumes.Airvolume3DTemplate(
    nSurfaces = 6,
    nAirElements = 1,
    bou(
    posX =     {
      0.0,
      0.5,
      1.0,
      0.5,
      0.5,
      0.5},
    posY =     {
    0.5,
    1.0,
    0.5,
    0.0,
    0.5,
    0.5},
    posZ =     {
    0.5,
    0.5,
    0.5,
    0.5,
    0.0,
    1.0},
    location =     {
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.West}));
      // Left border
      // Upper border
      // Right border
      // Lower border
      // Front side
      // Back side
    // Left border
    // Upper border
    // Right border
    // Lower border
    // Front side
    // Back side
    // Left border
    // Upper border
    // Right border
    // Lower border
    // Front side
    // Back side
    // Left border
    // Upper border
    // Right border
    // Lower border
    // Front side
    // Back side
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
  connect(bou[1].PortHeat, airEle111.heatPort_extern);
  connect(bou[1].PortF, airEle111.flowPort_X1);
  // Upper border
  connect(bou[2].PortHeat, airEle111.heatPort_extern);
  connect(bou[2].PortF, airEle111.flowPort_Y2);
  // Right border
  connect(bou[3].PortHeat, airEle111.heatPort_extern);
  connect(bou[3].PortF, airEle111.flowPort_X2);
  // Lower border
  connect(bou[4].PortHeat, airEle111.heatPort_extern);
  connect(bou[4].PortF, airEle111.flowPort_Y1);
  // Front side
  connect(bou[5].PortHeat, airEle111.heatPort_extern);
  connect(bou[5].PortF, airEle111.flowPort_Z1);
  // Back side
  connect(bou[6].PortHeat, airEle111.heatPort_extern);
  connect(bou[6].PortF, airEle111.flowPort_Z2);

  // Temperatures of all air elements
  airEle111.fluid.T = T[1];

  // Absolute moisture of all air elements
  airEle111.fluid.x = x[1];

  // Air velocity (magnitude) of all air elements
  airEle111.velMag = v[1];

  annotation (Diagram(coordinateSystem(initialScale=0.1)), Icon(
        coordinateSystem(initialScale=0.1)));
end AirvolumeThermal1x1x1;
