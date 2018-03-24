within BuildingSystems.Buildings.Zones.Examples;
model Airvolume3D1x1x1
extends BuildingSystems.Buildings.Airvolumes.Airvolume3DTemplate(
  nSurfaces = 6,
  nAirElements = 1,
  surfaceAdapter.posX = {
    1.5,
    3.0,
    1.5,
    0.0,
    1.5,
    1.5
  },
  surfaceAdapter.posY = {
    1.5,
    1.5,
    1.5,
    1.5,
    0.0,
    3.0
  },
  surfaceAdapter.posZ = {
    1.5,
    1.5,
    1.5,
    1.5,
    0.0,
    3.0
  },
  surfaceAdapter.location = {
  "south",
  "east",
  "north",
  "west",
  "floor",
  "roof"
  }
  );

  parameter Modelica.SIunits.Length length = 3.0;
  parameter Modelica.SIunits.Length width = 3.0;
  parameter Modelica.SIunits.Length height = 3.0;


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
  airEle111.fluid.Xi = x[1];
  airEle111.velMag = v[1];


// Air element <-> surface connections
// south
  connect(surfaceAdapter[1].PortF, airEle111.flowPort_Z1);
  connect(surfaceAdapter[1].PortHeat, airEle111.heatPort_extern);

// east
  connect(surfaceAdapter[2].PortF, airEle111.flowPort_X2);
  connect(surfaceAdapter[2].PortHeat, airEle111.heatPort_extern);

// north
  connect(surfaceAdapter[3].PortF, airEle111.flowPort_Z2);
  connect(surfaceAdapter[3].PortHeat, airEle111.heatPort_extern);

  // west
  connect(surfaceAdapter[4].PortF, airEle111.flowPort_X1);
  connect(surfaceAdapter[4].PortHeat, airEle111.heatPort_extern);

  // floor
  connect(surfaceAdapter[5].PortF, airEle111.flowPort_Y1);
  connect(surfaceAdapter[5].PortHeat, airEle111.heatPort_extern);

// roof
  connect(surfaceAdapter[6].PortF, airEle111.flowPort_Y2);
  connect(surfaceAdapter[6].PortHeat, airEle111.heatPort_extern);

  // inside  Flow-Connections
  // west-east
  // south-north
  // front - back
end Airvolume3D1x1x1;
