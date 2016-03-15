within ;
package ThermalModelHouse
  "User Guide of the BuildingSystems library Chapter 3: Multi-Zone Building Modeling "
  model Building
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
        surfacesToAmbient(nSurfaces=12), nZones=2);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone1(
      nConstructions1=1,
      nConstructions4=3,
      nConstructions2=2,
      nConstructions3=1,
      V=0.5*0.5*0.5,
      height=0.5)
      annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone2(
      nConstructions3=1,
      nConstructions2=2,
      nConstructions1=1,
      nConstructions4=3,
      V=0.5*0.5*0.5,
      height=0.5)
      annotation (Placement(transformation(extent={{30,-10},{50,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall1(
      redeclare Construction1THM constructionData,
      width=0.5,
      height=0.5,
      angleDegAzi=90.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-60,0})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall2(
      redeclare Construction1THM constructionData,
      width=0.5,
      height=0.5,
      angleDegAzi=180.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-52,20})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall3(
      redeclare Construction1THM constructionData,
      width=0.5,
      height=0.5,
      angleDegAzi=90.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={52,20})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall4(
      redeclare Construction1THM constructionData,
      width=0.5,
      height=0.5,
      angleDegAzi=-90.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,origin={60,0})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall5(
      redeclare Construction1THM constructionData,
      width=0.5,
      height=0.5,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      nInnSur=1,
      AInnSur={window2.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={28,-20})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall6(
      redeclare Construction1THM constructionData,
      width=0.5,
      height=0.5,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      nInnSur=1,
      AInnSur={window1.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-52,-20})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall7(
      redeclare Construction2THM constructionData,
      width=0.5,
      height=0.5)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,origin={0,0})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceiling1(
      redeclare Construction1THM constructionData,
      width=0.5,
      height=0.5,
      angleDegAzi=0.0,
      angleDegTil=0.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-40,40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceiling2(
      redeclare Construction1THM constructionData,
      width=0.5,
      height=0.5,
      angleDegAzi=0.0,
      angleDegTil=0.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={40,40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom1(
      redeclare Construction1THM constructionData,
      width=0.5,
      height=0.5,
      angleDegAzi=0.0,
      angleDegTil=180.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-40,-40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom2(
      redeclare Construction1THM constructionData,
      width=0.5,
      height=0.5,
      angleDegAzi=0.0,
      angleDegTil=180.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={40,-40})));
    BuildingSystems.Buildings.Constructions.Windows.Window window1(
      angleDegAzi=0.0,
      angleDegTil=90.0,
      width=0.378,
      height=0.33,
      thicknessPane=0.003)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-28,-20})));
    BuildingSystems.Buildings.Constructions.Windows.Window window2(
      angleDegAzi=0.0,
      angleDegTil=90.0,
      width=0.378,
      height=0.33,
      thicknessPane=0.003)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={52,-20})));
  equation
    connect(wall1.toSurfacePort_1, zone1.toConstructionPorts1[1]) annotation (
        Line(points={{-58,0},{-54,0},{-54,4},{-51,4}}, color={0,0,0}));
    connect(zone2.toConstructionPorts3[1], wall4.toSurfacePort_1) annotation (
        Line(points={{51,-4},{54,-4},{54,0},{58,0}}, color={127,0,0}));
    connect(wall6.toSurfacePort_1, zone1.toConstructionPorts4[1]) annotation (
        Line(points={{-52,-18},{-52,-18},{-52,-11},{-41.3333,-11}}, color={0,0,0}));
    connect(window1.toSurfacePort_1, zone1.toConstructionPorts4[2]) annotation (
       Line(points={{-28,-18},{-28,-18},{-28,-11},{-44,-11}}, color={0,0,0}));
    connect(wall2.toSurfacePort_1, zone1.toConstructionPorts2[1]) annotation (
        Line(points={{-52,18},{-52,18},{-52,14},{-50,14},{-38,14},{-38,11},{-34,11}}, color={0,0,0}));
    connect(ceiling1.toSurfacePort_1, zone1.toConstructionPorts2[2])
      annotation (Line(points={{-40,38},{-40,38},{-40,11},{-38,11}}, color={0,0,0}));
    connect(ceiling2.toSurfacePort_1, zone2.toConstructionPorts2[1])
      annotation (Line(points={{40,38},{40,38},{40,36},{40,16},{46,16},{46,11}},color={0,0,0}));
    connect(wall3.toSurfacePort_1, zone2.toConstructionPorts2[2]) annotation (
        Line(points={{52,18},{52,18},{52,11},{42,11}}, color={0,0,0}));
    connect(wall7.toSurfacePort_1, zone1.toConstructionPorts3[1]) annotation (
        Line(points={{-2,0},{-16,0},{-16,-4},{-29,-4}}, color={0,0,0}));
    connect(wall7.toSurfacePort_2, zone2.toConstructionPorts1[1])
      annotation (Line(points={{2,0},{16,0},{16,4},{29,4}}, color={0,0,0}));
    connect(zone2.toConstructionPorts4[1], wall5.toSurfacePort_1) annotation (
        Line(points={{38.6667,-11},{28,-11},{28,-18}}, color={127,0,0}));
    connect(zone2.toConstructionPorts4[2], window2.toSurfacePort_1)
      annotation (Line(points={{36,-11},{52,-11},{52,-18}}, color={127,0,0}));
    connect(zone1.toConstructionPorts4[3], bottom1.toSurfacePort_1) annotation (
       Line(points={{-46.6667,-11},{-46.6667,-16},{-40,-16},{-40,-26},{-40,-38}},color={127,0,0}));
    connect(bottom2.toSurfacePort_1, zone2.toConstructionPorts4[3]) annotation (
       Line(points={{40,-38},{38,-38},{38,-11},{33.3333,-11}}, color={0,0,0}));
    connect(wall1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1])
      annotation (Line(points={{-62,0},{-89.9,0}},           color={0,0,0}));
    connect(wall2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2])
      annotation (Line(points={{-52,22},{-52,30},{-76,30},{-76,3.55271e-015},{
            -89.9,3.55271e-015}}, color={0,0,0}));
    connect(wall6.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3])
      annotation (Line(points={{-52,-22},{-52,-22},{-52,-32},{-76,-32},{-76,0},
            {-82,0},{-82,3.55271e-015},{-89.9,3.55271e-015}},         color={0,0,0}));
    connect(ceiling1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4])
      annotation (Line(points={{-40,42},{-40,52},{-76,52},{-76,3.55271e-015},{-89.9,3.55271e-015}}, color={0,0,0}));
    connect(bottom1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5])
      annotation (Line(points={{-40,-42},{-40,-50},{-76,-50},{-76,0},{-89.9,0},{-89.9,3.55271e-015}}, color={0,0,0}));
    connect(window1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6])
      annotation (Line(points={{-28,-22},{-28,-22},{-28,-50},{-76,-50},{-76,0},{-89.9,0},{-89.9,3.55271e-015}},         color={0,0,0}));
    connect(ceiling2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7])
      annotation (Line(points={{40,42},{46,42},{46,50},{46,52},{-76,52},{-76,3.55271e-015},{-89.9,3.55271e-015}}, color={0,0,0}));
    connect(surfacesToAmbient.toConstructionPorts[8], wall5.toSurfacePort_2)
      annotation (Line(points={{-89.9,3.55271e-015},{-76,3.55271e-015},{-76,-50},
            {28,-50},{28,-46},{28,-36},{28,-22}},          color={127,0,0}));
    connect(wall3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9])
      annotation (Line(points={{52,22},{52,22},{52,48},{52,52},{-76,52},{-76,3.55271e-015},{-89.9,3.55271e-015}}, color={0,0,0}));
    connect(wall4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10])
      annotation (Line(points={{62,0},{66,0},{66,52},{-76,52},{-76,0},{-89.9,0}},color={0,0,0}));
    connect(bottom2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[11])
      annotation (Line(points={{40,-42},{40,-42},{40,-50},{-76,-50},{-76,3.55271e-015},{-89.9,3.55271e-015}}, color={0,0,0}));
    connect(window2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[12])
      annotation (Line(points={{52,-22},{52,-22},{52,-50},{46,-50},{-76,-50},{-76,-6},{-76,3.55271e-015},{-89.9,3.55271e-015}},           color={0,0,0}));
    connect(zone1.airchange, airchange[1]) annotation (Line(
        points={{-29,7},{-16,7},{-16,30},{80,30},{80,40},{100,40}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(zone2.airchange, airchange[2]) annotation (Line(
        points={{51,7},{54,7},{54,14},{80,14},{80,34},{90,34},{90,40},{100,40}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(T_setHeating[1], zone1.T_setHeating) annotation (Line(
        points={{100,80},{-22,80},{-22,0},{-39,0},{-39,7}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(T_setHeating[2], zone2.T_setHeating) annotation (Line(
        points={{100,80},{40,80},{24,80},{24,2},{41,2},{41,7}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(T_setCooling[1], zone1.T_setCooling) annotation (Line(
        points={{100,60},{38,60},{-22,60},{-22,0},{-35,0},{-35,7}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(T_setCooling[2], zone2.T_setCooling) annotation (Line(
        points={{100,60},{24,60},{24,2},{45,2},{45,7}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(TAirAmb, zone1.TAirAmb) annotation (Line(
        points={{50,100},{50,100},{50,80},{-10,80},{-10,6},{-29,6},{-29,5}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(TAirAmb, zone2.TAirAmb) annotation (Line(
        points={{50,100},{50,100},{50,80},{70,80},{70,14},{54,14},{54,5},{51,5}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(xAirAmb, zone2.xAirAmb) annotation (Line(
        points={{70,100},{70,14},{54,14},{54,3},{51,3}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(xAirAmb, zone1.xAirAmb) annotation (Line(
        points={{70,100},{70,100},{70,80},{-22,80},{-22,4},{-29,4},{-29,3}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(zone1.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
        points={{-37,7},{-37,-8},{-10,-8},{-10,-80},{80,-80},{80,-100}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(zone2.Q_flow_heating, Q_flow_heating[2]) annotation (Line(
        points={{43,7},{43,-10},{72,-10},{80,-10},{80,-100}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(zone1.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
        points={{-33,7},{-33,0},{-34,0},{-34,-8},{-10,-8},{-10,-80},{-80,-80},{-80,-100}},
        color={0,0,127},
        pattern=LinePattern.Dash));
    connect(Q_flow_cooling[2], zone2.Q_flow_cooling) annotation (Line(
        points={{-80,-100},{-80,-80},{-10,-80},{-10,-8},{47,-8},{47,7}},
        color={0,0,127},
        pattern=LinePattern.Dash));
  end Building;

  record Construction1THM
    "Outer constructions of the THM"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=3,
      thickness={0.006,0.030,0.009},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood()});
  end Construction1THM;

  record Construction2THM
    "Partition wall of the THM"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={0.009},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood()});
  end Construction2THM;

  model SystemModel
    Building building(
      nZones=2,
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
      prescribedAirchange=true,
      calcIdealLoads=true,
      useAirPathes=false)
      annotation (Placement(transformation(extent={{10,-10},{30,10}})));
    BuildingSystems.Buildings.Ambient ambient(
      redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile,
      nSurfaces=building.nSurfacesAmbient)
      annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));
    Modelica.Blocks.Sources.Constant TSetHeatingZone1(k=273.15 + 22.0)
      annotation (Placement(transformation(extent={{56,2},{44,14}})));
    Modelica.Blocks.Sources.Constant TSetHeatingZone2(k=273.15 + 20.0)
      annotation (Placement(transformation(extent={{72,12},{60,24}})));
    Modelica.Blocks.Sources.Constant TSetCoolingZone1(k=273.15 + 26.0)
      annotation (Placement(transformation(extent={{56,-22},{44,-10}})));
    Modelica.Blocks.Sources.Constant TSetCoolingZone2(k=273.15 + 24.0)
      annotation (Placement(transformation(extent={{72,-12},{60,0}})));
    Modelica.Blocks.Sources.Constant airchangeZone1(k=0.5)
      annotation (Placement(transformation(extent={{56,-42},{44,-30}})));
    Modelica.Blocks.Sources.Constant airchangeZone2(k=0.5)
      annotation (Placement(transformation(extent={{72,-32},{60,-20}})));
  equation
    connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts)
      annotation (Line(points={{-14,4},{11,4}}, color={0,255,0}));
    connect(ambient.toAirPorts, building.toAmbientAirPorts)
      annotation (Line(points={{-14,-4},{11,-4}}, color={85,170,255}));
    connect(ambient.TAirRef, building.TAirAmb) annotation (Line(points={{-30.2,
            7},{-32,7},{-32,14},{26.2,14},{26.2,9.8}}, color={0,0,127}));
    connect(ambient.xAir, building.xAirAmb) annotation (Line(points={{-30.2,5},
            {-34,5},{-34,16},{28.4,16},{28.4,9.8}}, color={0,0,127}));
    connect(TSetHeatingZone1.y, building.T_setHeating[1]) annotation (Line(
          points={{43.4,8},{29.8,8},{29.8,8.5}}, color={0,0,127}));
    connect(building.T_setHeating[2], TSetHeatingZone2.y) annotation (Line(
          points={{29.8,7.5},{40,7.5},{40,18},{59.4,18}}, color={0,0,127}));
    connect(building.T_setCooling[1], TSetCoolingZone1.y) annotation (Line(
          points={{29.8,6.5},{32,6.5},{32,6},{40,6},{40,-16},{43.4,-16}}, color=
           {0,0,127}));
    connect(TSetCoolingZone2.y, building.T_setCooling[2]) annotation (Line(
          points={{59.4,-6},{59.4,-6},{40,-6},{40,6},{29.8,6},{29.8,5.5}},
          color={0,0,127}));
    connect(building.airchange[1], airchangeZone1.y) annotation (Line(points={{
            29.8,4.5},{40,4.5},{40,-36},{43.4,-36}}, color={0,0,127}));
    connect(building.airchange[2], airchangeZone2.y) annotation (Line(points={{
            29.8,3.5},{29.8,4},{38,4},{40,4},{40,-26},{59.4,-26}}, color={0,0,
            127}));

    annotation (experiment(StartTime=0, StopTime=864000), Icon(coordinateSystem(preserveAspectRatio=false,extent={{-40,-50},{80,40}},initialScale=0.1)),
      Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-40,-50},{80,40}},initialScale=0.1)));
  end SystemModel;
  annotation (uses(Modelica(version="3.2.1"), BuildingSystems(version="0.1")));
end ThermalModelHouse;
