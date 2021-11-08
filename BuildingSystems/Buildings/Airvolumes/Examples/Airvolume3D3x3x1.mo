within BuildingSystems.Buildings.Airvolumes.Examples;
model Airvolume3D3x3x1
  extends BuildingSystems.Buildings.Airvolumes.Airvolume3DTemplate(
    nSurfaces = 4*3 + 2*9,
    nAirElements = 9,
    bou.posX = {
      // Left border
      0.0,
      0.0,
      0.0,
      // Upper border
      0.5,
      1.5,
      2.5,
      // Right border
      3.0,
      3.0,
      3.0,
      // Lower border
      2.5,
      1.5,
      0.5,
      // Front side
      0.5,
      1.5,
      2.5,
      0.5,
      1.5,
      2.5,
      0.5,
      1.5,
      2.5,
      // Back side
      0.5,
      1.5,
      2.5,
      0.5,
      1.5,
      2.5,
      0.5,
      1.5,
      2.5},
    bou.posY = {
    // Left border
    0.5,
    1.5,
    2.5,
    // Upper border
    3.0,
    3.0,
    3.0,
    // Right border
    2.5,
    1.5,
    0.5,
    // Lower border
    0.0,
    0.0,
    0.0,
    // Front side
    0.5,
    0.5,
    0.5,
    1.5,
    1.5,
    1.5,
    2.5,
    2.5,
    2.5,
    // Back side
    0.5,
    0.5,
    0.5,
    1.5,
    1.5,
    1.5,
    2.5,
    2.5,
    2.5},
    bou.posZ = {
    // Left border
    0.5,
    0.5,
    0.5,
    // Upper border
    0.5,
    0.5,
    0.5,
    // Right border
    0.5,
    0.5,
    0.5,
    // Lower border
    0.5,
    0.5,
    0.5,
    // Front side
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    0.0,
    // Back side
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0,
    1.0},
    bou.location = {
    // Left border
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.South,
    BuildingSystems.Buildings.Types.OrientationType.South,
    // Upper border
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    BuildingSystems.Buildings.Types.OrientationType.Roof,
    // Right border
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.North,
    BuildingSystems.Buildings.Types.OrientationType.North,
    // Lower border
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    BuildingSystems.Buildings.Types.OrientationType.Floor,
    // Front side
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    BuildingSystems.Buildings.Types.OrientationType.East,
    // Back side
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West,
    BuildingSystems.Buildings.Types.OrientationType.West});
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle111(
    BCwall_east=true,
    BCwall_south=true,
    BCwall_west=true,
    BCwall_floor=true,
    posX=0.5,
    posY=0.5,
    posZ=0.5,
    scalF={1,1,1},
    BCwall_north=false,
    BCwall_roof=false)
    annotation (Placement(transformation(extent={{-80,-90},{-60,-70}})));
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle211(
    scalF={1,1,1},
    posX=1.5,
    posY=0.5,
    posZ=0.5,
    BCwall_east=true,
    BCwall_south=false,
    BCwall_west=true,
    BCwall_floor=true,
    BCwall_north=false,
    BCwall_roof=false)
    annotation (Placement(transformation(extent={{-20,-90},{0,-70}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConnectionX_111_112(
    BCwall_east=true,
    BCwall_west=true,
    BCwall_floor=true)
    annotation (Placement(transformation(extent={{-50,-90},{-30,-70}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX zoneHeatConductionX_111_211
    annotation (Placement(transformation(extent={{-50,-100},{-30,-80}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConnectionX_211_311(
    BCwall_east=true,
    BCwall_west=true,
    BCwall_floor=true)
    annotation (Placement(transformation(extent={{10,-90},{30,-70}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX zoneHeatConductionX_211_311
    annotation (Placement(transformation(extent={{10,-100},{30,-80}})));
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle311(
    scalF={1,1,1},
    posX=2.5,
    posY=0.5,
    posZ=0.5,
    BCwall_north=true,
    BCwall_east=false,
    BCwall_south=true,
    BCwall_west=true,
    BCwall_floor=true,
    BCwall_roof=false)
    annotation (Placement(transformation(extent={{40,-90},{60,-70}})));
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle121(
    BCwall_east=true,
    BCwall_south=true,
    BCwall_west=true,
    posX=0.5,
    posZ=0.5,
    scalF={1,1,1},
    BCwall_north=false,
    BCwall_floor=false,
    BCwall_roof=false,
    posY=1.5)
    annotation (Placement(transformation(extent={{-80,-30},{-60,-10}})));
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle221(
    scalF={1,1,1},
    posX=1.5,
    posZ=0.5,
    BCwall_east=true,
    BCwall_west=true,
    BCwall_north=false,
    BCwall_south=false,
    BCwall_floor=false,
    BCwall_roof=false,
    posY=1.5)
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConnectionX_121_221(
    BCwall_east=true,
    BCwall_west=true,
    BCwall_floor=false,
    BCwall_roof=false)
    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX zoneHeatConductionX_121_221
    annotation (Placement(transformation(extent={{-50,-40},{-30,-20}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConnectionX_221_321(
    BCwall_east=true,
    BCwall_west=true)
    annotation (Placement(transformation(extent={{10,-30},{30,-10}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX zoneHeatConductionX_221_321
    annotation (Placement(transformation(extent={{10,-40},{30,-20}})));
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle321(
    scalF={1,1,1},
    posX=2.5,
    posZ=0.5,
    BCwall_north=true,
    BCwall_east=false,
    BCwall_south=true,
    BCwall_west=true,
    BCwall_floor=false,
    BCwall_roof=false,
    posY=1.5)
    annotation (Placement(transformation(extent={{40,-30},{60,-10}})));
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle131(
    BCwall_east=true,
    BCwall_south=true,
    BCwall_west=true,
    posX=0.5,
    posZ=0.5,
    scalF={1,1,1},
    BCwall_roof=true,
    BCwall_north=false,
    BCwall_floor=false,
    posY=2.5)
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle231(
    scalF={1,1,1},
    posX=1.5,
    posZ=0.5,
    BCwall_east=true,
    BCwall_west=true,
    BCwall_roof=true,
    BCwall_north=false,
    BCwall_south=false,
    BCwall_floor=false,
    posY=2.5)
    annotation (Placement(transformation(extent={{-20,30},{0,50}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConnectionX_131_231(
    BCwall_east=true,
    BCwall_west=true,
    BCwall_roof=true)
    annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX zoneHeatConductionX_131_231
    annotation (Placement(transformation(extent={{-50,20},{-30,40}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConnectionX_231_331(
    BCwall_east=true,
    BCwall_west=true,
    BCwall_roof=true)
    annotation (Placement(transformation(extent={{10,30},{30,50}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX zoneHeatConductionX_231_331
    annotation (Placement(transformation(extent={{10,20},{30,40}})));
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle331(
    scalF={1,1,1},
    posX=2.5,
    posZ=0.5,
    BCwall_north=true,
    BCwall_west=true,
    BCwall_roof=true,
    BCwall_east=true,
    BCwall_south=false,
    BCwall_floor=false,
    posY=2.5)
    annotation (Placement(transformation(extent={{40,30},{60,50}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConnectionY_111_121(
    BCwall_north=false,
    BCwall_east=true,
    BCwall_south=true,
    BCwall_west=true,
    BCwall_floor=false,
    BCwall_roof=false,
    gravity=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-52})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConnectionY_211_221(
    BCwall_north=false,
    BCwall_east=true,
    BCwall_west=true,
    BCwall_floor=false,
    BCwall_roof=false,
    gravity=true,
    BCwall_south=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-52})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConnectionY_311_321(
    BCwall_east=true,
    BCwall_west=true,
    BCwall_floor=false,
    BCwall_roof=false,
    gravity=true,
    BCwall_south=false,
    BCwall_north=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-52})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConnectionY_111_131(
    BCwall_north=false,
    BCwall_east=true,
    BCwall_south=true,
    BCwall_west=true,
    BCwall_floor=false,
    BCwall_roof=false,
    gravity=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,8})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConnectionY_221_231(
    BCwall_north=false,
    BCwall_east=true,
    BCwall_west=true,
    BCwall_roof=false,
    gravity=true,
    BCwall_south=false,
    BCwall_floor=false) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,8})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionY flowConnectionY_321_331(
    BCwall_east=true,
    BCwall_west=true,
    BCwall_floor=false,
    BCwall_roof=false,
    gravity=true,
    BCwall_south=false,
    BCwall_north=true) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,8})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY zoneHeatConductionY_121_131
    annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,8})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY zoneHeatConductionY_111_121
    annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-52})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY zoneHeatConductionY_211_221
    annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-52})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY zoneHeatConductionY_311_321
    annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,-52})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY zoneHeatConductionY_221_231
    annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,8})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionY zoneHeatConductionY_321_331
    annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,8})));
equation
  // left border
  connect(bou[1].PortHeat, airEle111.heatPort_extern);
  connect(bou[1].PortF, airEle111.flowPort_X1);
  connect(bou[2].PortHeat, airEle121.heatPort_extern);
  connect(bou[2].PortF, airEle121.flowPort_X1);
  connect(bou[3].PortHeat, airEle131.heatPort_extern);
  connect(bou[3].PortF, airEle131.flowPort_X1);
  // Upper border
  connect(bou[4].PortHeat, airEle131.heatPort_extern);
  connect(bou[4].PortF, airEle131.flowPort_Y2);
  connect(bou[5].PortHeat, airEle231.heatPort_extern);
  connect(bou[5].PortF, airEle231.flowPort_Y2);
  connect(bou[6].PortHeat, airEle331.heatPort_extern);
  connect(bou[6].PortF, airEle331.flowPort_Y2);
  // Right border
  connect(bou[7].PortHeat, airEle331.heatPort_extern);
  connect(bou[7].PortF, airEle331.flowPort_X2);
  connect(bou[8].PortHeat, airEle321.heatPort_extern);
  connect(bou[8].PortF, airEle321.flowPort_X2);
  connect(bou[9].PortHeat, airEle311.heatPort_extern);
  connect(bou[9].PortF, airEle311.flowPort_X2);
  // Lower border
  connect(bou[10].PortHeat, airEle311.heatPort_extern);
  connect(bou[10].PortF, airEle311.flowPort_Y1);
  connect(bou[11].PortHeat, airEle211.heatPort_extern);
  connect(bou[11].PortF, airEle211.flowPort_Y1);
  connect(bou[12].PortHeat, airEle111.heatPort_extern);
  connect(bou[12].PortF, airEle111.flowPort_Y1);
  // Front side
  connect(bou[13].PortHeat, airEle111.heatPort_extern);
  connect(bou[13].PortF, airEle111.flowPort_Z1);
  connect(bou[14].PortHeat, airEle211.heatPort_extern);
  connect(bou[14].PortF, airEle211.flowPort_Z1);
  connect(bou[15].PortHeat, airEle311.heatPort_extern);
  connect(bou[15].PortF, airEle311.flowPort_Z1);

  connect(bou[16].PortHeat, airEle121.heatPort_extern);
  connect(bou[16].PortF, airEle121.flowPort_Z1);
  connect(bou[17].PortHeat, airEle221.heatPort_extern);
  connect(bou[17].PortF, airEle221.flowPort_Z1);
  connect(bou[18].PortHeat, airEle321.heatPort_extern);
  connect(bou[18].PortF, airEle321.flowPort_Z1);

  connect(bou[19].PortHeat, airEle131.heatPort_extern);
  connect(bou[19].PortF, airEle131.flowPort_Z1);
  connect(bou[20].PortHeat, airEle231.heatPort_extern);
  connect(bou[20].PortF, airEle231.flowPort_Z1);
  connect(bou[21].PortHeat, airEle331.heatPort_extern);
  connect(bou[21].PortF, airEle331.flowPort_Z1);

  // Back side
  connect(bou[22].PortHeat, airEle111.heatPort_extern);
  connect(bou[22].PortF, airEle111.flowPort_Z2);
  connect(bou[23].PortHeat, airEle211.heatPort_extern);
  connect(bou[23].PortF, airEle211.flowPort_Z2);
  connect(bou[24].PortHeat, airEle311.heatPort_extern);
  connect(bou[24].PortF, airEle311.flowPort_Z2);

  connect(bou[25].PortHeat, airEle121.heatPort_extern);
  connect(bou[25].PortF, airEle121.flowPort_Z2);
  connect(bou[26].PortHeat, airEle221.heatPort_extern);
  connect(bou[26].PortF, airEle221.flowPort_Z2);
  connect(bou[27].PortHeat, airEle321.heatPort_extern);
  connect(bou[27].PortF, airEle321.flowPort_Z2);

  connect(bou[28].PortHeat, airEle131.heatPort_extern);
  connect(bou[28].PortF, airEle131.flowPort_Z2);
  connect(bou[29].PortHeat, airEle231.heatPort_extern);
  connect(bou[29].PortF, airEle231.flowPort_Z2);
  connect(bou[30].PortHeat, airEle331.heatPort_extern);
  connect(bou[30].PortF, airEle331.flowPort_Z2);

  // Temperatures of all air elements
  airEle111.fluid.T = T[1];
  airEle211.fluid.T = T[2];
  airEle311.fluid.T = T[3];
  airEle121.fluid.T = T[4];
  airEle221.fluid.T = T[5];
  airEle321.fluid.T = T[6];
  airEle131.fluid.T = T[7];
  airEle231.fluid.T = T[8];
  airEle331.fluid.T = T[9];

  // Absolute moisture of all air elements
  airEle111.fluid.x = x[1];
  airEle211.fluid.x = x[2];
  airEle311.fluid.x = x[3];
  airEle121.fluid.x = x[4];
  airEle221.fluid.x = x[5];
  airEle321.fluid.x = x[6];
  airEle131.fluid.x = x[7];
  airEle231.fluid.x = x[8];
  airEle331.fluid.x = x[9];

  // Air velocity (magnitude) of all air elements
  airEle111.velMag = v[1];
  airEle211.velMag = v[2];
  airEle311.velMag = v[3];
  airEle121.velMag = v[4];
  airEle221.velMag = v[5];
  airEle321.velMag = v[6];
  airEle131.velMag = v[7];
  airEle231.velMag = v[8];
  airEle331.velMag = v[9];

  // Flow connections
  connect(flowConnectionX_111_112.port_2,airEle211.flowPort_X1)
    annotation (Line(points={{-35.4,-80},{-22,-80},{-22,-80.2},{-18,-80.2}}));
  connect(airEle211.flowPort_X2,flowConnectionX_211_311.port_1)
    annotation (Line(points={{-2,-80},{15.2,-80}}));
  connect(airEle111.flowPort_X2,flowConnectionX_111_112.port_1)
    annotation (Line(points={{-62,-80},{-44.8,-80}}, color={0,0,0}));
  connect(airEle111.heatPort_intern,zoneHeatConductionX_111_211.port_1)
    annotation (Line(points={{-70,-83},{-70,-90},{-44.4,-90}}, color={0,0,0}));
  connect(zoneHeatConductionX_111_211.port_2,airEle211.heatPort_intern)
    annotation (Line(points={{-35.6,-90},{-10,-90},{-10,-83}},color={0,0,0}));
  connect(airEle211.heatPort_intern,zoneHeatConductionX_211_311.port_1)
    annotation (Line(points={{-10,-83},{-9.15,-83},{-9.15,-90},{15.6,-90}},color={0,0,0}));
  connect(flowConnectionX_211_311.port_2,airEle311.flowPort_X1)
    annotation (Line(points={{24.6,-80},{34,-80},{34,-80.2},{42,-80.2}}));
  connect(zoneHeatConductionX_211_311.port_2,airEle311.heatPort_intern)
    annotation (Line(points={{24.4,-90},{50,-90},{50,-83}}, color={0,0,0}));
  connect(flowConnectionX_121_221.port_2,airEle221. flowPort_X1)
    annotation (Line(points={{-35.4,-20},{-32,-20},{-32,-20.2},{-18,-20.2}}));
  connect(airEle221.flowPort_X2,flowConnectionX_221_321.port_1)
    annotation (Line(points={{-2,-20},{6,-20},{12,-20},{15.2,-20}}));
  connect(airEle121.flowPort_X2,flowConnectionX_121_221.port_1) annotation (Line(
        points={{-62,-20},{-56,-20},{-48,-20},{-44.8,-20}},color={0,0,0}));
  connect(airEle121.heatPort_intern,zoneHeatConductionX_121_221.port_1)
    annotation (Line(points={{-70,-23},{-70.7,-23},{-70.7,-30},{-44.4,-30}},color={0,0,0}));
  connect(zoneHeatConductionX_121_221.port_2,airEle221. heatPort_intern)
    annotation (Line(points={{-35.6,-30},{-10,-30},{-10,-24},{-10,-23}},color={0,0,0}));
  connect(airEle221.heatPort_intern,zoneHeatConductionX_221_321.port_1)
    annotation (Line(points={{-10,-23},{-9.15,-23},{-9.15,-30},{15.6,-30}},color={0,0,0}));
  connect(flowConnectionX_221_321.port_2,airEle321. flowPort_X1)
    annotation (Line(points={{24.6,-20},{24,-20},{24,-20.2},{42,-20.2}}));
  connect(zoneHeatConductionX_221_321.port_2,airEle321. heatPort_intern)
    annotation (Line(points={{24.4,-30},{50,-30},{50,-23}},color={0,0,0}));
  connect(flowConnectionX_131_231.port_2,airEle231. flowPort_X1)
    annotation (Line(points={{-35.4,40},{-42,40},{-42,39.8},{-18,39.8}}));
  connect(airEle231.flowPort_X2,flowConnectionX_231_331.port_1)
    annotation (Line(points={{-2,40},{-2,40},{2,40},{15.2,40}}));
  connect(airEle131.flowPort_X2,flowConnectionX_131_231.port_1) annotation (Line(
        points={{-62,40},{-62,40},{-58,40},{-44.8,40}}, color={0,0,0}));
  connect(airEle131.heatPort_intern,zoneHeatConductionX_131_231.port_1)
    annotation (Line(points={{-70,37},{-70.7,37},{-70.7,30},{-44.4,30}}, color={0,0,0}));
  connect(zoneHeatConductionX_131_231.port_2,airEle231. heatPort_intern)
    annotation (Line(points={{-35.6,30},{-10,30},{-10,36},{-10,38},{-10,37}},color={0,0,0}));
  connect(airEle231.heatPort_intern,zoneHeatConductionX_231_331.port_1)
    annotation (Line(points={{-10,37},{-11.15,37},{-11.15,30},{15.6,30}},color={0,0,0}));
  connect(flowConnectionX_231_331.port_2,airEle331. flowPort_X1)
    annotation (Line(points={{24.6,40},{14,40},{14,39.8},{42,39.8}}));
  connect(zoneHeatConductionX_231_331.port_2,airEle331. heatPort_intern)
    annotation (Line(points={{24.4,30},{50,30},{50,37}}, color={0,0,0}));
  connect(flowConnectionY_111_121.port_1,airEle111. flowPort_Y2) annotation (Line(
        points={{-70,-56.8},{-70,-56.8},{-70,-72}}, color={0,0,0}));
  connect(flowConnectionY_111_121.port_2,airEle121. flowPort_Y1) annotation (Line(
        points={{-70,-47.4},{-70,-47.4},{-70,-28}},color={0,0,0}));
  connect(flowConnectionY_211_221.port_2,airEle221. flowPort_Y1)
    annotation (Line(points={{-10,-47.4},{-10,-47.4},{-10,-28}},color={0,0,0}));
  connect(flowConnectionY_211_221.port_1,airEle211. flowPort_Y2)
    annotation (Line(points={{-10,-56.8},{-10,-72}},color={0,0,0}));
  connect(flowConnectionY_311_321.port_2,airEle321. flowPort_Y1)
    annotation (Line(points={{50,-47.4},{50,-47.4},{50,-28}},color={0,0,0}));
  connect(flowConnectionY_311_321.port_1,airEle311. flowPort_Y2)
    annotation (Line(points={{50,-56.8},{50,-72}}, color={0,0,0}));
  connect(flowConnectionY_111_131.port_2,airEle131. flowPort_Y1)
    annotation (Line(points={{-70,12.6},{-70,12.6},{-70,32}}, color={0,0,0}));
  connect(flowConnectionY_111_131.port_1,airEle121. flowPort_Y2)
    annotation (Line(points={{-70,3.2},{-70,3.2},{-70,-12}}, color={0,0,0}));
  connect(flowConnectionY_221_231.port_2,airEle231. flowPort_Y1)
    annotation (Line(points={{-10,12.6},{-10,22.3},{-10,32}},color={0,0,0}));
  connect(flowConnectionY_221_231.port_1,airEle221. flowPort_Y2)
    annotation (Line(points={{-10,3.2},{-10,-12}},
                                              color={0,0,0}));
  connect(flowConnectionY_321_331.port_2,airEle331. flowPort_Y1)
    annotation (Line(points={{50,12.6},{50,32}}, color={0,0,0}));
  connect(flowConnectionY_321_331.port_1,airEle321. flowPort_Y2)
    annotation (Line(points={{50,3.2},{50,-12}},color={0,0,0}));
  connect(airEle131.heatPort_intern,zoneHeatConductionY_121_131.port_2)
    annotation (Line(points={{-70,37},{-64,37},{-64,36},{-60,36},{-60,12.4}},
        color={191,0,0}));
  connect(airEle121.heatPort_intern,zoneHeatConductionY_121_131.port_1)
    annotation (Line(points={{-70,-23},{-64,-23},{-64,-22},{-60,-22},{-60,3.6}},
        color={191,0,0}));
  connect(airEle121.heatPort_intern,zoneHeatConductionY_111_121.port_2)
    annotation (Line(points={{-70,-23},{-66,-23},{-66,-24},{-60,-24},{-60,-47.6}},
        color={191,0,0}));
  connect(airEle111.heatPort_intern,zoneHeatConductionY_111_121.port_1)
    annotation (Line(points={{-70,-83},{-64,-83},{-64,-82},{-60,-82},{-60,-56.4}},
        color={191,0,0}));
  connect(airEle221.heatPort_intern,zoneHeatConductionY_211_221.port_2)
    annotation (Line(points={{-10,-23},{-4,-23},{-4,-22},{0,-22},{0,-47.6}},color={191,
          0,0}));
  connect(airEle211.heatPort_intern,zoneHeatConductionY_211_221.port_1)
    annotation (Line(points={{-10,-83},{-4,-83},{-4,-84},{0,-84},{0,-56.4}},
        color={191,0,0}));
  connect(airEle321.heatPort_intern,zoneHeatConductionY_311_321.port_2)
    annotation (Line(points={{50,-23},{56,-23},{56,-22},{60,-22},{60,-47.6}},
                                                                          color=
         {191,0,0}));
  connect(airEle311.heatPort_intern,zoneHeatConductionY_311_321.port_1)
    annotation (Line(points={{50,-83},{56,-83},{56,-82},{60,-82},{60,-56.4}},
        color={191,0,0}));
  connect(airEle221.heatPort_intern,zoneHeatConductionY_221_231.port_1)
    annotation (Line(points={{-10,-23},{-4,-23},{-4,-22},{0,-22},{0,3.6}},
                                                                      color={191,
          0,0}));
  connect(airEle231.heatPort_intern,zoneHeatConductionY_221_231.port_2)
    annotation (Line(points={{-10,37},{-4,37},{-4,36},{0,36},{0,12.4}},
                                                                      color={191,
          0,0}));
  connect(airEle331.heatPort_intern,zoneHeatConductionY_321_331.port_2)
    annotation (Line(points={{50,37},{56,37},{56,38},{60,38},{60,12.4}}, color={
          191,0,0}));
  connect(airEle321.heatPort_intern,zoneHeatConductionY_321_331.port_1)
    annotation (Line(points={{50,-23},{56,-23},{56,-22},{60,-22},{60,3.6}},
                                                                         color={
          191,0,0}));
  annotation (Diagram(coordinateSystem(initialScale=0.1)), Icon(
        coordinateSystem(initialScale=0.1)));
end Airvolume3D3x3x1;
