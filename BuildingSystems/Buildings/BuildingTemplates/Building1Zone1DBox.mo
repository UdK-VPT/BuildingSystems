within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone1DBox
  "1 zone thermal building model with the shape of a box"
  extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones = 1,
    final prescribedAirchange = true,
    final useAirPathes = false,
    final calcHygroThermal = false,
    final nAirpathes = 0,
    final convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
    final alphaConstant = 0.0, // dummy value
    surfacesToAmbient(nSurfaces=9),
    final nSurfacesSolid=1,
    surfacesToSolids(nSurfaces=nSurfacesSolid));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWall1
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWall2
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWall3
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWall4
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionCeiling
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionBottom
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
  parameter Boolean InteriorWalls = true
    "True: Interior walls are present, false: Interior walls are  absent"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"));
  parameter Modelica.SIunits.Area AInteriorWalls = 1.0
    "Surface area of one side of the interior walls"
    annotation(Dialog(tab="Opaque constructions",group="Interior constructions"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionWallsInterior
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"), choicesAllMatching=true);
  parameter Boolean InteriorCeilings = true
    "True: Interior ceilings are present, false: Interior ceilings are absent"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"));
  parameter Modelica.SIunits.Area AInteriorCeilings = 1.0
    "Surface area of one side of the interior ceilings"
    annotation(Dialog(tab="Opaque constructions",group="Interior constructions"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionCeilingsInterior
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"), choicesAllMatching=true);
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    final prescribedAirchange = prescribedAirchange,
    final V = width*length*height,
    final height = height,
    final calcIdealLoads = calcIdealLoads,
    final heatSources = heatSources,
    final nHeatSources = nHeatSources,
    nConstructions1 = if InteriorWalls then 4 else 2,
    nConstructions2 = if InteriorCeilings then 5 else 3,
    nConstructions3 = 2,
    nConstructions4 = 3)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  parameter Modelica.SIunits.Length width = 10.0
  "Width of the building (inner space)"
   annotation(Dialog(tab="General",group="Geometry"));
  parameter Modelica.SIunits.Length length = 10.0
   "Length of the building (inner space)"
    annotation(Dialog(tab="General",group="Geometry"));
  parameter Modelica.SIunits.Length height = 2.8
    "Height of the building (inner space)"
    annotation(Dialog(tab="General",group="Geometry"));
  parameter Modelica.SIunits.Length widthWindow1 = 0.0
    "Width of window1"
    annotation(Dialog(tab ="Transparent constructions",group = "window1 (included in constructionWall1)"));
  parameter Modelica.SIunits.Length heightWindow1 = 0.0
    "Height of window1"
    annotation(Dialog(tab ="Transparent constructions",group = "window1 (included in constructionWall1)"));
  parameter Real framePortionWindow1 = 0.2
    "Frame portion of window1"
    annotation(Dialog(tab ="Transparent constructions",group = "window1 (included in constructionWall1)"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.TransparentConstruction constructionWindow1
    "Data of the construction of window1"
    annotation(Dialog(tab = "Transparent constructions", group = "window1 (included in constructionWall1)"), choicesAllMatching=true);
  parameter Modelica.SIunits.Length widthWindow2 = 0.0
    "Width of window2"
    annotation(Dialog(tab ="Transparent constructions",group = "window2 (included in constructionWall2)"));
  parameter Modelica.SIunits.Length heightWindow2 = 0.0
    "Height of window2"
    annotation(Dialog(tab ="Transparent constructions",group = "window2 (included in constructionWall2)"));
  parameter Real framePortionWindow2 = 0.2
    "Frame portion of window2"
    annotation(Dialog(tab ="Transparent constructions",group = "window2 (included in constructionWall2)"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.TransparentConstruction constructionWindow2
    "Data of the construction of window2"
    annotation(Dialog(tab = "Transparent constructions", group = "window2 (included in constructionWall2)"), choicesAllMatching=true);
  parameter Modelica.SIunits.Length widthWindow3 = 0.0
    "Width of window3"
    annotation(Dialog(tab ="Transparent constructions",group = "window3 (included in constructionWall3)"));
  parameter Modelica.SIunits.Length heightWindow3 = 0.0
    "Height of window3"
    annotation(Dialog(tab ="Transparent constructions",group = "window3 (included in constructionWall3)"));
  parameter Real framePortionWindow3 = 0.2
    "Frame portion of window3"
    annotation(Dialog(tab ="Transparent constructions",group = "window3 (included in constructionWall3)"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.TransparentConstruction constructionWindow3
    "Data of the construction of window3"
    annotation(Dialog(tab = "Transparent constructions", group = "window3 (included in constructionWall3)"), choicesAllMatching=true);
  parameter Modelica.SIunits.Length widthWindow4 = 0.0
    "Width of window4"
    annotation(Dialog(tab ="Transparent constructions",group = "window4 (included in constructionWall4)"));
  parameter Modelica.SIunits.Length heightWindow4 = 0.0
    "Height of window4"
    annotation(Dialog(tab ="Transparent constructions",group = "window4 (included in constructionWall4)"));
  parameter Real framePortionWindow4 = 0.2
    "Frame portion of window4"
    annotation(Dialog(tab ="Transparent constructions",group = "window4 (included in constructionWall4)"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.TransparentConstruction constructionWindow4
    "Data of the construction of window4"
    annotation(Dialog(tab = "Transparent constructions", group = "window4 (included in constructionWall4)"), choicesAllMatching=true);
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall1(
    height = height,
    width = length,
    nInnSur = 1,
    AInnSur = {window1.A},
    constructionData = constructionWall1,
    angleDegAzi = 90.0 + angleDegAziBuilding,
    angleDegTil = 90.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-40,10})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall2(
    height = height,
    width = width,
    nInnSur = 1,
    AInnSur = {window2.A},
    constructionData = constructionWall2,
    angleDegAzi = 180.0 + angleDegAziBuilding,
    angleDegTil = 90.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-20,20})));
  replaceable BuildingSystems.Buildings.Constructions.Windows.Window window2(
    height = max(heightWindow2,1e-5),
    width = max(widthWindow2,1e-5),
    framePortion = framePortionWindow2,
    angleDegAzi = 180.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    UVal = (1.0 - framePortionWindow2) * constructionWindow2.UValGla + framePortionWindow2 * constructionWindow2.UValFra,
    tauDir0 = constructionWindow2.g,
    tauDif = constructionWindow2.g)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={2,20})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceiling(
    height = width,
    width = length,
    constructionData = constructionCeiling,
    angleDegAzi = 0.0,
    angleDegTil = 180.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={22,20})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall3(
    height = height,
    width = length,
    nInnSur = 1,
    AInnSur = {window3.A},
    constructionData = constructionWall3,
    angleDegAzi = -90.0 + angleDegAziBuilding,
    angleDegTil = 90.0)
    annotation (Placement(transformation(extent={{30,-20},{50,0}})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom(
    height = length,
    width = width,
    constructionData = constructionBottom,
    angleDegAzi = 0.0,
    angleDegTil = 0.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-20})));
  replaceable BuildingSystems.Buildings.Constructions.Windows.Window window4(
    height = max(heightWindow4,1e-5),
    width = max(widthWindow4,1e-5),
    framePortion = framePortionWindow4,
    angleDegAzi = 0.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    UVal = (1.0 - framePortionWindow4) * constructionWindow4.UValGla + framePortionWindow4 * constructionWindow4.UValFra,
    tauDir0 = constructionWindow4.g,
    tauDif = constructionWindow4.g)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-20})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall4(
    height = height,
    width = width,
    nInnSur = 1,
    AInnSur = {window4.A},
    constructionData = constructionWall4,
    angleDegAzi = 0.0 + angleDegAziBuilding,
    angleDegTil = 90.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-20,-20})));
  replaceable BuildingSystems.Buildings.Constructions.Windows.Window window1(
    height = max(heightWindow1,1e-5),
    width = max(widthWindow1,1e-5),
    framePortion = framePortionWindow1,
    angleDegAzi = 90.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    UVal = (1.0 - framePortionWindow1) * constructionWindow1.UValGla + framePortionWindow1 * constructionWindow1.UValFra,
    tauDir0 = constructionWindow1.g,
    tauDif = constructionWindow1.g)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-40,-10})));
  replaceable BuildingSystems.Buildings.Constructions.Windows.Window window3(
    height = max(heightWindow3,1e-5),
    width = max(widthWindow3,1e-5),
    framePortion = framePortionWindow3,
    angleDegAzi = -90.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    UVal = (1.0 - framePortionWindow3) * constructionWindow3.UValGla + framePortionWindow3 * constructionWindow3.UValFra,
    tauDir0 = constructionWindow3.g,
    tauDif = constructionWindow3.g)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={40,10})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wallsInterior(
    final constructionData=constructionWallsInterior,
    final angleDegTil = 90.0,
    final width = AInteriorWalls/wallsInterior.height,
    height = 1.0,
    final angleDegAzi = 0) if InteriorWalls
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-18,-6})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceilingsInterior(
    final constructionData=constructionCeilingsInterior,
    final width = AInteriorCeilings/ceilingsInterior.height,
    height = 1.0,
    final angleDegAzi = 0.0,
    final angleDegTil = 0.0) if InteriorCeilings
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-20,40})));
equation
  connect(zone.TAir, TAir[1]) annotation (Line(
    points={{-7,7},{-7,-30},{88,-30},{88,-70},{110,-70}},
    color={0,0,127},
    smooth=Smooth.None));
  // Building construction
  // Ideal heat load calculation
  if calcIdealLoads then
    connect(zone.T_setCooling, T_setCooling[1]) annotation (Line(
        points={{5,7},{8,7},{8,-12},{80,-12},{80,60},{100,60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone.T_setHeating, T_setHeating[1]) annotation (Line(
        points={{1,7},{1,-14},{74,-14},{74,80},{100,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
      points={{7,7},{7,-80},{-80,-80},{-80,-100}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
      points={{3,7},{3,-40},{80,-40},{80,-100}},
      color={0,0,127},
      smooth=Smooth.None));
  end if;
  // Prescribed airchange
  if prescribedAirchange then
    connect(zone.TAirAmb, TAirAmb) annotation (Line(
      points={{11,5},{16,5},{16,82},{50,82},{50,100}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.xAirAmb, xAirAmb) annotation (Line(
      points={{11,3},{18,3},{18,80},{70,80},{70,100}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.airchange, airchange[1]) annotation (Line(
      points={{11,7},{26,7},{26,40},{100,40}},
      color={0,0,127},
      smooth=Smooth.None));
  end if;
  // Ideal load calculation
  if heatSources then
    connect(zone.heatSourcesPorts, heatSourcesPorts) annotation (Line(
      points={{0.7,-7.3},{0.7,46.35},{0,46.35},{0,100}},
      color={127,0,0},
      smooth=Smooth.None));
  end if;
  connect(wall1.toSurfacePort_1, zone.toConstructionPorts1[1]) annotation (Line(
      points={{-38,10},{-26,10},{-26,2},{-11,2}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(window1.toSurfacePort_1, zone.toConstructionPorts1[2]) annotation (
      Line(
      points={{-38,-10},{-26,-10},{-26,6},{-11,6}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(window3.toSurfacePort_1, zone.toConstructionPorts3[1]) annotation (
      Line(
      points={{38,10},{26,10},{26,-6},{11,-6}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(wall3.toSurfacePort_1, zone.toConstructionPorts3[2]) annotation (Line(
      points={{38,-10},{26,-10},{26,-2},{11,-2}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(ceiling.toSurfacePort_1, zone.toConstructionPorts2[1]) annotation (
      Line(
      points={{22,18},{14,18},{14,14},{6.66667,14},{6.66667,11}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(wall2.toSurfacePort_1, zone.toConstructionPorts2[2]) annotation (Line(
      points={{-20,18},{-20,14},{4,14},{4,11}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(window2.toSurfacePort_1, zone.toConstructionPorts2[3]) annotation (
      Line(
      points={{2,18},{2,14},{1.33333,14},{1.33333,11}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(wall4.toSurfacePort_1, zone.toConstructionPorts4[1]) annotation (Line(
      points={{-20,-18},{-20,-16},{-1.33333,-16},{-1.33333,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(window4.toSurfacePort_1, zone.toConstructionPorts4[2]) annotation (
      Line(
      points={{0,-18},{0,-16},{-4,-16},{-4,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(bottom.toSurfacePort_1, zone.toConstructionPorts4[3]) annotation (
      Line(
      points={{20,-18},{20,-16},{-6.66667,-16},{-6.66667,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(window1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1])
    annotation (Line(
      points={{-42,-10},{-82,-10},{-82,3.55271e-015},{-89.9,3.55271e-015}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(wall1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2])
    annotation (Line(
      points={{-42,10},{-82,10},{-82,3.55271e-015},{-89.9,3.55271e-015}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(wall4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3])
    annotation (Line(
      points={{-20,-22},{-20,-34},{-82,-34},{-82,3.55271e-015},{-89.9,3.55271e-015}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(window4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4])
    annotation (Line(
      points={{-4.44089e-016,-22},{-4.44089e-016,-34},{-82,-34},{-82,3.55271e-015},
          {-89.9,3.55271e-015}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(wall3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5])
    annotation (Line(
      points={{42,-10},{44,-10},{44,-34},{-82,-34},{-82,3.55271e-015},{-89.9,3.55271e-015}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(wall2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6])
    annotation (Line(
      points={{-20,22},{-20,32},{-82,32},{-82,3.55271e-015},{-89.9,3.55271e-015}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(window2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7])
    annotation (Line(
      points={{2,22},{2,32},{-82,32},{-82,3.55271e-015},{-89.9,3.55271e-015}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(ceiling.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8])
    annotation (Line(
      points={{22,22},{22,32},{-82,32},{-82,3.55271e-015},{-89.9,3.55271e-015}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(window3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[9])
    annotation (Line(
      points={{42,10},{44,10},{44,32},{-82,32},{-82,3.55271e-015},{-89.9,3.55271e-015}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(bottom.toSurfacePort_2, surfacesToSolids.toConstructionPorts[1])
    annotation (Line(
      points={{20,-22},{20,-22},{20,-70},{8.88178e-016,-70},{8.88178e-016,-90.8}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(wallsInterior.toSurfacePort_2, zone.toConstructionPorts1[3])
   annotation (Line(points={{-16,-6},{-16,-6},{-16,5},{-11,5}},color={0,0,0},pattern=LinePattern.Solid));
  connect(zone.toConstructionPorts1[4], wallsInterior.toSurfacePort_1)
     annotation (Line(points={{-11,7},{-14,7},{-14,6},{-22,6},{-22,-6},{-20,-6}},color={127,0,0}));
  connect(zone.toConstructionPorts2[4], ceilingsInterior.toSurfacePort_2)
     annotation (Line(points={{2.4,11},{2.4,50},{-20,50},{-20,42}}, color={127,0,0}));
  connect(zone.toConstructionPorts2[5], ceilingsInterior.toSurfacePort_1)
     annotation (Line(points={{0.8,11},{0.8,34},{-20,34},{-20,38}}, color={127,0,0}));

end Building1Zone1DBox;
