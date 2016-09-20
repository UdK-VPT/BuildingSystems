within BuildingSystems.Buildings.Examples;
model ThermalModelHouse3D "Model of the thermal model house in 3D description."
  extends Modelica.Icons.Example;

    record ZoneGeometry
      extends Modelica.Icons.Record;
      parameter Modelica.SIunits.Length lengthX;
      parameter Modelica.SIunits.Length lengthY;
      parameter Modelica.SIunits.Length lengthZ;
      parameter Modelica.SIunits.Length widthWindow;
      parameter Modelica.SIunits.Length heightWindow;
    end ZoneGeometry;

  model Building "Building model of thermal model house (3D version)"
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
      surfacesToAmbient(nSurfaces=10),
      useAirPathes = false,
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
      nZones=2,
      heatSources = true,
      nHeatSources = 2,
      gridSurface = {{numDisZone1,numDisZone1},{numDisZone2,numDisZone2},
      {numDisZone2,numDisZone2},{numDisZone2,numDisZone2},{numDisZone1,numDisZone1},
      {numDisZone1,numDisZone1},{numDisZone2,numDisZone2},{numDisZone1,numDisZone1},
      {numDisZone2,numDisZone2},{numDisZone1,numDisZone1}});

   /// ZONE 1 ///////////////////////////////////////////////////////////////
   // discretization of the Walls Zone 1
    parameter Integer numDisZone1 = 3
      "equidistant discretisation of the walls (zone 1)" annotation (HideResult=false);

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone1(
      prescribedAirchange=false,
      Q_flow_heatingMax=100.0,
      Q_flow_coolingMax=-50.0,
      nConstructions1=1,
      nConstructions2=1,
      nConstructions3=1,
      nConstructions4=1,
      nConstructions5=1,
      nConstructions6=1,
      gridSurface1={{numDisZone1,numDisZone1}},
      gridSurface2={{numDisZone1,numDisZone1}},
      gridSurface3={{numDisZone2,numDisZone2}},
      gridSurface4={{numDisZone1,numDisZone1}},
      gridSurface5={{numDisZone1,numDisZone1}},
      gridSurface6={{numDisZone1,numDisZone1}},
      height=geoZone1.lengthZ,
      V=geoZone1.lengthX*geoZone1.lengthY*geoZone1.lengthZ,
      calcIdealLoads=false)
      annotation (Placement(transformation(extent={{-52,-8},{-32,12}})));

     /// ZONE 2 ////////////////////////////////////////////////////////////////
     // discretization of the AirVolume+Walls Zone 2
     // numDisZone2 = 3,4,5 -> 6 macht Schwierigkeiten
      parameter Integer numDisZone2 = 4
      "equidistant discretisation of the walls + AirVolume (zone 2), partition wall to zone 1"
         annotation (HideResult=false);

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolume3D zone2(
      prescribedAirchange=false,
      nConstructions1=1,
      nConstructions2=1,
      nConstructions3=1,
      nConstructions4=1,
      nConstructions5=1,
      nConstructions6=1,
      length=geoZone2.lengthX,
      width=geoZone2.lengthY,
      height=geoZone2.lengthZ,
      gridSurface1={{4,4}},
      gridSurface2={{4,4}},
      gridSurface3={{4,4}},
      gridSurface4={{4,4}},
      gridSurface5={{4,4}},
      gridSurface6={{4,4}},
      elemX=4,
      elemY=4,
      elemZ=4,
      surf1ai=[1,1,1,1; 2,2,2,2; 3,3,3,3; 4,4,4,4],
      surf1aj=[1,2,3,4; 1,2,3,4; 1,2,3,4; 1,2,3,4],
      dxVec={geoZone2.lengthX/4,geoZone2.lengthX/4,geoZone2.lengthX/4,geoZone2.lengthX/4},
      dyVec={geoZone2.lengthY/4,geoZone2.lengthY/4,geoZone2.lengthY/4,geoZone2.lengthY/4},
      dzVec={geoZone2.lengthZ/4,geoZone2.lengthZ/4,geoZone2.lengthZ/4,geoZone2.lengthZ/4},
      surf1nCon=[1,1,1,1; 1,1,1,1; 1,1,1,1; 1,1,1,1],
      surf2ai=[1,1,1,1; 2,2,2,2; 3,3,3,3; 4,4,4,4],
      surf2aj=[1,2,3,4; 1,2,3,4; 1,2,3,4; 1,2,3,4],
      surf2nCon=[1,1,1,1; 1,1,1,1; 1,1,1,1; 1,1,1,1],
      surf3ai=[1,1,1,1; 2,2,2,2; 3,3,3,3; 4,4,4,4],
      surf3aj=[1,2,3,4; 1,2,3,4; 1,2,3,4; 1,2,3,4],
      surf3nCon=[1,1,1,1; 1,1,1,1; 1,1,1,1; 1,1,1,1],
      surf4ai=[1,1,1,1; 2,2,2,2; 3,3,3,3; 4,4,4,4],
      surf4aj=[1,2,3,4; 1,2,3,4; 1,2,3,4; 1,2,3,4],
      surf4nCon=[1,1,1,1; 1,1,1,1; 1,1,1,1; 1,1,1,1],
      surf5ai=[1,1,1,1; 2,2,2,2; 3,3,3,3; 4,4,4,4],
      surf5aj=[1,2,3,4; 1,2,3,4; 1,2,3,4; 1,2,3,4],
      surf5nCon=[1,1,1,1; 1,1,1,1; 1,1,1,1; 1,1,1,1],
      surf6ai=[1,1,1,1; 2,2,2,2; 3,3,3,3; 4,4,4,4],
      surf6aj=[1,2,3,4; 1,2,3,4; 1,2,3,4; 1,2,3,4],
      surf6nCon=[1,1,1,1; 1,1,1,1; 1,1,1,1; 1,1,1,1])
      annotation (Placement(transformation(extent={{30,-10},{50,10}})));

      //// WALLS ///////////////////////////////////////////////////////////
      //nAirpathes1=2,
      //heightAirpath={0.2,0.25},
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall1(
        equidistantGrid = true,
        nY=numDisZone1,
        nZ=numDisZone1,
        angleDegAzi=90.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-50,-10},{-70,10}})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall2(
        equidistantGrid = true,
        nY=numDisZone1, nZ=numDisZone1,
        angleDegAzi=180.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-54,22})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall3(
        equidistantGrid = true,
        angleDegAzi=180.0,
        angleDegTil=90.0,
        constructionData=construction1,
        nY=4,
        nZ=4)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={52,22})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall4(
        equidistantGrid = true,
        angleDegAzi=-90.0,
        angleDegTil=90.0,
        constructionData=construction1,
        nY=4,
        nZ=4)
        annotation (Placement(transformation(extent={{50,-10},{70,10}})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall5(
        equidistantGrid = true,
        angleDegAzi=0.0,
        angleDegTil=90.0,
        constructionData=construction1,
        nY=4,
        nZ=4)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={30,-22})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall6(
        equidistantGrid = true,
        nY=numDisZone1,
        nZ=numDisZone1,
        angleDegAzi=0.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-52,-20})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D ceiling1(
        equidistantGrid = true,
        nY=numDisZone1,
        nZ=numDisZone1,
        angleDegAzi=0.0,
        angleDegTil=0.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-40,40})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D ceiling2(
        equidistantGrid = true,
        angleDegAzi=0.0,
        angleDegTil=0.0,
        constructionData=construction1,
        nY=4,
        nZ=4)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={40,40})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D bottom1(
        equidistantGrid = true,
        nY=numDisZone1,
        nZ=numDisZone1,
        angleDegAzi=0.0,
        angleDegTil=180.0,
        heatSource=true,
        layerWithHeatSource = 1,
        constructionData=construction3)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-40,-40})));
      // floor heating
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D bottom2(
        equidistantGrid = true,
        angleDegAzi=0.0,
        angleDegTil=180.0,
        heatSource=true,
        layerWithHeatSource = 1,
        constructionData=construction3,
        nY=4,
        nZ=4)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={40,-40})));

      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall7(
        equidistantGrid = true,
        angleDegAzi=-90.0,
        angleDegTil=90.0,
        constructionData=construction2,
        nY=4,
        nZ=4)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

      replaceable
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction             construction1
      "\"Construction of the building envelope\""
        annotation (Placement(transformation(extent={{-80,64},{-60,84}})));
      replaceable
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction             construction2
      "\"Construction of the partition wall\""
        annotation (Placement(transformation(extent={{-50,64},{-30,84}})));
      replaceable
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction             construction3
      "\"Construction of the bottom \""
        annotation (Placement(transformation(extent={{-20,64},{0,84}})));
      replaceable ZoneGeometry geoZone1
        annotation (Placement(transformation(extent={{10,64},{30,84}})));
      replaceable ZoneGeometry geoZone2
        annotation (Placement(transformation(extent={{40,64},{60,84}})));

  equation
      // ZONE 1 ///////////////////////////////
        connect(wall1.toSurfacePort_1, zone1.toConstructionPorts1[1])
        annotation (
          Line(
          points={{-58,0},{-54,0},{-54,6},{-53,6}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(wall2.toSurfacePort_1, zone1.toConstructionPorts2[1])
        annotation (
          Line(
          points={{-54,20},{-54,16},{-38,16},{-38,13}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(ceiling1.toSurfacePort_1, zone1.toConstructionPorts5[1])
        annotation (Line(
          points={{-40,38},{-40,8},{-33,8}},
          color={127,0,0},
          smooth=Smooth.None));
        connect(wall7.toSurfacePort_1, zone1.toConstructionPorts3[1])
        annotation (
          Line(
          points={{-2,0},{-16,0},{-16,-2},{-31,-2}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(wall6.toSurfacePort_1, zone1.toConstructionPorts4[1])
        annotation (
          Line(
          points={{-52,-18},{-52,-16},{-46,-16},{-46,-9}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(bottom1.toSurfacePort_1, zone1.toConstructionPorts6[1])
        annotation (
         Line(
          points={{-40,-38},{-40,-16},{-51,-16},{-51,-4}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

      // ZONE 2 ///////////////////////////////
      connect(wall5.toSurfacePort_1, zone2.toConstructionPorts4[1]) annotation (
          Line(
          points={{30,-20},{30,-16},{36,-16},{36,-11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

      connect(wall7.toSurfacePort_2, zone2.toConstructionPorts1[1]) annotation (
          Line(
          points={{2,0},{16,0},{16,4},{29,4}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

      connect(wall3.toSurfacePort_1, zone2.toConstructionPorts2[1]) annotation (
          Line(
          points={{52,20},{52,16},{44,16},{44,11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

      connect(wall4.toSurfacePort_1, zone2.toConstructionPorts3[1]) annotation (
          Line(
          points={{58,0},{56,0},{56,-4},{51,-4}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

      connect(ceiling2.toSurfacePort_1, zone2.toConstructionPorts6[1]) annotation (Line(
          points={{40,38},{40,-6},{31,-6}},
          color={127,0,0},
          smooth=Smooth.None));

       connect(bottom2.toSurfacePort_1, zone2.toConstructionPorts5[1]) annotation (
         Line(
          points={{40,-38},{40,-16},{49,-16},{49,6}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

      //////////////////////////////////////////
      // Surface To Ambient
      connect(ceiling1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1])
        annotation (Line(
          points={{-40,42},{-40,46},{-80,46},{-80,0},{-89.9,0}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(ceiling2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2])
        annotation (Line(
          points={{40,42},{40,46},{-80,46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3])
        annotation (Line(
          points={{52,24},{52,46},{-80,46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4])
        annotation (Line(
          points={{62,0},{70,0},{70,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5])
        annotation (Line(
          points={{-62,0},{-89.9,0}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall6.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6])
        annotation (Line(
          points={{-52,-22},{-52,-46},{-80,-46},{-80,3.55271e-015},{-89.9,
              3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7])
        annotation (Line(
          points={{30,-24},{30,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(bottom1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8])
        annotation (Line(
          points={{-40,-42},{-40,-46},{-80,-46},{-80,3.55271e-015},{-89.9,
              3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(bottom2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9])
        annotation (Line(
          points={{40,-42},{40,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
       connect(wall2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10])
        annotation (Line(
          points={{-54,24},{-54,46},{-80,46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

      // + Bottom To Ground (2)
      connect(bottom1.heatSourcePorts[2,2],conHeatSourcesPorts[1]);
      connect(bottom2.heatSourcePorts[2,2],conHeatSourcesPorts[2]);

  end Building;

    // Building construction
    record Construction1 =
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
      nLayers=3,
      thickness={0.006,0.030,0.009},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood(),
                    BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation(),
                    BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood()});

    record Construction2 =
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
      nLayers=1,
      thickness={0.009},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood()});

    record Construction3 =
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
      nLayers=4,
      thickness={0.002,0.006,0.030,0.009},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood(),
                     BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood(),
                     BuildingSystems.HAM.Data.MaterialProperties.Thermal.SuperInsulation(),
                     BuildingSystems.HAM.Data.MaterialProperties.Thermal.Aluminium()});

    // Building geometry
    record GeometryZone1 = ZoneGeometry (
      lengthX = 0.5,
      lengthY = 0.5,
      lengthZ = 0.5,
      widthWindow = 0.378,
      heightWindow = 0.33);

    record GeometryZone2 = ZoneGeometry (
      lengthX = 0.5,
      lengthY = 0.5,
      lengthZ = 0.5,
      widthWindow = 0.378,
      heightWindow = 0.33);

    Building building(
      redeclare Construction1 construction1,
      redeclare Construction2 construction2,
      redeclare Construction3 construction3,
      redeclare GeometryZone1 geoZone1,
      redeclare GeometryZone2 geoZone2,
      prescribedAirchange=false,
      calcIdealLoads=false)
      annotation (Placement(transformation(extent={{10,-10},{30,10}})));
    BuildingSystems.Buildings.Ambient ambient(
      nSurfaces=building.nSurfacesAmbient,
      gridSurface=building.gridSurface,
      redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile)
      annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatingZone1
      annotation (Placement(transformation(extent={{-5,-5},{5,5}},rotation=270,origin={17,21})));
    Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatingZone2
      annotation (Placement(transformation(extent={{-5,-5},{5,5}},rotation=270,origin={25,21})));
    Modelica.Blocks.Sources.Constant Q_flowHeatingZone2(k=20.0)
      annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={30,30})));
    Modelica.Blocks.Sources.Constant Q_flowHeatingZone1(k=0.0)
      annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={22,30})));
equation
    connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts)
      annotation (Line(
        points={{-12,4},{11,4}},
        color={0,255,0},
        smooth=Smooth.None));
    connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
        points={{-12,-4},{11,-4}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(Q_flowHeatingZone1.y, heatingZone1.Q_flow) annotation (Line(
        points={{19.8,30},{17,30},{17,26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(Q_flowHeatingZone2.y, heatingZone2.Q_flow) annotation (Line(
        points={{27.8,30},{25,30},{25,26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(heatingZone1.port, building.conHeatSourcesPorts[1]) annotation (Line(
            points={{17,16},{18,16},{18,12},{20,12},{20,9.5}}, color={191,0,0}));
    connect(heatingZone2.port, building.conHeatSourcesPorts[2]) annotation (Line(
            points={{25,16},{26,16},{26,12},{20,12},{20,10.5}}, color={191,0,0}));

  annotation(experiment(StopTime=86400, __Dymola_Algorithm="Cvode"),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/ThermalModelHouse3D.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="Model of the thermal model house in a 3D description")}),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(
 info="<html>
<p>Model of the thermal model house in a 3D description</p>
<ul>
<li>(Left-) Zone 1: equidistant discretised walls, 1D airvolume.</li>
<li>(Right-) Zone 2: equidistant discretised walls, 3D equidistant discretised airvolume (4x4x4).</li>
<li>Interconnecting wall (wall7): equidistant discretised wall (4x4)</li>
</ul>
<p><br/><br/><img src=\"modelica://BuildingSystems/Resources/Images/Airvolume3Ddoc/therModelhouse/modelhouseFas.JPG\" alt=\"ThermalModelhouse\"/></p>
<p>Further Informations about the thermal modelhouse could be found here:<a href=\"http://www.thermisches-modellhaus.de/sites/Home.html\"> www.thermisches-modellhaus.de</a></p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Katharina Mucha:<br/>
First implementation.
</li>
</ul>
</html>"));
end ThermalModelHouse3D;
