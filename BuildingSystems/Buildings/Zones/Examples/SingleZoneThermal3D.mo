within BuildingSystems.Buildings.Zones.Examples;
  model SingleZoneThermal3D
    "Thermal zone model with 3D discretised airvolume and some 3D-constructions elements under real weather data"
    extends Modelica.Icons.Example;

    parameter Integer nSurfaces = 6;
    parameter Modelica.SIunits.Length length = 3.0
      "Length of the zone (x-dimensíon)";
    parameter Modelica.SIunits.Length width = 3.0
      "Width of the zone (z-dimension)";
    parameter Modelica.SIunits.Length height = 3.0
      "Height of the zone (y-dimension)";
    parameter Integer elemX = 3
      "Number of a elements in x-dimension";
    parameter Integer elemY = 3
      "Number of a elements in y-dimension";
    parameter Integer elemZ = 3
      "Number of a elements in z-dimension";

    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction construction1(
      nLayers=2,
      thickness={0.2,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
      BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()})
      annotation(Placement(transformation(extent={{-40,40},{-20,60}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall1(
      nY=elemZ,
      nZ=elemY,
      height=height,
      width=width,
      angleDegAzi=90.0,
      angleDegTil=90.0,
      constructionData=construction1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-30,0})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall2(
      nY=elemX,
      nZ=elemY,
      height=height,
      width=length,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      constructionData=construction1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,18})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall3(
      nY=elemZ,
      nZ=elemY,
      height=height,
      width=width,
      angleDegAzi=-90.0,
      angleDegTil=90.0,
      constructionData=construction1)
      annotation (Placement(transformation(extent={{24,-10},{44,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall4(
      nY=elemX,
      nZ=elemY,
      height=height,
      width=length,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      constructionData=construction1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-18,-20})));
    BuildingSystems.Buildings.Ambient ambient(
      weatherDataFile=BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco(),
      nSurfaces=nSurfaces,
      gridSurface={{elemZ,elemY},{elemX,elemY},{elemZ,elemY},{elemX,elemY},{elemX,elemZ},{elemX,elemZ}})
      annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolume3D zone(
      nConstructions3=1,
      nConstructions2=1,
      nConstructions4=1,
      nConstructions1=1,
      nConstructions5=1,
      nConstructions6=1,
      length=3.0, // x-dimension
      width=3.0,  // z-dimension
      height=3.0, // y-dimension
      V=length*width*height,
      calcIdealLoads=false,
      prescribedAirchange=false,
      gridSurface1={{elemZ,elemY}},
      gridSurface2={{elemX,elemY}},
      gridSurface3={{elemZ,elemY}},
      gridSurface4={{elemX,elemY}},
      gridSurface5={{elemX,elemZ}},
      gridSurface6={{elemX,elemZ}},

      /*surf1ai=[1,1,1; 2,2,2; 3,3,3],
      surf1aj=[1,2,3; 1,2,3; 1,2,3],
      surf1nCon=[1,1,1; 1,1,1; 1,1,1],
      surf2ai=[1,1,1; 2,2,2; 3,3,3],
      surf2aj=[1,2,3; 1,2,3; 1,2,3],
      surf2nCon=[1,1,1; 1,1,1; 1,1,1],
      surf3ai=[1,1,1; 2,2,2; 3,3,3],
      surf3aj=[1,1,1; 2,2,2; 3,3,3],
      surf3nCon=[1,1,1; 1,1,1; 1,1,1],
      surf4ai=[1,1,1; 2,2,2; 3,3,3],
      surf4aj=[1,1,1; 2,2,2; 3,3,3],
      surf4nCon=[1,1,1; 1,1,1; 1,1,1],
      surf5ai=[1,1,1; 2,2,2; 3,3,3],
      surf5aj=[1,1,1; 2,2,2; 3,3,3],
      surf5nCon=[1,1,1; 1,1,1; 1,1,1],
      surf6ai=[1,1,1; 2,2,2; 3,3,3],
      surf6aj=[1,1,1; 2,2,2; 3,3,3],
      surf6nCon=[1,1,1; 1,1,1; 1,1,1],*/

      dxVec={length/elemX for i in 1:elemX},
      dyVec={height/elemY for i in 1:elemY},
      dzVec={width/elemZ for i in 1:elemZ},
      elemX=elemX,
      elemY=elemY,
      elemZ=elemZ)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2(
      nY=elemX,
      nZ=elemY)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,24})));
    BuildingSystems.Buildings.Surfaces.SurfaceToAir surface4(
      nY=elemX,
      nZ=elemY)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={40,0})));
    BuildingSystems.Buildings.Surfaces.SurfaceToAir surface6(
      nY=elemX,
      nZ=elemZ)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-18,-26})));
    BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1(
      nY=elemZ,
      nZ=elemY)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-36,0})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal3D ceiling(
      nY=elemX,
      nZ=elemZ,
      height=width,
      width=length,
      constructionData=construction1,
      angleDegAzi=0.0,
      angleDegTil=180.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,18})));
    BuildingSystems.Buildings.Surfaces.SurfaceToAir surface3(
      nY=elemZ,
      nZ=elemY)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,24})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal3D bottom(
      nY=elemX,
      nZ=elemZ,
      height=width,
      width=length,
      angleDegAzi=0.0,
      constructionData=construction1,
      angleDegTil=0.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-20})));
    BuildingSystems.Buildings.Surfaces.SurfaceToAir surface5(
    nY=elemX,
    nZ=elemZ)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-26})));
  equation
    connect(ambient.toAirPorts[1],surface1. toAirPort)
      annotation (Line(
        points={{-40,-4},{-40,4},{-36.6,4}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(surface2.toAirPort, ambient.toAirPorts[2]) annotation (Line(
        points={{-14,24.6},{-14,30},{-40,30},{-40,-4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface6.toAirPort, ambient.toAirPorts[4]) annotation (Line(
        points={{-22,-26.6},{-22,-32},{-40,-32},{-40,-4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface4.toAirPort, ambient.toAirPorts[4]) annotation (Line(
        points={{40.6,-4},{42,-4},{42,-32},{-40,-32},{-40,-4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface4.toConstructionPort, wall3.toSurfacePort_2) annotation (Line(
        points={{39.4,0},{36,0}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall3.toSurfacePort_1, zone.toConstructionPorts3[1]) annotation (Line(
        points={{32,0},{14,0},{14,-4},{11,-4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface2.toConstructionPort, wall2.toSurfacePort_2) annotation (Line(
        points={{-18,23.4},{-18,20}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall2.toSurfacePort_1, zone.toConstructionPorts2[1]) annotation (Line(
        points={{-18,16},{-18,14},{4,14},{4,11}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(bottom.toSurfacePort_1, zone.toConstructionPorts6[1]) annotation (
      Line(points={{20,-18},{20,-16},{-14,-16},{-14,-6},{-9,-6}}, color={0,0,0}));
      connect(ceiling.toSurfacePort_1, zone.toConstructionPorts5[1])
    annotation (Line(points={{20,16},{20,6},{9,6}}, color={0,0,0}));
      connect(surface2.toSurfacesPort, ambient.toSurfacePorts[2]) annotation (Line(
        points={{-22,24.6},{-22,30},{-40,30},{-40,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface4.toSurfacesPort, ambient.toSurfacePorts[4]) annotation (Line(
        points={{40.6,4},{42,4},{42,30},{-40,30},{-40,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface1.toSurfacesPort, ambient.toSurfacePorts[1])
      annotation (Line(
        points={{-36.6,-4},{-40,-4},{-40,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface6.toSurfacesPort, ambient.toSurfacePorts[6]) annotation (Line(
        points={{-14,-26.6},{-14,-32},{-40,-32},{-40,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(ceiling.toSurfacePort_2, surface3.toConstructionPort) annotation (
        Line(
        points={{20,20},{20,23.4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface3.toAirPort, ambient.toAirPorts[3]) annotation (Line(
        points={{24,24.6},{24,30},{-40,30},{-40,-4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface3.toSurfacesPort, ambient.toSurfacePorts[3]) annotation (Line(
        points={{16,24.6},{16,30},{-40,30},{-40,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface1.toConstructionPort, wall1.toSurfacePort_2) annotation (Line(
        points={{-35.4,0},{-32,0}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface6.toConstructionPort, wall4.toSurfacePort_2) annotation (Line(
        points={{-18,-25.4},{-18,-22}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall4.toSurfacePort_1, zone.toConstructionPorts4[1]) annotation (Line(
        points={{-18,-18},{-18,-14},{-2,-14},{-2,-11}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall1.toSurfacePort_1, zone.toConstructionPorts1[1]) annotation (Line(
        points={{-28,0},{-14,0},{-14,4},{-11,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(bottom.toSurfacePort_2, surface5.toConstructionPort) annotation (Line(
        points={{20,-22},{20,-25.4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface5.toAirPort, ambient.toAirPorts[5]) annotation (Line(
        points={{16,-26.6},{16,-32},{-40,-32},{-40,-4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface5.toSurfacesPort, ambient.toSurfacePorts[5]) annotation (Line(
        points={{24,-26.6},{24,-32},{-40,-32},{-40,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));

    annotation(experiment(StartTime=0, StopTime=31536000),
      __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Zones/Examples/SingleZoneThermal3D.mos" "Simulate and plot"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={
      Text(extent={{-54,-14},{50,-82}}, lineColor={0,0,255},
      textString="Thermal zone model with 3D discretised airvolume and some 3D-constructions elements under real weather data")}),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})));
end SingleZoneThermal3D;
