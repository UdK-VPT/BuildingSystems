within BuildingSystems.Buildings.Zones.Examples;
model SingleZoneHygroThermal1D
  "Hygro-thermal zone model and some 1D-constructions elements"
  extends Modelica.Icons.Example;
  parameter Integer nSurfaces = 8;
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall1(
    height=3.0,
    width=3.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-30,0})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall2(
    height=3.0,
    width=3.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    AInnSur=window2.width*window2.height,
    redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,18})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall3(
    height=3.0,
    width=3.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{24,-10},{44,10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall4(
    height=3.0,
    width=3.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    AInnSur=window4.width*window4.height,
    redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-18,-20})));
  BuildingSystems.Buildings.Constructions.Windows.Window window4(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-20})));
  BuildingSystems.Buildings.Constructions.Windows.Window window2(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,18})));
  BuildingSystems.Buildings.Ambience ambience(
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII,
    nSurfaces=nSurfaces)
    annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    V=3.0*3.0*3.0,
    height=3.0,
    calcIdealLoads=true,
    nConstructions=8)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,24})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,24})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={40,0})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface3
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-26})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface4
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-18,-26})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface5
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-36,0})));
  Modelica.Blocks.Sources.Constant TSetHeating(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-16,6},{-14,8}})));
  Modelica.Blocks.Sources.Constant TSetCooling(
    k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{-20,4},{-18,6}})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes ceiling(
    height=3.0,
    width=3.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,18})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface6
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,24})));
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes bottom(
    height=3.0,
    width=3.0,
    angleDegAzi=0.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.HygroThermal.ConstructionConcrete constructionData,
    angleDegTil=0.0,
    nNodes={4,4})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-20})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface7
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-26})));
  Modelica.Blocks.Sources.Constant airchange1(
    k=0.5)
    annotation (Placement(transformation(extent={{1,-1},{-1,1}},rotation=180,origin={-15,-3})));
equation
  connect(ambience.toAirPorts[1], surface5.toAirPort)
    annotation (Line(
      points={{-39,-4},{-39,4},{-36.6,4}},
      color={85,170,255},
      smooth=Smooth.None));
  connect(surface.toAirPort, ambience.toAirPorts[2])
    annotation (Line(
      points={{-14,24.6},{-14,30},{-39,30},{-39,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface1.toAirPort, ambience.toAirPorts[3])
    annotation (Line(
      points={{4,24.6},{4,30},{-39,30},{-39,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface4.toAirPort, ambience.toAirPorts[4])
    annotation (Line(
      points={{-22,-26.6},{-22,-32},{-39,-32},{-39,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface3.toAirPort, ambience.toAirPorts[5])
    annotation (Line(
      points={{-4,-26.6},{-4,-32},{-39,-32},{-39,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface2.toAirPort, ambience.toAirPorts[6])
    annotation (Line(
      points={{40.6,-4},{42,-4},{42,-32},{-39,-32},{-39,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface2.toConstructionPort, wall3.toSurfacePort_2)
    annotation (Line(
      points={{39.4,0},{36,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface.toConstructionPort, wall2.toSurfacePort_2)
    annotation (Line(
      points={{-18,23.4},{-18,20}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface1.toConstructionPort, window2.toSurfacePort_2)
    annotation (Line(
      points={{0,23.4},{0,20}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface.toSurfacesPort, ambience.toSurfacePorts[1])
    annotation (Line(
      points={{-22,24.6},{-22,30},{-39,30},{-39,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface1.toSurfacesPort, ambience.toSurfacePorts[2])
    annotation (Line(
      points={{-4,24.6},{-4,30},{-39,30},{-39,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface2.toSurfacesPort, ambience.toSurfacePorts[3])
    annotation (Line(
      points={{40.6,4},{42,4},{42,30},{-39,30},{-39,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface5.toSurfacesPort, ambience.toSurfacePorts[4])
    annotation (Line(
      points={{-36.6,-4},{-39,-4},{-39,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface4.toSurfacesPort, ambience.toSurfacePorts[5])
    annotation (Line(
      points={{-14,-26.6},{-14,-32},{-39,-32},{-39,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface3.toSurfacesPort, ambience.toSurfacePorts[6])
    annotation (Line(
      points={{4,-26.6},{4,-32},{-39,-32},{-39,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(TSetCooling.y, zone.T_setCooling) annotation (Line(
      points={{-17.9,5},{-11,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHeating.y, zone.T_setHeating) annotation (Line(
      points={{-13.9,7},{-11,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ceiling.toSurfacePort_2, surface6.toConstructionPort) annotation (
      Line(
      points={{20,20},{20,23.4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface6.toAirPort, ambience.toAirPorts[7]) annotation (Line(
      points={{24,24.6},{24,30},{-39,30},{-39,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface6.toSurfacesPort, ambience.toSurfacePorts[7]) annotation (Line(
      points={{16,24.6},{16,30},{-39,30},{-39,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface5.toConstructionPort, wall1.toSurfacePort_2) annotation (Line(
      points={{-35.4,0},{-32,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface4.toConstructionPort, wall4.toSurfacePort_2) annotation (Line(
      points={{-18,-25.4},{-18,-22}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface3.toConstructionPort, window4.toSurfacePort_2) annotation (
      Line(points={{0,-25.4},{0,-22}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(bottom.toSurfacePort_2, surface7.toConstructionPort) annotation (Line(
      points={{20,-22},{20,-25.4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface7.toAirPort, ambience.toAirPorts[8]) annotation (Line(
      points={{16,-26.6},{16,-32},{-39,-32},{-39,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface7.toSurfacesPort, ambience.toSurfacePorts[8]) annotation (Line(
      points={{24,-26.6},{24,-32},{-39,-32},{-39,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.TAirRef, zone.TAirAmb) annotation (Line(
      points={{-57,7},{-60,7},{-60,-30},{-26,-30},{-26,-4},{-11,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambience.xAir, zone.xAirAmb) annotation (Line(
      points={{-57,5},{-60,5},{-60,-28},{-26,-28},{-26,-8},{-11,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airchange1.y, zone.airchange) annotation (Line(
      points={{-13.9,-3},{-12,-3},{-12,-2},{-11,-2}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(window2.toSurfacePort_1, zone.toConstructionPorts[1])
    annotation (Line(points={{0,16},{0,-1.75}},color={0,0,0}));
  connect(ceiling.toSurfacePort_1, zone.toConstructionPorts[2])
    annotation (Line(points={{20,16},{20,12},{0,12},{0,-1.25}},color={0,0,0}));
  connect(wall2.toSurfacePort_1, zone.toConstructionPorts[3]) annotation (Line(
        points={{-18,16},{-18,12},{0,12},{0,-0.75}},color={0,0,0}));
  connect(wall1.toSurfacePort_1, zone.toConstructionPorts[4]) annotation (Line(
        points={{-28,0},{-14,0},{-14,-0.25},{0,-0.25}},
                                                      color={0,0,0}));
  connect(wall3.toSurfacePort_1, zone.toConstructionPorts[5])
    annotation (Line(points={{32,0},{16,0},{16,0.25},{0,0.25}},
                                                              color={0,0,0}));
  connect(wall4.toSurfacePort_1, zone.toConstructionPorts[6]) annotation (Line(
        points={{-18,-18},{-18,-12},{0,-12},{0,0.75}},color={0,0,0}));
  connect(bottom.toSurfacePort_1, zone.toConstructionPorts[7]) annotation (Line(
        points={{20,-18},{20,-12},{0,-12},{0,1.25}},color={0,0,0}));
  connect(window4.toSurfacePort_1, zone.toConstructionPorts[8])
    annotation (Line(points={{0,-18},{0,1.75}},color={0,0,0}));

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Zones/Examples/SingleZoneHygroThermal1D.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,40}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
    textString="Hygro-thermal zone model and some 1D-constructions elements")}),
     Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,40}})),
Documentation(info="<html>
<p>
Example that simulates a hygro-thermal zone model and some 1D-constructions elements.
</p>
</html>",
revisions="<html>
<ul>
<li>
August 16, 2020, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SingleZoneHygroThermal1D;
