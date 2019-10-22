within BuildingSystems.Buildings.Examples;
model BuildingThermal4Zones1DAirpaths
  "1D-Thermal building model with 4 zones and interzonal air paths"
  extends Modelica.Icons.Example;

  package Medium = BuildingSystems.Media.Air;

  model Building
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones = 4,
    surfacesToAmbience(nSurfaces=12),
    convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
    useAirPaths = false);

  record Construction1
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
    nLayers=2,
    thickness={0.2,0.1},
    material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
              BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()});
  end Construction1;

  record Construction2
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
    nLayers=1,
    thickness={0.1},
    material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()});
  end Construction2;

  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone1(
    V=3.0*3.0*3.0,
    height=3.0,
    prescribedAirchange=false,
    heightAirpath={0.5,1.5,0.5,1.5},
    convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free,
    nConstructions=5,
    nAirpaths=4)
    annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone2(
    V=3.0*3.0*3.0,
    height=3.0,
    prescribedAirchange=false,
    heightAirpath={0.5,1.5,0.5,1.5},
    convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free,
    nConstructions=5,
    nAirpaths=4)
    annotation (Placement(transformation(extent={{30,30},{50,50}})));
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone3(
    V=3.0*3.0*3.0,
    height=3.0,
    prescribedAirchange=false,
    heightAirpath={0.5,1.5,0.5,1.5},
    convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free,
    nConstructions=5,
    nAirpaths=4)
    annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone4(
    V=3.0*3.0*3.0,
    height=3.0,
    prescribedAirchange=false,
    heightAirpath={0.5,1.5,0.5,1.5},
    convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free,
    nConstructions=5,
    nAirpaths=4)
    annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall1(
    redeclare Construction1 constructionData,
    height=3.0,
    width=3.0,
    angleDegAzi=90.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{-50,30},{-70,50}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall2(
    redeclare Construction1 constructionData,
    height=3.0,
    width=3.0,
    AInnSur=window2.width*window2.height,
    angleDegAzi=90.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{-50,-30},{-70,-10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall3(
    redeclare Construction2 constructionData,
    height=3.0,
    width=3.0)
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall4(
    redeclare Construction2 constructionData,
    height=3.0,
    width=3.0)
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall5(
    redeclare Construction2 constructionData,
    height=3.0,
    width=3.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{50,30},{70,50}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall6(
    redeclare Construction1 constructionData,
    height=3.0,
    width=3.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{50,-30},{70,-10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall7(
    redeclare Construction1 constructionData,
    height=3.0,
    width=3.0,
    AInnSur=window3.width*window3.height,
    angleDegAzi=180.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-52,60})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall8(
    redeclare Construction1 constructionData,
    height=3.0,
    width=3.0,
    AInnSur=window4.width*window4.height,
    angleDegAzi=180.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={28,60})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall9(
    redeclare Construction2 constructionData,
    height=3.0,
    width=3.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-40,10})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall10(
    redeclare Construction2 constructionData,
    height=3.0,
    width=3.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={40,12})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall11(
    redeclare Construction1 constructionData,
    height=3.0,
    width=3.0,
    AInnSur=window1.width*window1.height,
    angleDegAzi=0.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={-52,-42})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall12(
    redeclare Construction1 constructionData,
    height=3.0,
    width=3.0,
    angleDegAzi=0.0,
    angleDegTil=90.0)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={28,-40})));
  BuildingSystems.Buildings.Constructions.Windows.Window window1(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={-28,-42})));
  BuildingSystems.Buildings.Constructions.Windows.Window window2(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={52,-40})));
  BuildingSystems.Buildings.Constructions.Windows.Window window3(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-28,60})));
  BuildingSystems.Buildings.Constructions.Windows.Window window4(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={52,60})));
  BuildingSystems.Airflow.Multizone.Orifice airpath1(
    redeclare package Medium = Medium,
    A=0.01)
    annotation (Placement(transformation(extent={{-2,26},{2,30}})));
  BuildingSystems.Airflow.Multizone.Orifice airpath2(
    redeclare package Medium = Medium,
    A=0.01)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=90,origin={22,12})));
  BuildingSystems.Airflow.Multizone.Orifice airpath3(
    redeclare package Medium = Medium,
    A=0.01)
    annotation (Placement(transformation(extent={{-2,-4},{2,0}})));
  BuildingSystems.Airflow.Multizone.Orifice airpath4(
    redeclare package Medium = Medium,
    A=0.01)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=90,origin={-26,10})));
  BuildingSystems.Airflow.Multizone.Orifice airpath5(
    redeclare package Medium = Medium,
    A=0.01)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=90,origin={-20,10})));
  BuildingSystems.Airflow.Multizone.Orifice airpath6(
    redeclare package Medium = Medium,
    A=0.01)
    annotation (Placement(transformation(extent={{-2,2},{2,6}})));
  BuildingSystems.Airflow.Multizone.Orifice airpath7(
    redeclare package Medium = Medium,
    A=0.01)
    annotation (Placement(transformation(extent={{-2,20},{2,24}})));
  BuildingSystems.Airflow.Multizone.Orifice airpath8(
    redeclare package Medium = Medium,
    A=0.01)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=90,origin={16,12})));
equation
  connect(zone1.T_setHeating, T_setHeating[1]) annotation (Line(
     points={{-51,47},{-51,87.5},{180,87.5}},
     color={255,0,0},
     smooth=Smooth.None,
     pattern=LinePattern.Dot));
  connect(zone1.T_setCooling, T_setCooling[1]) annotation (Line(
     points={{-51,45},{-51,67.5},{180,67.5}},
     color={255,0,0},
     smooth=Smooth.None,
     pattern=LinePattern.Dot));
  connect(zone2.T_setHeating, T_setHeating[2]) annotation (Line(
     points={{29,47},{29,82.5},{180,82.5}},
     color={255,0,0},
     smooth=Smooth.None,
     pattern=LinePattern.Dot));
  connect(T_setCooling[2], zone2.T_setCooling) annotation (Line(
     points={{180,62.5},{29,62.5},{29,45}},
     color={255,0,0},
     smooth=Smooth.None,
     pattern=LinePattern.Dot));
  connect(zone3.T_setHeating, T_setHeating[3]) annotation (Line(
     points={{-51,-13},{-51,-60},{80,-60},{80,77.5},{180,77.5}},
     color={255,0,0},
     smooth=Smooth.None,
     pattern=LinePattern.Dot));
  connect(zone3.T_setCooling, T_setCooling[3]) annotation (Line(
     points={{-51,-15},{-51,-68},{84,-68},{84,57.5},{180,57.5}},
     color={255,0,0},
     smooth=Smooth.None,
     pattern=LinePattern.Dot));
  connect(zone4.T_setHeating, T_setHeating[4]) annotation (Line(
     points={{29,-13},{29,-6},{76,-6},{76,72.5},{180,72.5}},
     color={255,0,0},
     smooth=Smooth.None,
     pattern=LinePattern.Dot));
  connect(zone4.T_setCooling, T_setCooling[4]) annotation (Line(
     points={{29,-15},{29,-4},{72,-4},{72,62},{180,62},{180,52.5}},
     color={255,0,0},
     smooth=Smooth.None,
     pattern=LinePattern.Dot));
  connect(wall1.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[1]) annotation (Line(
     points={{-62,40},{-76,40},{-76,0},{-170.8,0}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(wall7.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[2]) annotation (Line(
     points={{-52,62},{-52,68},{-76,68},{-76,0},{-170.8,0}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(window3.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[3]) annotation (Line(
     points={{-28,62},{-28,68},{-76,68},{-76,3.55271e-15},{-170.8,3.55271e-15}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(wall8.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[4]) annotation (Line(
     points={{28,62},{28,68},{-76,68},{-76,3.55271e-15},{-170.8,3.55271e-15}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(window4.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[5]) annotation (Line(
     points={{52,62},{52,68},{-76,68},{-76,3.55271e-15},{-170.8,3.55271e-15}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(wall5.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[6]) annotation (Line(
     points={{62,40},{70,40},{70,78},{-76,78},{-76,3.55271e-15},{-170.8,3.55271e-15}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(wall2.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[7]) annotation (Line(
     points={{-62,-20},{-76,-20},{-76,3.55271e-15},{-170.8,3.55271e-15}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(wall11.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[8]) annotation (Line(
     points={{-52,-44},{-52,-50},{-76,-50},{-76,3.55271e-15},{-170.8,3.55271e-15}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(window1.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[9]) annotation (Line(
     points={{-28,-44},{-28,-50},{-76,-50},{-76,3.55271e-15},{-170.8,3.55271e-15}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(wall12.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[10]) annotation (Line(
     points={{28,-42},{28,-50},{-76,-50},{-76,3.55271e-15},{-170.8,3.55271e-15}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(window2.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[11]) annotation (Line(
     points={{52,-42},{52,-50},{-76,-50},{-76,3.55271e-15},{-170.8,3.55271e-15}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(wall6.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[12]) annotation (Line(
     points={{62,-20},{70,-20},{70,-50},{-76,-50},{-76,3.55271e-15},{-170.8,3.55271e-15}},
     color={0,0,0},
     pattern=LinePattern.Solid,
     smooth=Smooth.None));
  connect(zone1.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
    points={{-29,45},{-29,18},{-80,18},{-80,-114.5}},
    color={0,0,127},
    smooth=Smooth.None,
    pattern=LinePattern.Dot));
  connect(zone2.Q_flow_cooling, Q_flow_cooling[2]) annotation (Line(
    points={{51,45},{51,8},{-80,8},{-80,-119.5}},
    color={0,0,127},
    smooth=Smooth.None,
    pattern=LinePattern.Dot));
  connect(zone3.Q_flow_cooling, Q_flow_cooling[3]) annotation (Line(
    points={{-29,-15},{-29,-80},{-80,-80},{-80,-124.5}},
    color={0,0,127},
    smooth=Smooth.None,
    pattern=LinePattern.Dot));
  connect(zone4.Q_flow_cooling, Q_flow_cooling[4]) annotation (Line(
    points={{51,-15},{51,-80},{-80,-80},{-80,-129.5}},
    color={0,0,127},
    smooth=Smooth.None,
    pattern=LinePattern.Dot));
  connect(zone1.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
    points={{-29,47},{-29,2},{-10,2},{-10,-76},{80,-76},{80,-114.5}},
    color={0,0,127},
    smooth=Smooth.None,
    pattern=LinePattern.Dot));
  connect(zone2.Q_flow_heating, Q_flow_heating[2]) annotation (Line(
      points={{51,47},{51,0},{80,0},{80,-119.5}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(zone3.Q_flow_heating, Q_flow_heating[3]) annotation (Line(
      points={{-29,-13},{-29,-76},{80,-76},{80,-124.5}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(zone4.Q_flow_heating, Q_flow_heating[4]) annotation (Line(
      points={{51,-13},{51,-76},{80,-76},{80,-129.5}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));

  connect(wall2.toSurfacePort_1, zone3.toConstructionPorts[1]) annotation (Line(
        points={{-58,-20},{-50,-20},{-50,-21.6},{-40,-21.6}}, color={0,0,0}));
  connect(zone3.toConstructionPorts[2], wall4.toSurfacePort_1) annotation (Line(
        points={{-40,-20.8},{-22,-20.8},{-22,-20},{-2,-20}}, color={127,0,0}));
  connect(wall4.toSurfacePort_2, zone4.toConstructionPorts[1]) annotation (Line(
        points={{2,-20},{22,-20},{22,-21.6},{40,-21.6}}, color={0,0,0}));
  connect(zone4.toConstructionPorts[2], wall6.toSurfacePort_1) annotation (Line(
        points={{40,-20.8},{50,-20.8},{50,-20},{58,-20}}, color={127,0,0}));
  connect(zone4.toConstructionPorts[3], wall10.toSurfacePort_1)
    annotation (Line(points={{40,-20},{40,10}}, color={127,0,0}));
  connect(wall10.toSurfacePort_2, zone2.toConstructionPorts[1])
    annotation (Line(points={{40,14},{40,38.4}}, color={0,0,0}));
  connect(zone2.toConstructionPorts[2], wall5.toSurfacePort_1) annotation (Line(
        points={{40,39.2},{50,39.2},{50,40},{58,40}}, color={127,0,0}));
  connect(wall3.toSurfacePort_2, zone2.toConstructionPorts[3])
    annotation (Line(points={{2,40},{22,40},{22,40},{40,40}}, color={0,0,0}));
  connect(zone1.toConstructionPorts[1], wall3.toSurfacePort_1) annotation (Line(
        points={{-40,38.4},{-22,38.4},{-22,40},{-2,40}},       color={127,0,0}));
  connect(wall1.toSurfacePort_1, zone1.toConstructionPorts[2]) annotation (Line(
        points={{-58,40},{-50,40},{-50,39.2},{-40,39.2}},color={0,0,0}));
  connect(window3.toSurfacePort_1, zone1.toConstructionPorts[3]) annotation (
      Line(points={{-28,58},{-28,54},{-40,54},{-40,40}},      color={0,0,0}));
  connect(wall7.toSurfacePort_1, zone1.toConstructionPorts[4]) annotation (Line(
        points={{-52,58},{-52,54},{-40,54},{-40,40.8}},    color={0,0,0}));
  connect(zone1.toConstructionPorts[5], wall9.toSurfacePort_2)
    annotation (Line(points={{-40,41.6},{-40,12}},color={127,0,0}));
  connect(wall9.toSurfacePort_1, zone3.toConstructionPorts[3])
    annotation (Line(points={{-40,8},{-40,-20}}, color={0,0,0}));
  connect(wall11.toSurfacePort_1, zone3.toConstructionPorts[4]) annotation (
      Line(points={{-52,-40},{-52,-36},{-40,-36},{-40,-19.2}}, color={0,0,0}));
  connect(window1.toSurfacePort_1, zone3.toConstructionPorts[5]) annotation (
      Line(points={{-28,-40},{-28,-36},{-40,-36},{-40,-18.4}}, color={0,0,0}));
  connect(wall12.toSurfacePort_1, zone4.toConstructionPorts[4]) annotation (
      Line(points={{28,-38},{28,-34},{40,-34},{40,-19.2}}, color={0,0,0}));
  connect(window2.toSurfacePort_1, zone4.toConstructionPorts[5]) annotation (
      Line(points={{52,-38},{52,-34},{40,-34},{40,-18.4}}, color={0,0,0}));
  connect(wall8.toSurfacePort_1, zone2.toConstructionPorts[4]) annotation (Line(
        points={{28,58},{28,54},{40,54},{40,40.8}}, color={0,0,0}));
  connect(window4.toSurfacePort_1, zone2.toConstructionPorts[5]) annotation (
      Line(points={{52,58},{52,54},{40,54},{40,41.6}}, color={0,0,0}));

  connect(zone1.airpathPorts[1], airpath1.port_a) annotation (Line(points={{-43,
          51},{-43,52},{-12,52},{-12,28},{-2,28}}, color={0,127,255}));
  connect(airpath1.port_b, zone2.airpathPorts[1]) annotation (Line(points={{2,28},
          {10,28},{10,52},{37,52},{37,51}}, color={0,127,255}));
  connect(zone1.airpathPorts[2], airpath7.port_a) annotation (Line(points={{-45,
          51},{-12,51},{-12,22},{-2,22}}, color={0,127,255}));
  connect(airpath7.port_b, zone2.airpathPorts[2]) annotation (Line(points={{2,22},
          {10,22},{10,51},{35,51}}, color={0,127,255}));
  connect(zone3.airpathPorts[1], airpath4.port_a)
    annotation (Line(points={{-43,-9},{-26,-9},{-26,8}}, color={0,127,255}));
  connect(airpath4.port_b, zone1.airpathPorts[3])
    annotation (Line(points={{-26,12},{-26,51},{-47,51}}, color={0,127,255}));
  connect(zone3.airpathPorts[2], airpath5.port_a)
    annotation (Line(points={{-45,-9},{-20,-9},{-20,8}}, color={0,127,255}));
  connect(airpath5.port_b, zone1.airpathPorts[4])
    annotation (Line(points={{-20,12},{-20,51},{-49,51}}, color={0,127,255}));
  connect(zone4.airpathPorts[1], airpath2.port_a) annotation (Line(points={{37,-9},
          {30,-9},{30,-10},{22,-10},{22,10}}, color={0,127,255}));
  connect(airpath2.port_b, zone2.airpathPorts[3]) annotation (Line(points={{22,14},
          {22,52},{33,52},{33,51}}, color={0,127,255}));
  connect(zone4.airpathPorts[2], airpath8.port_a)
    annotation (Line(points={{35,-9},{16,-9},{16,10}}, color={0,127,255}));
  connect(airpath8.port_b, zone2.airpathPorts[4])
    annotation (Line(points={{16,14},{16,51},{31,51}}, color={0,127,255}));
  connect(zone3.airpathPorts[3], airpath3.port_a) annotation (Line(points={{-47,
          -9},{-30,-9},{-30,-10},{-12,-10},{-12,-2},{-2,-2}}, color={0,127,255}));
  connect(airpath3.port_b, zone4.airpathPorts[3]) annotation (Line(points={{2,-2},
          {10,-2},{10,-9},{33,-9}}, color={0,127,255}));
  connect(zone3.airpathPorts[4], airpath6.port_a) annotation (Line(points={{-49,
          -9},{-28,-9},{-28,-10},{-12,-10},{-12,4},{-2,4}}, color={0,127,255}));
  connect(airpath6.port_b, zone4.airpathPorts[4]) annotation (Line(points={{2,4},
          {10,4},{10,-10},{31,-10},{31,-9}}, color={0,127,255}));
  end Building;

  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces=building.nSurfacesAmbience,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Building building(
    nZones = 4,
    prescribedAirchange= false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant TSetHeatingZone1(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,14})));
  Modelica.Blocks.Sources.Constant TSetHeatingZone2(
    k=273.15 + 20.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={24,18})));
  Modelica.Blocks.Sources.Constant TSetHeatingZone3(
    k=273.15 + 21.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={30,22})));
  Modelica.Blocks.Sources.Constant TSetHeatingZone4(
    k=273.15 + 21.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={36,26})));
  Modelica.Blocks.Sources.Constant TSetCoolingZone1(
    k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,4})));
  Modelica.Blocks.Sources.Constant TSetCoolingZone2(
    k=273.15 + 24.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={24,-2})));
  Modelica.Blocks.Sources.Constant TSetCoolingZone3(
    k=273.15 + 25.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={30,-8})));
  Modelica.Blocks.Sources.Constant TSetCoolingZone4(
    k=273.15 + 25.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={36,-14})));
equation
   connect(ambience.toSurfacePorts, building.toAmbienceSurfacesPorts) annotation (Line(
    points={{-22,4},{-20,4},{-20,8},{-20,11.3333},{-20,4},{-9,4}},
    color={0,255,0},
    smooth=Smooth.None));
  connect(ambience.toAirPorts, building.toAmbienceAirPorts) annotation (Line(
    points={{-22,-4},{-16,-4},{-16,-4},{-9,-4}},
    color={85,170,255},
    smooth=Smooth.None));
  connect(TSetHeatingZone1.y, building.T_setHeating[1]) annotation (Line(
      points={{15.8,14},{14,14},{14,8.75},{9.8,8.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHeatingZone2.y, building.T_setHeating[2]) annotation (Line(
      points={{21.8,18},{12,18},{12,8.25},{9.8,8.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHeatingZone3.y, building.T_setHeating[3]) annotation (Line(
      points={{27.8,22},{9.8,22},{9.8,7.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHeatingZone4.y, building.T_setHeating[4]) annotation (Line(
      points={{33.8,26},{9.8,26},{9.8,7.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoolingZone1.y, building.T_setCooling[1]) annotation (Line(
      points={{15.8,4},{14,4},{14,6.75},{9.8,6.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoolingZone2.y, building.T_setCooling[2]) annotation (Line(
      points={{21.8,-2},{14,-2},{14,6.25},{9.8,6.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoolingZone3.y, building.T_setCooling[3]) annotation (Line(
      points={{27.8,-8},{14,-8},{14,5.75},{9.8,5.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.T_setCooling[4], TSetCoolingZone4.y) annotation (Line(
      points={{9.8,5.25},{14,5.25},{14,-14},{33.8,-14}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=86400),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/BuildingThermal4Zones1DAirpaths.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
    textString="1D-Thermal building model with 4 zones")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a thermal building model with 4 zones and interzonal air paths, based on 1D-discretized building elements.
</p>
</html>",
revisions="<html>
<ul>
<li>
September 20, 2018, by Christoph Nytsch-Geusen:<br/>
New model for air paths from IBPSA 1 library used.
</li>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end BuildingThermal4Zones1DAirpaths;
