within BuildingSystems.Buildings.Zones.Examples;
model AirvolumeThermal3x3x3WithOpenings
extends BuildingSystems.Buildings.Airvolumes.Airvolume3DTemplate(
  nSurfaces = 54,
  nAirElements = 27,
  nAirpaths = 2,
    bou(
  posX =     {
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5},
  posY =     {
    0.5,
    0.5,
    0.5,
    1.5,
    1.5,
    1.5,
    2.5,
    2.5,
    2.5,
    0.5,
    0.5,
    0.5,
    1.5,
    1.5,
    1.5,
    2.5,
    2.5,
    2.5,
    0.5,
    0.5,
    0.5,
    1.5,
    1.5,
    1.5,
    2.5,
    2.5,
    2.5,
    0.5,
    0.5,
    0.5,
    1.5,
    1.5,
    1.5,
    2.5,
    2.5,
    2.5,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0},
  posZ =     {
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    3.0,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    0.5,
    1.5,
    2.5,
    0.5,
    0.5,
    0.5,
    1.5,
    1.5,
    1.5,
    2.5,
    2.5,
    2.5,
    0.5,
    0.5,
    0.5,
    1.5,
    1.5,
    1.5,
    2.5,
    2.5,
    2.5},
  opening =     {
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false},
  location =     {
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.Roof}));

  parameter Modelica.Units.SI.Length length=3.0;
  parameter Modelica.Units.SI.Length width=3.0;
  parameter Modelica.Units.SI.Length height=3.0;

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle111(
    posX = 0.5,
    posY = 0.5,
    posZ = 0.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX111(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX111
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY111(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY111
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ111(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ111
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle211(
    posX = 0.5,
    posY = 1.5,
    posZ = 0.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX211(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX211
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY211(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY211
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ211(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ211
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle311(
    posX = 0.5,
    posY = 2.5,
    posZ = 0.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX311(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX311
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ311(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ311
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle121(
    posX = 0.5,
    posY = 0.5,
    posZ = 1.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX121(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX121
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY121(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY121
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ121(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ121
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle221(
    posX = 0.5,
    posY = 1.5,
    posZ = 1.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX221(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX221
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY221(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY221
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ221(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ221
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle321(
    posX = 0.5,
    posY = 2.5,
    posZ = 1.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX321(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX321
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ321(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ321
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle131(
    posX = 0.5,
    posY = 0.5,
    posZ = 2.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX131(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX131
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY131(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY131
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle231(
    posX = 0.5,
    posY = 1.5,
    posZ = 2.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX231(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX231
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY231(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY231
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle331(
    posX = 0.5,
    posY = 2.5,
    posZ = 2.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX331(
    BCwall_west = true,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX331
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle112(
    posX = 1.5,
    posY = 0.5,
    posZ = 0.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX112(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX112
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY112(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY112
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ112(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ112
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle212(
    posX = 1.5,
    posY = 1.5,
    posZ = 0.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX212(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX212
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY212(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY212
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ212(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ212
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle312(
    posX = 1.5,
    posY = 2.5,
    posZ = 0.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX312(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX312
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ312(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ312
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle122(
    posX = 1.5,
    posY = 0.5,
    posZ = 1.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX122(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX122
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY122(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY122
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ122(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ122
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle222(
    posX = 1.5,
    posY = 1.5,
    posZ = 1.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX222(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX222
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY222(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY222
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ222(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ222
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle322(
    posX = 1.5,
    posY = 2.5,
    posZ = 1.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX322(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX322
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ322(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ322
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle132(
    posX = 1.5,
    posY = 0.5,
    posZ = 2.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX132(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX132
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY132(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY132
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle232(
    posX = 1.5,
    posY = 1.5,
    posZ = 2.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX232(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX232
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY232(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY232
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle332(
    posX = 1.5,
    posY = 2.5,
    posZ = 2.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConX332(
    BCwall_west = false,
    BCwall_east = false,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX heatConX332
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle113(
    posX = 2.5,
    posY = 0.5,
    posZ = 0.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY113(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY113
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ113(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ113
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle213(
    posX = 2.5,
    posY = 1.5,
    posZ = 0.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY213(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY213
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ213(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ213
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle313(
    posX = 2.5,
    posY = 2.5,
    posZ = 0.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ313(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = true,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ313
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle123(
    posX = 2.5,
    posY = 0.5,
    posZ = 1.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY123(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY123
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ123(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ123
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle223(
    posX = 2.5,
    posY = 1.5,
    posZ = 1.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY223(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY223
    annotation (HideResult=true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ223(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ223
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle323(
    posX = 2.5,
    posY = 2.5,
    posZ = 1.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionZ flowConZ323(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = false);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionZ heatConZ323
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle133(
    posX = 2.5,
    posY = 0.5,
    posZ = 2.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY133(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = true,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY133
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle233(
    posX = 2.5,
    posY = 1.5,
    posZ = 2.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConY233(
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = false,
    BCwall_south = false,
    BCwall_north = true);
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY heatConY233
    annotation (HideResult=true);

  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle333(
    posX = 2.5,
    posY = 2.5,
    posZ = 2.5,
    T_start = 293.15,
    scalF = {1.0,1.0,1.0},
    BCwall_west = false,
    BCwall_east = true,
    BCwall_floor = false,
    BCwall_roof = true,
    BCwall_south = false,
    BCwall_north = true);

equation
// Temperatures, moistures and Air velocity (magnitude) of all air elements
  airEle111.fluid.T = T[1];
  airEle111.fluid.x = x[1];
  airEle111.velMag = v[1];
  airEle111.fluid.p = p[1];

  airEle121.fluid.T = T[2];
  airEle121.fluid.x = x[2];
  airEle121.velMag = v[2];
  airEle121.fluid.p = p[2];

  airEle131.fluid.T = T[3];
  airEle131.fluid.x = x[3];
  airEle131.velMag = v[3];
  airEle131.fluid.p = p[3];

  airEle112.fluid.T = T[4];
  airEle112.fluid.x = x[4];
  airEle112.velMag = v[4];
  airEle112.fluid.p = p[4];

  airEle122.fluid.T = T[5];
  airEle122.fluid.x = x[5];
  airEle122.velMag = v[5];
  airEle122.fluid.p = p[5];

  airEle132.fluid.T = T[6];
  airEle132.fluid.x = x[6];
  airEle132.velMag = v[6];
  airEle132.fluid.p = p[6];

  airEle113.fluid.T = T[7];
  airEle113.fluid.x = x[7];
  airEle113.velMag = v[7];
  airEle113.fluid.p = p[7];

  airEle123.fluid.T = T[8];
  airEle123.fluid.x = x[8];
  airEle123.velMag = v[8];
  airEle123.fluid.p = p[8];

  airEle133.fluid.T = T[9];
  airEle133.fluid.x = x[9];
  airEle133.velMag = v[9];
  airEle133.fluid.p = p[9];

  airEle211.fluid.T = T[10];
  airEle211.fluid.x = x[10];
  airEle211.velMag = v[10];
  airEle211.fluid.p = p[10];

  airEle221.fluid.T = T[11];
  airEle221.fluid.x = x[11];
  airEle221.velMag = v[11];
  airEle221.fluid.p = p[11];

  airEle231.fluid.T = T[12];
  airEle231.fluid.x = x[12];
  airEle231.velMag = v[12];
  airEle231.fluid.p = p[12];

  airEle212.fluid.T = T[13];
  airEle212.fluid.x = x[13];
  airEle212.velMag = v[13];
  airEle212.fluid.p = p[13];

  airEle222.fluid.T = T[14];
  airEle222.fluid.x = x[14];
  airEle222.velMag = v[14];
  airEle222.fluid.p = p[14];

  airEle232.fluid.T = T[15];
  airEle232.fluid.x = x[15];
  airEle232.velMag = v[15];
  airEle232.fluid.p = p[15];

  airEle213.fluid.T = T[16];
  airEle213.fluid.x = x[16];
  airEle213.velMag = v[16];
  airEle213.fluid.p = p[16];

  airEle223.fluid.T = T[17];
  airEle223.fluid.x = x[17];
  airEle223.velMag = v[17];
  airEle223.fluid.p = p[17];

  airEle233.fluid.T = T[18];
  airEle233.fluid.x = x[18];
  airEle233.velMag = v[18];
  airEle233.fluid.p = p[18];

  airEle311.fluid.T = T[19];
  airEle311.fluid.x = x[19];
  airEle311.velMag = v[19];
  airEle311.fluid.p = p[19];

  airEle321.fluid.T = T[20];
  airEle321.fluid.x = x[20];
  airEle321.velMag = v[20];
  airEle321.fluid.p = p[20];

  airEle331.fluid.T = T[21];
  airEle331.fluid.x = x[21];
  airEle331.velMag = v[21];
  airEle331.fluid.p = p[21];

  airEle312.fluid.T = T[22];
  airEle312.fluid.x = x[22];
  airEle312.velMag = v[22];
  airEle312.fluid.p = p[22];

  airEle322.fluid.T = T[23];
  airEle322.fluid.x = x[23];
  airEle322.velMag = v[23];
  airEle322.fluid.p = p[23];

  airEle332.fluid.T = T[24];
  airEle332.fluid.x = x[24];
  airEle332.velMag = v[24];
  airEle332.fluid.p = p[24];

  airEle313.fluid.T = T[25];
  airEle313.fluid.x = x[25];
  airEle313.velMag = v[25];
  airEle313.fluid.p = p[25];

  airEle323.fluid.T = T[26];
  airEle323.fluid.x = x[26];
  airEle323.velMag = v[26];
  airEle323.fluid.p = p[26];

  airEle333.fluid.T = T[27];
  airEle333.fluid.x = x[27];
  airEle333.velMag = v[27];
  airEle333.fluid.p = p[27];

// Boundaries with openings <-> air volume airpaths
   connect(bou[2].port_a,airpathPorts[1]);
   connect(bou[26].port_a,airpathPorts[2]);

// Air element <-> surface connections
// south
  connect(bou[1].PortF, airEle111.flowPort_Z1);
  connect(bou[1].PortHeat, airEle111.heatPort_extern);
  connect(bou[2].PortF, airEle112.flowPort_Z1);
  connect(bou[2].PortHeat, airEle112.heatPort_extern);
  connect(bou[3].PortF, airEle113.flowPort_Z1);
  connect(bou[3].PortHeat, airEle113.heatPort_extern);
  connect(bou[4].PortF, airEle211.flowPort_Z1);
  connect(bou[4].PortHeat, airEle211.heatPort_extern);
  connect(bou[5].PortF, airEle212.flowPort_Z1);
  connect(bou[5].PortHeat, airEle212.heatPort_extern);
  connect(bou[6].PortF, airEle213.flowPort_Z1);
  connect(bou[6].PortHeat, airEle213.heatPort_extern);
  connect(bou[7].PortF, airEle311.flowPort_Z1);
  connect(bou[7].PortHeat, airEle311.heatPort_extern);
  connect(bou[8].PortF, airEle312.flowPort_Z1);
  connect(bou[8].PortHeat, airEle312.heatPort_extern);
  connect(bou[9].PortF, airEle313.flowPort_Z1);
  connect(bou[9].PortHeat, airEle313.heatPort_extern);

// east
  connect(bou[10].PortF, airEle113.flowPort_X2);
  connect(bou[10].PortHeat, airEle113.heatPort_extern);
  connect(bou[11].PortF, airEle123.flowPort_X2);
  connect(bou[11].PortHeat, airEle123.heatPort_extern);
  connect(bou[12].PortF, airEle133.flowPort_X2);
  connect(bou[12].PortHeat, airEle133.heatPort_extern);
  connect(bou[13].PortF, airEle213.flowPort_X2);
  connect(bou[13].PortHeat, airEle213.heatPort_extern);
  connect(bou[14].PortF, airEle223.flowPort_X2);
  connect(bou[14].PortHeat, airEle223.heatPort_extern);
  connect(bou[15].PortF, airEle233.flowPort_X2);
  connect(bou[15].PortHeat, airEle233.heatPort_extern);
  connect(bou[16].PortF, airEle313.flowPort_X2);
  connect(bou[16].PortHeat, airEle313.heatPort_extern);
  connect(bou[17].PortF, airEle323.flowPort_X2);
  connect(bou[17].PortHeat, airEle323.heatPort_extern);
  connect(bou[18].PortF, airEle333.flowPort_X2);
  connect(bou[18].PortHeat, airEle333.heatPort_extern);

// north
  connect(bou[19].PortF, airEle131.flowPort_Z2);
  connect(bou[19].PortHeat, airEle131.heatPort_extern);
  connect(bou[20].PortF, airEle132.flowPort_Z2);
  connect(bou[20].PortHeat, airEle132.heatPort_extern);
  connect(bou[21].PortF, airEle133.flowPort_Z2);
  connect(bou[21].PortHeat, airEle133.heatPort_extern);
  connect(bou[22].PortF, airEle231.flowPort_Z2);
  connect(bou[22].PortHeat, airEle231.heatPort_extern);
  connect(bou[23].PortF, airEle232.flowPort_Z2);
  connect(bou[23].PortHeat, airEle232.heatPort_extern);
  connect(bou[24].PortF, airEle233.flowPort_Z2);
  connect(bou[24].PortHeat, airEle233.heatPort_extern);
  connect(bou[25].PortF, airEle331.flowPort_Z2);
  connect(bou[25].PortHeat, airEle331.heatPort_extern);
  connect(bou[26].PortF, airEle332.flowPort_Z2);
  connect(bou[26].PortHeat, airEle332.heatPort_extern);
  connect(bou[27].PortF, airEle333.flowPort_Z2);
  connect(bou[27].PortHeat, airEle333.heatPort_extern);

  // west
  connect(bou[28].PortF, airEle111.flowPort_X1);
  connect(bou[28].PortHeat, airEle111.heatPort_extern);
  connect(bou[29].PortF, airEle121.flowPort_X1);
  connect(bou[29].PortHeat, airEle121.heatPort_extern);
  connect(bou[30].PortF, airEle131.flowPort_X1);
  connect(bou[30].PortHeat, airEle131.heatPort_extern);
  connect(bou[31].PortF, airEle211.flowPort_X1);
  connect(bou[31].PortHeat, airEle211.heatPort_extern);
  connect(bou[32].PortF, airEle221.flowPort_X1);
  connect(bou[32].PortHeat, airEle221.heatPort_extern);
  connect(bou[33].PortF, airEle231.flowPort_X1);
  connect(bou[33].PortHeat, airEle231.heatPort_extern);
  connect(bou[34].PortF, airEle311.flowPort_X1);
  connect(bou[34].PortHeat, airEle311.heatPort_extern);
  connect(bou[35].PortF, airEle321.flowPort_X1);
  connect(bou[35].PortHeat, airEle321.heatPort_extern);
  connect(bou[36].PortF, airEle331.flowPort_X1);
  connect(bou[36].PortHeat, airEle331.heatPort_extern);

  // floor
  connect(bou[37].PortF, airEle111.flowPort_Y1);
  connect(bou[37].PortHeat, airEle111.heatPort_extern);
  connect(bou[38].PortF, airEle112.flowPort_Y1);
  connect(bou[38].PortHeat, airEle112.heatPort_extern);
  connect(bou[39].PortF, airEle113.flowPort_Y1);
  connect(bou[39].PortHeat, airEle113.heatPort_extern);
  connect(bou[40].PortF, airEle121.flowPort_Y1);
  connect(bou[40].PortHeat, airEle121.heatPort_extern);
  connect(bou[41].PortF, airEle122.flowPort_Y1);
  connect(bou[41].PortHeat, airEle122.heatPort_extern);
  connect(bou[42].PortF, airEle123.flowPort_Y1);
  connect(bou[42].PortHeat, airEle123.heatPort_extern);
  connect(bou[43].PortF, airEle131.flowPort_Y1);
  connect(bou[43].PortHeat, airEle131.heatPort_extern);
  connect(bou[44].PortF, airEle132.flowPort_Y1);
  connect(bou[44].PortHeat, airEle132.heatPort_extern);
  connect(bou[45].PortF, airEle133.flowPort_Y1);
  connect(bou[45].PortHeat, airEle133.heatPort_extern);

// roof
  connect(bou[46].PortF, airEle311.flowPort_Y2);
  connect(bou[46].PortHeat, airEle311.heatPort_extern);
  connect(bou[47].PortF, airEle312.flowPort_Y2);
  connect(bou[47].PortHeat, airEle312.heatPort_extern);
  connect(bou[48].PortF, airEle313.flowPort_Y2);
  connect(bou[48].PortHeat, airEle313.heatPort_extern);
  connect(bou[49].PortF, airEle321.flowPort_Y2);
  connect(bou[49].PortHeat, airEle321.heatPort_extern);
  connect(bou[50].PortF, airEle322.flowPort_Y2);
  connect(bou[50].PortHeat, airEle322.heatPort_extern);
  connect(bou[51].PortF, airEle323.flowPort_Y2);
  connect(bou[51].PortHeat, airEle323.heatPort_extern);
  connect(bou[52].PortF, airEle331.flowPort_Y2);
  connect(bou[52].PortHeat, airEle331.heatPort_extern);
  connect(bou[53].PortF, airEle332.flowPort_Y2);
  connect(bou[53].PortHeat, airEle332.heatPort_extern);
  connect(bou[54].PortF, airEle333.flowPort_Y2);
  connect(bou[54].PortHeat, airEle333.heatPort_extern);

  // inside  Flow-Connections
  // west-east
  connect(airEle111.flowPort_X2, flowConX111.port_1);
  connect(flowConX111.port_2, airEle112.flowPort_X1);
  connect(airEle111.heatPort_intern, heatConX111.port_1);
  connect(heatConX111.port_2, airEle112.heatPort_intern);
  // south-north
  connect(airEle111.flowPort_Y2, flowConY111.port_1);
  connect(flowConY111.port_2, airEle211.flowPort_Y1);
  connect(airEle111.heatPort_intern, heatConY111.port_1);
  connect(heatConY111.port_2, airEle211.heatPort_intern);
  // front - back
  connect(airEle111.flowPort_Z2, flowConZ111.port_1);
  connect(flowConZ111.port_2, airEle121.flowPort_Z1);
  connect(airEle111.heatPort_intern, heatConZ111.port_1);
  connect(heatConZ111.port_2, airEle121.heatPort_intern);
  // west-east
  connect(airEle211.flowPort_X2, flowConX211.port_1);
  connect(flowConX211.port_2, airEle212.flowPort_X1);
  connect(airEle211.heatPort_intern, heatConX211.port_1);
  connect(heatConX211.port_2, airEle212.heatPort_intern);
  // south-north
  connect(airEle211.flowPort_Y2, flowConY211.port_1);
  connect(flowConY211.port_2, airEle311.flowPort_Y1);
  connect(airEle211.heatPort_intern, heatConY211.port_1);
  connect(heatConY211.port_2, airEle311.heatPort_intern);
  // front - back
  connect(airEle211.flowPort_Z2, flowConZ211.port_1);
  connect(flowConZ211.port_2, airEle221.flowPort_Z1);
  connect(airEle211.heatPort_intern, heatConZ211.port_1);
  connect(heatConZ211.port_2, airEle221.heatPort_intern);
  // west-east
  connect(airEle311.flowPort_X2, flowConX311.port_1);
  connect(flowConX311.port_2, airEle312.flowPort_X1);
  connect(airEle311.heatPort_intern, heatConX311.port_1);
  connect(heatConX311.port_2, airEle312.heatPort_intern);
  // south-north
  // front - back
  connect(airEle311.flowPort_Z2, flowConZ311.port_1);
  connect(flowConZ311.port_2, airEle321.flowPort_Z1);
  connect(airEle311.heatPort_intern, heatConZ311.port_1);
  connect(heatConZ311.port_2, airEle321.heatPort_intern);
  // west-east
  connect(airEle121.flowPort_X2, flowConX121.port_1);
  connect(flowConX121.port_2, airEle122.flowPort_X1);
  connect(airEle121.heatPort_intern, heatConX121.port_1);
  connect(heatConX121.port_2, airEle122.heatPort_intern);
  // south-north
  connect(airEle121.flowPort_Y2, flowConY121.port_1);
  connect(flowConY121.port_2, airEle221.flowPort_Y1);
  connect(airEle121.heatPort_intern, heatConY121.port_1);
  connect(heatConY121.port_2, airEle221.heatPort_intern);
  // front - back
  connect(airEle121.flowPort_Z2, flowConZ121.port_1);
  connect(flowConZ121.port_2, airEle131.flowPort_Z1);
  connect(airEle121.heatPort_intern, heatConZ121.port_1);
  connect(heatConZ121.port_2, airEle131.heatPort_intern);
  // west-east
  connect(airEle221.flowPort_X2, flowConX221.port_1);
  connect(flowConX221.port_2, airEle222.flowPort_X1);
  connect(airEle221.heatPort_intern, heatConX221.port_1);
  connect(heatConX221.port_2, airEle222.heatPort_intern);
  // south-north
  connect(airEle221.flowPort_Y2, flowConY221.port_1);
  connect(flowConY221.port_2, airEle321.flowPort_Y1);
  connect(airEle221.heatPort_intern, heatConY221.port_1);
  connect(heatConY221.port_2, airEle321.heatPort_intern);
  // front - back
  connect(airEle221.flowPort_Z2, flowConZ221.port_1);
  connect(flowConZ221.port_2, airEle231.flowPort_Z1);
  connect(airEle221.heatPort_intern, heatConZ221.port_1);
  connect(heatConZ221.port_2, airEle231.heatPort_intern);
  // west-east
  connect(airEle321.flowPort_X2, flowConX321.port_1);
  connect(flowConX321.port_2, airEle322.flowPort_X1);
  connect(airEle321.heatPort_intern, heatConX321.port_1);
  connect(heatConX321.port_2, airEle322.heatPort_intern);
  // south-north
  // front - back
  connect(airEle321.flowPort_Z2, flowConZ321.port_1);
  connect(flowConZ321.port_2, airEle331.flowPort_Z1);
  connect(airEle321.heatPort_intern, heatConZ321.port_1);
  connect(heatConZ321.port_2, airEle331.heatPort_intern);
  // west-east
  connect(airEle131.flowPort_X2, flowConX131.port_1);
  connect(flowConX131.port_2, airEle132.flowPort_X1);
  connect(airEle131.heatPort_intern, heatConX131.port_1);
  connect(heatConX131.port_2, airEle132.heatPort_intern);
  // south-north
  connect(airEle131.flowPort_Y2, flowConY131.port_1);
  connect(flowConY131.port_2, airEle231.flowPort_Y1);
  connect(airEle131.heatPort_intern, heatConY131.port_1);
  connect(heatConY131.port_2, airEle231.heatPort_intern);
  // front - back
  // west-east
  connect(airEle231.flowPort_X2, flowConX231.port_1);
  connect(flowConX231.port_2, airEle232.flowPort_X1);
  connect(airEle231.heatPort_intern, heatConX231.port_1);
  connect(heatConX231.port_2, airEle232.heatPort_intern);
  // south-north
  connect(airEle231.flowPort_Y2, flowConY231.port_1);
  connect(flowConY231.port_2, airEle331.flowPort_Y1);
  connect(airEle231.heatPort_intern, heatConY231.port_1);
  connect(heatConY231.port_2, airEle331.heatPort_intern);
  // front - back
  // west-east
  connect(airEle331.flowPort_X2, flowConX331.port_1);
  connect(flowConX331.port_2, airEle332.flowPort_X1);
  connect(airEle331.heatPort_intern, heatConX331.port_1);
  connect(heatConX331.port_2, airEle332.heatPort_intern);
  // south-north
  // front - back
  // west-east
  connect(airEle112.flowPort_X2, flowConX112.port_1);
  connect(flowConX112.port_2, airEle113.flowPort_X1);
  connect(airEle112.heatPort_intern, heatConX112.port_1);
  connect(heatConX112.port_2, airEle113.heatPort_intern);
  // south-north
  connect(airEle112.flowPort_Y2, flowConY112.port_1);
  connect(flowConY112.port_2, airEle212.flowPort_Y1);
  connect(airEle112.heatPort_intern, heatConY112.port_1);
  connect(heatConY112.port_2, airEle212.heatPort_intern);
  // front - back
  connect(airEle112.flowPort_Z2, flowConZ112.port_1);
  connect(flowConZ112.port_2, airEle122.flowPort_Z1);
  connect(airEle112.heatPort_intern, heatConZ112.port_1);
  connect(heatConZ112.port_2, airEle122.heatPort_intern);
  // west-east
  connect(airEle212.flowPort_X2, flowConX212.port_1);
  connect(flowConX212.port_2, airEle213.flowPort_X1);
  connect(airEle212.heatPort_intern, heatConX212.port_1);
  connect(heatConX212.port_2, airEle213.heatPort_intern);
  // south-north
  connect(airEle212.flowPort_Y2, flowConY212.port_1);
  connect(flowConY212.port_2, airEle312.flowPort_Y1);
  connect(airEle212.heatPort_intern, heatConY212.port_1);
  connect(heatConY212.port_2, airEle312.heatPort_intern);
  // front - back
  connect(airEle212.flowPort_Z2, flowConZ212.port_1);
  connect(flowConZ212.port_2, airEle222.flowPort_Z1);
  connect(airEle212.heatPort_intern, heatConZ212.port_1);
  connect(heatConZ212.port_2, airEle222.heatPort_intern);
  // west-east
  connect(airEle312.flowPort_X2, flowConX312.port_1);
  connect(flowConX312.port_2, airEle313.flowPort_X1);
  connect(airEle312.heatPort_intern, heatConX312.port_1);
  connect(heatConX312.port_2, airEle313.heatPort_intern);
  // south-north
  // front - back
  connect(airEle312.flowPort_Z2, flowConZ312.port_1);
  connect(flowConZ312.port_2, airEle322.flowPort_Z1);
  connect(airEle312.heatPort_intern, heatConZ312.port_1);
  connect(heatConZ312.port_2, airEle322.heatPort_intern);
  // west-east
  connect(airEle122.flowPort_X2, flowConX122.port_1);
  connect(flowConX122.port_2, airEle123.flowPort_X1);
  connect(airEle122.heatPort_intern, heatConX122.port_1);
  connect(heatConX122.port_2, airEle123.heatPort_intern);
  // south-north
  connect(airEle122.flowPort_Y2, flowConY122.port_1);
  connect(flowConY122.port_2, airEle222.flowPort_Y1);
  connect(airEle122.heatPort_intern, heatConY122.port_1);
  connect(heatConY122.port_2, airEle222.heatPort_intern);
  // front - back
  connect(airEle122.flowPort_Z2, flowConZ122.port_1);
  connect(flowConZ122.port_2, airEle132.flowPort_Z1);
  connect(airEle122.heatPort_intern, heatConZ122.port_1);
  connect(heatConZ122.port_2, airEle132.heatPort_intern);
  // west-east
  connect(airEle222.flowPort_X2, flowConX222.port_1);
  connect(flowConX222.port_2, airEle223.flowPort_X1);
  connect(airEle222.heatPort_intern, heatConX222.port_1);
  connect(heatConX222.port_2, airEle223.heatPort_intern);
  // south-north
  connect(airEle222.flowPort_Y2, flowConY222.port_1);
  connect(flowConY222.port_2, airEle322.flowPort_Y1);
  connect(airEle222.heatPort_intern, heatConY222.port_1);
  connect(heatConY222.port_2, airEle322.heatPort_intern);
  // front - back
  connect(airEle222.flowPort_Z2, flowConZ222.port_1);
  connect(flowConZ222.port_2, airEle232.flowPort_Z1);
  connect(airEle222.heatPort_intern, heatConZ222.port_1);
  connect(heatConZ222.port_2, airEle232.heatPort_intern);
  // west-east
  connect(airEle322.flowPort_X2, flowConX322.port_1);
  connect(flowConX322.port_2, airEle323.flowPort_X1);
  connect(airEle322.heatPort_intern, heatConX322.port_1);
  connect(heatConX322.port_2, airEle323.heatPort_intern);
  // south-north
  // front - back
  connect(airEle322.flowPort_Z2, flowConZ322.port_1);
  connect(flowConZ322.port_2, airEle332.flowPort_Z1);
  connect(airEle322.heatPort_intern, heatConZ322.port_1);
  connect(heatConZ322.port_2, airEle332.heatPort_intern);
  // west-east
  connect(airEle132.flowPort_X2, flowConX132.port_1);
  connect(flowConX132.port_2, airEle133.flowPort_X1);
  connect(airEle132.heatPort_intern, heatConX132.port_1);
  connect(heatConX132.port_2, airEle133.heatPort_intern);
  // south-north
  connect(airEle132.flowPort_Y2, flowConY132.port_1);
  connect(flowConY132.port_2, airEle232.flowPort_Y1);
  connect(airEle132.heatPort_intern, heatConY132.port_1);
  connect(heatConY132.port_2, airEle232.heatPort_intern);
  // front - back
  // west-east
  connect(airEle232.flowPort_X2, flowConX232.port_1);
  connect(flowConX232.port_2, airEle233.flowPort_X1);
  connect(airEle232.heatPort_intern, heatConX232.port_1);
  connect(heatConX232.port_2, airEle233.heatPort_intern);
  // south-north
  connect(airEle232.flowPort_Y2, flowConY232.port_1);
  connect(flowConY232.port_2, airEle332.flowPort_Y1);
  connect(airEle232.heatPort_intern, heatConY232.port_1);
  connect(heatConY232.port_2, airEle332.heatPort_intern);
  // front - back
  // west-east
  connect(airEle332.flowPort_X2, flowConX332.port_1);
  connect(flowConX332.port_2, airEle333.flowPort_X1);
  connect(airEle332.heatPort_intern, heatConX332.port_1);
  connect(heatConX332.port_2, airEle333.heatPort_intern);
  // south-north
  // front - back
  // west-east
  // south-north
  connect(airEle113.flowPort_Y2, flowConY113.port_1);
  connect(flowConY113.port_2, airEle213.flowPort_Y1);
  connect(airEle113.heatPort_intern, heatConY113.port_1);
  connect(heatConY113.port_2, airEle213.heatPort_intern);
  // front - back
  connect(airEle113.flowPort_Z2, flowConZ113.port_1);
  connect(flowConZ113.port_2, airEle123.flowPort_Z1);
  connect(airEle113.heatPort_intern, heatConZ113.port_1);
  connect(heatConZ113.port_2, airEle123.heatPort_intern);
  // west-east
  // south-north
  connect(airEle213.flowPort_Y2, flowConY213.port_1);
  connect(flowConY213.port_2, airEle313.flowPort_Y1);
  connect(airEle213.heatPort_intern, heatConY213.port_1);
  connect(heatConY213.port_2, airEle313.heatPort_intern);
  // front - back
  connect(airEle213.flowPort_Z2, flowConZ213.port_1);
  connect(flowConZ213.port_2, airEle223.flowPort_Z1);
  connect(airEle213.heatPort_intern, heatConZ213.port_1);
  connect(heatConZ213.port_2, airEle223.heatPort_intern);
  // west-east
  // south-north
  // front - back
  connect(airEle313.flowPort_Z2, flowConZ313.port_1);
  connect(flowConZ313.port_2, airEle323.flowPort_Z1);
  connect(airEle313.heatPort_intern, heatConZ313.port_1);
  connect(heatConZ313.port_2, airEle323.heatPort_intern);
  // west-east
  // south-north
  connect(airEle123.flowPort_Y2, flowConY123.port_1);
  connect(flowConY123.port_2, airEle223.flowPort_Y1);
  connect(airEle123.heatPort_intern, heatConY123.port_1);
  connect(heatConY123.port_2, airEle223.heatPort_intern);
  // front - back
  connect(airEle123.flowPort_Z2, flowConZ123.port_1);
  connect(flowConZ123.port_2, airEle133.flowPort_Z1);
  connect(airEle123.heatPort_intern, heatConZ123.port_1);
  connect(heatConZ123.port_2, airEle133.heatPort_intern);
  // west-east
  // south-north
  connect(airEle223.flowPort_Y2, flowConY223.port_1);
  connect(flowConY223.port_2, airEle323.flowPort_Y1);
  connect(airEle223.heatPort_intern, heatConY223.port_1);
  connect(heatConY223.port_2, airEle323.heatPort_intern);
  // front - back
  connect(airEle223.flowPort_Z2, flowConZ223.port_1);
  connect(flowConZ223.port_2, airEle233.flowPort_Z1);
  connect(airEle223.heatPort_intern, heatConZ223.port_1);
  connect(heatConZ223.port_2, airEle233.heatPort_intern);
  // west-east
  // south-north
  // front - back
  connect(airEle323.flowPort_Z2, flowConZ323.port_1);
  connect(flowConZ323.port_2, airEle333.flowPort_Z1);
  connect(airEle323.heatPort_intern, heatConZ323.port_1);
  connect(heatConZ323.port_2, airEle333.heatPort_intern);
  // west-east
  // south-north
  connect(airEle133.flowPort_Y2, flowConY133.port_1);
  connect(flowConY133.port_2, airEle233.flowPort_Y1);
  connect(airEle133.heatPort_intern, heatConY133.port_1);
  connect(heatConY133.port_2, airEle233.heatPort_intern);
  // front - back
  // west-east
  // south-north
  connect(airEle233.flowPort_Y2, flowConY233.port_1);
  connect(flowConY233.port_2, airEle333.flowPort_Y1);
  connect(airEle233.heatPort_intern, heatConY233.port_1);
  connect(heatConY233.port_2, airEle333.heatPort_intern);
  // front - back
  // west-east
  // south-north
  // front - back
end AirvolumeThermal3x3x3WithOpenings;
