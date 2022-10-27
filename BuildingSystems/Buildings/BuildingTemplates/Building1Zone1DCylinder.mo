within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone1DCylinder
  "1 zone thermal building model with the shape of a cylinder"
  extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones = 1,
    final prescribedAirchange = true,
    final useAirPaths = false,
    final calcHygroThermal = false,
    final nAirpaths = 0,
    final convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
    final alphaConstant = 0.0,
    surfacesToAmbience(nSurfaces=nSeg+1),
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
    nConstructions = 2+nSeg)
    "Thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  parameter Integer nSeg(min=3) = 3
    "Number of wall segments of the cylinder"
    annotation(Dialog(tab="Geometry",group="Building"));
  parameter Modelica.Units.SI.Length diameter=1.0
    "Diameter of the building (inner space)"
    annotation (Dialog(tab="Geometry", group="Building"));
  parameter Modelica.Units.SI.Length height=2.8
    "Height of the building (inner space)"
    annotation (Dialog(tab="Geometry", group="Building"));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall[nSeg](
    each height = height,
    width = {sqrt((circle.vertex[if i < nSeg then i+1 else 1].x-circle.vertex[i].x)^2
      + (circle.vertex[if i < nSeg then i+1 else 1].y-circle.vertex[i].y)^2) for i in 1:nSeg},
    each constructionData = constructionWall,
    angleDegAzi = {acos({-1.0,0.0,0.0}*{circle.vertex[if i < nSeg then i+1 else 1].x - circle.vertex[i].x,
      circle.vertex[if i < nSeg then i+1 else 1].y - circle.vertex[i].y,0.0} / (1.0 * wall[i].width))
      * 180.0 / Modelica.Constants.pi * (if i / nSeg > 0.5 then 1.0 else -1.0)
      + angleDegAziBuilding for i in 1:nSeg},
    each angleDegTil = 90.0)
    "Wall segments of the cylinder"
    annotation (Dialog(tab = "Constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-60,0})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceiling(
    height = 1.0,
    width = Modelica.Constants.pi * (diameter/2)^2,
    constructionData = constructionCeiling,
    angleDegAzi = 0.0,
    angleDegTil = 180.0)
    "Ceiling"
    annotation (Dialog(tab = "Constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,26})));
  replaceable BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes bottom(
    height = 1.0,
    width = Modelica.Constants.pi * (diameter/2)^2,
    constructionData = constructionBottom,
    angleDegAzi = 0.0,
    angleDegTil = 0.0)
    "Bottom"
    annotation (Dialog(tab = "Constructions", group = "model type"),
      Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-30})));
protected
  parameter BuildingSystems.Buildings.Geometries.BaseClasses.Circle circle(
    nSeg = nSeg,
    zMean = height/2,
    angleDegAzi = 0.0,
    angleDegTil = 0.0,
    vertex(
    x = {sin(2.0*Modelica.Constants.pi/nSeg*(i-1))*diameter/2 for i in 1:nSeg},
    y = {cos(2.0*Modelica.Constants.pi/nSeg*(i-1))*diameter/2 for i in 1:nSeg},
    z = {circle.zMean for i in 1:nSeg}))
    "3D geometry representation of circular section of the cylinder";
equation
  connect(zone.TAir, TAir[1]) annotation (Line(
    points={{11,-3},{11,-2},{86,-2},{86,-70},{190,-70}},
    color={0,0,127},
    smooth=Smooth.None));

  // Ideal heat load calculation
  if calcIdealLoads then
    connect(zone.T_setCooling, T_setCooling[1]) annotation (Line(
        points={{-11,5},{-20,5},{-20,60},{180,60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone.T_setHeating, T_setHeating[1]) annotation (Line(
        points={{-11,7},{-11,8},{-18,8},{-18,80},{180,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
      points={{11,5},{12,5},{12,4},{24,4},{24,-80},{-80,-80},{-80,-122}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
      points={{11,7},{12,7},{12,8},{80,8},{80,-122}},
      color={0,0,127},
      smooth=Smooth.None));
  end if;

  // Prescribed airchange
  if prescribedAirchange then
    connect(zone.TAirAmb, TAirAmb) annotation (Line(
      points={{-11,-5},{-16,-5},{-16,84},{50,84},{50,120}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.xAirAmb, xAirAmb) annotation (Line(
      points={{-11,-7},{-14,-7},{-14,80},{70,80},{70,120}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.airchange, airchange[1]) annotation (Line(
      points={{-11,-3},{-22,-3},{-22,40},{180,40}},
      color={0,0,127},
      smooth=Smooth.None));
  end if;

  // Ideal load calculation
  if heatSources then
    connect(conHeatSourcesPorts, zone.conHeatSourcesPorts) annotation (Line(
       points={{-44,120},{-44,-14},{-4.9,-14},{-4.9,-10.7}},        color={127,0,0}));
    connect(zone.radHeatSourcesPorts, radHeatSourcesPorts) annotation (Line(
       points={{4.9,-10.7},{4.9,-14},{40,-14},{40,48},{0,48},{0,120}},
       color={127,0,0}));
  end if;

  // Building construction
  for i in 1:nSeg loop
    connect(wall[i].toSurfacePort_1, zone.toConstructionPorts[i]) annotation (Line(
        points={{-58,-4.44089e-16},{-26,-4.44089e-16},{-26,0},{0,0}},
        color={0,0,0},
        pattern=LinePattern.Solid));
  end for;
  connect(ceiling.toSurfacePort_1, zone.toConstructionPorts[nSeg+1]) annotation (
      Line(
      points={{-2.22045e-16,24},{0,24},{0,0}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(bottom.toSurfacePort_1, zone.toConstructionPorts[nSeg+2]) annotation (
      Line(
      points={{4.44089e-16,-28},{4.44089e-16,-16},{0,-16},{0,0}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  for i in 1:nSeg loop
    connect(wall[i].toSurfacePort_2, surfacesToAmbience.toConstructionPorts[i])
      annotation (Line(
        points={{-62,2.22045e-16},{-82,2.22045e-16},{-82,3.55271e-15},{-170.8,3.55271e-15}},
        color={0,0,0},
        pattern=LinePattern.Solid));
  end for;
  connect(ceiling.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[nSeg+1])
    annotation (Line(
      points={{0,28},{0,46},{-82,46},{-82,2.66454e-15},{-170.8,2.66454e-15}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(bottom.toSurfacePort_2, surfacesToSolids.toConstructionPorts[1])
    annotation (Line(
      points={{-4.44089e-16,-32},{0,-32},{0,-72},{1.33227e-15,-72},{1.33227e-15,
          -109.6}},
      color={0,0,0},
      pattern=LinePattern.Solid));

  annotation(defaultComponentName="building",
Documentation(info="<html>
<p>
This is a 1 zone thermal building model with the shape of a cylinder.
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
end Building1Zone1DCylinder;
