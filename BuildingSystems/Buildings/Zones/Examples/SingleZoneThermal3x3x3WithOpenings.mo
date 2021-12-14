within BuildingSystems.Buildings.Zones.Examples;
model SingleZoneThermal3x3x3WithOpenings
  "Thermal zone model with 3D discretized air volume"
  extends Modelica.Icons.Example;
  parameter Integer nSurfaces = 54;
  package Medium = BuildingSystems.Media.Air;

  record Construction
    "Construction"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={0.01},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()});
  end Construction;

  // Southern walls
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south111(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_south111;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south112(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_south112;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south113(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_south113;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south211(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_south211;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south212(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_south212;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south213(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_south213;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south311(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_south311;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south312(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_south312;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_south313(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_south313;

  // Eastern walls
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east113(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_east113;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east123(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_east123;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east133(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_east133;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east213(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_east213;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east223(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_east223;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east233(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_east233;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east313(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_east313;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east323(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_east323;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_east333(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_east333;

  // Northern walls
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north131(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_north131;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north132(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_north132;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north133(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_north133;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north231(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_north231;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north232(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_north232;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north233(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_north233;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north331(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_north331;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north332(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_north332;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_north333(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_north333;

  // Western walls
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west111(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_west111;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west121(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_west121;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west131(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_west131;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west211(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_west211;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west221(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_west221;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west231(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_west231;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west311(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_west311;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west321(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_west321;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_west331(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_west331;

  // Floor walls
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor111(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=0.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_floor111;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor112(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=0.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_floor112;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor113(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=0.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_floor113;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor121(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=0.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_floor121;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor122(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=0.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_floor122;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor123(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=0.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_floor123;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor131(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=0.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_floor131;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor132(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=0.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_floor132;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor133(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=0.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_floor133;

  // Roof walls
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof311(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_roof311;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof312(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_roof312;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof313(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_roof313;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof321(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_roof321;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof322(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_roof322;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof323(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_roof323;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof331(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_roof331;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof332(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_roof332;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof333(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    redeclare Construction constructionData);
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface_roof333;

  BuildingSystems.Buildings.Ambience ambience(
    redeclare block WeatherData =
        BuildingSystems.Climate.WeatherDataMeteonorm.Germany_Berlin_Meteonorm_ASCII,
    nSurfaces=54,
    nAirpaths=2,
    heightAirpath={0.5,2.5})
    annotation (Placement(transformation(extent={{-36,-12},{-16,8}})));

  BuildingSystems.Buildings.Zones.Examples.ZoneAirvolumeThermal3x3x3WithOpenings zone(
    nAirElements = 27,
    V=3.0*3.0*3.0,
    nConstructions=54)
    annotation (Placement(transformation(extent={{16,-12},{36,8}})));

  BuildingSystems.Fluid.Actuators.Valves.TwoWayLinear val1(
    redeclare package Medium = Medium,
    m_flow_nominal=0.1,
    dpValve_nominal=4.0,
    y_start=0.0)
    annotation (Placement(transformation(extent={{0,2},{10,12}})));
  BuildingSystems.Fluid.Actuators.Valves.TwoWayLinear val2(
    redeclare package Medium = Medium,
    m_flow_nominal=0.1,
    dpValve_nominal=4.0,
    y_start=0.0)
    annotation (Placement(transformation(extent={{-8,-12},{2,-2}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=1.0,
    duration=2,
    offset=0.0,
    startTime=2)
    annotation (Placement(transformation(extent={{-28,14},{-22,20}})));
equation
  // zone <-> wall connections; wall <-> surface connection; surface <-> ambient connections
  // South walls
  connect(surface_south111.toConstructionPort, wall_south111.toSurfacePort_2);
  connect(zone.toConstructionPorts[1], wall_south111.toSurfacePort_1);
  connect(ambience.toSurfacePorts[1], surface_south111.toSurfacesPort);
  connect(ambience.toAirPorts[1], surface_south111.toAirPort);

  connect(surface_south112.toConstructionPort, wall_south112.toSurfacePort_2);
  connect(zone.toConstructionPorts[2], wall_south112.toSurfacePort_1);
  connect(ambience.toSurfacePorts[2], surface_south112.toSurfacesPort);
  connect(ambience.toAirPorts[2], surface_south112.toAirPort);

  connect(surface_south113.toConstructionPort, wall_south113.toSurfacePort_2);
  connect(zone.toConstructionPorts[3], wall_south113.toSurfacePort_1);
  connect(ambience.toSurfacePorts[3], surface_south113.toSurfacesPort);
  connect(ambience.toAirPorts[3], surface_south113.toAirPort);

  connect(surface_south211.toConstructionPort, wall_south211.toSurfacePort_2);
  connect(zone.toConstructionPorts[4], wall_south211.toSurfacePort_1);
  connect(ambience.toSurfacePorts[4], surface_south211.toSurfacesPort);
  connect(ambience.toAirPorts[4], surface_south211.toAirPort);

  connect(surface_south212.toConstructionPort, wall_south212.toSurfacePort_2);
  connect(zone.toConstructionPorts[5], wall_south212.toSurfacePort_1);
  connect(ambience.toSurfacePorts[5], surface_south212.toSurfacesPort);
  connect(ambience.toAirPorts[5], surface_south212.toAirPort);

  connect(surface_south213.toConstructionPort, wall_south213.toSurfacePort_2);
  connect(zone.toConstructionPorts[6], wall_south213.toSurfacePort_1);
  connect(ambience.toSurfacePorts[6], surface_south213.toSurfacesPort);
  connect(ambience.toAirPorts[6], surface_south213.toAirPort);

  connect(surface_south311.toConstructionPort, wall_south311.toSurfacePort_2);
  connect(zone.toConstructionPorts[7], wall_south311.toSurfacePort_1);
  connect(ambience.toSurfacePorts[7], surface_south311.toSurfacesPort);
  connect(ambience.toAirPorts[7], surface_south311.toAirPort);

  connect(surface_south312.toConstructionPort, wall_south312.toSurfacePort_2);
  connect(zone.toConstructionPorts[8], wall_south312.toSurfacePort_1);
  connect(ambience.toSurfacePorts[8], surface_south312.toSurfacesPort);
  connect(ambience.toAirPorts[8], surface_south312.toAirPort);

  connect(surface_south313.toConstructionPort, wall_south313.toSurfacePort_2);
  connect(zone.toConstructionPorts[9], wall_south313.toSurfacePort_1);
  connect(ambience.toSurfacePorts[9], surface_south313.toSurfacesPort);
  connect(ambience.toAirPorts[9], surface_south313.toAirPort);

  // East walls
  connect(surface_east113.toConstructionPort, wall_east113.toSurfacePort_2);
  connect(zone.toConstructionPorts[10], wall_east113.toSurfacePort_1);
  connect(ambience.toSurfacePorts[10], surface_east113.toSurfacesPort);
  connect(ambience.toAirPorts[10], surface_east113.toAirPort);

  connect(surface_east123.toConstructionPort, wall_east123.toSurfacePort_2);
  connect(zone.toConstructionPorts[11], wall_east123.toSurfacePort_1);
  connect(ambience.toSurfacePorts[11], surface_east123.toSurfacesPort);
  connect(ambience.toAirPorts[11], surface_east123.toAirPort);

  connect(surface_east133.toConstructionPort, wall_east133.toSurfacePort_2);
  connect(zone.toConstructionPorts[12], wall_east133.toSurfacePort_1);
  connect(ambience.toSurfacePorts[12], surface_east133.toSurfacesPort);
  connect(ambience.toAirPorts[12], surface_east133.toAirPort);

  connect(surface_east213.toConstructionPort, wall_east213.toSurfacePort_2);
  connect(zone.toConstructionPorts[13], wall_east213.toSurfacePort_1);
  connect(ambience.toSurfacePorts[13], surface_east213.toSurfacesPort);
  connect(ambience.toAirPorts[13], surface_east213.toAirPort);

  connect(surface_east223.toConstructionPort, wall_east223.toSurfacePort_2);
  connect(zone.toConstructionPorts[14], wall_east223.toSurfacePort_1);
  connect(ambience.toSurfacePorts[14], surface_east223.toSurfacesPort);
  connect(ambience.toAirPorts[14], surface_east223.toAirPort);

  connect(surface_east233.toConstructionPort, wall_east233.toSurfacePort_2);
  connect(zone.toConstructionPorts[15], wall_east233.toSurfacePort_1);
  connect(ambience.toSurfacePorts[15], surface_east233.toSurfacesPort);
  connect(ambience.toAirPorts[15], surface_east233.toAirPort);

  connect(surface_east313.toConstructionPort, wall_east313.toSurfacePort_2);
  connect(zone.toConstructionPorts[16], wall_east313.toSurfacePort_1);
  connect(ambience.toSurfacePorts[16], surface_east313.toSurfacesPort);
  connect(ambience.toAirPorts[16], surface_east313.toAirPort);

  connect(surface_east323.toConstructionPort, wall_east323.toSurfacePort_2);
  connect(zone.toConstructionPorts[17], wall_east323.toSurfacePort_1);
  connect(ambience.toSurfacePorts[17], surface_east323.toSurfacesPort);
  connect(ambience.toAirPorts[17], surface_east323.toAirPort);

  connect(surface_east333.toConstructionPort, wall_east333.toSurfacePort_2);
  connect(zone.toConstructionPorts[18], wall_east333.toSurfacePort_1);
  connect(ambience.toSurfacePorts[18], surface_east333.toSurfacesPort);
  connect(ambience.toAirPorts[18], surface_east333.toAirPort);

  // North walls
  connect(surface_north131.toConstructionPort, wall_north131.toSurfacePort_2);
  connect(zone.toConstructionPorts[19], wall_north131.toSurfacePort_1);
  connect(ambience.toSurfacePorts[19], surface_north131.toSurfacesPort);
  connect(ambience.toAirPorts[19], surface_north131.toAirPort);

  connect(surface_north132.toConstructionPort, wall_north132.toSurfacePort_2);
  connect(zone.toConstructionPorts[20], wall_north132.toSurfacePort_1);
  connect(ambience.toSurfacePorts[20], surface_north132.toSurfacesPort);
  connect(ambience.toAirPorts[20], surface_north132.toAirPort);

  connect(surface_north133.toConstructionPort, wall_north133.toSurfacePort_2);
  connect(zone.toConstructionPorts[21], wall_north133.toSurfacePort_1);
  connect(ambience.toSurfacePorts[21], surface_north133.toSurfacesPort);
  connect(ambience.toAirPorts[21], surface_north133.toAirPort);

  connect(surface_north231.toConstructionPort, wall_north231.toSurfacePort_2);
  connect(zone.toConstructionPorts[22], wall_north231.toSurfacePort_1);
  connect(ambience.toSurfacePorts[22], surface_north231.toSurfacesPort);
  connect(ambience.toAirPorts[22], surface_north231.toAirPort);

  connect(surface_north232.toConstructionPort, wall_north232.toSurfacePort_2);
  connect(zone.toConstructionPorts[23], wall_north232.toSurfacePort_1);
  connect(ambience.toSurfacePorts[23], surface_north232.toSurfacesPort);
  connect(ambience.toAirPorts[23], surface_north232.toAirPort);

  connect(surface_north233.toConstructionPort, wall_north233.toSurfacePort_2);
  connect(zone.toConstructionPorts[24], wall_north233.toSurfacePort_1);
  connect(ambience.toSurfacePorts[24], surface_north233.toSurfacesPort);
  connect(ambience.toAirPorts[24], surface_north233.toAirPort);

  connect(surface_north331.toConstructionPort, wall_north331.toSurfacePort_2);
  connect(zone.toConstructionPorts[25], wall_north331.toSurfacePort_1);
  connect(ambience.toSurfacePorts[25], surface_north331.toSurfacesPort);
  connect(ambience.toAirPorts[25], surface_north331.toAirPort);

  connect(surface_north332.toConstructionPort, wall_north332.toSurfacePort_2);
  connect(zone.toConstructionPorts[26], wall_north332.toSurfacePort_1);
  connect(ambience.toSurfacePorts[26], surface_north332.toSurfacesPort);
  connect(ambience.toAirPorts[26], surface_north332.toAirPort);

  connect(surface_north333.toConstructionPort, wall_north333.toSurfacePort_2);
  connect(zone.toConstructionPorts[27], wall_north333.toSurfacePort_1);
  connect(ambience.toSurfacePorts[27], surface_north333.toSurfacesPort);
  connect(ambience.toAirPorts[27], surface_north333.toAirPort);

  // West walls
  connect(surface_west111.toConstructionPort, wall_west111.toSurfacePort_2);
  connect(zone.toConstructionPorts[28], wall_west111.toSurfacePort_1);
  connect(ambience.toSurfacePorts[28], surface_west111.toSurfacesPort);
  connect(ambience.toAirPorts[28], surface_west111.toAirPort);

  connect(surface_west121.toConstructionPort, wall_west121.toSurfacePort_2);
  connect(zone.toConstructionPorts[29], wall_west121.toSurfacePort_1);
  connect(ambience.toSurfacePorts[29], surface_west121.toSurfacesPort);
  connect(ambience.toAirPorts[29], surface_west121.toAirPort);

  connect(surface_west131.toConstructionPort, wall_west131.toSurfacePort_2);
  connect(zone.toConstructionPorts[30], wall_west131.toSurfacePort_1);
  connect(ambience.toSurfacePorts[30], surface_west131.toSurfacesPort);
  connect(ambience.toAirPorts[30], surface_west131.toAirPort);

  connect(surface_west211.toConstructionPort, wall_west211.toSurfacePort_2);
  connect(zone.toConstructionPorts[31], wall_west211.toSurfacePort_1);
  connect(ambience.toSurfacePorts[31], surface_west211.toSurfacesPort);
  connect(ambience.toAirPorts[31], surface_west211.toAirPort);

  connect(surface_west221.toConstructionPort, wall_west221.toSurfacePort_2);
  connect(zone.toConstructionPorts[32], wall_west221.toSurfacePort_1);
  connect(ambience.toSurfacePorts[32], surface_west221.toSurfacesPort);
  connect(ambience.toAirPorts[32], surface_west221.toAirPort);

  connect(surface_west231.toConstructionPort, wall_west231.toSurfacePort_2);
  connect(zone.toConstructionPorts[33], wall_west231.toSurfacePort_1);
  connect(ambience.toSurfacePorts[33], surface_west231.toSurfacesPort);
  connect(ambience.toAirPorts[33], surface_west231.toAirPort);

  connect(surface_west311.toConstructionPort, wall_west311.toSurfacePort_2);
  connect(zone.toConstructionPorts[34], wall_west311.toSurfacePort_1);
  connect(ambience.toSurfacePorts[34], surface_west311.toSurfacesPort);
  connect(ambience.toAirPorts[34], surface_west311.toAirPort);

  connect(surface_west321.toConstructionPort, wall_west321.toSurfacePort_2);
  connect(zone.toConstructionPorts[35], wall_west321.toSurfacePort_1);
  connect(ambience.toSurfacePorts[35], surface_west321.toSurfacesPort);
  connect(ambience.toAirPorts[35], surface_west321.toAirPort);

  connect(surface_west331.toConstructionPort, wall_west331.toSurfacePort_2);
  connect(zone.toConstructionPorts[36], wall_west331.toSurfacePort_1);
  connect(ambience.toSurfacePorts[36], surface_west331.toSurfacesPort);
  connect(ambience.toAirPorts[36], surface_west331.toAirPort);

  // Floor
  connect(surface_floor111.toConstructionPort, floor111.toSurfacePort_2);
  connect(zone.toConstructionPorts[37], floor111.toSurfacePort_1);
  connect(ambience.toSurfacePorts[37], surface_floor111.toSurfacesPort);
  connect(ambience.toAirPorts[37], surface_floor111.toAirPort);

  connect(surface_floor112.toConstructionPort, floor112.toSurfacePort_2);
  connect(zone.toConstructionPorts[38], floor112.toSurfacePort_1);
  connect(ambience.toSurfacePorts[38], surface_floor112.toSurfacesPort);
  connect(ambience.toAirPorts[38], surface_floor112.toAirPort);

  connect(surface_floor113.toConstructionPort, floor113.toSurfacePort_2);
  connect(zone.toConstructionPorts[39], floor113.toSurfacePort_1);
  connect(ambience.toSurfacePorts[39], surface_floor113.toSurfacesPort);
  connect(ambience.toAirPorts[39], surface_floor113.toAirPort);

  connect(surface_floor121.toConstructionPort, floor121.toSurfacePort_2);
  connect(zone.toConstructionPorts[40], floor121.toSurfacePort_1);
  connect(ambience.toSurfacePorts[40], surface_floor121.toSurfacesPort);
  connect(ambience.toAirPorts[40], surface_floor121.toAirPort);

  connect(surface_floor122.toConstructionPort, floor122.toSurfacePort_2);
  connect(zone.toConstructionPorts[41], floor122.toSurfacePort_1);
  connect(ambience.toSurfacePorts[41], surface_floor122.toSurfacesPort);
  connect(ambience.toAirPorts[41], surface_floor122.toAirPort);

  connect(surface_floor123.toConstructionPort, floor123.toSurfacePort_2);
  connect(zone.toConstructionPorts[42], floor123.toSurfacePort_1);
  connect(ambience.toSurfacePorts[42], surface_floor123.toSurfacesPort);
  connect(ambience.toAirPorts[42], surface_floor123.toAirPort);

  connect(surface_floor131.toConstructionPort, floor131.toSurfacePort_2);
  connect(zone.toConstructionPorts[43], floor131.toSurfacePort_1);
  connect(ambience.toSurfacePorts[43], surface_floor131.toSurfacesPort);
  connect(ambience.toAirPorts[43], surface_floor131.toAirPort);

  connect(surface_floor132.toConstructionPort, floor132.toSurfacePort_2);
  connect(zone.toConstructionPorts[44], floor132.toSurfacePort_1);
  connect(ambience.toSurfacePorts[44], surface_floor132.toSurfacesPort);
  connect(ambience.toAirPorts[44], surface_floor132.toAirPort);

  connect(surface_floor133.toConstructionPort, floor133.toSurfacePort_2);
  connect(zone.toConstructionPorts[45], floor133.toSurfacePort_1);
  connect(ambience.toSurfacePorts[45], surface_floor133.toSurfacesPort);
  connect(ambience.toAirPorts[45], surface_floor133.toAirPort);

  // Roof
  connect(surface_roof311.toConstructionPort, roof311.toSurfacePort_2);
  connect(zone.toConstructionPorts[46], roof311.toSurfacePort_1);
  connect(ambience.toSurfacePorts[46], surface_roof311.toSurfacesPort);
  connect(ambience.toAirPorts[46], surface_roof311.toAirPort);

  connect(surface_roof312.toConstructionPort, roof312.toSurfacePort_2);
  connect(zone.toConstructionPorts[47], roof312.toSurfacePort_1);
  connect(ambience.toSurfacePorts[47], surface_roof312.toSurfacesPort);
  connect(ambience.toAirPorts[47], surface_roof312.toAirPort);

  connect(surface_roof313.toConstructionPort, roof313.toSurfacePort_2);
  connect(zone.toConstructionPorts[48], roof313.toSurfacePort_1);
  connect(ambience.toSurfacePorts[48], surface_roof313.toSurfacesPort);
  connect(ambience.toAirPorts[48], surface_roof313.toAirPort);

  connect(surface_roof321.toConstructionPort, roof321.toSurfacePort_2);
  connect(zone.toConstructionPorts[49], roof321.toSurfacePort_1);
  connect(ambience.toSurfacePorts[49], surface_roof321.toSurfacesPort);
  connect(ambience.toAirPorts[49], surface_roof321.toAirPort);

  connect(surface_roof322.toConstructionPort, roof322.toSurfacePort_2);
  connect(zone.toConstructionPorts[50], roof322.toSurfacePort_1);
  connect(ambience.toSurfacePorts[50], surface_roof322.toSurfacesPort);
  connect(ambience.toAirPorts[50], surface_roof322.toAirPort);

  connect(surface_roof323.toConstructionPort, roof323.toSurfacePort_2);
  connect(zone.toConstructionPorts[51], roof323.toSurfacePort_1);
  connect(ambience.toSurfacePorts[51], surface_roof323.toSurfacesPort);
  connect(ambience.toAirPorts[51], surface_roof323.toAirPort);

  connect(surface_roof331.toConstructionPort, roof331.toSurfacePort_2);
  connect(zone.toConstructionPorts[52], roof331.toSurfacePort_1);
  connect(ambience.toSurfacePorts[52], surface_roof331.toSurfacesPort);
  connect(ambience.toAirPorts[52], surface_roof331.toAirPort);

  connect(surface_roof332.toConstructionPort, roof332.toSurfacePort_2);
  connect(zone.toConstructionPorts[53], roof332.toSurfacePort_1);
  connect(ambience.toSurfacePorts[53], surface_roof332.toSurfacesPort);
  connect(ambience.toAirPorts[53], surface_roof332.toAirPort);

  connect(surface_roof333.toConstructionPort, roof333.toSurfacePort_2);
  connect(zone.toConstructionPorts[54], roof333.toSurfacePort_1);
  connect(ambience.toSurfacePorts[54], surface_roof333.toSurfacesPort);
  connect(ambience.toAirPorts[54], surface_roof333.toAirPort);

  connect(ambience.toAirpathPorts[1], val1.port_a)
    annotation (Line(points={{-18,7},{0,7}}, color={0,127,255}));
  connect(ambience.toAirpathPorts[2],val2. port_a) annotation (Line(points={{-22,7},
          {-12,7},{-12,-7},{-8,-7}},     color={0,127,255}));
  connect(val1.port_b, zone.airpathPorts[1]) annotation (Line(points={{10,7},{12,
          7},{12,14},{20,14},{20,9}}, color={0,127,255}));
  connect(val2.port_b, zone.airpathPorts[2]) annotation (Line(points={{2,-7},{10,
          -7},{10,-6},{14,-6},{14,9},{20,9}},          color={0,127,255}));

  connect(ramp.y, val2.y)
    annotation (Line(points={{-21.7,17},{-3,17},{-3,-1}}, color={0,0,127}));
  connect(ramp.y, val1.y)
    annotation (Line(points={{-21.7,17},{5,17},{5,13}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=86400),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Zones/Examples/SingleZoneThermal3x3x3WithOpenings.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-20},{60,60}}),
      graphics={Text(extent={{-56,70},{54,8}}, lineColor={0,0,255},
          textString="3D room model with 3 x 3 x 3 = 27 air elements, which is surrounded by
4 discretized (3 x 3) wall models, a discretized (3 x 3) roof model and
a discretized (3 x 3) floor model. The discretized air volume model
includes two air pathes, one for the lower surface element 2 and
one for the upper surface element 26.")}),
Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-20},{60,60}})),
Documentation(info="<html>
<p>
Example that simulates a 3x3x3 discretized thermal zone model.
</p>
</html>",
revisions="<html>
<ul>
<li>
December 13, 2021, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SingleZoneThermal3x3x3WithOpenings;
