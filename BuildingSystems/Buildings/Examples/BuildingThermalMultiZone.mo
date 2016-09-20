within BuildingSystems.Buildings.Examples;
model BuildingThermalMultiZone
  "Model of the storey of an office building"
  extends Modelica.Icons.Example;

  record ConstructionFacade
    "Facade construction"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=4,
      thickness={0.015,0.200,0.150,0.020},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.HighGradePlaster(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.ExpandedPolystyrene(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.HighGradePlaster()});
  end ConstructionFacade;

  record ConstructionInnerWall
    "Inner wall construction"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=3,
      thickness={0.015,0.120,0.015},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.HighGradePlaster(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.DIN_V_4108.Kalksandstein1800(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.HighGradePlaster()});
  end ConstructionInnerWall;

  record ConstructionBottom
    "Bottom construction"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=3,
      thickness={0.020,0.060,0.200},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.WoodFibreInsulation(),
        BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea.Concrete()});
  end ConstructionBottom;

  record ConstructionDoor
    "Bottom construction"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={0.030},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood()});
  end ConstructionDoor;

  model Building
    "Building model of storey of an office building"
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones = 13,
    surfacesToAmbient(nSurfaces=28),
    nSurfacesSolid=13,
    surfacesToSolids(nSurfaces=nSurfacesSolid),
    convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
    useAirPathes = false,
    heatSources = true,
    nHeatSources = 13);
    parameter Modelica.SIunits.Length heightRooms = 3.0
      "Height of all rooms";
    parameter BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal14 constructionWindow;

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office1(
      V=bottom1.width*bottom1.height*heightRooms,
      height=heightRooms,
      nConstructions2=2,
      nConstructions1=1,
      nConstructions3=1,
      nConstructions4=2,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-150,50},{-130,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office2(
      V=bottom2.width*bottom2.height*heightRooms,
      height=heightRooms,
      nConstructions2=2,
      nConstructions1=1,
      nConstructions3=1,
      nConstructions4=2,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office3(
      V=bottom3.width*bottom3.height*heightRooms,
      height=heightRooms,
      nConstructions2=2,
      nConstructions1=1,
      nConstructions3=1,
      nConstructions4=2,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office4(
      V=bottom4.width*bottom4.height*heightRooms,
      height=heightRooms,
      nConstructions2=2,
      nConstructions1=1,
      nConstructions3=1,
      nConstructions4=2,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office5(
      V=bottom5.width*bottom5.height*heightRooms,
      height=heightRooms,
      nConstructions2=2,
      nConstructions1=1,
      nConstructions3=1,
      nConstructions4=2,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{10,50},{30,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office6(
      V=bottom6.width*bottom6.height*heightRooms,
      height=heightRooms,
      nConstructions2=2,
      nConstructions1=1,
      nConstructions3=1,
      nConstructions4=2,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{50,50},{70,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office7(
      V=bottom7.width*bottom7.height*heightRooms,
      height=heightRooms,
      nConstructions2=2,
      nConstructions1=1,
      nConstructions3=1,
      nConstructions4=2,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{90,50},{110,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office8(
      V=bottom8.width*bottom8.height*heightRooms,
      height=heightRooms,
      nConstructions2=2,
      nConstructions1=1,
      nConstructions3=1,
      nConstructions4=2,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{130,50},{150,70}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall1(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom1.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-160,60})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall2(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom1.height)
      annotation (Placement(transformation(extent={{-130,50},{-110,70}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall3(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom2.height)
      annotation (Placement(transformation(extent={{-90,50},{-70,70}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall4(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom3.height)
      annotation (Placement(transformation(extent={{-50,50},{-30,70}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall5(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom4.height)
      annotation (Placement(transformation(extent={{-10,50},{10,70}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall6(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom5.height)
      annotation (Placement(transformation(extent={{30,50},{50,70}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall7(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom6.height)
      annotation (Placement(transformation(extent={{70,50},{90,70}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall8(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom7.height)
      annotation (Placement(transformation(extent={{110,50},{130,70}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall9(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom8.height)
      annotation (Placement(transformation(extent={{150,50},{170,70}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall10(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom1.width,
      nInnSur=1,
      AInnSur={window1.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-140,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall11(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom2.width,
      nInnSur=1,
      AInnSur={window2.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-100,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall12(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom3.width,
      nInnSur=1,
      AInnSur={window3.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-60,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall13(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom4.width,
      nInnSur=1,
      AInnSur={window4.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-20,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall14(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom5.width,
      nInnSur=1,
      AInnSur={window5.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall15(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom6.width,
      nInnSur=1,
      AInnSur={window6.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={60,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall16(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom7.width,
      nInnSur=1,
      AInnSur={window7.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={100,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall17(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom8.width,
      nInnSur=1,
      AInnSur={window8.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={140,80})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed corridor(
      V=bottom13.width*bottom13.height*heightRooms,
      height=heightRooms,
      nConstructions1=1,
      nConstructions3=1,
      nConstructions2=8,
      nConstructions4=4,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-10,10},{10,30}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed restroom1(
      V=bottom10.width*bottom10.height*heightRooms,
      height=heightRooms,
      nConstructions3=1,
      nConstructions2=1,
      nConstructions4=2,
      nConstructions1=1,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{90,-30},{110,-10}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed restroom2(
      V=bottom11.width*bottom11.height*heightRooms,
      height=heightRooms,
      nConstructions1=1,
      nConstructions3=1,
      nConstructions2=1,
      nConstructions4=2,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{130,-30},{150,-10}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed bullpen(
      V=bottom9.width*bottom9.height*heightRooms,
      height=heightRooms,
      nConstructions2=1,
      nConstructions3=2,
      nConstructions1=2,
      nConstructions4=3,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-70,-30},{-50,-10}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed conferenceRoom(
      V=bottom12.width*bottom12.height*heightRooms,
      height=heightRooms,
      nConstructions2=2,
      nConstructions4=3,
      nConstructions3=1,
      nConstructions1=1,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{110,-70},{130,-50}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall18(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom1.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-140,40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall19(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom2.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-100,40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall20(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom3.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-60,40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall21(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom4.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-20,40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall22(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom5.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall23(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom6.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={60,40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall24(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom7.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={100,40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall25(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom8.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={140,40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall26(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=3.0,
      width=bottom9.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-60,0})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall27(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom10.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={100,0})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall28(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom11.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={140,0})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall29(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom10.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={98,-40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall30(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom11.width)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={140,-40})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall31(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom12.width,
      nInnSur=1,
      AInnSur={window11.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={120,-80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall32(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom9.width,
      nInnSur=1,
      AInnSur={window10.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-60,-80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall33(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom10.height)
      annotation (Placement(transformation(extent={{70,-30},{90,-10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall34(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom12.height)
      annotation (Placement(transformation(extent={{70,-70},{90,-50}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall35(
      redeclare ConstructionInnerWall constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom11.height)
      annotation (Placement(transformation(extent={{110,-30},{130,-10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall36(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom13.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-160,20})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall37(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom9.height,
      nInnSur=1,
      AInnSur={window9.A})
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-160,-20})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall38(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom13.height)
      annotation (Placement(transformation(extent={{150,10},{170,30}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall39(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom11.height)
      annotation (Placement(transformation(extent={{150,-30},{170,-10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall40(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom12.height)
      annotation (Placement(transformation(extent={{150,-70},{170,-50}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom1(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=4.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-130,28})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom2(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=4.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-90,28})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom3(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=4.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-50,28})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom4(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=4.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-30,28})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom5(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=4.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={30,28})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom6(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=4.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={70,28})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom7(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=4.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={110,28})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom8(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=4.0,
      width=3.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={130,28})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom9(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=8.0,
      width=18.0+wall2.constructionData.thicknessTotal+wall3.constructionData.thicknessTotal
        +wall4.constructionData.thicknessTotal+wall5.constructionData.thicknessTotal
        +wall6.constructionData.thicknessTotal)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-48,-44})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom10(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=bottom9.height-bottom12.height-wall29.constructionData.thicknessTotal,
      width=bottom12.width/2.0-wall35.constructionData.thicknessTotal/2.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={88,-46})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom11(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=bottom9.height-bottom12.height-wall30.constructionData.thicknessTotal,
      width=bottom12.width/2.0-wall35.constructionData.thicknessTotal/2.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={150,-46})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom12(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=3.0,
      width=6.0+wall35.constructionData.thicknessTotal)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={130,-90})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom13(
      redeclare ConstructionBottom constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      height=2.0,
      width=24.0+wall2.constructionData.thicknessTotal+wall3.constructionData.thicknessTotal
        +wall4.constructionData.thicknessTotal+wall5.constructionData.thicknessTotal
        +wall6.constructionData.thicknessTotal+wall7.constructionData.thicknessTotal
        +wall8.constructionData.thicknessTotal)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={10,-6})));
    BuildingSystems.Buildings.Constructions.Windows.Window window1(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      UVal = (1.0 - window1.framePortion) * constructionWindow.UValGla + window1.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-150,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window2(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      UVal = (1.0 - window2.framePortion) * constructionWindow.UValGla + window2.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-110,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window3(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      UVal = (1.0 - window3.framePortion) * constructionWindow.UValGla + window3.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-70,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window4(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      UVal = (1.0 - window4.framePortion) * constructionWindow.UValGla + window4.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-30,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window5(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      UVal = (1.0 - window5.framePortion) * constructionWindow.UValGla + window5.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={10,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window6(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      UVal = (1.0 - window6.framePortion) * constructionWindow.UValGla + window6.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={50,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window7(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      UVal = (1.0 - window7.framePortion) * constructionWindow.UValGla + window7.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={90,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window8(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      UVal = (1.0 - window8.framePortion) * constructionWindow.UValGla + window8.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={130,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window9(
      height=1.5,
      width=5.0,
      angleDegAzi=90.0,
      angleDegTil=90.0,
      UVal = (1.0 - window9.framePortion) * constructionWindow.UValGla + window9.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-168,-30})));
    BuildingSystems.Buildings.Constructions.Windows.Window window10(
      height=2.5,
      width=16.0,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      UVal = (1.0 - window10.framePortion) * constructionWindow.UValGla + window10.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-50,-90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window11(
      height=2.5,
      width=5.0,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      UVal = (1.0 - window11.framePortion) * constructionWindow.UValGla + window11.framePortion * constructionWindow.UValFra,
      tauDir0 = constructionWindow.g,
      tauDif = constructionWindow.g)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={110,-90})));
  equation
    connect(wall10.toSurfacePort_1, office1.toConstructionPorts2[1]) annotation (
        Line(points={{-140,78},{-138,78},{-138,71},{-134,71}}, color={0,0,0}));
    connect(wall11.toSurfacePort_1, office2.toConstructionPorts2[1]) annotation (
        Line(points={{-100,78},{-98,78},{-98,71},{-94,71}}, color={0,0,0}));
    connect(wall12.toSurfacePort_1, office3.toConstructionPorts2[1]) annotation (
        Line(points={{-60,78},{-58,78},{-58,71},{-54,71}}, color={0,0,0}));
    connect(wall13.toSurfacePort_1, office4.toConstructionPorts2[1]) annotation (
        Line(points={{-20,78},{-18,78},{-18,71},{-14,71}}, color={0,0,0}));
    connect(wall14.toSurfacePort_1, office5.toConstructionPorts2[1])
      annotation (Line(points={{20,78},{22,78},{22,71},{26,71}}, color={0,0,0}));
    connect(wall15.toSurfacePort_1, office6.toConstructionPorts2[1])
      annotation (Line(points={{60,78},{62,78},{62,71},{66,71}}, color={0,0,0}));
    connect(wall16.toSurfacePort_1, office7.toConstructionPorts2[1]) annotation (
        Line(points={{100,78},{102,78},{102,71},{106,71}}, color={0,0,0}));
    connect(wall17.toSurfacePort_1, office8.toConstructionPorts2[1]) annotation (
        Line(points={{140,78},{142,78},{142,71},{146,71}}, color={0,0,0}));
    connect(wall1.toSurfacePort_1, office1.toConstructionPorts1[1]) annotation (
        Line(points={{-158,60},{-154,60},{-154,64},{-151,64}}, color={0,0,0}));
    connect(office1.toConstructionPorts3[1], wall2.toSurfacePort_1) annotation (
        Line(points={{-129,56},{-125.5,56},{-125.5,60},{-122,60}}, color={127,0,0}));
    connect(wall2.toSurfacePort_2, office2.toConstructionPorts1[1]) annotation (
        Line(points={{-118,60},{-116,60},{-116,64},{-111,64}}, color={0,0,0}));
    connect(office2.toConstructionPorts3[1], wall3.toSurfacePort_1) annotation (
        Line(points={{-89,56},{-86,56},{-86,60},{-82,60}}, color={127,0,0}));
    connect(wall3.toSurfacePort_2, office3.toConstructionPorts1[1]) annotation (
        Line(points={{-78,60},{-74,60},{-74,64},{-71,64}}, color={0,0,0}));
    connect(office3.toConstructionPorts3[1], wall4.toSurfacePort_1) annotation (
        Line(points={{-49,56},{-46,56},{-46,60},{-42,60}}, color={127,0,0}));
    connect(wall4.toSurfacePort_2, office4.toConstructionPorts1[1]) annotation (
        Line(points={{-38,60},{-36,60},{-36,64},{-31,64}}, color={0,0,0}));
    connect(office4.toConstructionPorts3[1], wall5.toSurfacePort_1) annotation (
        Line(points={{-9,56},{-6,56},{-6,60},{-2,60}}, color={127,0,0}));
    connect(wall5.toSurfacePort_2, office5.toConstructionPorts1[1])
      annotation (Line(points={{2,60},{6,60},{6,64},{9,64}}, color={0,0,0}));
    connect(office5.toConstructionPorts3[1], wall6.toSurfacePort_1) annotation (
        Line(points={{31,56},{34,56},{34,60},{38,60}}, color={127,0,0}));
    connect(wall6.toSurfacePort_2, office6.toConstructionPorts1[1])
      annotation (Line(points={{42,60},{46,60},{46,64},{49,64}}, color={0,0,0}));
    connect(office6.toConstructionPorts3[1], wall7.toSurfacePort_1) annotation (
        Line(points={{71,56},{74,56},{74,60},{78,60}}, color={127,0,0}));
    connect(wall7.toSurfacePort_2, office7.toConstructionPorts1[1])
      annotation (Line(points={{82,60},{86,60},{86,64},{89,64}}, color={0,0,0}));
    connect(office7.toConstructionPorts3[1], wall8.toSurfacePort_1) annotation (
        Line(points={{111,56},{114,56},{114,60},{118,60}}, color={127,0,0}));
    connect(wall8.toSurfacePort_2, office8.toConstructionPorts1[1]) annotation (
        Line(points={{122,60},{126,60},{126,64},{129,64}}, color={0,0,0}));
    connect(office8.toConstructionPorts3[1], wall9.toSurfacePort_1) annotation (
        Line(points={{151,56},{156,56},{156,60},{158,60}}, color={127,0,0}));
    connect(wall18.toSurfacePort_2, office1.toConstructionPorts4[1])
      annotation (Line(points={{-140,42},{-142,42},{-142,49}}, color={0,0,0}));
    connect(wall19.toSurfacePort_2, office2.toConstructionPorts4[1]) annotation (
        Line(points={{-100,42},{-102,42},{-102,49},{-102,49}}, color={0,0,0}));
    connect(wall20.toSurfacePort_2, office3.toConstructionPorts4[1]) annotation (
        Line(points={{-60,42},{-62,42},{-62,49},{-62,49}}, color={0,0,0}));
    connect(wall21.toSurfacePort_2, office4.toConstructionPorts4[1])
      annotation (Line(points={{-20,42},{-22,42},{-22,49}}, color={0,0,0}));
    connect(wall22.toSurfacePort_2, office5.toConstructionPorts4[1])
      annotation (Line(points={{20,42},{20,42},{20,49},{18,49}}, color={0,0,0}));
    connect(wall23.toSurfacePort_2, office6.toConstructionPorts4[1])
      annotation (Line(points={{60,42},{58,42},{58,49},{58,49}}, color={0,0,0}));
    connect(wall24.toSurfacePort_2, office7.toConstructionPorts4[1]) annotation (
        Line(points={{100,42},{100,42},{100,49},{98,49}}, color={0,0,0}));
    connect(wall25.toSurfacePort_2, office8.toConstructionPorts4[1]) annotation (
        Line(points={{140,42},{140,42},{140,49},{138,49}}, color={0,0,0}));
    connect(window1.toSurfacePort_1, office1.toConstructionPorts2[2]) annotation
      (Line(points={{-150,88},{-150,88},{-150,74},{-138,74},{-138,71}}, color={0,0,0}));
    connect(window2.toSurfacePort_1, office2.toConstructionPorts2[2]) annotation
      (Line(points={{-110,88},{-110,88},{-110,74},{-98,74},{-98,71}}, color={0,0,0}));
    connect(window3.toSurfacePort_1, office3.toConstructionPorts2[2]) annotation
      (Line(points={{-70,88},{-70,88},{-70,74},{-58,74},{-58,71}}, color={0,0,0}));
    connect(window4.toSurfacePort_1, office4.toConstructionPorts2[2]) annotation
      (Line(points={{-30,88},{-30,74},{-18,74},{-18,71}}, color={0,0,0}));
    connect(window5.toSurfacePort_1, office5.toConstructionPorts2[2])
      annotation (Line(points={{10,88},{10,74},{22,74},{22,71}}, color={0,0,0}));
    connect(window6.toSurfacePort_1, office6.toConstructionPorts2[2]) annotation
      (Line(points={{50,88},{50,88},{50,74},{62,74},{62,71}}, color={0,0,0}));
    connect(window7.toSurfacePort_1, office7.toConstructionPorts2[2]) annotation
      (Line(points={{90,88},{90,88},{90,74},{102,74},{102,71}}, color={0,0,0}));
    connect(window8.toSurfacePort_1, office8.toConstructionPorts2[2]) annotation
      (Line(points={{130,88},{130,88},{130,76},{130,74},{142,74},{142,71}}, color={0,0,0}));
    connect(bottom1.toSurfacePort_1, office1.toConstructionPorts4[2]) annotation
      (Line(points={{-130,30},{-130,30},{-130,46},{-130,44},{-146,44},{-146,49}},color={0,0,0}));
    connect(bottom2.toSurfacePort_1, office2.toConstructionPorts4[2]) annotation
      (Line(points={{-90,30},{-90,30},{-90,46},{-106,46},{-106,49}}, color={0,0,0}));
    connect(bottom3.toSurfacePort_1, office3.toConstructionPorts4[2]) annotation
      (Line(points={{-50,30},{-50,30},{-50,44},{-50,46},{-66,46},{-66,49}}, color={0,0,0}));
    connect(bottom4.toSurfacePort_1, office4.toConstructionPorts4[2]) annotation
      (Line(points={{-30,30},{-30,30},{-30,44},{-26,44},{-26,49}}, color={0,0,0}));
    connect(bottom5.toSurfacePort_1, office5.toConstructionPorts4[2]) annotation
      (Line(points={{30,30},{30,30},{30,44},{14,44},{14,49}}, color={0,0,0}));
    connect(bottom6.toSurfacePort_1, office6.toConstructionPorts4[2]) annotation
      (Line(points={{70,30},{70,30},{70,46},{54,46},{54,49}}, color={0,0,0}));
    connect(bottom7.toSurfacePort_1, office7.toConstructionPorts4[2]) annotation
      (Line(points={{110,30},{110,44},{94,44},{94,49}}, color={0,0,0}));
    connect(bottom8.toSurfacePort_1, office8.toConstructionPorts4[2]) annotation
      (Line(points={{130,30},{130,30},{130,46},{134,46},{134,49}}, color={0,0,0}));
    connect(wall36.toSurfacePort_1, corridor.toConstructionPorts1[1]) annotation
      (Line(points={{-158,20},{-158,20},{-20,20},{-20,24},{-11,24}}, color={0,0,0}));
    connect(corridor.toConstructionPorts3[1], wall38.toSurfacePort_1) annotation
      (Line(points={{11,16},{20,16},{20,20},{158,20}}, color={127,0,0}));
    connect(wall18.toSurfacePort_1, corridor.toConstructionPorts2[1]) annotation
      (Line(points={{-140,38},{-140,34},{7.5,34},{7.5,31}}, color={0,0,0}));
    connect(wall19.toSurfacePort_1, corridor.toConstructionPorts2[2]) annotation
      (Line(points={{-100,38},{-100,34},{6.5,34},{6.5,31}}, color={0,0,0}));
    connect(wall20.toSurfacePort_1, corridor.toConstructionPorts2[3]) annotation
      (Line(points={{-60,38},{-62,38},{-62,34},{5.5,34},{5.5,31}}, color={0,0,0}));
    connect(wall21.toSurfacePort_1, corridor.toConstructionPorts2[4]) annotation
      (Line(points={{-20,38},{-20,34},{4.5,34},{4.5,31}}, color={0,0,0}));
    connect(wall22.toSurfacePort_1, corridor.toConstructionPorts2[5]) annotation
      (Line(points={{20,38},{20,34},{3.5,34},{3.5,31}}, color={0,0,0}));
    connect(wall23.toSurfacePort_1, corridor.toConstructionPorts2[6]) annotation
      (Line(points={{60,38},{60,34},{2.5,34},{2.5,31}}, color={0,0,0}));
    connect(wall24.toSurfacePort_1, corridor.toConstructionPorts2[7]) annotation
      (Line(points={{100,38},{100,34},{1.5,34},{1.5,31}}, color={0,0,0}));
    connect(wall25.toSurfacePort_1, corridor.toConstructionPorts2[8]) annotation
      (Line(points={{140,38},{140,38},{140,30},{140,34},{0.5,34},{0.5,31}}, color={0,0,0}));
    connect(wall26.toSurfacePort_2, corridor.toConstructionPorts4[1])
      annotation (Line(points={{-60,2},{-60,4},{-1,4},{-1,9}}, color={0,0,0}));
    connect(wall27.toSurfacePort_2, corridor.toConstructionPorts4[2]) annotation
      (Line(points={{100,2},{100,2},{100,4},{-3,4},{-3,9}}, color={0,0,0}));
    connect(wall28.toSurfacePort_2, corridor.toConstructionPorts4[3])
      annotation (Line(points={{140,2},{140,4},{-5,4},{-5,9}}, color={0,0,0}));
    connect(wall26.toSurfacePort_1, bullpen.toConstructionPorts2[1]) annotation (
        Line(points={{-60,-2},{-60,-6},{-56,-6},{-56,-9}}, color={0,0,0}));
    connect(bullpen.toConstructionPorts3[1], wall33.toSurfacePort_1) annotation (
        Line(points={{-49,-24},{-40,-24},{-40,-20},{78,-20}}, color={127,0,0}));
    connect(bullpen.toConstructionPorts1[1], wall37.toSurfacePort_1) annotation (
        Line(points={{-71,-18},{-76,-18},{-80,-18},{-80,-20},{-158,-20}}, color={127,0,0}));
    connect(wall32.toSurfacePort_1, bullpen.toConstructionPorts4[1]) annotation (
        Line(points={{-60,-78},{-60,-31},{-61.3333,-31}}, color={0,0,0}));
    connect(bullpen.toConstructionPorts4[2], bottom9.toSurfacePort_1) annotation
      (Line(points={{-64,-31},{-64,-38},{-48,-38},{-48,-42}}, color={127,0,0}));
    connect(corridor.toConstructionPorts4[4], bottom13.toSurfacePort_1)
      annotation (Line(points={{-7,9},{-4,9},{-4,0},{10,0},{10,-4}}, color={127,0,0}));
    connect(window9.toSurfacePort_1, bullpen.toConstructionPorts1[2]) annotation
      (Line(points={{-166,-30},{-122,-30},{-80,-30},{-80,-14},{-71,-14}}, color={0,0,0}));
    connect(window10.toSurfacePort_1, bullpen.toConstructionPorts4[3])
      annotation (Line(points={{-50,-88},{-50,-88},{-50,-70},{-66.6667,-70},{-66.6667,-31}}, color={0,0,0}));
    connect(restroom1.toConstructionPorts3[1], wall35.toSurfacePort_1)
      annotation (Line(points={{111,-24},{114,-24},{114,-20},{118,-20}}, color={127,0,0}));
    connect(wall35.toSurfacePort_2, restroom2.toConstructionPorts1[1])
      annotation (Line(points={{122,-20},{126,-20},{126,-16},{129,-16}}, color={0,0,0}));
    connect(restroom2.toConstructionPorts3[1], wall39.toSurfacePort_1)
      annotation (Line(points={{151,-24},{154,-24},{154,-20},{158,-20}}, color={127,0,0}));
    connect(wall27.toSurfacePort_1, restroom1.toConstructionPorts2[1])
      annotation (Line(points={{100,-2},{100,-2},{100,-6},{104,-6},{104,-9}},color={0,0,0}));
    connect(wall28.toSurfacePort_1, restroom2.toConstructionPorts2[1])
      annotation (Line(points={{140,-2},{140,-6},{144,-6},{144,-9}}, color={0,0,0}));
    connect(restroom1.toConstructionPorts4[1], wall29.toSurfacePort_2)
      annotation (Line(points={{98,-31},{98,-34},{98,-34},{98,-38}}, color={127,0,0}));
    connect(restroom2.toConstructionPorts4[1], wall30.toSurfacePort_2)
      annotation (Line(points={{138,-31},{138,-36},{140,-36},{140,-38}}, color={127,0,0}));
    connect(bottom10.toSurfacePort_1, restroom1.toConstructionPorts4[2])
      annotation (Line(points={{88,-44},{88,-36},{94,-36},{94,-31}}, color={0,0,0}));
    connect(bottom11.toSurfacePort_1, restroom2.toConstructionPorts4[2])
      annotation (Line(points={{150,-44},{150,-34},{134,-34},{134,-31}}, color={0,0,0}));
    connect(wall29.toSurfacePort_1, conferenceRoom.toConstructionPorts2[1])
      annotation (Line(points={{98,-42},{98,-46},{126,-46},{126,-49}}, color={0,0,0}));
    connect(wall30.toSurfacePort_1, conferenceRoom.toConstructionPorts2[2])
      annotation (Line(points={{140,-42},{140,-42},{140,-46},{122,-46},{122,-49}},color={0,0,0}));
    connect(conferenceRoom.toConstructionPorts4[1], wall31.toSurfacePort_1)
      annotation (Line(points={{118.667,-71},{118.667,-74},{120,-74},{120,-78}},color={127,0,0}));
    connect(conferenceRoom.toConstructionPorts3[1], wall40.toSurfacePort_1)
      annotation (Line(points={{131,-64},{136,-64},{140,-64},{140,-60},{158,-60}},color={127,0,0}));
    connect(wall34.toSurfacePort_2, conferenceRoom.toConstructionPorts1[1])
      annotation (Line(points={{82,-60},{100,-60},{100,-56},{109,-56}}, color={0,0,0}));
    connect(bottom12.toSurfacePort_1, conferenceRoom.toConstructionPorts4[2])
      annotation (Line(points={{130,-88},{130,-88},{130,-76},{116,-76},{116,-71}},color={0,0,0}));
    connect(window11.toSurfacePort_1, conferenceRoom.toConstructionPorts4[3])
      annotation (Line(points={{110,-88},{110,-74},{113.333,-74},{113.333,-71}},color={0,0,0}));
    connect(restroom1.toConstructionPorts1[1], wall33.toSurfacePort_2)
      annotation (Line(points={{89,-16},{84,-16},{84,-20},{82,-20}}, color={127,0,0}));
    connect(bullpen.toConstructionPorts3[2], wall34.toSurfacePort_1)
      annotation (Line(points={{-49,-22},{-40,-22},{-40,-20},{-24,-20},{0,-20},{0,-60},{78,-60}},color={127,0,0}));
    connect(wall36.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1])
      annotation (Line(points={{-162,20},{-166,20},{-166,0},{-173.9,0}}, color={0,0,0}));
    connect(wall1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2])
      annotation (Line(points={{-162,60},{-166,60},{-166,3.55271e-015},{-173.9,3.55271e-015}},color={0,0,0}));
    connect(window1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3])
      annotation (Line(points={{-150,92},{-150,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4])
      annotation (Line(points={{-140,82},{-140,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(window2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5])
      annotation (Line(points={{-110,92},{-110,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6])
      annotation (Line(points={{-100,82},{-100,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(window3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7])
      annotation (Line(points={{-70,92},{-70,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall12.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8])
      annotation (Line(points={{-60,82},{-60,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(window4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9])
      annotation (Line(points={{-30,92},{-30,92},{-30,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall13.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10])
      annotation (Line(points={{-20,82},{-20,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(window5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[11])
      annotation (Line(points={{10,92},{10,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall14.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[12])
      annotation (Line(points={{20,82},{20,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(window6.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[13])
      annotation (Line(points={{50,92},{50,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall15.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[14])
      annotation (Line(points={{60,82},{60,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(window7.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[15])
      annotation (Line(points={{90,92},{90,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall16.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[16])
      annotation (Line(points={{100,82},{100,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(window8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[17])
      annotation (Line(points={{130,92},{130,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall17.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[18])
      annotation (Line(points={{140,82},{140,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[19])
      annotation (Line(points={{162,60},{166,60},{166,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall38.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[20])
      annotation (Line(points={{162,20},{166,20},{166,96},{-166,96},{-166,3.55271e-015},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(window9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[21])
      annotation (Line(points={{-170,-30},{-173.9,-30},{-173.9,3.55271e-015}},color={0,0,0}));
    connect(wall32.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[22])
      annotation (Line(points={{-60,-82},{-60,-82},{-60,-98},{-173.9,-98},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(window10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[23])
      annotation (Line(points={{-50,-92},{-50,-98},{-173.9,-98},{-173.9,3.55271e-015}},color={0,0,0}));
    connect(window11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[24])
      annotation (Line(points={{110,-92},{110,-98},{-173.9,-98},{-173.9,3.55271e-015}},color={0,0,0}));
    connect(wall40.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[25])
      annotation (Line(points={{162,-60},{166,-60},{166,-98},{-173.9,-98},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall39.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[26])
      annotation (Line(points={{162,-20},{166,-20},{166,-98},{-173.9,-98},{-173.9,3.55271e-015}}, color={0,0,0}));
    connect(wall31.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[27])
      annotation (Line(points={{120,-82},{120,-82},{120,-98},{-174,-98},{-174,-50},{-173.9,-50},{-173.9,0}}, color={0,0,0}));
    connect(wall37.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[28])
      annotation (Line(points={{-162,-20},{-166,-20},{-166,3.55271e-015},{-173.9,3.55271e-015}},color={0,0,0}));
    connect(bottom1.toSurfacePort_2, surfacesToSolids.toConstructionPorts[1])
      annotation (Line(points={{-130,26},{-130,26},{-130,-68},{-130,-64},{-130,-66},{0,-66},{0,-112.8}}, color={0,0,0}));
    connect(bottom2.toSurfacePort_2, surfacesToSolids.toConstructionPorts[2])
      annotation (Line(points={{-90,26},{-90,26},{-90,-66},{8.88178e-016,-66},{8.88178e-016,-112.8}}, color={0,0,0}));
    connect(bottom3.toSurfacePort_2, surfacesToSolids.toConstructionPorts[3])
      annotation (Line(points={{-50,26},{-50,12},{-90,12},{-90,-66},{8.88178e-016,-66},{8.88178e-016,-112.8}}, color={0,0,0}));
    connect(bottom4.toSurfacePort_2, surfacesToSolids.toConstructionPorts[4])
      annotation (Line(points={{-30,26},{-30,-66},{0,-66},{0,-112.8}}, color={0,0,0}));
    connect(bottom5.toSurfacePort_2, surfacesToSolids.toConstructionPorts[5])
      annotation (Line(points={{30,26},{30,26},{30,-66},{8.88178e-016,-66},{8.88178e-016,-112.8}}, color={0,0,0}));
    connect(bottom6.toSurfacePort_2, surfacesToSolids.toConstructionPorts[6])
      annotation (Line(points={{70,26},{70,26},{70,-66},{8.88178e-016,-66},{8.88178e-016,-112.8}}, color={0,0,0}));
    connect(bottom7.toSurfacePort_2, surfacesToSolids.toConstructionPorts[7])
      annotation (Line(points={{110,26},{110,20},{70,20},{70,-66},{8.88178e-016,-66},{8.88178e-016,-112.8}}, color={0,0,0}));
    connect(bottom8.toSurfacePort_2, surfacesToSolids.toConstructionPorts[8])
      annotation (Line(points={{130,26},{130,20},{70,20},{70,-66},{8.88178e-016,-66},{8.88178e-016,-112.8}}, color={0,0,0}));
    connect(bottom9.toSurfacePort_2, surfacesToSolids.toConstructionPorts[9])
      annotation (Line(points={{-48,-46},{-48,-66},{0,-66},{0,-112.8}}, color={0,0,0}));
    connect(bottom10.toSurfacePort_2, surfacesToSolids.toConstructionPorts[10])
      annotation (Line(points={{88,-48},{88,-48},{88,-98},{88,-98},{8.88178e-016,-98},{8.88178e-016,-112.8}}, color={0,0,0}));
    connect(bottom11.toSurfacePort_2, surfacesToSolids.toConstructionPorts[11])
      annotation (Line(points={{150,-48},{150,-98},{8.88178e-016,-98},{8.88178e-016,-112.8}}, color={0,0,0}));
    connect(bottom12.toSurfacePort_2, surfacesToSolids.toConstructionPorts[12])
      annotation (Line(points={{130,-92},{130,-98},{8.88178e-016,-98},{8.88178e-016,-112.8}}, color={0,0,0}));
    connect(bottom13.toSurfacePort_2, surfacesToSolids.toConstructionPorts[13])
      annotation (Line(points={{10,-8},{10,-8},{10,-98},{10,-98},{8.88178e-016,-98},{8.88178e-016,-112.8}}, color={0,0,0}));
    connect(office1.T_setHeating, T_setHeating[1]) annotation (Line(
        points={{-139,67},{-139,62},{-126,62},{-126,102},{180,102},{180,88.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.T_setHeating, T_setHeating[2]) annotation (Line(
        points={{-99,67},{-99,62},{-86,62},{-86,102},{180,102},{180,86.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.T_setHeating, T_setHeating[3]) annotation (Line(
        points={{-59,67},{-59,62},{-46,62},{-46,102},{180,102},{180,83.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.T_setHeating, T_setHeating[4]) annotation (Line(
        points={{-19,67},{-19,62},{-6,62},{-6,102},{180,102},{180,81.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.T_setHeating, T_setHeating[5]) annotation (Line(
        points={{21,67},{21,62},{34,62},{34,102},{180,102},{180,78.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.T_setHeating, T_setHeating[6]) annotation (Line(
        points={{61,67},{61,62},{74,62},{74,102},{180,102},{180,76.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.T_setHeating, T_setHeating[7]) annotation (Line(
        points={{101,67},{101,62},{114,62},{114,102},{180,102},{180,73.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.T_setHeating, T_setHeating[8]) annotation (Line(
        points={{141,67},{141,62},{156,62},{156,102},{180,102},{180,71.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.T_setHeating, T_setHeating[9]) annotation (Line(
      points={{-59,-13},{-59,-18},{-46,-18},{-46,102},{180,102},{180,76.9231}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.T_setHeating, T_setHeating[10]) annotation (Line(
      points={{1,27},{1,22},{42,22},{44,22},{44,78},{38,78},{38,102},{180,102},{180,75.3846}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.T_setHeating, T_setHeating[11]) annotation (Line(
      points={{101,-13},{101,-18},{116,-18},{116,8},{168,8},{168,73.8462},{180,73.8462}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.T_setHeating, T_setHeating[12]) annotation (Line(
      points={{141,-13},{141,-18},{154,-18},{154,8},{168,8},{168,70.9091},{180,70.9091},{180,72.3077}},color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.T_setHeating, T_setHeating[13]) annotation (Line(
      points={{121,-53},{121,-58},{156,-58},{156,-50},{168,-50},{168,70.7692},{180,70.7692}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.T_setCooling, T_setCooling[1]) annotation (Line(
      points={{-135,67},{-135,62},{-126,62},{-126,102},{180,102},{180,68.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.T_setCooling, T_setCooling[2]) annotation (Line(
      points={{-95,67},{-95,62},{-86,62},{-86,102},{180,102},{180,66.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.T_setCooling, T_setCooling[3]) annotation (Line(
        points={{-55,67},{-55,62},{-46,62},{-46,102},{180,102},{180,63.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.T_setCooling, T_setCooling[4]) annotation (Line(
        points={{-15,67},{-15,62},{-6,62},{-6,102},{180,102},{180,61.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.T_setCooling, T_setCooling[5]) annotation (Line(
        points={{25,67},{25,62},{34,62},{34,102},{180,102},{180,58.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.T_setCooling, T_setCooling[6]) annotation (Line(
        points={{65,67},{65,62},{74,62},{74,102},{180,102},{180,56.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.T_setCooling, T_setCooling[7]) annotation (Line(
        points={{105,67},{105,62},{114,62},{114,102},{180,102},{180,53.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.T_setCooling, T_setCooling[8]) annotation (Line(
        points={{145,67},{145,62},{156,62},{156,102},{180,102},{180,51.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.T_setCooling, T_setCooling[9]) annotation (Line(
        points={{-55,-13},{-55,-18},{-46,-18},{-46,102},{180,102},{180,56.9231}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.T_setCooling, T_setCooling[10]) annotation (Line(
        points={{5,27},{5,22},{44,22},{44,78},{38,78},{38,102},{180,102},{180,55.3846}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.T_setCooling, T_setCooling[11]) annotation (Line(
        points={{105,-13},{105,-18},{116,-18},{116,8},{168,8},{168,53.8462},{180,53.8462}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.T_setCooling, T_setCooling[12]) annotation (Line(
        points={{145,-13},{145,-18},{154,-18},{154,8},{168,8},{168,52.3077},{180,52.3077}},color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.T_setCooling, T_setCooling[13]) annotation (Line(
        points={{125,-53},{125,-58},{156,-58},{156,-50},{168,-50},{168,50.7692},{180,50.7692}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.airchange, airchange[1]) annotation (Line(
        points={{-129,67},{-126,67},{-126,102},{166,102},{166,102},{166,48.75},{180,48.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.airchange, airchange[2]) annotation (Line(
        points={{-89,67},{-86,67},{-86,102},{166,102},{166,46.25},{180,46.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.airchange, airchange[3]) annotation (Line(
        points={{-49,67},{-46,67},{-46,102},{166,102},{166,43.75},{180,43.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.airchange, airchange[4]) annotation (Line(
        points={{-9,67},{-6,67},{-6,102},{166,102},{166,41.25},{180,41.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.airchange, airchange[5]) annotation (Line(
        points={{31,67},{34,67},{34,102},{166,102},{166,68},{180,68},{180,38.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.airchange, airchange[6]) annotation (Line(
        points={{71,67},{74,67},{74,102},{166,102},{166,36.25},{180,36.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.airchange, airchange[7]) annotation (Line(
        points={{111,67},{114,67},{114,102},{166,102},{166,33.75},{180,33.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.airchange, airchange[8]) annotation (Line(
        points={{151,67},{156,67},{156,102},{166,102},{166,31.25},{180,31.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.airchange, airchange[9]) annotation (Line(
          points={{-49,-13},{62,-13},{62,14},{154,14},{154,36},{180,36},{180,36.9231}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.airchange, airchange[10]) annotation (Line(
        points={{11,27},{16,27},{16,14},{154,14},{154,34},{180,34},{180,35.3846}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.airchange, airchange[11]) annotation (Line(
        points={{111,-13},{114,-13},{114,14},{154,14},{154,33.8462},{180,33.8462}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.airchange, airchange[12]) annotation (Line(
        points={{151,-13},{154,-13},{154,30},{168,30},{168,32.3077},{180,32.3077}},color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.airchange, airchange[13]) annotation (Line(
        points={{131,-53},{156,-53},{156,-48},{180,-48},{180,30.7692}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.TAirAmb, TAirAmb) annotation (Line(
        points={{-129,65},{-126,65},{-126,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.TAirAmb, TAirAmb) annotation (Line(
        points={{-89,65},{-86,65},{-86,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.TAirAmb, TAirAmb) annotation (Line(
        points={{-49,65},{-46,65},{-46,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.TAirAmb, TAirAmb) annotation (Line(
        points={{-9,65},{-6,65},{-6,102},{50,102},{50,120},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.TAirAmb, TAirAmb) annotation (Line(
        points={{31,65},{34,65},{34,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.TAirAmb, TAirAmb) annotation (Line(
        points={{71,65},{74,65},{74,102},{50,102},{50,120},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.TAirAmb, TAirAmb) annotation (Line(
        points={{111,65},{114,65},{114,102},{50,102},{50,120},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.TAirAmb, TAirAmb) annotation (Line(
        points={{151,65},{156,65},{156,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.TAirAmb, TAirAmb) annotation (Line(
        points={{-49,-15},{-46,-15},{-46,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.TAirAmb, TAirAmb) annotation (Line(
        points={{11,25},{14,25},{14,26},{44,26},{44,78},{38,78},{38,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.TAirAmb, TAirAmb) annotation (Line(
        points={{111,-15},{114,-15},{114,14},{34,14},{34,72},{34,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.TAirAmb, TAirAmb) annotation (Line(
        points={{151,-15},{154,-15},{154,14},{44,14},{44,78},{38,78},{38,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.TAirAmb, TAirAmb) annotation (Line(
        points={{131,-55},{134,-55},{134,-42},{114,-42},{114,14},{44,14},{44,78},{34,78},{34,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.xAirAmb, xAirAmb) annotation (Line(
        points={{-129,63},{-126,63},{-126,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dot));
    connect(office2.xAirAmb, xAirAmb) annotation (Line(
        points={{-89,63},{-86,63},{-86,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.xAirAmb, xAirAmb) annotation (Line(
        points={{-49,63},{-46,63},{-46,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.xAirAmb, xAirAmb) annotation (Line(
        points={{-9,63},{-6,63},{-6,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.xAirAmb, xAirAmb) annotation (Line(
        points={{31,63},{34,63},{34,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.xAirAmb, xAirAmb) annotation (Line(
        points={{71,63},{74,63},{74,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.xAirAmb, xAirAmb) annotation (Line(
        points={{111,63},{114,63},{114,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.xAirAmb, xAirAmb) annotation (Line(
        points={{151,63},{156,63},{156,102},{70,102},{70,120},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.xAirAmb, xAirAmb) annotation (Line(
        points={{-49,-17},{-46,-17},{-46,102},{70,102},{70,120},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.xAirAmb, xAirAmb) annotation (Line(
        points={{11,23},{44,23},{44,78},{38,78},{38,102},{70,102},{70,120},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.xAirAmb, xAirAmb) annotation (Line(
        points={{111,-17},{114,-17},{114,14},{44,14},{44,78},{38,78},{38,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.xAirAmb, xAirAmb) annotation (Line(
        points={{151,-17},{154,-17},{154,14},{44,14},{44,78},{42,78},{38,78},{38,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.xAirAmb, xAirAmb) annotation (Line(
        points={{131,-57},{134,-57},{134,-42},{114,-42},{114,14},{44,14},{44,78},{38,78},{38,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
        points={{-133,67},{-133,-106},{-80,-106},{-80,-113.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.Q_flow_cooling, Q_flow_cooling[2]) annotation (Line(
        points={{-93,67},{-93,-20},{-94,-20},{-94,-106},{-80,-106},{-80,-115.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.Q_flow_cooling, Q_flow_cooling[3]) annotation (Line(
        points={{-53,67},{-53,-106},{-80,-106},{-80,-118.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.Q_flow_cooling, Q_flow_cooling[4]) annotation (Line(
        points={{-13,67},{-13,-106},{-80,-106},{-80,-120.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.Q_flow_cooling, Q_flow_cooling[5]) annotation (Line(
        points={{27,67},{27,-20},{28,-20},{28,-106},{-80,-106},{-80,-123.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.Q_flow_cooling, Q_flow_cooling[6]) annotation (Line(
        points={{67,67},{67,-20},{68,-20},{68,-106},{-80,-106},{-80,-125.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.Q_flow_cooling, Q_flow_cooling[7]) annotation (Line(
        points={{107,67},{107,-20},{108,-20},{108,-106},{-80,-106},{-80,-128.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.Q_flow_cooling, Q_flow_cooling[8]) annotation (Line(
        points={{147,67},{147,-20},{148,-20},{148,-106},{-80,-106},{-80,-130.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.Q_flow_cooling, Q_flow_cooling[9]) annotation (Line(
        points={{-53,-13},{-53,-60},{-54,-60},{-54,-106},{-80,-106},{-80,-125.077}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.Q_flow_cooling, Q_flow_cooling[10]) annotation (Line(
        points={{7,27},{7,-106},{-80,-106},{-80,-126.615}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.Q_flow_cooling, Q_flow_cooling[11]) annotation (Line(
        points={{107,-13},{107,-106},{-80,-106},{-80,-128.154}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.Q_flow_cooling, Q_flow_cooling[12]) annotation (Line(
        points={{147,-13},{147,-106},{-80,-106},{-80,-129.692}},color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.Q_flow_cooling, Q_flow_cooling[13]) annotation (Line(
        points={{127,-53},{127,-106},{-80,-106},{-80,-131.231}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
        points={{-137,67},{-137,-106},{80,-106},{80,-113.25},{80,-113.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.Q_flow_heating, Q_flow_heating[2]) annotation (Line(
        points={{-97,67},{-97,-106},{80,-106},{80,-115.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.Q_flow_heating, Q_flow_heating[3]) annotation (Line(
        points={{-57,67},{-57,-106},{80,-106},{80,-118.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.Q_flow_heating, Q_flow_heating[4]) annotation (Line(
        points={{-17,67},{-17,-106},{80,-106},{80,-120.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.Q_flow_heating, Q_flow_heating[5]) annotation (Line(
        points={{23,67},{23,-106},{80,-106},{80,-123.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.Q_flow_heating, Q_flow_heating[6]) annotation (Line(
        points={{63,67},{63,-106},{80,-106},{80,-125.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.Q_flow_heating, Q_flow_heating[7]) annotation (Line(
        points={{103,67},{103,-20},{104,-20},{104,-106},{80,-106},{80,-128.25}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.Q_flow_heating, Q_flow_heating[8]) annotation (Line(
        points={{143,67},{143,-20},{144,-20},{144,-106},{80,-106},{80,-130.75}},color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.Q_flow_heating, Q_flow_heating[9]) annotation (Line(
        points={{-57,-13},{-57,-106},{80,-106},{80,-124.143}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.Q_flow_heating, Q_flow_heating[10]) annotation (Line(
        points={{3,27},{3,-106},{80,-106},{80,-125.571}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.Q_flow_heating, Q_flow_heating[11]) annotation (Line(
        points={{103,-13},{103,-60},{104,-60},{104,-106},{80,-106},{80,-127}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.Q_flow_heating, Q_flow_heating[12]) annotation (Line(
        points={{143,-13},{143,-60},{144,-60},{144,-106},{80,-106},{80,-128.429}},color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.Q_flow_heating, Q_flow_heating[13]) annotation (Line(
        points={{123,-53},{123,-80},{124,-80},{124,-106},{80,-106},{80,-129.857}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.radHeatSourcesPorts[1], radHeatSourcesPorts[1]) annotation (Line(
      points={{-139.3,52.7},{-126,52.7},{-126,102},{0,102},{0,120}},
      color={127,0,0},
      pattern=LinePattern.Dash));
    connect(office2.radHeatSourcesPorts[1], radHeatSourcesPorts[2]) annotation (Line(
        points={{-99.3,52.7},{-86,52.7},{-86,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office3.radHeatSourcesPorts[1], radHeatSourcesPorts[3]) annotation (Line(
        points={{-59.3,52.7},{-46,52.7},{-46,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office4.radHeatSourcesPorts[1], radHeatSourcesPorts[4]) annotation (Line(
        points={{-19.3,52.7},{-6,52.7},{-6,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office5.radHeatSourcesPorts[1], radHeatSourcesPorts[5]) annotation (Line(
        points={{20.7,52.7},{34,52.7},{34,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office6.radHeatSourcesPorts[1], radHeatSourcesPorts[6]) annotation (Line(
        points={{60.7,52.7},{74,52.7},{74,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office7.radHeatSourcesPorts[1], radHeatSourcesPorts[7]) annotation (Line(
        points={{100.7,52.7},{114,52.7},{114,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office8.radHeatSourcesPorts[1], radHeatSourcesPorts[8]) annotation (Line(
        points={{140.7,52.7},{156,52.7},{156,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(bullpen.radHeatSourcesPorts[1], radHeatSourcesPorts[9]) annotation (Line(
        points={{-59.3,-27.3},{-46,-27.3},{-46,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(corridor.radHeatSourcesPorts[1], radHeatSourcesPorts[10]) annotation (Line(
        points={{0.7,12.7},{34,12.7},{34,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(restroom1.radHeatSourcesPorts[1], radHeatSourcesPorts[11]) annotation (Line(
        points={{100.7,-27.3},{114,-27.3},{114,14},{44,14},{44,78},{38,78},{38,102},{0,102},{0,120}},
        color={127,0,0},pattern=LinePattern.Dash));
    connect(restroom2.radHeatSourcesPorts[1], radHeatSourcesPorts[12]) annotation (Line(
        points={{140.7,-27.3},{154,-27.3},{154,14},{44,14},{44,78},{38,78},{38,102},{0,102},{0,120}},
        color={127,0,0},pattern=LinePattern.Dash));
    connect(conferenceRoom.radHeatSourcesPorts[1], radHeatSourcesPorts[13]);
    connect(office1.conHeatSourcesPorts[1], conHeatSourcesPorts[1]) annotation (Line(
      points={{-139.3,52.7},{-126,52.7},{-126,102},{0,102},{0,120}},
      color={127,0,0},
      pattern=LinePattern.Dash));
    connect(office2.conHeatSourcesPorts[1], conHeatSourcesPorts[2]) annotation (Line(
        points={{-99.3,52.7},{-86,52.7},{-86,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office3.conHeatSourcesPorts[1], conHeatSourcesPorts[3]) annotation (Line(
        points={{-59.3,52.7},{-46,52.7},{-46,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office4.conHeatSourcesPorts[1], conHeatSourcesPorts[4]) annotation (Line(
        points={{-19.3,52.7},{-6,52.7},{-6,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office5.conHeatSourcesPorts[1], conHeatSourcesPorts[5]) annotation (Line(
        points={{20.7,52.7},{34,52.7},{34,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office6.conHeatSourcesPorts[1], conHeatSourcesPorts[6]) annotation (Line(
        points={{60.7,52.7},{74,52.7},{74,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office7.conHeatSourcesPorts[1], conHeatSourcesPorts[7]) annotation (Line(
        points={{100.7,52.7},{114,52.7},{114,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office8.conHeatSourcesPorts[1], conHeatSourcesPorts[8]) annotation (Line(
        points={{140.7,52.7},{156,52.7},{156,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(bullpen.conHeatSourcesPorts[1], conHeatSourcesPorts[9]) annotation (Line(
        points={{-59.3,-27.3},{-46,-27.3},{-46,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(corridor.conHeatSourcesPorts[1], conHeatSourcesPorts[10]) annotation (Line(
        points={{0.7,12.7},{34,12.7},{34,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(restroom1.conHeatSourcesPorts[1], conHeatSourcesPorts[11]) annotation (Line(
        points={{100.7,-27.3},{114,-27.3},{114,14},{44,14},{44,78},{38,78},{38,102},{0,102},{0,120}},
        color={127,0,0},pattern=LinePattern.Dash));
    connect(restroom2.conHeatSourcesPorts[1], conHeatSourcesPorts[12]) annotation (Line(
        points={{140.7,-27.3},{154,-27.3},{154,14},{44,14},{44,78},{38,78},{38,102},{0,102},{0,120}},
        color={127,0,0},pattern=LinePattern.Dash));
    connect(conferenceRoom.conHeatSourcesPorts[1], conHeatSourcesPorts[13]);
  end Building;

  Building building(
    nZones=13)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));

  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient,
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin weatherDataFile)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));

  Modelica.Blocks.Sources.Constant TSetHeatingOffice1(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{46,40},{42,44}})));
  Modelica.Blocks.Sources.Constant TSetHeatingOffice2(k=273.15 + 21.0)
    annotation (Placement(transformation(extent={{54,40},{50,44}})));
  Modelica.Blocks.Sources.Constant TSetHeatingOffice3(k=273.15 + 19.0)
    annotation (Placement(transformation(extent={{62,40},{58,44}})));
  Modelica.Blocks.Sources.Constant TSetHeatingOffice4(k=273.15 + 22.0)
    annotation (Placement(transformation(extent={{70,40},{66,44}})));
  Modelica.Blocks.Sources.Constant TSetHeatingOffice5(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{78,40},{74,44}})));
  Modelica.Blocks.Sources.Constant TSetHeatingOffice6(k=273.15 + 21.0)
    annotation (Placement(transformation(extent={{86,40},{82,44}})));
  Modelica.Blocks.Sources.Constant TSetHeatingOffice7(k=273.15 + 19.0)
    annotation (Placement(transformation(extent={{94,40},{90,44}})));
  Modelica.Blocks.Sources.Constant TSetHeatingOffice8(k=273.15 + 22.0)
    annotation (Placement(transformation(extent={{102,40},{98,44}})));
  Modelica.Blocks.Sources.Constant TSetCoolingOffice1(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{46,32},{42,36}})));
  Modelica.Blocks.Sources.Constant TSetCoolingOffice2(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{54,32},{50,36}})));
  Modelica.Blocks.Sources.Constant TSetCoolingOffice3(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{62,32},{58,36}})));
  Modelica.Blocks.Sources.Constant TSetCoolingOffice4(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{70,32},{66,36}})));
  Modelica.Blocks.Sources.Constant TSetCoolingOffice5(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{78,32},{74,36}})));
  Modelica.Blocks.Sources.Constant TSetCoolingOffice6(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{86,32},{82,36}})));
  Modelica.Blocks.Sources.Constant TSetCoolingOffice7(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{94,32},{90,36}})));
  Modelica.Blocks.Sources.Constant TSetCoolingOffice8(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{102,32},{98,36}})));
  Modelica.Blocks.Sources.Constant airchangeOffice1(k=0.5)
    annotation (Placement(transformation(extent={{46,24},{42,28}})));
  Modelica.Blocks.Sources.Constant airchangeOffice2(k=0.5)
    annotation (Placement(transformation(extent={{54,24},{50,28}})));
  Modelica.Blocks.Sources.Constant airchangeOffice3(k=0.5)
    annotation (Placement(transformation(extent={{62,24},{58,28}})));
  Modelica.Blocks.Sources.Constant airchangeOffice4(k=0.5)
    annotation (Placement(transformation(extent={{70,24},{66,28}})));
  Modelica.Blocks.Sources.Constant airchangeOffice5(k=0.5)
    annotation (Placement(transformation(extent={{78,24},{74,28}})));
  Modelica.Blocks.Sources.Constant airchangeOffice6(k=0.5)
    annotation (Placement(transformation(extent={{86,24},{82,28}})));
  Modelica.Blocks.Sources.Constant airchangeOffice7(k=0.5)
    annotation (Placement(transformation(extent={{94,24},{90,28}})));
  Modelica.Blocks.Sources.Constant airchangeOffice8(k=0.5)
    annotation (Placement(transformation(extent={{102,24},{98,28}})));
  Modelica.Blocks.Sources.Constant TSetHeatingBullpen(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{52,-12},{48,-8}})));
  Modelica.Blocks.Sources.Constant TSetCoolingBullpen(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{58,-12},{54,-8}})));
  Modelica.Blocks.Sources.Constant airchangeBullpen(k=2.0)
    annotation (Placement(transformation(extent={{64,-12},{60,-8}})));
  Modelica.Blocks.Sources.Constant TSetHeatingCorridor(k=273.15 + 15.0)
    annotation (Placement(transformation(extent={{62,8},{58,12}})));
  Modelica.Blocks.Sources.Constant TSetCoolingCorridor(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{68,8},{64,12}})));
  Modelica.Blocks.Sources.Constant airchangeCorridor(k=0.5)
    annotation (Placement(transformation(extent={{74,8},{70,12}})));
  Modelica.Blocks.Sources.Constant TSetHeatingRestroom1(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{86,0},{82,4}})));
  Modelica.Blocks.Sources.Constant TSetCoolingRestroom1(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{86,-8},{82,-4}})));
  Modelica.Blocks.Sources.Constant airchangeRestroom1(k=0.5)
    annotation (Placement(transformation(extent={{86,-16},{82,-12}})));
  Modelica.Blocks.Sources.Constant TSetHeatingRestroom2(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{100,0},{96,4}})));
  Modelica.Blocks.Sources.Constant TSetCoolingRestroom2(k=273.15 + 100.0)
    annotation (Placement(transformation(extent={{100,-8},{96,-4}})));
  Modelica.Blocks.Sources.Constant airchangeRestroom2(k=0.5)
    annotation (Placement(transformation(extent={{100,-16},{96,-12}})));
  Modelica.Blocks.Sources.Constant TSetHeatingConferenceRoom(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{84,-30},{80,-26}})));
  Modelica.Blocks.Sources.Constant TSetCoolingConferenceRoom(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{90,-30},{86,-26}})));
  Modelica.Blocks.Sources.Constant airchangeCoinferenceRoom(k=2.0)
    annotation (Placement(transformation(extent={{96,-30},{92,-26}})));
  Modelica.Blocks.Sources.Constant heatsourcesOffice1(k=(70.0+100.0)*8/24+2*36*4/24)
    annotation (Placement(transformation(extent={{46,16},{42,20}})));
  Modelica.Blocks.Sources.Constant heatsourcesOffice2(k=(70.0+100.0)*8/24+2*36*4/24)
    annotation (Placement(transformation(extent={{54,16},{50,20}})));
  Modelica.Blocks.Sources.Constant heatsourcesOffice3(k=(70.0+100.0)*8/24+2*36*4/24)
    annotation (Placement(transformation(extent={{62,16},{58,20}})));
  Modelica.Blocks.Sources.Constant heatsourcesOffice4(k=(70.0+100.0)*8/24+2*36*4/24)
    annotation (Placement(transformation(extent={{70,16},{66,20}})));
  Modelica.Blocks.Sources.Constant heatsourcesOffice5(k=(70.0+100.0)*8/24+2*36*4/24)
    annotation (Placement(transformation(extent={{78,16},{74,20}})));
  Modelica.Blocks.Sources.Constant heatsourcesOffice6(k=(70.0+100.0)*8/24+2*36*4/24)
    annotation (Placement(transformation(extent={{86,16},{82,20}})));
  Modelica.Blocks.Sources.Constant heatsourcesOffice7(k=(70.0+100.0)*8/24+2*36*4/24)
    annotation (Placement(transformation(extent={{94,16},{90,20}})));
  Modelica.Blocks.Sources.Constant heatsourcesOffice8(k=(70.0+100.0)*8/24+2*36*4/24)
    annotation (Placement(transformation(extent={{102,16},{98,20}})));
  Modelica.Blocks.Sources.Constant heatsourcesCorridor(k=(8*36)*8/24)
    annotation (Placement(transformation(extent={{80,8},{76,12}})));
  Modelica.Blocks.Sources.Constant heatsourcesBullpen(k=12*(70.0+100.0)*8/24+12*2*36*4/24)
    annotation (Placement(transformation(extent={{70,-12},{66,-8}})));
  Modelica.Blocks.Sources.Constant heatsourcesRestroom1(k=2*36*8/24)
    annotation (Placement(transformation(extent={{86,-23},{82,-19}})));
  Modelica.Blocks.Sources.Constant heatsourcesRestroom2(k=2*36*8/24)
    annotation (Placement(transformation(extent={{100,-23},{96,-19}})));
  Modelica.Blocks.Sources.Constant heatsourcesConferenceRoom(k=(10*70+2*36+200.0)*2/24)
    annotation (Placement(transformation(extent={{102,-30},{98,-26}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatFlow[13]
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={26,18})));
  BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relationRadiationConvection[13](each radiationportion = 0.5)
    annotation (Placement(transformation(extent={{-3,3},{3,-3}},rotation=-90,origin={21,15})));
equation
  connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts)
    annotation (Line(points={{-12,4},{11,4}},color={0,255,0},smooth=Smooth.None));
  connect(ambient.toAirPorts, building.toAmbientAirPorts)
    annotation (Line(points={{-12,-4},{11,-4}},color={85,170,255},smooth=Smooth.None));
  connect(ambient.TAirRef, building.TAirAmb)
    annotation (Line(points={{-28.2,7},{-30,7},{-30,12},{-30,14},{26.2,14},{26.2,9.8}}, color={0,0,127}));
  connect(ambient.xAir, building.xAirAmb)
    annotation (Line(points={{-28.2,5},{-32,5},{-32,16},{28.4,16},{28.4,9.8}}, color={0,0,127}));
  connect(building.T_setHeating[1], TSetHeatingOffice1.y)
    annotation (Line(points={{29.8,8.92308},{34,8.92308},{34,42},{41.8,42}},color={0,0,127}));
  connect(TSetHeatingOffice2.y, building.T_setHeating[2])
    annotation (Line(points={{49.8,42},{49.8,42},{34,42},{34,8.76923},{29.8,8.76923}},color={0,0,127}));
  connect(TSetHeatingOffice3.y, building.T_setHeating[3])
    annotation (Line(points={{57.8,42},{57.8,42},{34,42},{34,8.61538},{29.8,8.61538}},color={0,0,127}));
  connect(TSetHeatingOffice4.y, building.T_setHeating[4])
    annotation (Line(points={{65.8,42},{34,42},{34,16},{29.8,16},{29.8,8.46154}},color={0,0,127}));
  connect(TSetHeatingOffice5.y, building.T_setHeating[5])
    annotation (Line(points={{73.8,42},{73.8,42},{34,42},{34,8.30769},{29.8,8.30769}},color={0,0,127}));
  connect(TSetHeatingOffice6.y, building.T_setHeating[6])
    annotation (Line(points={{81.8,42},{34,42},{34,8.15385},{29.8,8.15385}},color={0,0,127}));
  connect(TSetHeatingOffice7.y, building.T_setHeating[7])
    annotation (Line(points={{89.8,42},{34,42},{34,16},{29.8,16},{29.8,8}},      color={0,0,127}));
  connect(TSetHeatingOffice8.y, building.T_setHeating[8])
    annotation (Line(points={{97.8,42},{34,42},{34,14},{29.8,14},{29.8,7.84615}},color={0,0,127}));
  connect(TSetCoolingOffice1.y, building.T_setCooling[1])
    annotation (Line(points={{41.8,34},{36,34},{36,6.92308},{29.8,6.92308}},color={0,0,127}));
  connect(TSetCoolingOffice2.y, building.T_setCooling[2])
    annotation (Line(points={{49.8,34},{36,34},{36,6.76923},{29.8,6.76923}},color={0,0,127}));
  connect(TSetCoolingOffice3.y, building.T_setCooling[3])
    annotation (Line(points={{57.8,34},{36,34},{36,14},{29.8,14},{29.8,6.61538}},color={0,0,127}));
  connect(TSetCoolingOffice4.y, building.T_setCooling[4])
    annotation (Line(points={{65.8,34},{65.8,36},{36,36},{36,6.46154},{29.8,6.46154}},color={0,0,127}));
  connect(TSetCoolingOffice5.y, building.T_setCooling[5])
    annotation (Line(points={{73.8,34},{36,34},{36,14.75},{29.8,14.75},{29.8,6.30769}},color={0,0,127}));
  connect(TSetCoolingOffice6.y, building.T_setCooling[6])
    annotation (Line(points={{81.8,34},{36,34},{36,14.8},{29.8,14.8},{29.8,6.15385}},color={0,0,127}));
  connect(TSetCoolingOffice7.y, building.T_setCooling[7])
    annotation (Line(points={{89.8,34},{36,34},{36,14.8333},{29.8,14.8333},{29.8,6}}, color={0,0,127}));
  connect(TSetCoolingOffice8.y, building.T_setCooling[8])
    annotation (Line(points={{97.8,34},{36,34},{36,5.84615},{29.8,5.84615}},color={0,0,127}));
  connect(airchangeOffice1.y, building.airchange[1])
    annotation (Line(points={{41.8,26},{38,26},{38,4.92308},{29.8,4.92308}},color={0,0,127}));
  connect(airchangeOffice2.y, building.airchange[2])
    annotation (Line(points={{49.8,26},{38,26},{38,4.76923},{29.8,4.76923}},color={0,0,127}));
  connect(airchangeOffice3.y, building.airchange[3])
    annotation (Line(points={{57.8,26},{38,26},{38,12.5},{29.8,12.5},{29.8,4.61538}},color={0,0,127}));
  connect(airchangeOffice4.y, building.airchange[4])
    annotation (Line(points={{65.8,26},{38,26},{38,12.6667},{29.8,12.6667},{29.8,4.46154}},color={0,0,127}));
  connect(airchangeOffice5.y, building.airchange[5])
    annotation (Line(points={{73.8,26},{38,26},{38,12.75},{29.8,12.75},{29.8,4.30769}},color={0,0,127}));
  connect(airchangeOffice6.y, building.airchange[6])
    annotation (Line(points={{81.8,26},{38,26},{38,12.8},{29.8,12.8},{29.8,4.15385}},color={0,0,127}));
  connect(airchangeOffice7.y, building.airchange[7])
    annotation (Line(points={{89.8,26},{38,26},{38,12.8333},{29.8,12.8333},{29.8,4}},color={0,0,127}));
  connect(airchangeOffice8.y, building.airchange[8])
    annotation (Line(points={{97.8,26},{38,26},{38,10.8571},{29.8,10.8571},{29.8,3.84615}},color={0,0,127}));
  connect(TSetHeatingBullpen.y, building.T_setHeating[9])
    annotation (Line(points={{47.8,-10},{34,-10},{34,8},{32,8},{29.8,8},{29.8,7.69231}},color={0,0,127}));
  connect(TSetHeatingCorridor.y, building.T_setHeating[10])
    annotation (Line(points={{57.8,10},{50,10},{42,10},{42,7.53846},{29.8,7.53846}}, color={0,0,127}));
  connect(TSetHeatingRestroom1.y, building.T_setHeating[11])
    annotation (Line(points={{81.8,2},{81.8,2},{46,2},{46,8},{38,8},{38,7.38462},{29.8,7.38462}}, color={0,0,127}));
  connect(TSetHeatingRestroom2.y, building.T_setHeating[12])
    annotation (Line(points={{95.8,2},{95.8,2},{46,2},{46,7.23077},{29.8,7.23077}},color={0,0,127}));
  connect(TSetHeatingConferenceRoom.y, building.T_setHeating[13])
    annotation (Line(points={{79.8,-28},{76,-28},{76,2},{46,2},{46,8},{38,8},{38,7.07692},{29.8,7.07692}}, color={0,0,127}));
  connect(TSetCoolingBullpen.y, building.T_setCooling[9])
    annotation (Line(points={{53.8,-10},{50,-10},{50,5.69231},{29.8,5.69231}}, color={0,0,127}));
  connect(TSetCoolingCorridor.y, building.T_setCooling[10])
    annotation (Line(points={{63.8,10},{64,10},{64,5.53846},{29.8,5.53846}}, color={0,0,127}));
  connect(TSetCoolingRestroom1.y, building.T_setCooling[11])
    annotation (Line(points={{81.8,-6},{76,-6},{76,5.38462},{29.8,5.38462}},color={0,0,127}));
  connect(TSetCoolingRestroom2.y, building.T_setCooling[12])
    annotation (Line(points={{95.8,-6},{76,-6},{76,6},{29.8,6},{29.8,5.23077}}, color={0,0,127}));
  connect(TSetCoolingConferenceRoom.y, building.T_setCooling[13])
    annotation (Line(points={{85.8,-28},{75.8,-28},{75.8,4},{38,4},{30,4},{29.8,4},{29.8,5.07692}}, color={0,0,127}));
  connect(airchangeBullpen.y, building.airchange[9])
    annotation (Line(points={{59.8,-10},{56,-10},{56,3.69231},{29.8,3.69231}}, color={0,0,127}));
  connect(airchangeCorridor.y, building.airchange[10])
    annotation (Line(points={{69.8,10},{70,10},{70,3.53846},{29.8,3.53846}}, color={0,0,127}));
  connect(airchangeRestroom1.y, building.airchange[11])
    annotation (Line(points={{81.8,-14},{76,-14},{76,3.38462},{29.8,3.38462}},color={0,0,127}));
  connect(airchangeRestroom2.y, building.airchange[12])
    annotation (Line(points={{95.8,-14},{95.8,-14},{76,-14},{76,3.23077},{29.8,3.23077}}, color={0,0,127}));
  connect(airchangeCoinferenceRoom.y, building.airchange[13])
    annotation (Line(points={{91.8,-28},{91.8,-28},{76,-28},{76,2},{52,2},{52,3.07692},{29.8,3.07692}}, color={0,0,127}));
  connect(heatFlow[1].Q_flow, heatsourcesOffice1.y)
    annotation (Line(points={{28,18},{41.8,18}}, color={0,0,127}));
  connect(heatFlow[2].Q_flow, heatsourcesOffice2.y)
    annotation (Line(points={{28,18},{38,18},{49.8,18}}, color={0,0,127}));
  connect(heatFlow[3].Q_flow, heatsourcesOffice3.y)
    annotation (Line(points={{28,18},{42,18},{57.8,18}}, color={0,0,127}));
  connect(heatFlow[4].Q_flow, heatsourcesOffice4.y)
    annotation (Line(points={{28,18},{46,18},{65.8,18}}, color={0,0,127}));
  connect(heatFlow[5].Q_flow, heatsourcesOffice5.y)
    annotation (Line(points={{28,18},{73.8,18}}, color={0,0,127}));
  connect(heatFlow[6].Q_flow, heatsourcesOffice6.y)
    annotation (Line(points={{28,18},{81.8,18}},color={0,0,127}));
  connect(heatFlow[7].Q_flow, heatsourcesOffice7.y)
    annotation (Line(points={{28,18},{89.8,18}},color={0,0,127}));
  connect(heatFlow[8].Q_flow, heatsourcesOffice8.y)
    annotation (Line(points={{28,18},{46,18},{62,18},{97.8,18}},color={0,0,127}));
  connect(heatsourcesBullpen.y, heatFlow[9].Q_flow)
    annotation (Line(points={{65.8,-10},{62,-10},{34,-10},{34,18},{28,18}},color={0,0,127}));
  connect(heatsourcesCorridor.y, heatFlow[10].Q_flow)
    annotation (Line(points={{75.8,10},{62,10},{40,10},{40,18},{28,18}}, color={0,0,127}));
  connect(heatsourcesRestroom1.y, heatFlow[11].Q_flow)
    annotation (Line(points={{81.8,-21},{76,-21},{76,2},{34,2},{34,18},{28,18}}, color={0,0,127}));
  connect(heatsourcesRestroom2.y, heatFlow[12].Q_flow)
    annotation (Line(points={{95.8,-21},{76,-21},{76,2},{34,2},{34,18},{28,18}}, color={0,0,127}));
  connect(heatsourcesConferenceRoom.y, heatFlow[13].Q_flow)
    annotation (Line(points={{97.8,-28},{97.8,-28},{76,-28},{76,2},{34,2},{34,18},{28,18}}, color={0,0,127}));
  connect(relationRadiationConvection.heatPortCv, building.conHeatSourcesPorts[1:13])
    annotation (Line(points={{21.6,15.2},{21.6,12},{20,12},{20,10}},color={191,0,0}));
  connect(relationRadiationConvection.heatPortLw, building.radHeatSourcesPorts[1:13])
    annotation (Line(points={{22.4,15.2},{22.4,12},{23,12},{23,10}},color={191,0,0}));
  connect(relationRadiationConvection.heatPort, heatFlow.port)
    annotation (Line(points={{22,16.6},{22,18},{24,18}}, color={191,0,0}));

  annotation(experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/BuildingThermalMultiZone.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{120,50}}, initialScale=0.1), graphics={
    Text(extent={{-54,-2},{50,-70}},lineColor={0,0,255}, textString="Model of a storey of an office building with 13 thermal zones"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{100,40}},initialScale =  0.1)),
   Rectangle(
     extent={{40,14},{104,6}},
     lineColor={255,0,0},
     pattern=LinePattern.Dash),
   Rectangle(
     extent={{40,6},{78,-32}},
     lineColor={255,0,0},
     pattern=LinePattern.Dash),
   Rectangle(
     extent={{78,-24},{104,-32}},
     lineColor={255,0,0},
     pattern=LinePattern.Dash),
   Rectangle(
     extent={{78,6},{90,-24}},
     lineColor={255,0,0},
     pattern=LinePattern.Dash),
   Rectangle(
     extent={{90,6},{104,-24}},
     lineColor={255,0,0},
     pattern=LinePattern.Dash),
   Rectangle(
     extent={{40,46},{104,14}},
     lineColor={255,0,0},
     pattern=LinePattern.Dash)}),
 Documentation(info="<html>
 <p>
 Example that simulates a thermal building model with 13 zones, based on 1D-discretized building elements
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
end BuildingThermalMultiZone;
