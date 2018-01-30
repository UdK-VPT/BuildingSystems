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
    final alphaConstant = 0.0,
    surfacesToAmbient(nSurfaces=9
      - (if BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic then 1 else 0)
      - (if BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic then 1 else 0)
      - (if BCWall3 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic then 1 else 0)
      - (if BCWall4 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic then 1 else 0)
      - (if BCCeiling == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic then 1 else 0)
      - (if BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant then 1 else 0)
      - (if BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant then 1 else 0)
      - (if BCWall3 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant then 1 else 0)
      - (if BCWall4 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant then 1 else 0)
      - (if BCCeiling == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant then 1 else 0)),
    final nSurfacesSolid=1,
    surfacesToSolids(nSurfaces=nSurfacesSolid),
    final show_TAir = true,
    final show_xAir = true);   // dummy value

  BuildingSystems.Buildings.Surfaces.SurfaceToSolid outerSurfaceWall1 if
       (BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic
    or BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant)
    "Surface for outer thermal boundary condition of wall1";
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ConstTempWall1(T=TWall1_constant) if
       BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant
    "Constant temperature on the outer surface of wall1";
  BuildingSystems.Buildings.Surfaces.SurfaceToSolid outerSurfaceWall2 if
       (BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic
    or BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant)
    "Surface for outer thermal boundary condition of wall2";
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ConstTempWall2(T=TWall2_constant) if
       BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant
    "Constant temperature on the outer surface of wall2";
  BuildingSystems.Buildings.Surfaces.SurfaceToSolid outerSurfaceWall3 if
       (BCWall3 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic
    or BCWall3 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant)
    "Surface for outer thermal boundary condition of wall3";
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ConstTempWall3(T=TWall3_constant) if
       BCWall3 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant
    "Constant temperature on the outer surface of wall3";
  BuildingSystems.Buildings.Surfaces.SurfaceToSolid outerSurfaceWall4 if
       (BCWall4 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic
    or BCWall4 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant)
    "Surface for outer thermal boundary condition of wall4";
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ConstTempWall4(T=TWall4_constant) if
       BCWall4 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant
    "Constant temperature on the outer surface of wall4";
  BuildingSystems.Buildings.Surfaces.SurfaceToSolid outerSurfaceCeiling if
       (BCCeiling == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic
    or BCCeiling == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant)
    "Surface for outer thermal boundary condition of ceiling";
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature ConstTempCeiling(T=TCeiling_constant) if
       BCCeiling == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant
    "Constant temperature on the outer surface of ceiling";
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
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWallsInterior
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"), choicesAllMatching=true);
  parameter Boolean InteriorCeilings = true
    "True: Interior ceilings are present, false: Interior ceilings are absent"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"));
  parameter Modelica.SIunits.Area AInteriorCeilings = 1.0
    "Surface area of one side of the interior ceilings"
    annotation(Dialog(tab="Opaque constructions",group="Interior constructions"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionCeilingsInterior
    "Data of the thermal construction"
    annotation(Dialog(tab = "Opaque constructions", group = "Interior constructions"), choicesAllMatching=true);
  parameter BuildingSystems.Buildings.Types.ThermalBoundaryCondition BCWall1=
    BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient
    "Thermal boundary condition wall1"
    annotation(Dialog(tab = "Opaque constructions", group = "Thermal boundary conditions"));
  parameter Modelica.SIunits.Temp_K TWall1_constant = 293.15
    "Constant temperature on the outer surface of wall1 (used if BCWall1=Constant)"
    annotation (Dialog(tab = "Opaque constructions", group = "Thermal boundary conditions"));
  parameter BuildingSystems.Buildings.Types.ThermalBoundaryCondition BCWall2=
    BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient
    "Thermal boundary condition wall2"
    annotation(Dialog(tab = "Opaque constructions", group = "Thermal boundary conditions"));
  parameter Modelica.SIunits.Temp_K TWall2_constant = 293.15
    "Constant temperature on the outer surface of wall2 (used if BCWall2=Constant)"
    annotation (Dialog(tab = "Opaque constructions", group = "Thermal boundary conditions"));
  parameter BuildingSystems.Buildings.Types.ThermalBoundaryCondition BCWall3=
    BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient
    "Thermal boundary condition wall3"
    annotation(Dialog(tab = "Opaque constructions", group = "Thermal boundary conditions"));
  parameter Modelica.SIunits.Temp_K TWall3_constant = 293.15
    "Constant temperature on the outer surface of wall3 (used if BCWall3=Constant)"
    annotation (Dialog(tab = "Opaque constructions", group = "Thermal boundary conditions"));
  parameter BuildingSystems.Buildings.Types.ThermalBoundaryCondition BCWall4=
    BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient
    "Thermal boundary condition wall4"
    annotation(Dialog(tab = "Opaque constructions", group = "Thermal boundary conditions"));
  parameter Modelica.SIunits.Temp_K TWall4_constant = 293.15
    "Constant temperature on the outer surface of wall4 (used if BCWall4=Constant)"
    annotation (Dialog(tab = "Opaque constructions", group = "Thermal boundary conditions"));
  parameter BuildingSystems.Buildings.Types.ThermalBoundaryCondition BCCeiling=
    BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient
    "Thermal boundary condition ceiling"
    annotation(Dialog(tab = "Opaque constructions", group = "Thermal boundary conditions"));
  parameter Modelica.SIunits.Temp_K TCeiling_constant = 293.15
    "Constant temperature on the outer surface of ceiling (used if BCCeiling=Constant)"
    annotation (Dialog(tab = "Opaque constructions", group = "Thermal boundary conditions"));
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
    annotation(Dialog(tab= "Transparent constructions",group = "window1 (included in constructionWall1)"));
  parameter Modelica.SIunits.Length heightWindow1 = 0.0
    "Height of window1"
    annotation(Dialog(tab= "Transparent constructions",group = "window1 (included in constructionWall1)"));
  parameter Real framePortionWindow1 = 0.2
    "Frame portion of window1"
    annotation(Dialog(tab= "Transparent constructions",group = "window1 (included in constructionWall1)"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.TransparentConstruction constructionWindow1
    "Data of the construction of window1"
    annotation(Dialog(tab = "Transparent constructions", group = "window1 (included in constructionWall1)"), choicesAllMatching=true);
  parameter Boolean use_GSCWindow1_in = false
    "= true, use input for geometric shading coefficient GSCWindow1"
    annotation(Dialog(tab = "Transparent constructions", group = "window1 (included in constructionWall1)"), choicesAllMatching=true);
  Modelica.Blocks.Interfaces.RealOutput GSCWindow1_constant(
    min = 0.0,
    max = 1.0) = 0.0
    "Constant shading coefficient window1 (if use_GSCWindow1_in = true)"
    annotation(Dialog(tab= "Transparent constructions",group = "window1 (included in constructionWall1)"));
  input Modelica.Blocks.Interfaces.RealInput GSCWindow1_in if use_GSCWindow1_in
    "Shading coefficient window1"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-98,-12}),
      iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-60,54})));
  parameter Modelica.SIunits.Length widthWindow2 = 0.0
    "Width of window2"
    annotation(Dialog(tab= "Transparent constructions",group = "window2 (included in constructionWall2)"));
  parameter Modelica.SIunits.Length heightWindow2 = 0.0
    "Height of window2"
    annotation(Dialog(tab= "Transparent constructions",group = "window2 (included in constructionWall2)"));
  parameter Real framePortionWindow2 = 0.2
    "Frame portion of window2"
    annotation(Dialog(tab= "Transparent constructions",group = "window2 (included in constructionWall2)"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.TransparentConstruction constructionWindow2
    "Data of the construction of window2"
    annotation(Dialog(tab = "Transparent constructions", group = "window2 (included in constructionWall2)"), choicesAllMatching=true);
  parameter Boolean use_GSCWindow2_in = false
    "= true, use input for geometric shading coefficient GSCWindow2"
    annotation(Dialog(tab = "Transparent constructions", group = "window2 (included in constructionWall2)"), choicesAllMatching=true);
  Modelica.Blocks.Interfaces.RealOutput GSCWindow2_constant(
    min = 0.0,
    max = 1.0) = 0.0
    "Constant shading coefficient window1 (if use_GSCWindow2_in = true)"
    annotation(Dialog(tab= "Transparent constructions",group = "window2 (included in constructionWall2)"));
  input Modelica.Blocks.Interfaces.RealInput GSCWindow2_in if use_GSCWindow2_in
    "Shading coefficient window2"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={8,52},
        rotation=-90),
      iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-30,54})));
  parameter Modelica.SIunits.Length widthWindow3 = 0.0
    "Width of window3"
    annotation(Dialog(tab= "Transparent constructions",group = "window3 (included in constructionWall3)"));
  parameter Modelica.SIunits.Length heightWindow3 = 0.0
    "Height of window3"
    annotation(Dialog(tab= "Transparent constructions",group = "window3 (included in constructionWall3)"));
  parameter Real framePortionWindow3 = 0.2
    "Frame portion of window3"
    annotation(Dialog(tab= "Transparent constructions",group = "window3 (included in constructionWall3)"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.TransparentConstruction constructionWindow3
    "Data of the construction of window3"
    annotation(Dialog(tab = "Transparent constructions", group = "window3 (included in constructionWall3)"), choicesAllMatching=true);
  parameter Boolean use_GSCWindow3_in = false
    "= true, use input for geometric shading coefficient GSCWindow2"
    annotation(Dialog(tab = "Transparent constructions", group = "window3 (included in constructionWall3)"), choicesAllMatching=true);
  Modelica.Blocks.Interfaces.RealOutput GSCWindow3_constant(
    min = 0.0,
    max = 1.0) = 0.0
    "Constant shading coefficient window1 (if use_GSCWindow3_in = true)"
    annotation(Dialog(tab= "Transparent constructions",group = "window3 (included in constructionWall3)"));
  input Modelica.Blocks.Interfaces.RealInput GSCWindow3_in if use_GSCWindow3_in
    "Shading coefficient window3"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},origin={76,10}),
      iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={0,54})));
  parameter Modelica.SIunits.Length widthWindow4 = 0.0
    "Width of window4"
    annotation(Dialog(tab= "Transparent constructions",group = "window4 (included in constructionWall4)"));
  parameter Modelica.SIunits.Length heightWindow4 = 0.0
    "Height of window4"
    annotation(Dialog(tab= "Transparent constructions",group = "window4 (included in constructionWall4)"));
  parameter Real framePortionWindow4 = 0.2
    "Frame portion of window4"
    annotation(Dialog(tab= "Transparent constructions",group = "window4 (included in constructionWall4)"));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.TransparentConstruction constructionWindow4
    "Data of the construction of window4"
    annotation(Dialog(tab = "Transparent constructions", group = "window4 (included in constructionWall4)"), choicesAllMatching=true);
  parameter Boolean use_GSCWindow4_in = false
    "= true, use input for geometric shading coefficient GSCWindow4"
    annotation(Dialog(tab = "Transparent constructions", group = "window4 (included in constructionWall4)"), choicesAllMatching=true);
  Modelica.Blocks.Interfaces.RealOutput GSCWindow4_constant(
    min = 0.0,
    max = 1.0) = 0.0
    "Constant shading coefficient window4 (if use_GSCWindow4_in = true)"
    annotation(Dialog(tab= "Transparent constructions",group = "window4 (included in constructionWall4)"));
  input Modelica.Blocks.Interfaces.RealInput GSCWindow4_in if use_GSCWindow4_in
    "Shading coefficient window4"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,-64}),
      iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={30,54})));
  parameter Modelica.SIunits.Temp_K TWall1_start = 293.15
    "Start temperature of each layer of wall1"
    annotation (Dialog(tab="Initialization",group = "Opaque constructions"));
  parameter Modelica.SIunits.Temp_K TWall2_start = 293.15
    "Start temperature of each layer of wall2"
    annotation (Dialog(tab="Initialization",group = "Opaque constructions"));
  parameter Modelica.SIunits.Temp_K TWall3_start = 293.15
    "Start temperature of each layer of wall3"
    annotation (Dialog(tab="Initialization",group = "Opaque constructions"));
  parameter Modelica.SIunits.Temp_K TWall4_start = 293.15
    "Start temperature of each layer of wall4"
    annotation (Dialog(tab="Initialization",group = "Opaque constructions"));
  parameter Modelica.SIunits.Temp_K TCeiling_start = 293.15
    "Start temperature of each layer of ceiling"
    annotation (Dialog(tab="Initialization",group = "Opaque constructions"));
  parameter Modelica.SIunits.Temp_K TBottom_start = 293.15
    "Start temperature of each layer of bottom"
    annotation (Dialog(tab="Initialization",group = "Opaque constructions"));
  parameter Modelica.SIunits.Temp_K TWallsInterior_start = 293.15
    "Start temperature of each layer of interior walls"
    annotation (Dialog(tab="Initialization",group = "Opaque constructions"));
  parameter Modelica.SIunits.Temp_K TCeilingsInterior_start = 293.15
    "Start temperature of each layer of interior ceilings"
    annotation (Dialog(tab="Initialization",group = "Opaque constructions"));
  parameter Modelica.SIunits.Temp_K TWindow1_start = 293.15
    "Start temperature of each layer of window1"
    annotation (Dialog(tab="Initialization",group = "Transparent constructions"));
  parameter Modelica.SIunits.Temp_K TWindow2_start = 293.15
    "Start temperature of each layer of window2"
    annotation (Dialog(tab="Initialization",group = "Transparent constructions"));
  parameter Modelica.SIunits.Temp_K TWindow3_start = 293.15
    "Start temperature of each layer of window3"
    annotation (Dialog(tab="Initialization",group = "Transparent constructions"));
  parameter Modelica.SIunits.Temp_K TWindow4_start = 293.15
    "Start temperature of each layer of window4"
    annotation (Dialog(tab="Initialization",group = "Transparent constructions"));
  parameter Modelica.SIunits.Temp_K TAir_start = 293.15
    "Start temperature of indoor air temperature"
    annotation (Dialog(tab="Initialization"));
  parameter BuildingSystems.Buildings.Types.NumericalResolution numResWall1=
    BuildingSystems.Buildings.Types.NumericalResolution.Low
    "Numerical resolution wall1"
    annotation(Dialog(tab = "Advanced", group = "Numerical Parameters"));
  parameter BuildingSystems.Buildings.Types.NumericalResolution numResWall2=
    BuildingSystems.Buildings.Types.NumericalResolution.Low
    "Numerical resolution wall2"
    annotation(Dialog(tab = "Advanced", group = "Numerical Parameters"));
  parameter BuildingSystems.Buildings.Types.NumericalResolution numResWall3=
    BuildingSystems.Buildings.Types.NumericalResolution.Low
    "Numerical resolution wall3"
    annotation(Dialog(tab = "Advanced", group = "Numerical Parameters"));
  parameter BuildingSystems.Buildings.Types.NumericalResolution numResWall4=
    BuildingSystems.Buildings.Types.NumericalResolution.Low
    "Numerical resolution wall4"
    annotation(Dialog(tab = "Advanced", group = "Numerical Parameters"));
  parameter BuildingSystems.Buildings.Types.NumericalResolution numResCeiling=
    BuildingSystems.Buildings.Types.NumericalResolution.Low
    "Numerical resolution ceiling"
    annotation(Dialog(tab = "Advanced", group = "Numerical Parameters"));
  parameter BuildingSystems.Buildings.Types.NumericalResolution numResBottom=
    BuildingSystems.Buildings.Types.NumericalResolution.Low
    "Numerical resolution bottom"
    annotation(Dialog(tab = "Advanced", group = "Numerical Parameters"));
  parameter BuildingSystems.Buildings.Types.NumericalResolution numResCeilingsInterior=
    BuildingSystems.Buildings.Types.NumericalResolution.Low
    "Numerical resolution interior ceilings"
    annotation(Dialog(tab = "Advanced", group = "Numerical Parameters"));
  parameter BuildingSystems.Buildings.Types.NumericalResolution numResWallsInterior=
    BuildingSystems.Buildings.Types.NumericalResolution.Low
    "Numerical resolution interior walls"
    annotation(Dialog(tab = "Advanced", group = "Numerical Parameters"));
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    final prescribedAirchange = prescribedAirchange,
    final V = width*length*height,
    final height = height,
    final calcIdealLoads = calcIdealLoads,
    final heatSources = heatSources,
    final nHeatSources = nHeatSources,
    nConstructions = 10+(if InteriorWalls then 2 else 0)+(if InteriorCeilings then 2 else 0),
    T_start = TAir_start)
    "Thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall1(
    height = height,
    width = length,
    AInnSur = window1.ASur,
    constructionData = constructionWall1,
    nNodes = if numResWall1 == BuildingSystems.Buildings.Types.NumericalResolution.Low then fill(1,constructionWall1.nLayers) else
      if numResWall1 == BuildingSystems.Buildings.Types.NumericalResolution.Medium then fill(2,constructionWall1.nLayers) else
      fill(4,constructionWall1.nLayers),
    angleDegAzi = 90.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    T_start = {TWall1_start for i in 1:wall1.constructionData.nLayers})
    "Wall 1 (west oriented if angleDegAzi is 0 degree)"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-54,10})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall2(
    height = height,
    width = width,
    AInnSur = window2.ASur,
    constructionData = constructionWall2,
    nNodes = if numResWall2 == BuildingSystems.Buildings.Types.NumericalResolution.Low then fill(1,constructionWall2.nLayers) else
      if numResWall2 == BuildingSystems.Buildings.Types.NumericalResolution.Medium then fill(2,constructionWall2.nLayers) else
      fill(4,constructionWall2.nLayers),
    angleDegAzi = 180.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    T_start = {TWall2_start for i in 1:wall2.constructionData.nLayers})
    "Wall 2 (north oriented if angleDegAzi is 0 degree)"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-20,26})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall3(
    height = height,
    width = length,
    AInnSur = window3.ASur,
    constructionData = constructionWall3,
    nNodes = if numResWall3 == BuildingSystems.Buildings.Types.NumericalResolution.Low then fill(1,constructionWall3.nLayers) else
      if numResWall3 == BuildingSystems.Buildings.Types.NumericalResolution.Medium then fill(2,constructionWall3.nLayers) else
      fill(4,constructionWall3.nLayers),
    angleDegAzi = -90.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    T_start = {TWall3_start for i in 1:wall3.constructionData.nLayers})
    "Wall 3 (east oriented if angleDegAzi is 0 degree)"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{40,-20},{60,0}})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall4(
    height = height,
    width = width,
    AInnSur = window4.ASur,
    constructionData = constructionWall4,
    nNodes = if numResWall4 == BuildingSystems.Buildings.Types.NumericalResolution.Low then fill(1,constructionWall4.nLayers) else
      if numResWall4 == BuildingSystems.Buildings.Types.NumericalResolution.Medium then fill(2,constructionWall4.nLayers) else
      fill(4,constructionWall4.nLayers),
    angleDegAzi = 0.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    T_start = {TWall4_start for i in 1:wall4.constructionData.nLayers})
    "Wall 4 (south oriented if angleDegAzi is 0 degree)"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-20,-38})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceiling(
    height = length,
    width = width,
    constructionData = constructionCeiling,
    nNodes = if numResCeiling == BuildingSystems.Buildings.Types.NumericalResolution.Low then fill(1,constructionCeiling.nLayers) else
      if numResCeiling == BuildingSystems.Buildings.Types.NumericalResolution.Medium then fill(2,constructionCeiling.nLayers) else
      fill(4,constructionCeiling.nLayers),
    angleDegAzi = 0.0,
    angleDegTil = 180.0,
    T_start = {TCeiling_start for i in 1:ceiling.constructionData.nLayers})
    "Ceiling (horizontal oriented)"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={22,26})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom(
    height = length,
    width = width,
    constructionData = constructionBottom,
    nNodes = if numResBottom == BuildingSystems.Buildings.Types.NumericalResolution.Low then fill(1,constructionBottom.nLayers) else
      if numResBottom == BuildingSystems.Buildings.Types.NumericalResolution.Medium then fill(2,constructionBottom.nLayers) else
      fill(4,constructionBottom.nLayers),
    angleDegAzi = 0.0,
    angleDegTil = 0.0,
    T_start = {TBottom_start for i in 1:bottom.constructionData.nLayers})
    "Bottom"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-38})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wallsInterior(
    final constructionData=constructionWallsInterior,
    nNodes = if numResWallsInterior == BuildingSystems.Buildings.Types.NumericalResolution.Low then fill(1,constructionWallsInterior.nLayers) else
      if numResWallsInterior == BuildingSystems.Buildings.Types.NumericalResolution.Medium then fill(2,constructionWallsInterior.nLayers) else
      fill(4,constructionWallsInterior.nLayers),
    final angleDegTil = 90.0,
    final width = AInteriorWalls/wallsInterior.height,
    height = 1.0,
    final angleDegAzi = 0,
    T_start = {TWallsInterior_start for i in 1:wallsInterior.constructionData.nLayers}) if InteriorWalls
    "Optional interior walls"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},origin={-30,-14})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceilingsInterior(
    final constructionData=constructionCeilingsInterior,
    nNodes = if numResCeilingsInterior == BuildingSystems.Buildings.Types.NumericalResolution.Low then fill(1,constructionCeilingsInterior.nLayers) else
      if numResCeilingsInterior == BuildingSystems.Buildings.Types.NumericalResolution.Medium then fill(2,constructionCeilingsInterior.nLayers) else
      fill(4,constructionCeilingsInterior.nLayers),
    final width = AInteriorCeilings/ceilingsInterior.height,
    height = 1.0,
    final angleDegAzi = 0.0,
    final angleDegTil = 0.0,
    T_start = {TCeilingsInterior_start for i in 1:ceilingsInterior.constructionData.nLayers}) if InteriorCeilings
    "Optional interior ceilings"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-20,50})));
  replaceable BuildingSystems.Buildings.Constructions.Windows.Window window1(
    height = max(heightWindow1,1e-5),
    width = max(widthWindow1,1e-5),
    framePortion = framePortionWindow1,
    angleDegAzi = 90.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    constructionData = constructionWindow1,
    T_start = TWindow1_start,
    use_GSC_in = true)
    "Window 1 (west oriented if angleDegAzi is 0 degree)"
    annotation (Dialog(tab = "Transparent constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-54,-10})));
  replaceable BuildingSystems.Buildings.Constructions.Windows.Window window2(
    height = max(heightWindow2,1e-5),
    width = max(widthWindow2,1e-5),
    framePortion = framePortionWindow2,
    angleDegAzi = 180.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    constructionData = constructionWindow2,
    T_start = TWindow2_start)
    "Window 2 (north oriented if angleDegAzi is 0 degree)"
    annotation (Dialog(tab = "Transparent constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={2,26})));
  replaceable BuildingSystems.Buildings.Constructions.Windows.Window window3(
    height = max(heightWindow3,1e-5),
    width = max(widthWindow3,1e-5),
    framePortion = framePortionWindow3,
    angleDegAzi = -90.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    constructionData = constructionWindow3,
    T_start = TWindow3_start)
    "Window 3 (east oriented if angleDegAzi is 0 degree)"
    annotation (Dialog(tab = "Transparent constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},origin={50,10})));
  replaceable BuildingSystems.Buildings.Constructions.Windows.Window window4(
    height = max(heightWindow4,1e-5),
    width = max(widthWindow4,1e-5),
    framePortion = framePortionWindow4,
    angleDegAzi = 0.0 + angleDegAziBuilding,
    angleDegTil = 90.0,
    constructionData = constructionWindow4,
    T_start = TWindow4_start)
    "Window 4 (south oriented if angleDegAzi is 0 degree)"
    annotation (Dialog(tab = "Transparent constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-38})));
protected
  Modelica.Blocks.Interfaces.RealInput GSCWindow1_internal
    "Shading coefficient window1";
  Modelica.Blocks.Interfaces.RealInput GSCWindow2_internal
    "Shading coefficient window2";
  Modelica.Blocks.Interfaces.RealInput GSCWindow3_internal
    "Shading coefficient window3";
  Modelica.Blocks.Interfaces.RealInput GSCWindow4_internal
    "Shading coefficient window4";
equation
  // Shadowing
  if use_GSCWindow1_in then
    connect(GSCWindow1_internal,GSCWindow1_in);
  else
    connect(GSCWindow1_internal,GSCWindow1_constant);
  end if;
  connect(window1.GSC_in,GSCWindow1_internal);
  if use_GSCWindow2_in then
    connect(GSCWindow2_internal,GSCWindow2_in);
  else
    connect(GSCWindow2_internal,GSCWindow2_constant);
  end if;
  connect(window2.GSC_in,GSCWindow2_internal);
  if use_GSCWindow3_in then
    connect(GSCWindow3_internal,GSCWindow3_in);
  else
    connect(GSCWindow3_internal,GSCWindow3_constant);
  end if;
  connect(window3.GSC_in,GSCWindow3_internal);
  if use_GSCWindow4_in then
    connect(GSCWindow4_internal,GSCWindow4_in);
  else
    connect(GSCWindow4_internal,GSCWindow4_constant);
  end if;
  connect(window4.GSC_in,GSCWindow4_internal);

  // Air and moisture
  connect(zone.TAir, TAir[1])
    annotation (Line(points={{11,-3},{11,-4},{36,-4},{36,-24},{88,-24},{88,-70},
      {190,-70}}, color={0,0,127},smooth=Smooth.None));
  connect(zone.xAir, xAir[1])
    annotation (Line(points={{11,-9},{12,-9},{12,-10},{34,-10},{34,-90},{190,-90}},
      color={0,0,127}));

  // Ideal heat load calculation
  if calcIdealLoads then
    connect(zone.T_setCooling, T_setCooling[1])
      annotation (Line(points={{-11,5},{-14,5},{-14,-24},{84,-24},{84,60},{180,60}},
        color={0,0,127},smooth=Smooth.None));
    connect(zone.T_setHeating, T_setHeating[1])
      annotation (Line(points={{-11,7},{-14,7},{-14,80},{180,80}},
        color={0,0,127},smooth=Smooth.None));
    connect(zone.Q_flow_cooling, Q_flow_cooling[1])
      annotation (Line(points={{11,5},{11,4},{36,4},{36,-70},{-80,-70},{-80,-122}},
        color={0,0,127},smooth=Smooth.None));
    connect(zone.Q_flow_heating, Q_flow_heating[1])
      annotation (Line(points={{11,7},{24,7},{24,6},{36,6},{36,-50},{80,-50},{80,
            -122}},
        color={0,0,127},smooth=Smooth.None));
  end if;

  // Prescribed airchange
  if prescribedAirchange then
    connect(zone.TAirAmb, TAirAmb)
      annotation (Line(points={{-11,-5},{-14,-5},{-14,82},{50,82},{50,120}},
        color={0,0,127},smooth=Smooth.None));
    connect(zone.xAirAmb, xAirAmb)
      annotation (Line(points={{-11,-7},{-14,-7},{-14,80},{70,80},{70,120}},
        color={0,0,127},smooth=Smooth.None));
    connect(zone.airchange, airchange[1])
      annotation (Line(points={{-11,-3},{-14,-3},{-14,40},{180,40}},
        color={0,0,127},smooth=Smooth.None));
  end if;

  // Ideal load calculation
  if heatSources then
    connect(conHeatSourcesPorts, zone.conHeatSourcesPorts) annotation (Line(
       points={{-44,120},{-44,66},{-40,66},{-40,12},{-16,12},{-16,-14},{-4.9,-14},
            {-4.9,-10.7}}, color={127,0,0}));
    connect(zone.radHeatSourcesPorts, radHeatSourcesPorts) annotation (Line(
       points={{4.9,-10.7},{4.9,-13.65},{0,-13.65},{0,120}},
          color={127,0,0}));
  end if;

  // Building construction
  connect(wall1.toSurfacePort_1, zone.toConstructionPorts[1])
    annotation (Line(points={{-52,10},{-26,10},{-26,0},{0,0}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(window1.toSurfacePort_1, zone.toConstructionPorts[2])
    annotation (Line(points={{-52,-10},{-42,-10},{-42,0},{0,0}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(window3.toSurfacePort_1, zone.toConstructionPorts[3])
    annotation (Line(points={{48,10},{26,10},{26,0},{0,0}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(wall3.toSurfacePort_1, zone.toConstructionPorts[4])
    annotation (Line(points={{48,-10},{26,-10},{26,0},{0,0}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(ceiling.toSurfacePort_1, zone.toConstructionPorts[5])
    annotation (Line(points={{22,24},{14,24},{14,14},{0,14},{0,0}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(wall2.toSurfacePort_1, zone.toConstructionPorts[6])
    annotation (Line(points={{-20,24},{-20,14},{0,14},{0,0}},
     color={0,0,0},pattern=LinePattern.Solid));
  connect(window2.toSurfacePort_1, zone.toConstructionPorts[7])
    annotation (Line(points={{2,24},{2,14},{0,14},{0,0}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(wall4.toSurfacePort_1, zone.toConstructionPorts[8])
    annotation (Line(points={{-20,-36},{-20,-26},{0,-26},{0,0}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(window4.toSurfacePort_1, zone.toConstructionPorts[9])
    annotation (Line(points={{0,-36},{0,0}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(bottom.toSurfacePort_1, zone.toConstructionPorts[10])
    annotation (Line(points={{20,-36},{20,-26},{0,-26},{0,0}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(bottom.toSurfacePort_2, surfacesToSolids.toConstructionPorts[1])
    annotation (Line(points={{20,-40},{20,-90},{8.88178e-16,-90},{8.88178e-16,-109.6}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(wallsInterior.toSurfacePort_2, zone.toConstructionPorts[11])
    annotation (Line(points={{-28,-14},{-26,-14},{-26,0},{0,0}},
      color={0,0,0},pattern=LinePattern.Solid));
  connect(zone.toConstructionPorts[12], wallsInterior.toSurfacePort_1)
    annotation (Line(points={{0,0},{-32,0},{-32,-14}},
      color={127,0,0}));
  connect(zone.toConstructionPorts[11+(if InteriorWalls then 2 else 0)], ceilingsInterior.toSurfacePort_2)
    annotation (Line(points={{0,0},{0,52},{-20,52}},
      color={127,0,0}));
  connect(zone.toConstructionPorts[12+(if InteriorWalls then 2 else 0)], ceilingsInterior.toSurfacePort_1)
    annotation (Line(points={{0,0},{0,42},{-20,42},{-20,48}},
      color={127,0,0}));
  connect(window1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1])
    annotation (Line(points={{-56,-10},{-82,-10},{-82,3.55271e-15},{-170.8,3.55271e-15}},
                            color={0,0,0},pattern=LinePattern.Solid));
  connect(window2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[2])
    annotation (Line(points={{2,28},{2,32},{-82,32},{-82,3.55271e-15},{-170.8,3.55271e-15}},
                            color={0,0,0},pattern=LinePattern.Solid));
  connect(window3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3])
    annotation (Line(points={{52,10},{64,10},{64,32},{-82,32},{-82,2.66454e-15},
          {-170.8,2.66454e-15}},
                            color={0,0,0},pattern=LinePattern.Solid));
  connect(window4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4])
    annotation (Line(points={{-4.44089e-16,-40},{-4.44089e-16,-50},{-82,-50},{-82,
          2.66454e-15},{-170.8,2.66454e-15}},  color={0,0,0},
      pattern=LinePattern.Solid));
  if BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then
    connect(wall1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4
      + (if BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)])
      annotation (Line(points={{-56,10},{-82,10},{-82,3.55271e-15},{-170.8,3.55271e-15}},
                            color={0,0,0},pattern=LinePattern.Solid));
  elseif BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant then
    connect(wall1.toSurfacePort_2,outerSurfaceWall1.toConstructionPort);
    connect(ConstTempWall1.port,outerSurfaceWall1.heatPort);
  else
    connect(wall1.toSurfacePort_2,outerSurfaceWall1.toConstructionPort);
  end if;
  if BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then
    connect(wall2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4
     + (if BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)
     + (if BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)])
      annotation (Line(points={{-20,28},{-20,32},{-82,32},{-82,3.55271e-15},{-170.8,
            3.55271e-15}},    color={0,0,0},pattern=LinePattern.Solid));
  elseif BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant then
    connect(wall2.toSurfacePort_2,outerSurfaceWall2.toConstructionPort);
    connect(ConstTempWall2.port,outerSurfaceWall2.heatPort);
  else
    connect(wall2.toSurfacePort_2,outerSurfaceWall2.toConstructionPort);
  end if;
  if BCWall3 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then
    connect(wall3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4
      + (if BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)
      + (if BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)
      + (if BCWall3 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)])
      annotation (Line(points={{52,-10},{64,-10},{64,-50},{-82,-50},{-82,2.66454e-15},
            {-170.8,2.66454e-15}},               color={0,0,0},
        pattern=LinePattern.Solid));
  elseif BCWall3 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant then
    connect(wall3.toSurfacePort_2,outerSurfaceWall3.toConstructionPort);
    connect(ConstTempWall3.port,outerSurfaceWall3.heatPort);
  else
    connect(wall3.toSurfacePort_2,outerSurfaceWall3.toConstructionPort);
  end if;
  if BCWall4 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then
    connect(wall4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4
      + (if BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)
      + (if BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)
      + (if BCWall3 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)
      + (if BCWall4 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)])
      annotation (Line(points={{-20,-40},{-20,-50},{-82,-50},{-82,2.66454e-15},{
            -170.8,2.66454e-15}},
                              color={0,0,0},pattern=LinePattern.Solid));
  elseif BCWall4 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant then
    connect(wall4.toSurfacePort_2,outerSurfaceWall4.toConstructionPort);
    connect(ConstTempWall4.port,outerSurfaceWall4.heatPort);
  else
    connect(wall4.toSurfacePort_2,outerSurfaceWall4.toConstructionPort);
  end if;
  if BCCeiling == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then
    connect(ceiling.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4
      + (if BCWall1 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)
      + (if BCWall2 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)
      + (if BCWall3 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)
      + (if BCWall4 == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)
      + (if BCCeiling == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient then 1 else 0)])
      annotation (Line(points={{22,28},{22,32},{-82,32},{-82,3.55271e-15},{-170.8,
        3.55271e-15}}, color={0,0,0},pattern=LinePattern.Solid));
  elseif BCCeiling == BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant then
    connect(ceiling.toSurfacePort_2,outerSurfaceCeiling.toConstructionPort);
    connect(ConstTempCeiling.port,outerSurfaceCeiling.heatPort);
  else
    connect(ceiling.toSurfacePort_2,outerSurfaceCeiling.toConstructionPort);
  end if;

  annotation(defaultComponentName="building",
Documentation(info="<html>
<p>
This is a 1 zone thermal building model with the shape of a box.
</p>
</html>", revisions="<html>
<ul>
<li>
January 25, 2018 by Christoph Nytsch-Geusen:<br/>
Adaptation to new zone model.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Building1Zone1DBox;
