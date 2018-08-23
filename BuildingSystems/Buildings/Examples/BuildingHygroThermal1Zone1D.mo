within BuildingSystems.Buildings.Examples;
model BuildingHygroThermal1Zone1D
  "1D-Hygro-thermal building model with 1 zone under real weather data"
  extends Modelica.Icons.Example;

  model Building
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
      nZones=1,
      surfacesToAmbient(nSurfaces=6),
      useAirPaths = false,
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced);
    record Construction
      extends BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
      nLayers=2,
      thickness={0.1,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton(),
        BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton()});
    end Construction;
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone1(
      V = 4.0*4.0*2.5,
      height = 2.5,
      nConstructions=6)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall1(
      height=2.5,
      width=4.0,
      angleDegAzi=90.0,
      angleDegTil=90.0,
      redeclare Construction constructionData)
      annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall3(
      height=2.5,
      width=4.0,
      angleDegAzi=-90.0,
      angleDegTil=90.0,
      redeclare Construction constructionData)
      annotation (Placement(transformation(extent={{16,-10},{36,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall2(
      height=2.5,
      width=4.0,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      AInnSur=window2.ASur,
      redeclare Construction constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-12,20})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall4(
      height=2.5,
      width=4.0,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      AInnSur=window4.ASur,
      redeclare Construction constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-12,-20})));
    BuildingSystems.Buildings.Constructions.Windows.Window window2(
      height=1.0,
      width=2.0,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,20})));
    BuildingSystems.Buildings.Constructions.Windows.Window window4(
      height=1.0,
      width=2.0,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,-20})));
  equation
   connect(wall2.toSurfacePort_1, zone1.toConstructionPorts[1]) annotation (
        Line(
        points={{-12,18},{-12,14},{0,14},{0,-1.66667}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall1.toSurfacePort_2, zone1.toConstructionPorts[2]) annotation (
        Line(
        points={{-22,0},{-16,0},{-16,-1},{0,-1}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall4.toSurfacePort_2, zone1.toConstructionPorts[3]) annotation (
        Line(
        points={{-12,-18},{-12,-16},{0,-16},{0,-0.333333}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(window2.toSurfacePort_1, zone1.toConstructionPorts[4]) annotation (
        Line(
        points={{12,18},{12,14},{0,14},{0,0.333333}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(window4.toSurfacePort_2, zone1.toConstructionPorts[5]) annotation (
        Line(
        points={{12,-18},{12,-16},{0,-16},{0,1}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall3.toSurfacePort_1, zone1.toConstructionPorts[6]) annotation (
        Line(
        points={{24,0},{0,0},{0,1.66667}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[1], wall1.toSurfacePort_1)
      annotation (Line(
        points={{-170.8,3.10862e-15},{-55.95,3.10862e-15},{-55.95,0},{-26,0}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[2], wall2.toSurfacePort_2)
      annotation (Line(
        points={{-170.8,0},{-40,0},{-40,28},{-12,28},{-12,22}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[3], window2.toSurfacePort_2)
      annotation (Line(
        points={{-170.8,0},{-40,0},{-40,28},{12,28},{12,22}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[4], wall3.toSurfacePort_2)
      annotation (Line(
        points={{-170.8,0},{-40,0},{-40,28},{32,28},{32,0},{28,0}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[5], window4.toSurfacePort_1)
      annotation (Line(
        points={{-170.8,0},{-40,0},{-40,-30},{12,-30},{12,-22}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[6], wall4.toSurfacePort_1)
      annotation (Line(
        points={{-170.8,0},{-40,0},{-40,-30},{-12,-30},{-12,-22}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(zone1.T_setCooling, T_setCooling[1]) annotation (Line(
        points={{-11,5},{-12,5},{-12,4},{-14,4},{-14,-12},{50,-12},{50,60},{180,
            60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone1.T_setHeating, T_setHeating[1]) annotation (Line(
        points={{-11,7},{-11,-12},{70,-12},{70,80},{180,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone1.airchange, airchange[1]) annotation (Line(
      points={{-11,-3},{-14,-3},{-14,10},{70,10},{70,40},{180,40}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone1.xAirAmb, xAirAmb) annotation (Line(
      points={{-11,-7},{-14,-7},{-14,10},{70,10},{70,120}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(TAirAmb, zone1.TAirAmb) annotation (Line(
      points={{50,120},{50,10},{-14,10},{-14,-5},{-11,-5}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone1.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
      points={{11,5},{22,5},{22,-80},{-80,-80},{-80,-122}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone1.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
      points={{11,7},{11,8},{22,8},{22,-80},{80,-80},{80,-122}},
      color={0,0,127},
      smooth=Smooth.None));

  end Building;

  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_NetCDF)
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
   connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts) annotation (Line(
    points={{-22,4},{-20,4},{-20,8},{-20,11.3333},{-20,4},{-9,4}},
    color={0,255,0},
    smooth=Smooth.None));
  connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
    points={{-22,-4},{-16,-4},{-16,-4},{-9,-4}},
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
  connect(building.TAirAmb, ambient.TAirRef) annotation (Line(
      points={{6.2,9.8},{6.2,12},{-40,12},{-40,7},{-39,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.xAirAmb, ambient.xAir) annotation (Line(
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
    textString="1D-Hygro-thermal building model with 1 zone under real weather data")}),
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
