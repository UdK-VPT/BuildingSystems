within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone1DCylinder
  "1 zone thermal building model with the shape of a cylinder"
  extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    final nZones = 1,
    final prescribedAirchange = true,
    final useAirPathes = false,
    final calcHygroThermal = false,
    final nAirpathes = 0,
    final convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
    final alphaConstant = 0.0, // dummy value
    surfacesToAmbient(nSurfaces=nSeg+1),
    nSurfacesSolid=1,
    surfacesToSolids(nSurfaces=nSurfacesSolid));
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionWall
    "Data of the thermal construction"
    annotation(Dialog(tab = "Constructions", group = "Exterior constructions"), choicesAllMatching=true);
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionCeiling
    "Data of the thermal construction"
    annotation(Dialog(tab = "Constructions", group = "Exterior constructions"), choicesAllMatching=true);
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction constructionBottom
    "Data of the thermal construction"
    annotation(Dialog(tab = "Constructions", group = "Exterior constructions"), choicesAllMatching=true);
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    final prescribedAirchange = prescribedAirchange,
    final V = Modelica.Constants.pi * (diameter/2)^2 * height,
    final height = height,
    final calcIdealLoads = calcIdealLoads,
    final heatSources = heatSources,
    final nHeatSources = nHeatSources,
    nConstructions1 = nSeg,
    nConstructions2 = 1,
    nConstructions4 = 1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  parameter Integer nSeg(min=3) = 3
    "Number of wall segments of the cylinder"
    annotation(Dialog(tab="Geometry",group="Building"));
  parameter Modelica.SIunits.Length diameter = 1.0
    "Diameter of the building (inner space)"
    annotation(Dialog(tab="Geometry",group="Building"));
  parameter Modelica.SIunits.Length height = 2.8
    "Height of the building (inner space)"
    annotation(Dialog(tab="Geometry",group="Building"));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall[nSeg](
    each height = height,
    width = {sqrt((circle.point[if i < nSeg then i+1 else 1].x-circle.point[i].x)^2
      + (circle.point[if i < nSeg then i+1 else 1].y-circle.point[i].y)^2) for i in 1:nSeg},
    each constructionData = constructionWall,
    angleDegAzi = {acos({-1.0,0.0,0.0}*{circle.point[if i < nSeg then i+1 else 1].x - circle.point[i].x,
      circle.point[if i < nSeg then i+1 else 1].y - circle.point[i].y,0.0} / (1.0 * wall[i].width))
      * 180.0 / Modelica.Constants.pi * (if i / nSeg > 0.5 then 1.0 else -1.0)
      + angleDegAziBuilding for i in 1:nSeg},
    each angleDegTil = 90.0)
    annotation (Dialog(tab = "Constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-40,10})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceiling(
    height = 1.0,
    width = Modelica.Constants.pi * (diameter/2)^2,
    constructionData = constructionCeiling,
    angleDegAzi = 0.0,
    angleDegTil = 180.0)
    annotation (Dialog(tab = "Constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={22,20})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom(
    height = 1.0,
    width = Modelica.Constants.pi * (diameter/2)^2,
    constructionData = constructionBottom,
    angleDegAzi = 0.0,
    angleDegTil = 0.0)
    annotation (Dialog(tab = "Constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-20})));
protected
  parameter BuildingSystems.Geometries.BaseClasses.GeometryCircle circle(
    nSeg = nSeg,
    zMean = height/2,
    angleDegAzi = 0.0,
    angleDegTil = 0.0,
    point.x = {sin(2.0*Modelica.Constants.pi/nSeg*(i-1))*diameter/2 for i in 1:nSeg},
    point.y = {cos(2.0*Modelica.Constants.pi/nSeg*(i-1))*diameter/2 for i in 1:nSeg},
    point.z = {circle.zMean for i in 1:nSeg})
    "3D geometry representation of circular section of the cylinder";
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
    connect(conHeatSourcesPorts, zone.conHeatSourcesPorts) annotation (Line(
       points={{-44,120},{-44,120},{-44,46},{-5.1,46},{-5.1,-7.3}}, color={127,0,0}));
    connect(zone.radHeatSourcesPorts, radHeatSourcesPorts) annotation (Line(
       points={{0.7,-7.3},{0.7,54.35},{0,54.35},{0,120}}, color={127,0,0}));
  end if;
  for i in 1:nSeg loop
    connect(wall[i].toSurfacePort_1, zone.toConstructionPorts1[i]) annotation (Line(
        points={{-38,10},{-26,10},{-26,2},{-11,2}},
        color={0,0,0},
        pattern=LinePattern.Solid));
  end for;
  connect(ceiling.toSurfacePort_1, zone.toConstructionPorts2[1]) annotation (
      Line(
      points={{22,18},{14,18},{14,14},{6.66667,14},{6.66667,11}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(bottom.toSurfacePort_1, zone.toConstructionPorts4[1]) annotation (
      Line(
      points={{20,-18},{20,-16},{-6.66667,-16},{-6.66667,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  for i in 1:nSeg loop
    connect(wall[i].toSurfacePort_2, surfacesToAmbient.toConstructionPorts[i])
      annotation (Line(
        points={{-42,10},{-82,10},{-82,3.55271e-015},{-89.9,3.55271e-015}},
        color={0,0,0},
        pattern=LinePattern.Solid));
  end for;
  connect(ceiling.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[nSeg+1])
    annotation (Line(
      points={{22,22},{22,32},{-82,32},{-82,3.55271e-015},{-89.9,3.55271e-015}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(bottom.toSurfacePort_2, surfacesToSolids.toConstructionPorts[1])
    annotation (Line(
      points={{20,-22},{20,-22},{20,-70},{8.88178e-016,-70},{8.88178e-016,-90.8}},
      color={0,0,0},
      pattern=LinePattern.Solid));

  annotation(defaultComponentName="building");
end Building1Zone1DCylinder;
