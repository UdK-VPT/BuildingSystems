within BuildingSystems.Buildings.Examples;
model ThermalModelHouse3Dwindow
  "Model of the thermal model house in 3D description"
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
      surfacesToAmbient(nSurfaces=18),
      nZones=2,
      useAirPathes = false,
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
      heatSources = true,
      nHeatSources = 2,
      gridSurface = {{3,3},{3,3},{3,3},{3,3},{3,3},{3,1},{1,1},{1,1},{3,1},{3,3},{3,3},{3,3},{3,1},{3,1},{1,1},{1,1},{1,1},{1,1}});

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone1(
      prescribedAirchange=false,
      Q_flow_heatingMax=100.0,
      Q_flow_coolingMax=-50.0,
      nConstructions2=2,
      gridSurface2={{3,3},{3,3}},
      nConstructions3=1,
      gridSurface3={{3,3}},
      V=geoZone1.lengthX*geoZone1.lengthY*geoZone1.lengthZ,
      nConstructions4=6,
      gridSurface4={{3,1},{1,1},{3,3},{3,1},{1,1},{1,1}},
      nConstructions1=1,
      gridSurface1={{3,3}},
      height=geoZone1.lengthZ,
      calcIdealLoads=false)
      annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));

     /////////////////////////////////////////////////////////////////////////////////////////

    // due to the site of the window
    parameter Modelica.SIunits.Length[3] dxVecini = {(geoZone2.lengthX-window2.width)/2,window2.width,(geoZone2.lengthX-window2.width)/2};
    parameter Modelica.SIunits.Length[3] dyVecini = {0.076,window2.height,geoZone2.lengthZ - window2.height - 0.076};
    parameter Modelica.SIunits.Length[3] dzVecini = {geoZone2.lengthY/3,geoZone2.lengthY/3,geoZone2.lengthY/3};

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolume3D zone2(
      prescribedAirchange=false,
      nConstructions1=1,
      nConstructions2=1,
      nConstructions3=1,
      nConstructions4=5,
      nConstructions5=1,
      nConstructions6=1,
      gridSurface1={{3,3}},
      gridSurface2={{3,3}},
      gridSurface3={{3,3}},
      gridSurface4={{3,1},{3,1},{1,1},{1,1},{1,1}},
      gridSurface5={{3,3}},
      gridSurface6={{3,3}},
      length=geoZone2.lengthX,
      width=geoZone2.lengthZ,
      height=geoZone2.lengthY,
      dxVec=dxVecini,
      dyVec=dyVecini,
      dzVec=dzVecini,
      surf4ai=[1,1,1; 1,1,1; 1,1,1],
      surf4aj=[1,2,3; 1,1,1; 1,2,3],
      surf4nCon=[2,2,2; 3,5,4; 1,1,1],
      elemX=3,
      elemY=3,
      elemZ=3) annotation (Placement(transformation(extent={{30,-10},{50,10}})));

       ////////////////////////////////////////////////////////////////////////////////////

      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall1(
        equidistantGrid = false,
        pointsSegY={0.0,1/3*geoZone1.lengthY,2/3*geoZone1.lengthY,geoZone1.lengthY},
        pointsSegZ={0.0,0.076,0.076+window1.height,geoZone1.lengthZ},
        nY=3, nZ=3,
        angleDegAzi=90.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-50,-10},{-70,10}})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall2(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone1.lengthX-window1.width)/2,(geoZone1.lengthX-window1.width)/2+window1.width,geoZone1.lengthX},
        pointsSegZ={0.0,0.076,0.076+window1.height,geoZone1.lengthZ},
        nY=3, nZ=3,
        angleDegAzi=180.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-54,22})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall3(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone2.lengthX-window2.width)/2,(geoZone2.lengthX-window2.width)/2+window2.width,geoZone2.lengthX},
        pointsSegZ={0.0,0.076,0.076+window2.height,geoZone2.lengthZ},
        nY=3, nZ=3,
        angleDegAzi=180.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={52,22})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall4(
        equidistantGrid = false,
        pointsSegY={0.0,1/3*geoZone2.lengthY,2/3*geoZone2.lengthY,geoZone2.lengthY},
        pointsSegZ={0.0,0.076,0.076+window2.height,geoZone2.lengthZ},
        nY=3, nZ=3,
        angleDegAzi=-90.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{50,-10},{70,10}})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall5(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone2.lengthX-window2.width)/2,(geoZone2.lengthX-window2.width)/2+window2.width,geoZone2.lengthX},
        pointsSegZ={0.0,0.076},
        nY=3, nZ=1,
        angleDegAzi=0.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={30,-22})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall6(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone1.lengthX-window1.width)/2,(geoZone1.lengthX-window1.width)/2+window1.width,geoZone1.lengthX},
        pointsSegZ={0.0,0.076},
        nY=3, nZ=1,
        angleDegAzi=0.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-52,-20})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall8(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone1.lengthX-window1.width)/2,(geoZone1.lengthX-window1.width)/2+window1.width,geoZone1.lengthX},
        pointsSegZ={0.0,geoZone1.lengthZ-window1.height-0.076},
        nY=3, nZ=1,
        angleDegAzi=0.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-62,-32})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall9(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone2.lengthX-window2.width)/2,(geoZone2.lengthX-window2.width)/2+window2.width,geoZone2.lengthX},
        pointsSegZ={0.0,geoZone2.lengthZ-window2.height-0.076},
        nY=3, nZ=1,
        angleDegAzi=0.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={18,-32})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall10(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone1.lengthX-window1.width)/2},
        pointsSegZ={0.0,window1.height},
        nY=1, nZ=1,
        angleDegAzi=0.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-16,-30})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall11(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone1.lengthX-window1.width)/2},
        pointsSegZ={0.0,window1.height},
        nY=1,nZ=1,
        angleDegAzi=0.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-4,-38})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall12(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone2.lengthX-window2.width)/2},
        pointsSegZ={0.0,window2.height},
        nY=1, nZ=1,
        angleDegAzi=0.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={62,-28})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall13(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone2.lengthX-window2.width)/2},
        pointsSegZ={0.0,window2.height},
        nY=1, nZ=1,
        angleDegAzi=0.0,
        angleDegTil=90.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={74,-38})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D ceiling1(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone1.lengthX-window1.width)/2,(geoZone1.lengthX-window1.width)/2+window1.width,geoZone1.lengthX},
        pointsSegZ={0.0,1/3*geoZone1.lengthY,2/3*geoZone1.lengthY,geoZone1.lengthY},
        nY=3, nZ=3,
        angleDegAzi=0.0,
        angleDegTil=0.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-40,40})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D ceiling2(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone2.lengthX-window2.width)/2,(geoZone2.lengthX-window2.width)/2+window2.width,geoZone2.lengthX},
        pointsSegZ={0.0,1/3*geoZone2.lengthY,2/3*geoZone2.lengthY,geoZone2.lengthY},
        nY=3, nZ=3,
        angleDegAzi=0.0,
        angleDegTil=0.0,
        constructionData=construction1)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={40,40})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D bottom1(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone1.lengthX-window1.width)/2,(geoZone1.lengthX-window1.width)/2+window1.width,geoZone1.lengthX},
        pointsSegZ={0.0,1/3*geoZone1.lengthY,2/3*geoZone1.lengthY,geoZone1.lengthY},
        nY=3, nZ=3,
        angleDegAzi=0.0,
        angleDegTil=180.0,
        heatSource=true,
        layerWithHeatSource = 1,
        constructionData=construction3)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-40,-40})));
        // floor heating
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D bottom2(
        equidistantGrid = false,
        pointsSegY={0.0,(geoZone2.lengthX-window2.width)/2,(geoZone2.lengthX-window2.width)/2+window2.width,geoZone2.lengthX},
        pointsSegZ={0.0,1/3*geoZone2.lengthY,2/3*geoZone2.lengthY,geoZone2.lengthY},
        nY=3, nZ=3,
        angleDegAzi=0.0,
        angleDegTil=180.0,
        heatSource=true,
        layerWithHeatSource = 1,
        constructionData=construction3)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={40,-40})));

      BuildingSystems.Buildings.Constructions.Windows.Window window1(
        height=geoZone1.heightWindow,
        width=geoZone1.widthWindow,
        thicknessPane=0.003,
        angleDegAzi=0.0,
        angleDegTil=90.0)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-28,-20})));
      BuildingSystems.Buildings.Constructions.Windows.Window window2(
        height=geoZone2.heightWindow,
        width=geoZone2.widthWindow,
        thicknessPane=0.003,
        angleDegAzi=0.0,
        angleDegTil=90.0)
        annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={52,-20})));
      BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall7(
        equidistantGrid = false,
        pointsSegY={0.0,1/3*geoZone1.lengthY,2/3*geoZone1.lengthY,geoZone1.lengthY},
        pointsSegZ={0.0,0.076,0.076+window1.height,geoZone1.lengthZ},
        nY=3, nZ=3,
        angleDegAzi=-90.0,
        angleDegTil=90.0,
        constructionData=construction2)
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
        connect(wall1.toSurfacePort_1, zone1.toConstructionPorts1[1])
        annotation (
          Line(
          points={{-58,0},{-54,0},{-54,4},{-51,4}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(wall2.toSurfacePort_1, zone1.toConstructionPorts2[1])
        annotation (
          Line(
          points={{-54,20},{-54,16},{-34,16},{-34,11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(zone1.toConstructionPorts2[2], ceiling1.toSurfacePort_1)
        annotation (Line(
          points={{-38,11},{-38,16},{-40,16},{-40,38}},
          color={127,0,0},
          smooth=Smooth.None));
        connect(wall7.toSurfacePort_1, zone1.toConstructionPorts3[1])
        annotation (
          Line(
          points={{-2,0},{-16,0},{-16,-4},{-29,-4}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(wall6.toSurfacePort_1, zone1.toConstructionPorts4[1])
        annotation (
          Line(
          points={{-52,-18},{-52,-16},{-40.6667,-16},{-40.6667,-11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(window1.toSurfacePort_1, zone1.toConstructionPorts4[2])
        annotation (
         Line(
          points={{-28,-18.2},{-28,-16},{-42,-16},{-42,-11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(bottom1.toSurfacePort_1, zone1.toConstructionPorts4[3])
        annotation (
         Line(
          points={{-40,-38},{-40,-16},{-43.3333,-16},{-43.3333,-11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(wall8.toSurfacePort_1, zone1.toConstructionPorts4[4])
        annotation (
          Line(points={{-62,-30},{-62,-16},{-44.6667,-16},{-44.6667,-11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(wall10.toSurfacePort_1, zone1.toConstructionPorts4[5])
        annotation (
          Line(
          points={{-16,-28},{-16,-16},{-46,-16},{-46,-11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
        connect(zone1.toConstructionPorts4[6], wall11.toSurfacePort_1)
        annotation (
          Line(
          points={{-47.3333,-11},{-47.3333,-16},{-16,-16},{-16,-26},{-4,-26},{
            -4,-36}},
          color={127,0,0},
          smooth=Smooth.None));
      //////////////////////////////////////////

      connect(wall5.toSurfacePort_1, zone2.toConstructionPorts4[1]) annotation (
          Line(
          points={{30,-20},{30,-16},{39.2,-16},{39.2,-11}},
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

      connect(zone2.toConstructionPorts6[1], ceiling2.toSurfacePort_1)
        annotation (Line(
          points={{31,-6},{31,16},{40,16},{40,38}},
          color={127,0,0},
          smooth=Smooth.None));

       connect(bottom2.toSurfacePort_1, zone2.toConstructionPorts5[1]) annotation (
         Line(
          points={{40,-38},{40,-16},{49,-16},{49,6}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

       connect(wall9.toSurfacePort_1, zone2.toConstructionPorts4[2]) annotation (
          Line(points={{18,-30},{18,-16},{37.6,-16},{37.6,-11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

     connect(wall12.toSurfacePort_1, zone2.toConstructionPorts4[3]) annotation (
          Line(
          points={{62,-26},{62,-16},{36,-16},{36,-11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

     connect(wall13.toSurfacePort_1, zone2.toConstructionPorts4[4]) annotation (
          Line(
          points={{74,-36},{74,-16},{34.4,-16},{34.4,-11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

     connect(window2.toSurfacePort_1, zone2.toConstructionPorts4[5]) annotation (
         Line(
          points={{52,-18.2},{52,-16},{32.8,-16},{32.8,-11}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      //////////////////////////////////////////
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

      //////////////////////////////////////////
      // Surface To Ambient (18)

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
      connect(window1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7])
        annotation (Line(
          points={{-28,-21.8},{-28,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(window2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8])
        annotation (Line(
          points={{52,-21.8},{52,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9])
        annotation (Line(
          points={{30,-24},{30,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(bottom1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10])
        annotation (Line(
          points={{-40,-42},{-40,-46},{-80,-46},{-80,3.55271e-015},{-89.9,
              3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(bottom2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[11])
        annotation (Line(
          points={{40,-42},{40,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
       connect(wall2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[12])
        annotation (Line(
          points={{-54,24},{-54,46},{-80,46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[13])
       annotation (
          Line(points={{-62,-34},{-62,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[14])
        annotation (Line(
          points={{18,-34},{18,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[15])
        annotation (Line(
          points={{-4,-40},{-4,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[16])
        annotation (Line(
          points={{-16,-32},{-16,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall12.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[17])
        annotation (Line(
          points={{62,-30},{62,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(wall13.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[18])
        annotation (Line(
          points={{74,-40},{74,-46},{-80,-46},{-80,3.55271e-015},{-89.9,3.55271e-015}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));

      // + Bottom To Ground (2)

      connect(bottom1.heatSourcePorts[2,2],conHeatSourcesPorts[1]);
      connect(bottom2.heatSourcePorts[2,2],conHeatSourcesPorts[2]);

      // that makes 20 surfaces (5 each wall + 5 sideparts of windows)
      // 18 are connected to Ambient

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

  annotation(experiment(StartTime=0, StopTime=86400),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/ThermalModelHouse3Dwindow.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="Model of the thermal model house in a 3D description")}),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(
info="<html>
<p>Model of the thermal model house in a 3D description - special case ThermalModelHouse3D with window</p>
<p><br/>(Left-) Zone 1: 3x3 discretised walls, according to the window size, 1D airvolume.</p>
<p><br/>(Right-) Zone 2: 3x3 discretised walls/ (3x3x3) discretised airvolume, according to the window size.</p>
<p><img src=\"modelica://BuildingSystems/Resources/Images/Airvolume3Ddoc/therModelhouse/modelhouseWin.JPG\" alt=\"ThermalModelhouse\"/></p>
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
end ThermalModelHouse3Dwindow;
