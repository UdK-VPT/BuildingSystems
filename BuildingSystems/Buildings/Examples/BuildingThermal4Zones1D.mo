within BuildingSystems.Buildings.Examples;
model BuildingThermal4Zones1D
  "1D-Thermal building model with 4 zones under real weather data"
  extends Modelica.Icons.Example;

  model Building
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones = 4,
    surfacesToAmbient(nSurfaces=12),
    convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
    useAirPathes = false);

    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction construction1(
      nLayers=2,
      thickness={0.2,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()})
      annotation(Placement(transformation(extent={{-80,80},{-60,100}})));
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction construction2(
      nLayers=1,thickness={0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()})
      annotation(Placement(transformation(extent={{-58,80},{-38,100}})));

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone1(
      V=3.0*3.0*3.0,
      height=3.0,
      nAirpathes3=2,
      nAirpathes4=2,
      nConstructions1=1,
      nConstructions2=2,
      nConstructions4=1,
      nConstructions3=1,
      prescribedAirchange=false,
      heightAirpath={0.5,1.5,0.5,1.5},
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free)
      annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone2(
      V=3.0*3.0*3.0,
      height=3.0,
      nAirpathes4=2,
      nConstructions2=2,
      nConstructions3=1,
      nConstructions4=1,
      nConstructions1=1,
      prescribedAirchange=false,
      nAirpathes1=2,
      heightAirpath={0.5,1.5,0.5,1.5},
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free)
      annotation (Placement(transformation(extent={{30,30},{50,50}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone3(
      V=3.0*3.0*3.0,
      height=3.0,
      nAirpathes3=2,
      nAirpathes2=2,
      nConstructions1=1,
      nConstructions4=2,
      nConstructions2=1,
      nConstructions3=1,
      prescribedAirchange=false,
      heightAirpath={0.5,1.5,0.5,1.5},
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free)
      annotation (Placement(transformation(extent={{-50,-30},{-30,-10}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone4(
      V=3.0*3.0*3.0,
      height=3.0,
      nAirpathes1=2,
      nAirpathes2=2,
      nConstructions3=1,
      nConstructions4=2,
      nConstructions2=1,
      nConstructions1=1,
      prescribedAirchange=false,
      heightAirpath={0.5,1.5,0.5,1.5},
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free)
      annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall1(
      constructionData=construction1,
      height=3.0,
      width=3.0,
      angleDegAzi=90.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-50,30},{-70,50}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall2(
      constructionData=construction1,
      height=3.0,
      width=3.0,
      nInnSur = 1,
      AInnSur={window2.A},
      angleDegAzi=90.0,angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-50,-30},{-70,-10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall3(
      constructionData=construction2,
      height=3.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,30},{10,50}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall4(
      constructionData=construction2,
      height=3.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall5(
      constructionData=construction1,
      height=3.0,
      width=3.0,
      angleDegAzi=-90.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{50,30},{70,50}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall6(
      constructionData=construction1,
      height=3.0,
      width=3.0,
      angleDegAzi=-90.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{50,-30},{70,-10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall7(
      constructionData=construction1,
      height=3.0,
      width=3.0,
      nInnSur = 1,
      AInnSur={window3.A},
      angleDegAzi=180.0,angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-52,60})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall8(
      constructionData=construction1,
      height=3.0,
      width=3.0,
      nInnSur = 1,
      AInnSur={window4.A},
      angleDegAzi=180.0,angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={28,60})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall9(
      constructionData=construction2,
      height=3.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-40,10})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall10(
      constructionData=construction2,
      height=3.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={40,12})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall11(
      constructionData=construction1,
      height=3.0,
      width=3.0,
      nInnSur = 1,
      AInnSur={window1.A},
      angleDegAzi=0.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={-52,-42})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall12(
      constructionData=construction1,
      height=3.0,
      width=3.0,
      angleDegAzi=0.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={28,-40})));
    BuildingSystems.Buildings.Constructions.Windows.Window window1(
      height=1.0,
      width=1.0,
      angleDegAzi=0.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={-28,-42})));
    BuildingSystems.Buildings.Constructions.Windows.Window window2(
      height=1.0,
      width=1.0,
      angleDegAzi=0.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={52,-40})));
    BuildingSystems.Buildings.Constructions.Windows.Window window3(
      height=1.0,
      width=1.0,
      angleDegAzi=180.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-28,60})));
    BuildingSystems.Buildings.Constructions.Windows.Window window4(
      height=1.0,
      width=1.0,
      angleDegAzi=180.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={52,60})));
    BuildingSystems.Buildings.Airpathes.AirpathConstant airpath1(
      mConstant=0.5,
      kConstant=0.1)
      annotation (Placement(transformation(extent={{-10,16},{10,36}})));
    BuildingSystems.Buildings.Airpathes.AirpathConstant airpath2(
      mConstant=0.5,
      kConstant=0.1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={26,12})));
    BuildingSystems.Buildings.Airpathes.AirpathConstant airpath3(
      mConstant=0.5,
      kConstant=0.1)
      annotation (Placement(transformation(extent={{-10,-16},{10,4}})));
    BuildingSystems.Buildings.Airpathes.AirpathConstant airpath4(
      mConstant=0.5,
      kConstant=0.1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-28,10})));
    BuildingSystems.Buildings.Airpathes.AirpathConstant airpath5(
      mConstant=0.5,
      kConstant=0.1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-22,10})));
    BuildingSystems.Buildings.Airpathes.AirpathConstant airpath6(
      mConstant=0.5,
      kConstant=0.1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    BuildingSystems.Buildings.Airpathes.AirpathConstant airpath7(
      mConstant=0.5,
      kConstant=0.1)
      annotation (Placement(transformation(extent={{-10,10},{10,30}})));
    BuildingSystems.Buildings.Airpathes.AirpathConstant airpath8(
      mConstant=0.5,
      kConstant=0.1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,12})));
  equation
    connect(zone1.airpathPorts3[1], airpath1.airpathPort_1) annotation (Line(
       points={{-29,42},{-20,42},{-20,26},{-4,26}},
       color={0,0,255},
       smooth=Smooth.None));
    connect(zone3.airpathPorts3[1], airpath3.airpathPort_1) annotation (Line(
       points={{-29,-18},{-16,-18},{-16,-6},{-4,-6}},
       color={0,0,255},
       smooth=Smooth.None));
    connect(airpath3.airpathPort_2, zone4.airpathPorts1[1]) annotation (Line(
       points={{4,-6},{14,-6},{14,-26},{29,-26}},
       color={0,0,255},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(zone2.airpathPorts4[1], airpath2.airpathPort_2) annotation (Line(
       points={{44,27},{44,22},{26,22},{26,16}},
       color={0,0,255},
       smooth=Smooth.None));
    connect(airpath2.airpathPort_1, zone4.airpathPorts2[1]) annotation (Line(
       points={{26,8},{26,-2},{36,-2},{36,-11}},
       color={0,0,255},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(zone1.airpathPorts4[1], airpath4.airpathPort_2) annotation (Line(
       points={{-36,27},{-36,24},{-28,24},{-28,14}},
       color={0,0,255},
       smooth=Smooth.None));
    connect(airpath4.airpathPort_1, zone3.airpathPorts2[1]) annotation (Line(
       points={{-28,6},{-28,-6},{-44,-6},{-44,-11}},
       color={0,0,255},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(zone1.T_setHeating, T_setHeating[1]) annotation (Line(
       points={{-35,33},{-35,72.5},{100,72.5}},
       color={255,0,0},
       smooth=Smooth.None,
       pattern=LinePattern.Dot));
    connect(zone1.T_setCooling, T_setCooling[1]) annotation (Line(
       points={{-33,33},{-33,52.5},{100,52.5}},
       color={255,0,0},
       smooth=Smooth.None,
       pattern=LinePattern.Dot));
    connect(zone2.T_setHeating, T_setHeating[2]) annotation (Line(
       points={{45,33},{45,77.5},{100,77.5}},
       color={255,0,0},
       smooth=Smooth.None,
       pattern=LinePattern.Dot));
    connect(T_setCooling[2], zone2.T_setCooling) annotation (Line(
       points={{100,57.5},{47,57.5},{47,33}},
       color={255,0,0},
       smooth=Smooth.None,
       pattern=LinePattern.Dot));
    connect(zone3.T_setHeating, T_setHeating[3]) annotation (Line(
       points={{-35,-27},{-35,-60},{80,-60},{80,82.5},{100,82.5}},
       color={255,0,0},
       smooth=Smooth.None,
       pattern=LinePattern.Dot));
    connect(zone3.T_setCooling, T_setCooling[3]) annotation (Line(
       points={{-33,-27},{-33,-68},{84,-68},{84,62.5},{100,62.5}},
       color={255,0,0},
       smooth=Smooth.None,
       pattern=LinePattern.Dot));
    connect(zone4.T_setHeating, T_setHeating[4]) annotation (Line(
       points={{45,-27},{45,-6},{76,-6},{76,87.5},{100,87.5}},
       color={255,0,0},
       smooth=Smooth.None,
       pattern=LinePattern.Dot));
    connect(zone4.T_setCooling, T_setCooling[4]) annotation (Line(
       points={{47,-27},{47,-4},{72,-4},{72,62},{100,62},{100,67.5}},
       color={255,0,0},
       smooth=Smooth.None,
       pattern=LinePattern.Dot));
    connect(wall2.toSurfacePort_1, zone3.toConstructionPorts1[1]) annotation (
       Line(
       points={{-58,-20},{-56,-20},{-56,-16},{-51,-16}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall1.toSurfacePort_1, zone1.toConstructionPorts1[1]) annotation (
       Line(
       points={{-58,40},{-56,40},{-56,44},{-51,44}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall7.toSurfacePort_1, zone1.toConstructionPorts2[1]) annotation (
       Line(
       points={{-52,58},{-52,56},{-36,56},{-36,49}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(window3.toSurfacePort_1, zone1.toConstructionPorts2[2]) annotation (
       Line(
       points={{-28,58.2},{-28,56},{-36,56},{-36,53}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall8.toSurfacePort_1, zone2.toConstructionPorts2[1]) annotation (
       Line(
       points={{28,58},{28,54},{44,54},{44,49}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(window4.toSurfacePort_1, zone2.toConstructionPorts2[2]) annotation (
       Line(
       points={{52,58.2},{52,54},{44,54},{44,53}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall5.toSurfacePort_1, zone2.toConstructionPorts3[1]) annotation (
       Line(
       points={{58,40},{54,40},{54,36},{51,36}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall6.toSurfacePort_1, zone4.toConstructionPorts3[1]) annotation (
       Line(
       points={{58,-20},{56,-20},{56,-24},{51,-24}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(window2.toSurfacePort_1, zone4.toConstructionPorts4[1]) annotation (
       Line(
       points={{52,-38.2},{52,-36},{36,-36},{36,-33}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall12.toSurfacePort_1, zone4.toConstructionPorts4[2]) annotation (
       Line(
       points={{28,-38},{28,-36},{36,-36},{36,-29}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(window1.toSurfacePort_1, zone3.toConstructionPorts4[1]) annotation (
       Line(
       points={{-28,-40.2},{-28,-36},{-44,-36},{-44,-33}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall11.toSurfacePort_1, zone3.toConstructionPorts4[2]) annotation (
       Line(
       points={{-52,-40},{-52,-36},{-44,-36},{-44,-29}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall9.toSurfacePort_1, zone3.toConstructionPorts2[1]) annotation (
       Line(
       points={{-40,8},{-40,-2},{-36,-2},{-36,-9}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall9.toSurfacePort_2, zone1.toConstructionPorts4[1]) annotation (
       Line(
       points={{-40,12},{-40,20},{-44,20},{-44,29}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(zone4.toConstructionPorts2[1], wall10.toSurfacePort_1) annotation (
       Line(
       points={{44,-9},{44,0},{40,0},{40,10}},
       color={127,0,0},
       smooth=Smooth.None));
    connect(wall10.toSurfacePort_2, zone2.toConstructionPorts4[1]) annotation (
       Line(
       points={{40,14},{40,24},{36,24},{36,29}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall3.toSurfacePort_2, zone2.toConstructionPorts1[1]) annotation (
       Line(
       points={{2,40},{20,40},{20,44},{29,44}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall3.toSurfacePort_1, zone1.toConstructionPorts3[1]) annotation (
       Line(
       points={{-2,40},{-16,40},{-16,36},{-29,36}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall4.toSurfacePort_1, zone3.toConstructionPorts3[1]) annotation (
       Line(
       points={{-2,-20},{-16,-20},{-16,-24},{-29,-24}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall4.toSurfacePort_2, zone4.toConstructionPorts1[1]) annotation (
       Line(
       points={{2,-20},{20,-20},{20,-16},{29,-16}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1]) annotation (Line(
       points={{-62,40},{-76,40},{-76,0},{-89.9,0}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall7.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2]) annotation (Line(
       points={{-52,62},{-52,68},{-76,68},{-76,0},{-89.9,0}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(window3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3]) annotation (Line(
       points={{-28,61.8},{-28,68},{-76,68},{-76,3.55271e-015},{-89.9,3.55271e-015}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4]) annotation (Line(
       points={{28,62},{28,68},{-76,68},{-76,3.55271e-015},{-89.9,3.55271e-015}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(window4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5]) annotation (Line(
       points={{52,61.8},{52,68},{-76,68},{-76,3.55271e-015},{-89.9,3.55271e-015}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6]) annotation (Line(
       points={{62,40},{70,40},{70,78},{-76,78},{-76,3.55271e-015},{-89.9,3.55271e-015}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7]) annotation (Line(
       points={{-62,-20},{-76,-20},{-76,3.55271e-015},{-89.9,3.55271e-015}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8]) annotation (Line(
       points={{-52,-44},{-52,-50},{-76,-50},{-76,3.55271e-015},{-89.9,3.55271e-015}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(window1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9]) annotation (Line(
       points={{-28,-43.8},{-28,-50},{-76,-50},{-76,3.55271e-015},{-89.9,3.55271e-015}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall12.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10]) annotation (Line(
       points={{28,-42},{28,-50},{-76,-50},{-76,3.55271e-015},{-89.9,3.55271e-015}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(window2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[11]) annotation (Line(
       points={{52,-41.8},{52,-50},{-76,-50},{-76,3.55271e-015},{-89.9,3.55271e-015}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall6.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[12]) annotation (Line(
       points={{62,-20},{70,-20},{70,-50},{-76,-50},{-76,3.55271e-015},{-89.9,3.55271e-015}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(zone3.airpathPorts3[2], airpath6.airpathPort_1) annotation (Line(
        points={{-29,-14},{-16,-14},{-16,0},{-4,0}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(airpath6.airpathPort_2, zone4.airpathPorts1[2]) annotation (Line(
        points={{4,0},{14,0},{14,-22},{29,-22}},
        color={0,0,255},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(airpath8.airpathPort_1, zone4.airpathPorts2[2]) annotation (Line(
        points={{20,8},{20,-2},{36,-2},{36,-7}},
        color={0,0,255},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(airpath5.airpathPort_2, zone1.airpathPorts4[2]) annotation (Line(
        points={{-22,14},{-22,24},{-36,24},{-36,31}},
        color={0,0,255},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(airpath5.airpathPort_1, zone3.airpathPorts2[2]) annotation (Line(
        points={{-22,6},{-22,-6},{-44,-6},{-44,-7}},
        color={0,0,255},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(airpath8.airpathPort_2, zone2.airpathPorts4[2]) annotation (Line(
        points={{20,16},{20,22},{44,22},{44,31}},
        color={0,0,255},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(airpath1.airpathPort_2, zone2.airpathPorts1[1]) annotation (Line(
        points={{4,26},{22,26},{22,34},{29,34}},
        color={0,0,255},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(zone1.airpathPorts3[2], airpath7.airpathPort_1) annotation (Line(
        points={{-29,46},{-20,46},{-20,20},{-4,20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(airpath7.airpathPort_2, zone2.airpathPorts1[2]) annotation (Line(
        points={{4,20},{18,20},{18,38},{29,38}},
        color={0,0,255},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(zone1.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
      points={{-33,47},{-33,18},{-80,18},{-80,-95}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
    connect(zone2.Q_flow_cooling, Q_flow_cooling[2]) annotation (Line(
      points={{47,47},{47,8},{-80,8},{-80,-105}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
    connect(zone3.Q_flow_cooling, Q_flow_cooling[3]) annotation (Line(
      points={{-33,-13},{-33,-80},{-80,-80},{-80,-105}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
    connect(zone4.Q_flow_cooling, Q_flow_cooling[4]) annotation (Line(
      points={{47,-13},{47,-80},{-80,-80},{-80,-105}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
    connect(zone1.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
      points={{-37,47},{-37,2},{-10,2},{-10,-76},{80,-76},{80,-92.5}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
    connect(zone2.Q_flow_heating, Q_flow_heating[2]) annotation (Line(
        points={{43,47},{43,0},{80,0},{80,-97.5}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dot));
    connect(zone3.Q_flow_heating, Q_flow_heating[3]) annotation (Line(
        points={{-37,-13},{-37,-76},{80,-76},{80,-102.5}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dot));
    connect(zone4.Q_flow_heating, Q_flow_heating[4]) annotation (Line(
        points={{43,-13},{43,-76},{80,-76},{80,-107.5}},
        color={0,0,127},
        smooth=Smooth.None,
        pattern=LinePattern.Dot));

  end Building;

  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient,
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile)
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
   connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts) annotation (Line(
    points={{-22,7.66667},{-20,7.66667},{-20,8},{-20,11.3333},{-20,7.66667},{-9,7.66667}},
    color={0,255,0},
    smooth=Smooth.None));
  connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
    points={{-22,-0.333333},{-16,-0.333333},{-16,-0.333333},{-9,-0.333333}},
    color={85,170,255},
    smooth=Smooth.None));
  connect(TSetHeatingZone1.y, building.T_setHeating[1]) annotation (Line(
      points={{15.8,14},{14,14},{14,7.25},{9.8,7.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHeatingZone2.y, building.T_setHeating[2]) annotation (Line(
      points={{21.8,18},{12,18},{12,7.75},{9.8,7.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHeatingZone3.y, building.T_setHeating[3]) annotation (Line(
      points={{27.8,22},{9.8,22},{9.8,8.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHeatingZone4.y, building.T_setHeating[4]) annotation (Line(
      points={{33.8,26},{9.8,26},{9.8,8.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoolingZone1.y, building.T_setCooling[1]) annotation (Line(
      points={{15.8,4},{14,4},{14,5.25},{9.8,5.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoolingZone2.y, building.T_setCooling[2]) annotation (Line(
      points={{21.8,-2},{14,-2},{14,5.75},{9.8,5.75}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCoolingZone3.y, building.T_setCooling[3]) annotation (Line(
      points={{27.8,-8},{14,-8},{14,6.25},{9.8,6.25}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.T_setCooling[4], TSetCoolingZone4.y) annotation (Line(
      points={{9.8,6.75},{14,6.75},{14,-14},{33.8,-14}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=86400),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/BuildingThermal4Zones1D.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
    textString="1D-Thermal building model with 4 zones under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a thermal building model with 4 zones, based on 1D-discretized building elements.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end BuildingThermal4Zones1D;
