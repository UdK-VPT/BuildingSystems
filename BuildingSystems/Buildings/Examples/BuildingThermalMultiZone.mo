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
    useAirPaths = false,
    heatSources = true,
    nHeatSources = 13);
    parameter Modelica.SIunits.Length heightRooms = 3.0
    "Height of all rooms";

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office1(
      V=bottom1.width*bottom1.height*heightRooms,
      height=heightRooms,
      nConstructions=6,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-150,50},{-130,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office2(
      V=bottom2.width*bottom2.height*heightRooms,
      height=heightRooms,
      nConstructions=6,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-110,50},{-90,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office3(
      V=bottom3.width*bottom3.height*heightRooms,
      height=heightRooms,
      nConstructions=6,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office4(
      V=bottom4.width*bottom4.height*heightRooms,
      height=heightRooms,
      nConstructions=6,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-30,50},{-10,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office5(
      V=bottom5.width*bottom5.height*heightRooms,
      height=heightRooms,
      nConstructions=6,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{10,50},{30,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office6(
      V=bottom6.width*bottom6.height*heightRooms,
      height=heightRooms,
      nConstructions=6,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{50,50},{70,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office7(
      V=bottom7.width*bottom7.height*heightRooms,
      height=heightRooms,
      nConstructions=6,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{90,50},{110,70}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed office8(
      V=bottom8.width*bottom8.height*heightRooms,
      height=heightRooms,
      nConstructions=6,
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
      AInnSur=window1.width*window1.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-136,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall11(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom2.width,
      AInnSur=window2.width*window2.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-96,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall12(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom3.width,
      AInnSur=window3.width*window3.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-56,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall13(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom4.width,
      AInnSur=window4.width*window4.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-16,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall14(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom5.width,
      AInnSur=window5.width*window5.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={24,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall15(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom6.width,
      AInnSur=window6.width*window6.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={64,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall16(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom7.width,
      AInnSur=window7.width*window7.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={104,80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall17(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom8.width,
      AInnSur=window8.width*window8.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={144,80})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed corridor(
      V=bottom13.width*bottom13.height*heightRooms,
      height=heightRooms,
      nConstructions=14,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-6,10},{14,30}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed restroom1(
      V=bottom10.width*bottom10.height*heightRooms,
      height=heightRooms,
      nConstructions=5,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{88,-30},{108,-10}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed restroom2(
      V=bottom11.width*bottom11.height*heightRooms,
      height=heightRooms,
      nConstructions=5,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{130,-30},{150,-10}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed bullpen(
      V=bottom9.width*bottom9.height*heightRooms,
      height=heightRooms,
      nConstructions=8,
      heatSources=true,
      nHeatSources=1)
      annotation (Placement(transformation(extent={{-70,-30},{-50,-10}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed conferenceRoom(
      V=bottom12.width*bottom12.height*heightRooms,
      height=heightRooms,
      nConstructions=7,
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
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={98,0})));
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
      AInnSur=window11.width*window11.height)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={120,-80})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall32(
      redeclare ConstructionFacade constructionData,
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      height=heightRooms,
      width=bottom9.width,
      AInnSur=window10.width*window10.height)
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
      AInnSur=window9.width*window9.height)
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
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-46,-44})));
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
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={4,-6})));
    BuildingSystems.Buildings.Constructions.Windows.Window window1(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-146,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window2(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-106,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window3(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-66,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window4(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-26,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window5(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={14,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window6(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={54,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window7(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={94,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window8(
      height=1.5,
      width=2.5,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={134,90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window9(
      height=1.5,
      width=5.0,
      angleDegAzi=90.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-168,-30})));
    BuildingSystems.Buildings.Constructions.Windows.Window window10(
      height=2.5,
      width=16.0,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-50,-90})));
    BuildingSystems.Buildings.Constructions.Windows.Window window11(
      height=2.5,
      width=5.0,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={110,-90})));
  equation
    connect(wall10.toSurfacePort_1, office1.toConstructionPorts[1]) annotation (
        Line(points={{-136,78},{-136,74},{-140,74},{-140,58.3333}},
                                                               color={0,0,0}));
    connect(wall11.toSurfacePort_1, office2.toConstructionPorts[1]) annotation (
        Line(points={{-96,78},{-96,74},{-100,74},{-100,58.3333}},
                                                            color={0,0,0}));
    connect(wall12.toSurfacePort_1, office3.toConstructionPorts[1]) annotation (
        Line(points={{-56,78},{-56,74},{-60,74},{-60,58.3333}},
                                                           color={0,0,0}));
    connect(wall13.toSurfacePort_1, office4.toConstructionPorts[1]) annotation (
        Line(points={{-16,78},{-16,74},{-20,74},{-20,58.3333}},
                                                           color={0,0,0}));
    connect(wall14.toSurfacePort_1, office5.toConstructionPorts[1])
      annotation (Line(points={{24,78},{24,74},{20,74},{20,58.3333}},
                                                                 color={0,0,0}));
    connect(wall15.toSurfacePort_1, office6.toConstructionPorts[1])
      annotation (Line(points={{64,78},{64,74},{60,74},{60,58.3333}},
                                                                 color={0,0,0}));
    connect(wall16.toSurfacePort_1, office7.toConstructionPorts[1]) annotation (
        Line(points={{104,78},{104,74},{100,74},{100,58.3333}},
                                                           color={0,0,0}));
    connect(wall17.toSurfacePort_1, office8.toConstructionPorts[1]) annotation (
        Line(points={{144,78},{144,74},{140,74},{140,58.3333}},
                                                           color={0,0,0}));
    connect(wall1.toSurfacePort_1, office1.toConstructionPorts[2]) annotation (
        Line(points={{-158,60},{-154,60},{-154,59},{-140,59}}, color={0,0,0}));
    connect(office1.toConstructionPorts[3], wall2.toSurfacePort_1) annotation (
        Line(points={{-140,59.6667},{-125.5,59.6667},{-125.5,60},{-122,60}},
                                                                   color={127,0,0}));
    connect(wall2.toSurfacePort_2, office2.toConstructionPorts[2]) annotation (
        Line(points={{-118,60},{-116,60},{-116,59},{-100,59}}, color={0,0,0}));
    connect(office2.toConstructionPorts[3], wall3.toSurfacePort_1) annotation (
        Line(points={{-100,59.6667},{-86,59.6667},{-86,60},{-82,60}},
                                                           color={127,0,0}));
    connect(wall3.toSurfacePort_2, office3.toConstructionPorts[2]) annotation (
        Line(points={{-78,60},{-74,60},{-74,59},{-60,59}}, color={0,0,0}));
    connect(office3.toConstructionPorts[3], wall4.toSurfacePort_1) annotation (
        Line(points={{-60,59.6667},{-46,59.6667},{-46,60},{-42,60}},
                                                           color={127,0,0}));
    connect(wall4.toSurfacePort_2, office4.toConstructionPorts[2]) annotation (
        Line(points={{-38,60},{-36,60},{-36,59},{-20,59}}, color={0,0,0}));
    connect(office4.toConstructionPorts[3], wall5.toSurfacePort_1) annotation (
        Line(points={{-20,59.6667},{-6,59.6667},{-6,60},{-2,60}},
                                                       color={127,0,0}));
    connect(wall5.toSurfacePort_2, office5.toConstructionPorts[2])
      annotation (Line(points={{2,60},{6,60},{6,59},{20,59}},color={0,0,0}));
    connect(office5.toConstructionPorts[3], wall6.toSurfacePort_1) annotation (
        Line(points={{20,59.6667},{34,59.6667},{34,60},{38,60}},
                                                       color={127,0,0}));
    connect(wall6.toSurfacePort_2, office6.toConstructionPorts[2])
      annotation (Line(points={{42,60},{46,60},{46,59},{60,59}}, color={0,0,0}));
    connect(office6.toConstructionPorts[3], wall7.toSurfacePort_1) annotation (
        Line(points={{60,59.6667},{74,59.6667},{74,60},{78,60}},
                                                       color={127,0,0}));
    connect(wall7.toSurfacePort_2, office7.toConstructionPorts[2])
      annotation (Line(points={{82,60},{86,60},{86,59},{100,59}},color={0,0,0}));
    connect(office7.toConstructionPorts[3], wall8.toSurfacePort_1) annotation (
        Line(points={{100,59.6667},{114,59.6667},{114,60},{118,60}},
                                                           color={127,0,0}));
    connect(wall8.toSurfacePort_2, office8.toConstructionPorts[2]) annotation (
        Line(points={{122,60},{126,60},{126,59},{140,59}}, color={0,0,0}));
    connect(office8.toConstructionPorts[3], wall9.toSurfacePort_1) annotation (
        Line(points={{140,59.6667},{156,59.6667},{156,60},{158,60}},
                                                           color={127,0,0}));
    connect(wall18.toSurfacePort_2, office1.toConstructionPorts[4])
      annotation (Line(points={{-140,42},{-140,60.3333},{-140,60.3333}},
                                                               color={0,0,0}));
    connect(wall19.toSurfacePort_2, office2.toConstructionPorts[4]) annotation (
        Line(points={{-100,42},{-100,60.3333}},                color={0,0,0}));
    connect(wall20.toSurfacePort_2, office3.toConstructionPorts[4]) annotation (
        Line(points={{-60,42},{-60,60.3333}},              color={0,0,0}));
    connect(wall21.toSurfacePort_2, office4.toConstructionPorts[4])
      annotation (Line(points={{-20,42},{-20,60.3333},{-20,60.3333}},
                                                            color={0,0,0}));
    connect(wall22.toSurfacePort_2, office5.toConstructionPorts[4])
      annotation (Line(points={{20,42},{20,42},{20,60.3333},{20,60.3333}},
                                                                 color={0,0,0}));
    connect(wall23.toSurfacePort_2, office6.toConstructionPorts[4])
      annotation (Line(points={{60,42},{58,42},{58,60.3333},{60,60.3333}},
                                                                 color={0,0,0}));
    connect(wall24.toSurfacePort_2, office7.toConstructionPorts[4]) annotation (
        Line(points={{100,42},{100,42},{100,60.3333},{100,60.3333}},
                                                          color={0,0,0}));
    connect(wall25.toSurfacePort_2, office8.toConstructionPorts[4]) annotation (
        Line(points={{140,42},{140,42},{140,60.3333},{140,60.3333}},
                                                           color={0,0,0}));
    connect(window1.toSurfacePort_1, office1.toConstructionPorts[5]) annotation (
       Line(points={{-146,88},{-146,74},{-140,74},{-140,61}},           color={0,0,0}));
    connect(window2.toSurfacePort_1, office2.toConstructionPorts[5]) annotation (
       Line(points={{-106,88},{-106,74},{-100,74},{-100,61}},         color={0,0,0}));
    connect(window3.toSurfacePort_1, office3.toConstructionPorts[5]) annotation (
       Line(points={{-66,88},{-66,74},{-60,74},{-60,61}},          color={0,0,0}));
    connect(window4.toSurfacePort_1, office4.toConstructionPorts[5]) annotation (
       Line(points={{-26,88},{-26,74},{-20,74},{-20,61}}, color={0,0,0}));
    connect(window5.toSurfacePort_1, office5.toConstructionPorts[5])
      annotation (Line(points={{14,88},{14,74},{20,74},{20,61}}, color={0,0,0}));
    connect(window6.toSurfacePort_1, office6.toConstructionPorts[5]) annotation (
       Line(points={{54,88},{54,74},{60,74},{60,61}},         color={0,0,0}));
    connect(window7.toSurfacePort_1, office7.toConstructionPorts[5]) annotation (
       Line(points={{94,88},{94,74},{100,74},{100,61}},         color={0,0,0}));
    connect(window8.toSurfacePort_1, office8.toConstructionPorts[5]) annotation (
       Line(points={{134,88},{134,74},{140,74},{140,61}},                   color={0,0,0}));
    connect(bottom1.toSurfacePort_1, office1.toConstructionPorts[6]) annotation (
       Line(points={{-130,30},{-130,44},{-140,44},{-140,61.6667}},               color={0,0,0}));
    connect(bottom2.toSurfacePort_1, office2.toConstructionPorts[6]) annotation (
       Line(points={{-90,30},{-90,44},{-100,44},{-100,61.6667}},     color={0,0,0}));
    connect(bottom3.toSurfacePort_1, office3.toConstructionPorts[6]) annotation (
       Line(points={{-50,30},{-50,44},{-60,44},{-60,61.6667}},              color={0,0,0}));
    connect(bottom4.toSurfacePort_1, office4.toConstructionPorts[6]) annotation (
       Line(points={{-30,30},{-30,30},{-30,44},{-20,44},{-20,61.6667}},
                                                                   color={0,0,0}));
    connect(bottom5.toSurfacePort_1, office5.toConstructionPorts[6]) annotation (
       Line(points={{30,30},{30,30},{30,44},{20,44},{20,61.6667}},
                                                              color={0,0,0}));
    connect(bottom6.toSurfacePort_1, office6.toConstructionPorts[6]) annotation (
       Line(points={{70,30},{70,30},{70,46},{60,46},{60,61.6667}},
                                                              color={0,0,0}));
    connect(bottom7.toSurfacePort_1, office7.toConstructionPorts[6]) annotation (
       Line(points={{110,30},{110,44},{100,44},{100,61.6667}},
                                                        color={0,0,0}));
    connect(bottom8.toSurfacePort_1, office8.toConstructionPorts[6]) annotation (
       Line(points={{130,30},{130,44},{140,44},{140,61.6667}},     color={0,0,0}));
    connect(wall36.toSurfacePort_1, corridor.toConstructionPorts[1]) annotation (
       Line(points={{-158,20},{4,20},{4,18.1429}},                   color={0,0,0}));
    connect(corridor.toConstructionPorts[2], wall38.toSurfacePort_1) annotation (
       Line(points={{4,18.4286},{4,20},{158,20}},      color={127,0,0}));
    connect(wall18.toSurfacePort_1, corridor.toConstructionPorts[3]) annotation (
       Line(points={{-140,38},{-140,34},{4,34},{4,18.7143}},color={0,0,0}));
    connect(wall19.toSurfacePort_1, corridor.toConstructionPorts[4]) annotation (
       Line(points={{-100,38},{-100,34},{4,34},{4,19}},     color={0,0,0}));
    connect(wall20.toSurfacePort_1, corridor.toConstructionPorts[5]) annotation (
       Line(points={{-60,38},{-62,38},{-62,34},{4,34},{4,19.2857}},color={0,0,0}));
    connect(wall21.toSurfacePort_1, corridor.toConstructionPorts[6]) annotation (
       Line(points={{-20,38},{-20,34},{4,34},{4,19.5714}},color={0,0,0}));
    connect(wall22.toSurfacePort_1, corridor.toConstructionPorts[7]) annotation (
       Line(points={{20,38},{20,34},{4,34},{4,19.8571}},color={0,0,0}));
    connect(wall23.toSurfacePort_1, corridor.toConstructionPorts[8]) annotation (
       Line(points={{60,38},{60,34},{4,34},{4,20.1429}},color={0,0,0}));
    connect(wall24.toSurfacePort_1, corridor.toConstructionPorts[9]) annotation (
       Line(points={{100,38},{100,34},{4,34},{4,20.4286}},color={0,0,0}));
    connect(wall25.toSurfacePort_1, corridor.toConstructionPorts[10]) annotation (
       Line(points={{140,38},{140,34},{4,34},{4,20.7143}},                  color={0,0,0}));
    connect(wall26.toSurfacePort_2, corridor.toConstructionPorts[11])
      annotation (Line(points={{-60,2},{-60,4},{4,4},{4,21}},  color={0,0,0}));
    connect(wall27.toSurfacePort_2, corridor.toConstructionPorts[12]) annotation (
       Line(points={{98,2},{98,4},{4,4},{4,21.2857}},       color={0,0,0}));
    connect(wall28.toSurfacePort_2, corridor.toConstructionPorts[13])
      annotation (Line(points={{140,2},{140,4},{4,4},{4,21.5714}},
                                                               color={0,0,0}));
    connect(wall26.toSurfacePort_1, bullpen.toConstructionPorts[1]) annotation (
        Line(points={{-60,-2},{-60,-21.75}},               color={0,0,0}));
    connect(bullpen.toConstructionPorts[2], wall33.toSurfacePort_1) annotation (
        Line(points={{-60,-21.25},{-60,-20},{78,-20}},        color={127,0,0}));
    connect(bullpen.toConstructionPorts[3], wall37.toSurfacePort_1) annotation (
        Line(points={{-60,-20.75},{-60,-20},{-158,-20}},                  color={127,0,0}));
    connect(wall32.toSurfacePort_1, bullpen.toConstructionPorts[4]) annotation (
        Line(points={{-60,-78},{-60,-20.25}},             color={0,0,0}));
    connect(bullpen.toConstructionPorts[5], bottom9.toSurfacePort_1) annotation (
       Line(points={{-60,-19.75},{-60,-38},{-46,-38},{-46,-42}},
                                                              color={127,0,0}));
    connect(corridor.toConstructionPorts[14], bottom13.toSurfacePort_1)
      annotation (Line(points={{4,21.8571},{4,-4}},                  color={127,0,0}));
    connect(window9.toSurfacePort_1, bullpen.toConstructionPorts[6]) annotation (
       Line(points={{-166,-30},{-80,-30},{-80,-19.25},{-60,-19.25}},      color={0,0,0}));
    connect(window10.toSurfacePort_1, bullpen.toConstructionPorts[7])
      annotation (Line(points={{-50,-88},{-50,-70},{-60,-70},{-60,-18.75}},                  color={0,0,0}));
    connect(restroom1.toConstructionPorts[1], wall35.toSurfacePort_1)
      annotation (Line(points={{98,-21.6},{98,-20},{118,-20}},           color={127,0,0}));
    connect(wall35.toSurfacePort_2, restroom2.toConstructionPorts[1])
      annotation (Line(points={{122,-20},{140,-20},{140,-21.6}},         color={0,0,0}));
    connect(restroom2.toConstructionPorts[2], wall39.toSurfacePort_1)
      annotation (Line(points={{140,-20.8},{154,-20.8},{154,-20},{158,-20}},
                                                                         color={127,0,0}));
    connect(wall27.toSurfacePort_1, restroom1.toConstructionPorts[2])
      annotation (Line(points={{98,-2},{98,-20.8}},                          color={0,0,0}));
    connect(wall28.toSurfacePort_1, restroom2.toConstructionPorts[3])
      annotation (Line(points={{140,-2},{140,-6},{140,-6},{140,-20}},color={0,0,0}));
    connect(restroom1.toConstructionPorts[3], wall29.toSurfacePort_2)
      annotation (Line(points={{98,-20},{98,-38}},                   color={127,0,0}));
    connect(restroom2.toConstructionPorts[4], wall30.toSurfacePort_2)
      annotation (Line(points={{140,-19.2},{140,-36},{140,-36},{140,-38}},
                                                                         color={127,0,0}));
    connect(bottom10.toSurfacePort_1, restroom1.toConstructionPorts[4])
      annotation (Line(points={{88,-44},{88,-36},{98,-36},{98,-19.2}},
                                                                     color={0,0,0}));
    connect(bottom11.toSurfacePort_1, restroom2.toConstructionPorts[5])
      annotation (Line(points={{150,-44},{150,-34},{140,-34},{140,-18.4}},
                                                                         color={0,0,0}));
    connect(wall29.toSurfacePort_1, conferenceRoom.toConstructionPorts[1])
      annotation (Line(points={{98,-42},{98,-46},{120,-46},{120,-61.7143}},
                                                                       color={0,0,0}));
    connect(wall30.toSurfacePort_1, conferenceRoom.toConstructionPorts[2])
      annotation (Line(points={{140,-42},{140,-42},{140,-46},{120,-46},{120,-61.1429}},
                                                                                  color={0,0,0}));
    connect(conferenceRoom.toConstructionPorts[3], wall31.toSurfacePort_1)
      annotation (Line(points={{120,-60.5714},{120,-74},{120,-74},{120,-78}},   color={127,0,0}));
    connect(conferenceRoom.toConstructionPorts[4], wall40.toSurfacePort_1)
      annotation (Line(points={{120,-60},{136,-60},{140,-60},{140,-60},{158,-60}},color={127,0,0}));
    connect(wall34.toSurfacePort_2, conferenceRoom.toConstructionPorts[5])
      annotation (Line(points={{82,-60},{100,-60},{100,-59.4286},{120,-59.4286}},
                                                                        color={0,0,0}));
    connect(bottom12.toSurfacePort_1, conferenceRoom.toConstructionPorts[6])
      annotation (Line(points={{130,-88},{130,-74},{120,-74},{120,-58.8571}},     color={0,0,0}));
    connect(window11.toSurfacePort_1, conferenceRoom.toConstructionPorts[7])
      annotation (Line(points={{110,-88},{110,-74},{120,-74},{120,-58.2857}},   color={0,0,0}));
    connect(restroom1.toConstructionPorts[5], wall33.toSurfacePort_2)
      annotation (Line(points={{98,-18.4},{98,-20},{82,-20}},        color={127,0,0}));
    connect(bullpen.toConstructionPorts[8], wall34.toSurfacePort_1)
      annotation (Line(points={{-60,-18.25},{-60,-20},{0,-20},{0,-60},{78,-60}},                 color={127,0,0}));
    connect(wall36.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1])
      annotation (Line(points={{-162,20},{-166,20},{-166,0},{-170.8,0}}, color={0,0,0}));
    connect(wall1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2])
      annotation (Line(points={{-162,60},{-166,60},{-166,3.55271e-15},{-170.8,3.55271e-15}},  color={0,0,0}));
    connect(window1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3])
      annotation (Line(points={{-146,92},{-146,96},{-166,96},{-166,3.55271e-15},
            {-170.8,3.55271e-15}},                                                                       color={0,0,0}));
    connect(wall10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4])
      annotation (Line(points={{-136,82},{-136,96},{-166,96},{-166,3.55271e-15},
            {-170.8,3.55271e-15}},                                                                       color={0,0,0}));
    connect(window2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5])
      annotation (Line(points={{-106,92},{-106,96},{-166,96},{-166,3.55271e-15},
            {-170.8,3.55271e-15}},                                                                       color={0,0,0}));
    connect(wall11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6])
      annotation (Line(points={{-96,82},{-96,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                               color={0,0,0}));
    connect(window3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7])
      annotation (Line(points={{-66,92},{-66,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                             color={0,0,0}));
    connect(wall12.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8])
      annotation (Line(points={{-56,82},{-56,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                             color={0,0,0}));
    connect(window4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9])
      annotation (Line(points={{-26,92},{-30,92},{-30,96},{-166,96},{-166,3.55271e-15},
            {-170.8,3.55271e-15}},                                                                              color={0,0,0}));
    connect(wall13.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10])
      annotation (Line(points={{-16,82},{-16,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                             color={0,0,0}));
    connect(window5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[11])
      annotation (Line(points={{14,92},{14,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                           color={0,0,0}));
    connect(wall14.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[12])
      annotation (Line(points={{24,82},{24,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                           color={0,0,0}));
    connect(window6.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[13])
      annotation (Line(points={{54,92},{54,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                           color={0,0,0}));
    connect(wall15.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[14])
      annotation (Line(points={{64,82},{64,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                           color={0,0,0}));
    connect(window7.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[15])
      annotation (Line(points={{94,92},{94,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                           color={0,0,0}));
    connect(wall16.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[16])
      annotation (Line(points={{104,82},{104,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                             color={0,0,0}));
    connect(window8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[17])
      annotation (Line(points={{134,92},{134,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                             color={0,0,0}));
    connect(wall17.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[18])
      annotation (Line(points={{144,82},{144,96},{-166,96},{-166,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                             color={0,0,0}));
    connect(wall9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[19])
      annotation (Line(points={{162,60},{166,60},{166,96},{-166,96},{-166,3.55271e-15},
            {-170.8,3.55271e-15}},                                                                              color={0,0,0}));
    connect(wall38.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[20])
      annotation (Line(points={{162,20},{166,20},{166,96},{-166,96},{-166,3.55271e-15},
            {-170.8,3.55271e-15}},                                                                              color={0,0,0}));
    connect(window9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[21])
      annotation (Line(points={{-170,-30},{-170.8,-30},{-170.8,3.55271e-15}}, color={0,0,0}));
    connect(wall32.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[22])
      annotation (Line(points={{-60,-82},{-60,-82},{-60,-98},{-170.8,-98},{-170.8,
            3.55271e-15}},                                                                        color={0,0,0}));
    connect(window10.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[23])
      annotation (Line(points={{-50,-92},{-50,-98},{-170.8,-98},{-170.8,3.55271e-15}}, color={0,0,0}));
    connect(window11.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[24])
      annotation (Line(points={{110,-92},{110,-98},{-170.8,-98},{-170.8,3.55271e-15}}, color={0,0,0}));
    connect(wall40.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[25])
      annotation (Line(points={{162,-60},{166,-60},{166,-98},{-170.8,-98},{-170.8,
            3.55271e-15}},                                                                        color={0,0,0}));
    connect(wall39.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[26])
      annotation (Line(points={{162,-20},{166,-20},{166,-98},{-170.8,-98},{-170.8,
            3.55271e-15}},                                                                        color={0,0,0}));
    connect(wall31.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[27])
      annotation (Line(points={{120,-82},{120,-98},{-170,-98},{-170,-50},{-170.8,
            -50},{-170.8,0}},                                                                                color={0,0,0}));
    connect(wall37.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[28])
      annotation (Line(points={{-162,-20},{-170,-20},{-170,3.55271e-15},{-170.8,
            3.55271e-15}},                                                                      color={0,0,0}));
    connect(bottom1.toSurfacePort_2, surfacesToSolids.toConstructionPorts[1])
      annotation (Line(points={{-130,26},{-130,26},{-130,-68},{-130,-64},{-130,-66},
            {0,-66},{0,-109.6}},                                                                         color={0,0,0}));
    connect(bottom2.toSurfacePort_2, surfacesToSolids.toConstructionPorts[2])
      annotation (Line(points={{-90,26},{-90,26},{-90,-66},{8.88178e-16,-66},{8.88178e-16,
            -109.6}},                                                                                 color={0,0,0}));
    connect(bottom3.toSurfacePort_2, surfacesToSolids.toConstructionPorts[3])
      annotation (Line(points={{-50,26},{-50,12},{-90,12},{-90,-66},{8.88178e-16,
            -66},{8.88178e-16,-109.6}},                                                                        color={0,0,0}));
    connect(bottom4.toSurfacePort_2, surfacesToSolids.toConstructionPorts[4])
      annotation (Line(points={{-30,26},{-30,-66},{0,-66},{0,-109.6}}, color={0,0,0}));
    connect(bottom5.toSurfacePort_2, surfacesToSolids.toConstructionPorts[5])
      annotation (Line(points={{30,26},{30,26},{30,-66},{8.88178e-16,-66},{8.88178e-16,
            -109.6}},                                                                              color={0,0,0}));
    connect(bottom6.toSurfacePort_2, surfacesToSolids.toConstructionPorts[6])
      annotation (Line(points={{70,26},{70,26},{70,-66},{8.88178e-16,-66},{8.88178e-16,
            -109.6}},                                                                              color={0,0,0}));
    connect(bottom7.toSurfacePort_2, surfacesToSolids.toConstructionPorts[7])
      annotation (Line(points={{110,26},{110,20},{70,20},{70,-66},{8.88178e-16,-66},
            {8.88178e-16,-109.6}},                                                                           color={0,0,0}));
    connect(bottom8.toSurfacePort_2, surfacesToSolids.toConstructionPorts[8])
      annotation (Line(points={{130,26},{130,20},{70,20},{70,-66},{8.88178e-16,-66},
            {8.88178e-16,-109.6}},                                                                           color={0,0,0}));
    connect(bottom9.toSurfacePort_2, surfacesToSolids.toConstructionPorts[9])
      annotation (Line(points={{-46,-46},{-46,-66},{0,-66},{0,-109.6}}, color={0,0,0}));
    connect(bottom10.toSurfacePort_2, surfacesToSolids.toConstructionPorts[10])
      annotation (Line(points={{88,-48},{88,-48},{88,-98},{88,-98},{8.88178e-16,
            -98},{8.88178e-16,-109.6}},                                                                       color={0,0,0}));
    connect(bottom11.toSurfacePort_2, surfacesToSolids.toConstructionPorts[11])
      annotation (Line(points={{150,-48},{150,-98},{8.88178e-16,-98},{8.88178e-16,
            -109.6}},                                                                         color={0,0,0}));
    connect(bottom12.toSurfacePort_2, surfacesToSolids.toConstructionPorts[12])
      annotation (Line(points={{130,-92},{130,-98},{8.88178e-16,-98},{8.88178e-16,
            -109.6}},                                                                         color={0,0,0}));
    connect(bottom13.toSurfacePort_2, surfacesToSolids.toConstructionPorts[13])
      annotation (Line(points={{4,-8},{10,-8},{10,-98},{8.88178e-16,-98},{8.88178e-16,
            -109.6}},                                                                                       color={0,0,0}));
    connect(office1.T_setHeating, T_setHeating[1]) annotation (Line(
        points={{-151,67},{-151,64},{-156,64},{-156,102},{180,102},{180,89.2308}},
                                                                                color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.T_setHeating, T_setHeating[2]) annotation (Line(
        points={{-111,67},{-111,66},{-116,66},{-116,106},{180,106},{180,87.6923}},
                                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.T_setHeating, T_setHeating[3]) annotation (Line(
        points={{-71,67},{-71,66},{-76,66},{-76,106},{180,106},{180,86.1538}},
                                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.T_setHeating, T_setHeating[4]) annotation (Line(
        points={{-31,67},{-31,66},{-36,66},{-36,106},{180,106},{180,84.6154}},
                                                                          color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.T_setHeating, T_setHeating[5]) annotation (Line(
        points={{9,67},{9,66},{4,66},{4,106},{180,106},{180,83.0769}},  color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.T_setHeating, T_setHeating[6]) annotation (Line(
        points={{49,67},{49,64},{44,64},{44,104},{180,104},{180,81.5385}},
                                                                        color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.T_setHeating, T_setHeating[7]) annotation (Line(
        points={{89,67},{89,66},{84,66},{84,102},{180,102},{180,80}},       color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.T_setHeating, T_setHeating[8]) annotation (Line(
        points={{129,67},{129,64},{124,64},{124,104},{180,104},{180,78.4615}},
                                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.T_setHeating, T_setHeating[9]) annotation (Line(
      points={{-71,-13},{-71,-18},{-76,-18},{-76,102},{180,102},{180,76.9231}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.T_setHeating, T_setHeating[10]) annotation (Line(
      points={{-7,27},{-7,6},{44,6},{44,78},{38,78},{38,102},{180,102},{180,75.3846}},        color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.T_setHeating, T_setHeating[11]) annotation (Line(
      points={{87,-13},{87,-18},{84,-18},{84,8},{168,8},{168,73.8462},{180,73.8462}},    color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.T_setHeating, T_setHeating[12]) annotation (Line(
      points={{129,-13},{129,-18},{124,-18},{124,8},{168,8},{168,70.9091},{180,70.9091},
            {180,72.3077}},                                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.T_setHeating, T_setHeating[13]) annotation (Line(
      points={{109,-53},{109,-58},{108,-58},{108,-50},{168,-50},{168,70.7692},{180,
            70.7692}},                                                                       color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.T_setCooling, T_setCooling[1]) annotation (Line(
      points={{-151,65},{-151,68},{-156,68},{-156,102},{180,102},{180,69.2308}},
                                                                              color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.T_setCooling, T_setCooling[2]) annotation (Line(
      points={{-111,65},{-111,68},{-116,68},{-116,108},{180,108},{180,67.6923}},
                                                                          color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.T_setCooling, T_setCooling[3]) annotation (Line(
        points={{-71,65},{-71,68},{-76,68},{-76,108},{180,108},{180,66.1538}},
                                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.T_setCooling, T_setCooling[4]) annotation (Line(
        points={{-31,65},{-31,68},{-36,68},{-36,108},{180,108},{180,64.6154}},
                                                                          color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.T_setCooling, T_setCooling[5]) annotation (Line(
        points={{9,65},{9,68},{4,68},{4,108},{180,108},{180,63.0769}},  color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.T_setCooling, T_setCooling[6]) annotation (Line(
        points={{49,65},{49,68},{44,68},{44,108},{180,108},{180,61.5385}},
                                                                        color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.T_setCooling, T_setCooling[7]) annotation (Line(
        points={{89,65},{89,62},{84,62},{84,102},{180,102},{180,60}},       color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.T_setCooling, T_setCooling[8]) annotation (Line(
        points={{129,65},{129,68},{124,68},{124,108},{180,108},{180,58.4615}},
                                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.T_setCooling, T_setCooling[9]) annotation (Line(
        points={{-71,-15},{-71,-18},{-76,-18},{-76,102},{180,102},{180,56.9231}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.T_setCooling, T_setCooling[10]) annotation (Line(
        points={{-7,25},{-7,6},{44,6},{44,78},{38,78},{38,102},{180,102},{180,55.3846}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.T_setCooling, T_setCooling[11]) annotation (Line(
        points={{87,-15},{87,-18},{84,-18},{84,8},{168,8},{168,53.8462},{180,53.8462}},    color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.T_setCooling, T_setCooling[12]) annotation (Line(
        points={{129,-15},{129,-20},{124,-20},{124,8},{168,8},{168,52.3077},{180,
            52.3077}},                                                                     color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.T_setCooling, T_setCooling[13]) annotation (Line(
        points={{109,-55},{109,-56},{108,-56},{108,-50},{168,-50},{168,50.7692},
            {180,50.7692}},                                                                    color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.airchange, airchange[1]) annotation (Line(
        points={{-151,57},{-154,57},{-154,58},{-156,58},{-156,102},{166,102},{166,
            49.2308},{180,49.2308}},                                                        color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.airchange, airchange[2]) annotation (Line(
        points={{-111,57},{-116,57},{-116,102},{166,102},{166,47.6923},{180,47.6923}},
                                                                               color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.airchange, airchange[3]) annotation (Line(
        points={{-71,57},{-76,57},{-76,102},{166,102},{166,46.1538},{180,46.1538}},
                                                                               color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.airchange, airchange[4]) annotation (Line(
        points={{-31,57},{-36,57},{-36,102},{166,102},{166,44.6154},{180,44.6154}},
                                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.airchange, airchange[5]) annotation (Line(
        points={{9,57},{4,57},{4,102},{166,102},{166,68},{180,68},{180,43.0769}}, color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.airchange, airchange[6]) annotation (Line(
        points={{49,57},{44,57},{44,102},{166,102},{166,41.5385},{180,41.5385}},
                                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.airchange, airchange[7]) annotation (Line(
        points={{89,57},{84,57},{84,102},{166,102},{166,40},{180,40}},         color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.airchange, airchange[8]) annotation (Line(
        points={{129,57},{124,57},{124,102},{166,102},{166,38.4615},{180,38.4615}},
                                                                               color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.airchange, airchange[9]) annotation (Line(
          points={{-71,-23},{-74,-23},{-74,-26},{-76,-26},{-76,-36},{62,-36},{62,
            12},{154,12},{154,34},{180,34},{180,36.9231}},                             color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.airchange, airchange[10]) annotation (Line(
        points={{-7,17},{-12,17},{-12,18},{-14,18},{-14,6},{154,6},{154,34},{180,
            34},{180,35.3846}},                                                   color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.airchange, airchange[11]) annotation (Line(
        points={{87,-23},{86,-23},{86,-24},{84,-24},{84,14},{154,14},{154,33.8462},
            {180,33.8462}},                                                        color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.airchange, airchange[12]) annotation (Line(
        points={{129,-23},{126,-23},{126,-24},{124,-24},{124,6},{168,6},{168,32.3077},
            {180,32.3077}},                                                        color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.airchange, airchange[13]) annotation (Line(
        points={{109,-63},{108,-63},{108,-50},{180,-50},{180,30.7692}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.TAirAmb, TAirAmb) annotation (Line(
        points={{-151,55},{-154,55},{-154,56},{-156,56},{-156,102},{50,102},{50,
            120}},                                                color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.TAirAmb, TAirAmb) annotation (Line(
        points={{-111,55},{-116,55},{-116,102},{50,102},{50,120}},
                                                               color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.TAirAmb, TAirAmb) annotation (Line(
        points={{-71,55},{-76,55},{-76,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.TAirAmb, TAirAmb) annotation (Line(
        points={{-31,55},{-36,55},{-36,102},{20,102},{20,120},{50,120}},
                                                                     color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.TAirAmb, TAirAmb) annotation (Line(
        points={{9,55},{4,55},{4,102},{50,102},{50,120}},   color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.TAirAmb, TAirAmb) annotation (Line(
        points={{49,55},{44,55},{44,102},{20,102},{20,120},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.TAirAmb, TAirAmb) annotation (Line(
        points={{89,55},{84,55},{84,102},{20,102},{20,120},{50,120}},   color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.TAirAmb, TAirAmb) annotation (Line(
        points={{129,55},{124,55},{124,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.TAirAmb, TAirAmb) annotation (Line(
        points={{-71,-25},{-76,-25},{-76,102},{50,102},{50,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.TAirAmb, TAirAmb) annotation (Line(
        points={{-7,15},{-14,15},{-14,6},{44,6},{44,78},{38,78},{38,102},{50,102},
            {50,120}},                                                                      color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.TAirAmb, TAirAmb) annotation (Line(
        points={{87,-25},{84,-25},{84,4},{-6,4},{-6,102},{50,102},{50,120}},             color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.TAirAmb, TAirAmb) annotation (Line(
        points={{129,-25},{126,-25},{126,-26},{124,-26},{124,14},{44,14},{44,78},
            {38,78},{38,102},{50,102},{50,120}},                                                 color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.TAirAmb, TAirAmb) annotation (Line(
        points={{109,-65},{108,-65},{108,-42},{114,-42},{114,14},{44,14},{44,78},
            {34,78},{34,102},{50,102},{50,120}},                                                                     color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.xAirAmb, xAirAmb) annotation (Line(
        points={{-151,53},{-154,53},{-154,54},{-156,54},{-156,102},{70,102},{70,
            120}},                                                color={0,0,127},pattern=LinePattern.Dot));
    connect(office2.xAirAmb, xAirAmb) annotation (Line(
        points={{-111,53},{-116,53},{-116,102},{70,102},{70,120}},
                                                               color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.xAirAmb, xAirAmb) annotation (Line(
        points={{-71,53},{-76,53},{-76,102},{70,102},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.xAirAmb, xAirAmb) annotation (Line(
        points={{-31,53},{-36,53},{-36,102},{70,102},{70,120}},
                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.xAirAmb, xAirAmb) annotation (Line(
        points={{9,53},{4,53},{4,102},{70,102},{70,120}},   color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.xAirAmb, xAirAmb) annotation (Line(
        points={{49,53},{46,53},{46,54},{44,54},{44,88},{70,88},{70,120}},
                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.xAirAmb, xAirAmb) annotation (Line(
        points={{89,53},{84,53},{84,102},{70,102},{70,120}},   color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.xAirAmb, xAirAmb) annotation (Line(
        points={{129,53},{124,53},{124,102},{38,102},{38,120},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.xAirAmb, xAirAmb) annotation (Line(
        points={{-71,-27},{-76,-27},{-76,102},{38,102},{38,120},{70,120}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.xAirAmb, xAirAmb) annotation (Line(
        points={{-7,13},{-14,13},{-14,6},{44,6},{44,78},{38,78},{38,102},{70,102},
            {70,120}},                                                               color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.xAirAmb, xAirAmb) annotation (Line(
        points={{87,-27},{86,-27},{86,-28},{84,-28},{84,14},{44,14},{44,78},{38,
            78},{38,102},{70,102},{70,120}},                                                     color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.xAirAmb, xAirAmb) annotation (Line(
        points={{129,-27},{126,-27},{126,-28},{124,-28},{124,14},{44,14},{44,78},
            {38,78},{38,102},{70,102},{70,120}},                                                         color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.xAirAmb, xAirAmb) annotation (Line(
        points={{109,-67},{108,-67},{108,-42},{114,-42},{114,14},{44,14},{44,78},
            {38,78},{38,102},{70,102},{70,120}},                                                                     color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
        points={{-129,65},{-129,-106},{-80,-106},{-80,-112.769}},
                                                                color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.Q_flow_cooling, Q_flow_cooling[2]) annotation (Line(
        points={{-89,65},{-89,-20},{-94,-20},{-94,-106},{-80,-106},{-80,-114.308}},
                                                                                  color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.Q_flow_cooling, Q_flow_cooling[3]) annotation (Line(
        points={{-49,65},{-49,-106},{-80,-106},{-80,-115.846}},
                                                              color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.Q_flow_cooling, Q_flow_cooling[4]) annotation (Line(
        points={{-9,65},{-9,-106},{-80,-106},{-80,-117.385}}, color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.Q_flow_cooling, Q_flow_cooling[5]) annotation (Line(
        points={{31,65},{31,-20},{28,-20},{28,-106},{-80,-106},{-80,-118.923}},
                                                                              color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.Q_flow_cooling, Q_flow_cooling[6]) annotation (Line(
        points={{71,65},{71,-20},{68,-20},{68,-106},{-80,-106},{-80,-120.462}},
                                                                              color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.Q_flow_cooling, Q_flow_cooling[7]) annotation (Line(
        points={{111,65},{111,-46},{98,-46},{98,-106},{-80,-106},{-80,-122}},     color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.Q_flow_cooling, Q_flow_cooling[8]) annotation (Line(
        points={{151,65},{151,-20},{154,-20},{154,-106},{-80,-106},{-80,-123.538}},
                                                                                  color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.Q_flow_cooling, Q_flow_cooling[9]) annotation (Line(
        points={{-49,-15},{-49,-62},{-80,-62},{-80,-125.077}},                      color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.Q_flow_cooling, Q_flow_cooling[10]) annotation (Line(
        points={{15,25},{15,-106},{-80,-106},{-80,-126.615}},
                                                           color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.Q_flow_cooling, Q_flow_cooling[11]) annotation (Line(
        points={{109,-15},{109,-106},{-80,-106},{-80,-128.154}},color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.Q_flow_cooling, Q_flow_cooling[12]) annotation (Line(
        points={{151,-15},{151,-106},{-80,-106},{-80,-129.692}},color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.Q_flow_cooling, Q_flow_cooling[13]) annotation (Line(
        points={{131,-55},{131,-80},{140,-80},{140,-106},{-80,-106},{-80,-131.231}},
                                                                color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
        points={{-129,67},{-129,-106},{80,-106},{80,-112.769}},            color={0,0,127},pattern=LinePattern.Dash));
    connect(office2.Q_flow_heating, Q_flow_heating[2]) annotation (Line(
        points={{-89,67},{-89,-106},{80,-106},{80,-114.308}},
                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(office3.Q_flow_heating, Q_flow_heating[3]) annotation (Line(
        points={{-49,67},{-49,-106},{80,-106},{80,-115.846}},
                                                            color={0,0,127},pattern=LinePattern.Dash));
    connect(office4.Q_flow_heating, Q_flow_heating[4]) annotation (Line(
        points={{-9,67},{-9,-106},{80,-106},{80,-117.385}}, color={0,0,127},pattern=LinePattern.Dash));
    connect(office5.Q_flow_heating, Q_flow_heating[5]) annotation (Line(
        points={{31,67},{31,-106},{80,-106},{80,-118.923}},
                                                          color={0,0,127},pattern=LinePattern.Dash));
    connect(office6.Q_flow_heating, Q_flow_heating[6]) annotation (Line(
        points={{71,67},{71,-106},{80,-106},{80,-120.462}},
                                                          color={0,0,127},pattern=LinePattern.Dash));
    connect(office7.Q_flow_heating, Q_flow_heating[7]) annotation (Line(
        points={{111,67},{111,-20},{110,-20},{110,-106},{80,-106},{80,-122}},   color={0,0,127},pattern=LinePattern.Dash));
    connect(office8.Q_flow_heating, Q_flow_heating[8]) annotation (Line(
        points={{151,67},{151,-20},{154,-20},{154,-106},{80,-106},{80,-123.538}},
                                                                                color={0,0,127},pattern=LinePattern.Dash));
    connect(bullpen.Q_flow_heating, Q_flow_heating[9]) annotation (Line(
        points={{-49,-13},{-49,-106},{80,-106},{80,-125.077}},color={0,0,127},pattern=LinePattern.Dash));
    connect(corridor.Q_flow_heating, Q_flow_heating[10]) annotation (Line(
        points={{15,27},{15,-106},{80,-106},{80,-126.615}},
                                                         color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom1.Q_flow_heating, Q_flow_heating[11]) annotation (Line(
        points={{109,-13},{109,-60},{98,-60},{98,-106},{80,-106},{80,-128.154}},
                                                                              color={0,0,127},pattern=LinePattern.Dash));
    connect(restroom2.Q_flow_heating, Q_flow_heating[12]) annotation (Line(
        points={{151,-13},{151,-60},{144,-60},{144,-106},{80,-106},{80,-129.692}},color={0,0,127},pattern=LinePattern.Dash));
    connect(conferenceRoom.Q_flow_heating, Q_flow_heating[13]) annotation (Line(
        points={{131,-53},{131,-80},{140,-80},{140,-106},{80,-106},{80,-131.231}},color={0,0,127},pattern=LinePattern.Dash));
    connect(office1.radHeatSourcesPorts[1], radHeatSourcesPorts[1]) annotation (Line(
      points={{-135.1,49.3},{-156,49.3},{-156,102},{0,102},{0,110.769}},
      color={127,0,0},
      pattern=LinePattern.Dash));
    connect(office2.radHeatSourcesPorts[1], radHeatSourcesPorts[2]) annotation (Line(
        points={{-95.1,49.3},{-116,49.3},{-116,102},{0,102},{0,112.308}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office3.radHeatSourcesPorts[1], radHeatSourcesPorts[3]) annotation (Line(
        points={{-55.1,49.3},{-76,49.3},{-76,102},{0,102},{0,113.846}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office4.radHeatSourcesPorts[1], radHeatSourcesPorts[4]) annotation (Line(
        points={{-15.1,49.3},{-36,49.3},{-36,102},{0,102},{0,115.385}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office5.radHeatSourcesPorts[1], radHeatSourcesPorts[5]) annotation (Line(
        points={{24.9,49.3},{4,49.3},{4,102},{0,102},{0,116.923}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office6.radHeatSourcesPorts[1], radHeatSourcesPorts[6]) annotation (Line(
        points={{64.9,49.3},{44,49.3},{44,102},{0,102},{0,118.462}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office7.radHeatSourcesPorts[1], radHeatSourcesPorts[7]) annotation (Line(
        points={{104.9,49.3},{84,49.3},{84,102},{0,102},{0,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office8.radHeatSourcesPorts[1], radHeatSourcesPorts[8]) annotation (Line(
        points={{144.9,49.3},{124,49.3},{124,102},{0,102},{0,121.538}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(bullpen.radHeatSourcesPorts[1], radHeatSourcesPorts[9]) annotation (Line(
        points={{-55.1,-30.7},{-76,-30.7},{-76,102},{0,102},{0,123.077}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(corridor.radHeatSourcesPorts[1], radHeatSourcesPorts[10]) annotation (Line(
        points={{8.9,9.3},{0,9.3},{0,0}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(restroom1.radHeatSourcesPorts[1], radHeatSourcesPorts[11]) annotation (Line(
        points={{102.9,-30.7},{114,-30.7},{114,14},{44,14},{44,78},{38,78},{38,102},
            {0,102},{0,126.154}},
        color={127,0,0},pattern=LinePattern.Dash));
    connect(restroom2.radHeatSourcesPorts[1], radHeatSourcesPorts[12]) annotation (Line(
        points={{144.9,-30.7},{154,-30.7},{154,14},{44,14},{44,78},{38,78},{38,102},
            {0,102},{0,127.692}},
        color={127,0,0},pattern=LinePattern.Dash));
    connect(conferenceRoom.radHeatSourcesPorts[1], radHeatSourcesPorts[13]);
    connect(office1.conHeatSourcesPorts[1], conHeatSourcesPorts[1]) annotation (Line(
      points={{-144.9,49.3},{-156,49.3},{-156,102},{-44,102},{-44,110.769}},
      color={127,0,0},
      pattern=LinePattern.Dash));
    connect(office2.conHeatSourcesPorts[1], conHeatSourcesPorts[2]) annotation (Line(
        points={{-104.9,49.3},{-116,49.3},{-116,102},{-44,102},{-44,112.308}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office3.conHeatSourcesPorts[1], conHeatSourcesPorts[3]) annotation (Line(
        points={{-64.9,49.3},{-76,49.3},{-76,102},{-44,102},{-44,113.846}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office4.conHeatSourcesPorts[1], conHeatSourcesPorts[4]) annotation (Line(
        points={{-24.9,49.3},{-36,49.3},{-36,102},{-44,102},{-44,115.385}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office5.conHeatSourcesPorts[1], conHeatSourcesPorts[5]) annotation (Line(
        points={{15.1,49.3},{4,49.3},{4,102},{-44,102},{-44,116.923}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office6.conHeatSourcesPorts[1], conHeatSourcesPorts[6]) annotation (Line(
        points={{55.1,49.3},{44,49.3},{44,102},{-44,102},{-44,118.462}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office7.conHeatSourcesPorts[1], conHeatSourcesPorts[7]) annotation (Line(
        points={{95.1,49.3},{84,49.3},{84,102},{-44,102},{-44,120}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(office8.conHeatSourcesPorts[1], conHeatSourcesPorts[8]) annotation (Line(
        points={{135.1,49.3},{124,49.3},{124,102},{-44,102},{-44,121.538}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(bullpen.conHeatSourcesPorts[1], conHeatSourcesPorts[9]) annotation (Line(
        points={{-64.9,-30.7},{-76,-30.7},{-76,102},{-44,102},{-44,123.077}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(corridor.conHeatSourcesPorts[1], conHeatSourcesPorts[10]) annotation (Line(
        points={{-0.9,9.3},{-6,9.3},{-6,102},{-44,102},{-44,124.615}},
        color={127,0,0},
        pattern=LinePattern.Dash));
    connect(restroom1.conHeatSourcesPorts[1], conHeatSourcesPorts[11]) annotation (Line(
        points={{93.1,-30.7},{114,-30.7},{114,14},{44,14},{44,78},{38,78},{38,102},
            {-44,102},{-44,126.154}},
        color={127,0,0},pattern=LinePattern.Dash));
    connect(restroom2.conHeatSourcesPorts[1], conHeatSourcesPorts[12]) annotation (Line(
        points={{135.1,-30.7},{154,-30.7},{154,14},{44,14},{44,78},{38,78},{38,102},
            {-44,102},{-44,127.692}},
        color={127,0,0},pattern=LinePattern.Dash));
    connect(conferenceRoom.conHeatSourcesPorts[1], conHeatSourcesPorts[13]);
  end Building;

  Building building(
    nZones=13)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));

  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.Germany_Berlin_Meteonorm_ASCII)
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
  BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relationRadiationConvection[13](
    each radiationportion = 0.5)
    annotation (Placement(transformation(extent={{-3,3},{3,-3}},rotation=-90,origin={21,15})));
equation
  connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts)
    annotation (Line(points={{-12,4},{11,4}},color={0,255,0},smooth=Smooth.None));
  connect(ambient.toAirPorts, building.toAmbientAirPorts)
    annotation (Line(points={{-12,-4},{11,-4}},color={85,170,255},smooth=Smooth.None));
  connect(ambient.TAirRef, building.TAirAmb)
    annotation (Line(points={{-29,7},{-30,7},{-30,12},{-30,14},{26.2,14},{26.2,9.8}},   color={0,0,127}));
  connect(ambient.xAir, building.xAirAmb)
    annotation (Line(points={{-29,5},{-32,5},{-32,16},{28.4,16},{28.4,9.8}},   color={0,0,127}));
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
    annotation (Line(points={{20.4,13.8},{20.4,12},{20,12},{20,10}},color={191,0,0}));
  connect(relationRadiationConvection.heatPortLw, building.radHeatSourcesPorts[1:13])
    annotation (Line(points={{21.6,13.8},{21.6,12},{23,12},{23,10}},color={191,0,0}));
  connect(relationRadiationConvection.heatPort, heatFlow.port)
    annotation (Line(points={{21,15.9},{21,18},{24,18}}, color={191,0,0}));

  annotation(experiment(StopTime=86400, __Dymola_Algorithm="Dassl"),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/BuildingThermalMultiZone.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{120,50}}), graphics={
    Text(extent={{-54,-2},{50,-70}},lineColor={0,0,255}, textString="Model of a storey of an office building with 13 thermal zones"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{100,40}})),
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
