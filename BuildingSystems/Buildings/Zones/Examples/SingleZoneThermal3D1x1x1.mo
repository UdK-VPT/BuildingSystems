within BuildingSystems.Buildings.Zones.Examples;
model SingleZoneThermal3D1x1x1
  "Thermal zone model and some 1D-constructions elements under real weather data"
  extends Modelica.Icons.Example;
  parameter Integer nSurfaces = 6;

  record Construction
    "Construction"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=2,
      thickness={0.2,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
      BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()});
  end Construction;

  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall1(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-28,0})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes roof(
    height=1.0,
    width=1.0,
    angleDegAzi=180.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,28})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor(
    height=1.0,
    width=1.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={0,-28})));
  BuildingSystems.Buildings.Ambient ambient(
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin weatherDataFile,
    nSurfaces=nSurfaces)
    annotation (Placement(transformation(extent={{-62,-10},{-42,10}})));
  BuildingSystems.Buildings.Zones.Examples.ZoneAirvolume3D1x1 zone(
    nAirElements = 1,
    V=1.0*1.0*1.0,
    nConstructions=6)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,34})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface4
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-34})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall2(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{18,-10},{38,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface9
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={34,0})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-34,0},
        rotation=180)));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall3(
    height=1.0,
    width=1.0,
    angleDegAzi=90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2}) annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-20,-20})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall4(
    height=1.0,
    width=1.0,
    angleDegAzi=-90.0,
    angleDegTil=90.0,
    redeclare Construction constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{10,10},{30,30}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2 annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-26,-20},
        rotation=180)));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface3
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={26,20})));
equation
  connect(surface1.toConstructionPort, wall1.toSurfacePort_2) annotation (Line(
        points={{-33.4,0},{-30,0},{-30,4.44089e-016}}, color={0,0,0}));
  connect(surface.toConstructionPort, roof.toSurfacePort_2) annotation (Line(
        points={{0,33.4},{0,30},{4,30},{2.22045e-016,30}}, color={0,0,0}));
  connect(surface9.toConstructionPort, wall2.toSurfacePort_2)
    annotation (Line(points={{33.4,0},{30,0}}, color={0,0,0}));
  connect(surface4.toConstructionPort, floor.toSurfacePort_2) annotation (Line(
        points={{0,-33.4},{0,-30},{-4.44089e-016,-30}}, color={0,0,0}));
  connect(wall1.toSurfacePort_1, zone.toConstructionPorts[1]) annotation (Line(
        points={{-26,-2.22045e-016},{-20,-2.22045e-016},{-20,4},{-11,4}}, color=
         {0,0,0}));
  connect(roof.toSurfacePort_1, zone.toConstructionPorts[2]) annotation (Line(
        points={{-2.22045e-016,26},{-2.22045e-016,20},{-2.22045e-016,16},{4,16},
          {4,11}}, color={0,0,0}));
  connect(wall2.toSurfacePort_1, zone.toConstructionPorts[3])
    annotation (Line(points={{26,0},{20,0},{20,-4},{11,-4}}, color={0,0,0}));
  connect(floor.toSurfacePort_1, zone.toConstructionPorts[4]) annotation (Line(
        points={{4.44089e-016,-26},{4.44089e-016,-20},{0,-20},{0,-16},{-4,-16},{
          -4,-11}}, color={0,0,0}));
  connect(ambient.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,-4},{-34.6,-4}}, color={0,255,0}));
  connect(ambient.toSurfacePorts[2], surface.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,38},{-4,38},{-4,34.6}},   color={0,255,0}));
  connect(ambient.toSurfacePorts[3], surface9.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,38},{38,38},{38,4},{34.6,4}},   color={0,255,
          0}));
  connect(ambient.toSurfacePorts[4], surface4.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,-40},{4,-40},{4,-34.6}},     color={0,255,0}));
  connect(ambient.toAirPorts[1], surface1.toAirPort) annotation (Line(points={{-44,-4},
          {-34.6,-4},{-34.6,4}},     color={85,170,255}));
  connect(ambient.toAirPorts[2], surface.toAirPort) annotation (Line(points={{-44,-4},
          {-38,-4},{-38,36},{4,36},{4,34.6}},         color={85,170,255}));
  connect(ambient.toAirPorts[3], surface9.toAirPort) annotation (Line(points={{-44,-4},
          {-38,-4},{-38,36},{36,36},{36,-4},{34.6,-4}},     color={85,170,255}));
  connect(ambient.toAirPorts[4], surface4.toAirPort) annotation (Line(points={{-44,-4},
          {-38,-4},{-38,-38},{-4,-38},{-4,-34.6}},           color={85,170,255}));

  connect(wall3.toSurfacePort_1, zone.toConstructionPorts[6]) annotation (Line(
        points={{-18,-20},{-14,-20},{-14,-6},{-9,-6}}, color={0,0,0}));
  connect(wall4.toSurfacePort_1, zone.toConstructionPorts[5])
    annotation (Line(points={{18,20},{14,20},{14,6},{9,6}}, color={0,0,0}));
  connect(surface2.toConstructionPort, wall3.toSurfacePort_2) annotation (Line(
        points={{-25.4,-20},{-23.7,-20},{-22,-20}}, color={0,0,0}));
  connect(wall4.toSurfacePort_2, surface3.toConstructionPort)
    annotation (Line(points={{22,20},{25.4,20}},           color={0,0,0}));
  connect(ambient.toSurfacePorts[6], surface3.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,38},{38,38},{38,24},{26.6,24}}, color={0,255,
          0}));
  connect(ambient.toSurfacePorts[5], surface2.toSurfacesPort) annotation (Line(
        points={{-44,4},{-40,4},{-40,-20},{-40,-24},{-26.6,-24}}, color={0,255,0}));
  connect(ambient.toAirPorts[6], surface3.toAirPort) annotation (Line(points={{-44,
          -4},{-38,-4},{-38,36},{36,36},{36,16},{26.6,16}}, color={85,170,255}));
  connect(ambient.toAirPorts[5], surface2.toAirPort) annotation (Line(points={{-44,
          -4},{-38,-4},{-38,-16},{-26.6,-16}}, color={85,170,255}));

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Zones/Examples/SingleZoneThermal3D1x1x1.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})));
end SingleZoneThermal3D1x1x1;
