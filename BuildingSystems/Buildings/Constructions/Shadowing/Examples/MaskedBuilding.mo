within BuildingSystems.Buildings.Constructions.Shadowing.Examples;
model MaskedBuilding
  "Masked building model"
  extends Modelica.Icons.Example;
  model Building
    "Building model with four walls, one window, one ceiling and one floor"
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
      nIdealLoads = 0,
      nZones=1,
      prescribedAirchange = false,
      surfacesToAmbience(nSurfaces=6),
      nSurfacesSolid = 1,
      surfacesToSolids(nSurfaces = nSurfacesSolid),
      useAirPaths = false,
      nAirpaths = 0,
      calcIdealLoads = false,
      convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced);

    parameter Modelica.Units.SI.Length width = 10.0
      "Width of the building (inner space)"
      annotation (Dialog(tab="General", group="Geometry"));
    parameter Modelica.Units.SI.Length length = 10.0
      "Length of the building (inner space)"
      annotation (Dialog(tab="General", group="Geometry"));
    parameter Modelica.Units.SI.Length height = 2.8
      "Height of the building (inner space)"
      annotation (Dialog(tab="General", group="Geometry"));
    parameter Modelica.Units.SI.Temperature TWall_start = 283.15
      "Start temperature of each layer of wall1"
      annotation (Dialog(tab="Initialization", group="Opaque constructions"));
    parameter Modelica.Units.SI.Temperature TCeiling_start = 283.15
      "Start temperature of each layer of wall1"
      annotation (Dialog(tab="Initialization", group="Opaque constructions"));
    parameter Modelica.Units.SI.Temperature TBottom_start = 283.15
      "Start temperature of each layer of wall1"
      annotation (Dialog(tab="Initialization", group="Opaque constructions"));
    parameter Modelica.Units.SI.Temperature TAir_start = 283.15
      "Start temperature of indoor air temperature"
      annotation (Dialog(tab="Initialization"));

    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
      nConstructions=7,
      V = width*length*height,
      height = height,
      T_start = 281.15,
      calcIdealLoads = calcIdealLoads,
      nHeatSources = 0,
      heatSources = false,
      prescribedAirchange = prescribedAirchange,
      convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free)
      "Thermal zone with fully mixed air volume"
      annotation (Placement(transformation(extent={{-20,-20},{20,20}})));

    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWall1(
      nLayers=1,
      thickness={0.15},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()})
      "Data of the thermal construction"
      annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWall2(
      nLayers=1,
      thickness={0.15},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()})
      "Data of the thermal construction"
      annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWall3(
      nLayers=1,
      thickness={0.15},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()})
      "Data of the thermal construction"
      annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWall4(
      nLayers=1,
      thickness={0.15},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()})
      "Data of the thermal construction"
      annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionCeiling(
      nLayers=1,
      thickness={0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()})
      "Data of the thermal construction"
      annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);
    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionBottom(
      nLayers=1,
      thickness={0.3},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()})
      "Data of the thermal construction"
      annotation(Dialog(tab = "Opaque constructions", group = "Exterior constructions"), choicesAllMatching=true);

    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_1(
      constructionData = constructionWall1,
      width = width,
      height = height,
      T_start = {TWall_start},
      angleDegAzi = 0.0,
      angleDegTil = 90.0,
      epsilon_2 = 0.93,
      epsilon_1 = 0.93,
      abs_1 = 0.0,
      abs_2 = 0.4)
      "Wall 1 : Thermal wall model with 1D discretisation of the single layers"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-20,-20},{20,20}},rotation=270,origin={-30,-60})));
    
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_2(
      constructionData = constructionWall2,
      width = length,
      height = height,
      T_start = {TWall_start},
      angleDegAzi = 90.0,
      angleDegTil = 90.0,
      epsilon_2 = 0.93,
      epsilon_1 = 0.93,
      abs_1 =  0.0,
      abs_2 = 0.4)
      "Wall 2 : Thermal wall model with 1D discretisation of the single layers"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-20,-20},{20,20}},rotation=180,origin={-60,0})));

    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_3(
      constructionData = constructionWall3,
      width = width,
      height = height,
      T_start = {TWall_start},
      angleDegAzi = 180.0,
      angleDegTil = 90.0,
      epsilon_2 = 0.93,
      epsilon_1 = 0.93,
      abs_1 =  0.0,
      abs_2 = 0.4)
      "Wall 3 : Thermal wall model with 1D discretisation of the single layers"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-20,-20},{20,20}},rotation=90,origin={-30,60})));

    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall_4(
      constructionData = constructionWall4,
      width = length,
      height = height,
      T_start = {TWall_start},
      angleDegAzi = -90.0,
      angleDegTil = 90.0,
      epsilon_2 = 0.93,
      epsilon_1 = 0.93,
      abs_1 =  0.0,
      abs_2 = 0.4)
      "Wall 4 : Thermal wall model with 1D discretisation of the single layers"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-20,-20},{20,20}},rotation=0,origin={60,30})));

    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceiling(
      constructionData = constructionCeiling,
      width = width,
      height = length,
      angleDegAzi = 0.0,
      angleDegTil = 0.0,
      T_start = {TCeiling_start},
      epsilon_1 = 0.9,
      epsilon_2 = 0.9,
      abs_1 = 0.0,
      abs_2 = 0.4)
      "Ceiling : Thermal wall model with 1D discretisation of the single layers"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-20,-20},{20,20}},rotation=90,origin={30,60})));

    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom(
      constructionData = constructionBottom,
      width = width,
      height = length,
      angleDegAzi = 0.0,
      angleDegTil = 180.0,
      T_start = {TBottom_start},
      epsilon_2 = 0.0,
      epsilon_1 = 0.95,
      abs_1 = 0.0,
      abs_2 = 0.0)
      "Bottom : Thermal wall model with 1D discretisation of the single layers"
    annotation (Dialog(tab = "Opaque constructions", group = "model type"),
      Placement(transformation(extent={{-20,-20},{20,20}},rotation=270,origin={30,-60})));

    BuildingSystems.Buildings.Constructions.Windows.Window window(
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
      width = 0.2*width,
      T_start=283.15,
      height = 0.3*height,
      angleDegAzi = -90.0)
      "Window"
    annotation (Dialog(tab = "Transparent constructions", group = "model type"),
      Placement(transformation(extent={{-20,-20},{20,20}},rotation=0,origin={60,-30})));

  equation

    // connections between building components and the thermal zone
    connect(wall_1.toSurfacePort_1, zone.toConstructionPorts[1])
      annotation (Line(points={{-30,-56},{-30,-26},{0,-26},{0,-1.85714}}, color={0,0,0}));
    connect(wall_2.toSurfacePort_1, zone.toConstructionPorts[2])
      annotation (Line(points={{-30,56},{-30,-26},{0,-26},{0,-1.57143}}, color={0,0,0}));
    connect(wall_3.toSurfacePort_1, zone.toConstructionPorts[3])
      annotation (Line(points={{-56,-1.55431e-15},{-30,-1.55431e-15},{-30,-26}, {0,-26},{0,-1.28571}}, color={0,0,0}));
    connect(wall_4.toSurfacePort_1, zone.toConstructionPorts[4])
      annotation (Line(points={{56,30},{-30,30},{-30,-26},{0,-26},{0,-1}}, color={0,0,0}));
    connect(bottom.toSurfacePort_1, zone.toConstructionPorts[5])
      annotation (Line(points={{30,-56},{30,-28},{0,-28},{0,-0.714286}}, color={0,0,0}));
    connect(ceiling.toSurfacePort_1, zone.toConstructionPorts[6])
      annotation (Line(points={{30,56},{30,30},{-30,30},{-30,-26},{0,-26},{0,-0.428571}}, color={0,0,0}));
    connect(window.toSurfacePort_1, zone.toConstructionPorts[7])
      annotation (Line(points={{56,-30},{30,-30},{30,-28},{0,-28},{0,-0.142857}}, color={0,0,0}));

    // connections between construction elements and environment
    connect(wall_1.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[1])
      annotation (Line(points={{-30,-64},{-138,-64},{-138,2.66454e-15},{-170.8,2.66454e-15}}, color={0,0,0}));
    connect(wall_2.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[2])
      annotation (Line(points={{-64,-5.55112e-16},{-117.4,-5.55112e-16},{-117.4,2.66454e-15},{-170.8,2.66454e-15}}, color={0,0,0}));
    connect(wall_3.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[3])
      annotation (Line(points={{-30,64},{-30,86},{-136,86},{-136,2.66454e-15},{-170.8,2.66454e-15}}, color={0,0,0}));
    connect(wall_4.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[4])
      annotation (Line(points={{64,30},{86,30},{86,88},{-30,88},{-30,86},{-136,86},{-136,2.66454e-15},{-170.8,2.66454e-15}}, color={0,0,0}));
    connect(ceiling.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[5])
      annotation (Line(points={{30,64},{30,88},{-30,88},{-30,86},{-136,86},{-136,2.66454e-15},{-170.8,2.66454e-15}}, color={0,0,0}));
    connect(window.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[6])
      annotation (Line(points={{64,-30},{86,-30},{86,88},{-30,88},{-30,86},{-136,86},{-136,2.66454e-15},{-170.8,2.66454e-15}}, color={0,0,0}));

    // connections between construction elements and ground
    connect(bottom.toSurfacePort_2, surfacesToSolids.toConstructionPorts[1])
      annotation (Line(points={{30,-64},{1.33227e-15,-64},{1.33227e-15,-109.6}}, color={0,0,0}));

    // air and moisture
    connect(zone.TAir, TAir[1])
      annotation (Line(points={{22,-2},{88,-2},{88,-70},{190,-70}}, color={0,0,127}));
    connect(zone.xAir, xAir[1])
      annotation (Line(points={{22,-14},{30,-14},{30,-4},{82,-4},{82,-90},{190,-90}}, color={0,0,127}));

    // Prescribed airchange - depends on boolean prescribedAirchange
    if prescribedAirchange then
      // Ambient temperature of each thermal zones
      connect(zone.TAirAmb, TAirAmb)
        annotation (Line(points={{-22,-8},{-28,-8},{-28,2},{-26,2},{-26,26},{4,26},{4,82},{50,82},{50,120}}, color={0,0,127}));

      // Airchange rates of each thermal zones
      connect(zone.airchange, airchange[1])
        annotation (Line(points={{-22,-4},{-22,22},{28,22},{28,4},{84,4},{84,40},{180,40}}, color={0,0,127}));

      // Ambient moisture of each thermal zones
      connect(zone.xAirAmb, xAirAmb)
        annotation (Line(points={{-22,-16},{-28,-16},{-28,28},{-4,28},{-4,86},{28,86},{28,102},{70,102},{70,120}}, color={0,0,127}));
    end if;

    // Ideal heat load calculation - depends on boolean heatSources
    if heatSources then
      connect(zone.conHeatSourcesPorts, conHeatSourcesPorts);
      connect(zone.radHeatSourcesPorts, radHeatSourcesPorts);
    end if;

    annotation (Line(points={{-56,-1.55431e-15},{-28,-1.55431e-15},{-28,-26},{0,-26},{0,1.75}}, color={0,0,0}));
  end Building;

  Modelica.Blocks.Interfaces.RealInput SC_wall1(min = 0.0, max = 1.0);
    annotation (Dialog(group = "Solarmask related input"));
  Modelica.Blocks.Interfaces.RealInput SC_wall2(min = 0.0, max = 1.0);
    annotation (Dialog(group = "Solarmask related input"));
  Modelica.Blocks.Interfaces.RealInput SC_wall3(min = 0.0, max = 1.0);
    annotation (Dialog(group = "Solarmask related input"));
  Modelica.Blocks.Interfaces.RealInput SC_wall4(min = 0.0, max = 1.0);
    annotation (Dialog(group = "Solarmask related input"));
  Modelica.Blocks.Interfaces.RealInput SC_ceiling(min = 0.0, max = 1.0);
    annotation (Dialog(group = "Solarmask related input"));
  Modelica.Blocks.Interfaces.RealInput SC_window(min = 0.0, max = 1.0);
    annotation (Dialog(group = "Solarmask related input"));

  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces = building.nSurfacesAmbience,
    useSolarMask = true,
    redeclare block WeatherData =
      BuildingSystems.Climate.WeatherDataMeteonorm.Algeria_Tamanrasset_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

  Building building
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

equation

  // connections between ambience and building
  connect(ambience.toSurfacePorts, building.toAmbienceSurfacesPorts);
  connect(ambience.TAirRef, building.TAirAmb);
  connect(ambience.xAir, building.xAirAmb);
  connect(ambience.toAirPorts, building.toAmbienceAirPorts);

  // connections between inputs and solarmasks
  connect(ambience.solarmask[1].SC, SC_wall1);
  connect(ambience.solarmask[2].SC, SC_wall2);
  connect(ambience.solarmask[3].SC, SC_wall3);
  connect(ambience.solarmask[4].SC, SC_wall4);
  connect(ambience.solarmask[5].SC, SC_ceiling);
  connect(ambience.solarmask[6].SC, SC_window);

  annotation(experiment(StartTime=1.728e+07, StopTime=1.73664e+07),
  Documentation(info="<html>
  <p>
  Example that simulates a building using a solar mask.
  The solar mask is calculated outside buildingSystems.
  The shading coefficients of the wall exterior surfaces are input at each time step.
  </p>
  </html>",
  revisions="<html>
  <ul>
  <li>
  October 3, 2023 by Philippe Pinçon:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end MaskedBuilding;