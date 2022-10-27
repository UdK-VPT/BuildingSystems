within BuildingSystems.Buildings.Examples;
model BuildingHygroThermal1Zone1D
  "1D-Hygro-thermal building model with 1 zone"
  extends Modelica.Icons.Example;

  model Building
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
      nZones=1,
      surfacesToAmbience(nSurfaces=8),
      useAirPaths = false,
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced);
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone1(
      V=3.0*4.0*2.5,
      height = 2.5,
      nConstructions=8,
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall1(
      height=2.5,
      width=3.0,
      angleDegAzi=90.0,
      angleDegTil=90.0,
      position={-2.0,0.0,1.25},
      redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-24,0})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall3(
      height=2.5,
      width=3.0,
      angleDegAzi=-90.0,
      angleDegTil=90.0,
      position={2.0,0.0,1.25},
      redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData)
      annotation (Placement(transformation(extent={{16,-10},{36,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall2(
      height=2.5,
      width=4.0,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      position={0.0,1.5,1.25},
      AInnSur=window2.width*window2.height,
      redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-12,20})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall4(
      height=2.5,
      width=4.0,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      position={0.0,-1.5,1.25},
      AInnSur=window4.width*window4.height,
      redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-12,-20})));
    BuildingSystems.Buildings.Constructions.Windows.Window window2(
      height=1.0,
      width=2.0,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      position={0.0,1.5,0.5 + 0.6},
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,20})));
    BuildingSystems.Buildings.Constructions.Windows.Window window4(
      height=1.0,
      width=2.0,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      position={0.0,-1.5,0.5 + 0.6},
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={12,-20})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes bottom(
      height=4.0,
      width=3.0,
      angleDegAzi=0.0,
      angleDegTil=0.0,
      position={0.0,0.0,0.0},
      redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-38})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes ceiling(
      height=4.0,
      width=3.0,
      angleDegAzi=0.0,
      angleDegTil=180.0,
      position={0.0,0.0,2.5},
      redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,42})));
  equation
   connect(wall2.toSurfacePort_1, zone1.toConstructionPorts[1]) annotation (
        Line(
        points={{-12,18},{-12,14},{0,14},{0,-1.75}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall3.toSurfacePort_1, zone1.toConstructionPorts[2]) annotation (
        Line(
        points={{24,0},{0,0},{0,-1.25}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surfacesToAmbience.toConstructionPorts[1], wall2.toSurfacePort_2)
      annotation (Line(
        points={{-170.8,2.66454e-15},{-40,2.66454e-15},{-40,28},{-12,28},{-12,22}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbience.toConstructionPorts[2], window2.toSurfacePort_2)
      annotation (Line(
        points={{-170.8,2.66454e-15},{-40,2.66454e-15},{-40,28},{12,28},{12,22}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbience.toConstructionPorts[3], wall3.toSurfacePort_2)
      annotation (Line(
        points={{-170.8,2.66454e-15},{-40,2.66454e-15},{-40,28},{32,28},{32,0},{28,0}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(zone1.T_setCooling, T_setCooling[1]) annotation (Line(
        points={{-11,5},{-14,5},{-14,-12},{50,-12},{50,60},{180,60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone1.T_setHeating, T_setHeating[1]) annotation (Line(
        points={{-11,7},{-11,-12},{70,-12},{70,80},{180,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone1.airchange, airchange[1]) annotation (Line(
      points={{-11,-2},{-14,-2},{-14,10},{70,10},{70,40},{180,40}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone1.xAirAmb, xAirAmb) annotation (Line(
      points={{-11,-8},{-14,-8},{-14,10},{70,10},{70,120}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(TAirAmb, zone1.TAirAmb) annotation (Line(
      points={{50,120},{50,10},{-14,10},{-14,-4},{-11,-4}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone1.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
      points={{11,5},{22,5},{22,-80},{-80,-80},{-80,-122}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone1.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
      points={{11,7},{11,8},{22,8},{22,-80},{80,-80},{80,-122}},
      color={0,0,127},smooth=Smooth.None));
    connect(window2.toSurfacePort_1, zone1.toConstructionPorts[3]) annotation (
        Line(points={{12,18},{12,14},{0,14},{0,-0.75}},   color={0,0,0}));
    connect(surfacesToAmbience.toConstructionPorts[4], wall1.toSurfacePort_2)
      annotation (Line(points={{-170.8,0},{-26,0}}, color={127,0,0}));
    connect(wall1.toSurfacePort_1, zone1.toConstructionPorts[4]) annotation (
        Line(points={{-22,0},{-12,0},{-12,-0.25},{0,-0.25}},color={0,0,0}));
    connect(ceiling.toSurfacePort_1, zone1.toConstructionPorts[5])
      annotation (Line(points={{0,40},{0,0.25}}, color={0,0,0}));
    connect(bottom.toSurfacePort_1, zone1.toConstructionPorts[6])
      annotation (Line(points={{0,-36},{0,0.75}}, color={0,0,0}));
    connect(ceiling.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[5])
      annotation (Line(points={{0,44},{0,50},{-40,50},{-40,0},{-170,0},{-170,2.66454e-15},
            {-170.8,2.66454e-15}}, color={0,0,0}));
    connect(bottom.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[6])
      annotation (Line(points={{-4.44089e-16,-40},{-4.44089e-16,-42},{0,-42},{0,
            -46},{-40,-46},{-40,2.66454e-15},{-170.8,2.66454e-15}}, color={0,0,0}));
    connect(wall4.toSurfacePort_1, zone1.toConstructionPorts[7]) annotation (
        Line(points={{-12,-18},{-12,-16},{0,-16},{0,1.25}}, color={0,0,0}));
    connect(window4.toSurfacePort_1, zone1.toConstructionPorts[8]) annotation (
        Line(points={{12,-18},{12,-16},{0,-16},{0,1.75}}, color={0,0,0}));
    connect(wall4.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[7])
      annotation (Line(points={{-12,-22},{-12,-28},{-40,-28},{-40,0},{-170.8,0},
            {-170.8,2.66454e-15}}, color={0,0,0}));
    connect(window4.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[8])
      annotation (Line(points={{12,-22},{12,-28},{-40,-28},{-40,0},{-170.8,0},{-170.8,
            2.66454e-15}}, color={0,0,0}));
  end Building;

  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces=building.nSurfacesAmbience,
    redeclare block WeatherData =
        BuildingSystems.Climate.WeatherDataMeteonorm.Germany_Berlin_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Building building(nZones=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,14})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,6})));
  Modelica.Blocks.Sources.Constant airchange(k=0.5)
     annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,-2})));
equation
   connect(ambience.toSurfacePorts, building.toAmbienceSurfacesPorts) annotation (Line(
    points={{-21,4},{-20,4},{-20,8},{-20,11.3333},{-20,4},{-9,4}},
    color={0,255,0},
    smooth=Smooth.None));
  connect(ambience.toAirPorts, building.toAmbienceAirPorts) annotation (Line(
    points={{-21,-4},{-16,-4},{-16,-4},{-9,-4}},
    color={85,170,255},
    smooth=Smooth.None));
  connect(TSetHeating.y, building.T_setHeating[1]) annotation (Line(
      points={{15.8,14},{12,14},{12,8},{9.8,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCooling.y, building.T_setCooling[1]) annotation (Line(
      points={{15.8,6},{9.8,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.TAirAmb, ambience.TAirRef) annotation (Line(
      points={{6.2,9.8},{6.2,12},{-40,12},{-40,7},{-39,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.xAirAmb, ambience.xAir) annotation (Line(
      points={{8.4,9.8},{8.4,14},{-42,14},{-42,5},{-39,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.airchange[1], airchange.y) annotation (Line(
      points={{9.8,4},{12,4},{12,-2},{15.8,-2}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/BuildingHygroThermal1Zone1D.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
    textString="1D-Hygro-thermal building model with 1 zone")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a hygro-thermal building model with 1 zone, based on 1D-discretized building elements.
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
end BuildingHygroThermal1Zone1D;
