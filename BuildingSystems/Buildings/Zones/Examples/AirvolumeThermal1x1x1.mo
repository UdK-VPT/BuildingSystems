within BuildingSystems.Buildings.Zones.Examples;
model AirvolumeThermal1x1x1
extends BuildingSystems.Buildings.Airvolumes.Airvolume3DTemplate(
  nSurfaces = 6,
  nAirElements = 1,
    bou(
  posX =     {
    1.5,
    3.0,
    1.5,
    0.0,
    1.5,
    1.5},
  posY =     {
    1.5,
    1.5,
    1.5,
    1.5,
    0.0,
    3.0},
  posZ =     {
    1.5,
    1.5,
    1.5,
    1.5,
    0.0,
    3.0},
  location =     {
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Roof}));

  parameter Modelica.Units.SI.Length length=3.0;
  parameter Modelica.Units.SI.Length width=3.0;
  parameter Modelica.Units.SI.Length height=3.0;


  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle111(
    posX = 1.5,
    posY = 1.5,
    posZ = 2.0,
    T_start = 293.15,
    scalF = {3.0,3.0,4.0},
    BCwall_west = true,
    BCwall_east = true,
    BCwall_floor = true,
    BCwall_roof = true,
    BCwall_south = true,
    BCwall_north = true);

equation
// Temperatures, moistures and Air velocity (magnitude) of all air elements
  airEle111.fluid.T = T[1];
  airEle111.fluid.x = x[1];
  airEle111.velMag = v[1];
  airEle111.fluid.p = p[1];

// Air element <-> surface connections
// south
  connect(bou[1].PortF, airEle111.flowPort_Z1);
  connect(bou[1].PortHeat, airEle111.heatPort_extern);

// east
  connect(bou[2].PortF, airEle111.flowPort_X2);
  connect(bou[2].PortHeat, airEle111.heatPort_extern);

// north
  connect(bou[3].PortF, airEle111.flowPort_Z2);
  connect(bou[3].PortHeat, airEle111.heatPort_extern);

  // west
  connect(bou[4].PortF, airEle111.flowPort_X1);
  connect(bou[4].PortHeat, airEle111.heatPort_extern);

  // floor
  connect(bou[5].PortF, airEle111.flowPort_Y1);
  connect(bou[5].PortHeat, airEle111.heatPort_extern);

// roof
  connect(bou[6].PortF, airEle111.flowPort_Y2);
  connect(bou[6].PortHeat, airEle111.heatPort_extern);

  // inside  Flow-Connections
  // west-east
  // south-north
  // front - back
end AirvolumeThermal1x1x1;
