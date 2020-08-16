within BuildingSystems.Buildings.Zones.Examples;
model SingleZoneThermal1DTriangularWalls
  "Thermal zone model of a box with triangulated walls"
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.Ambience ambience(
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII,
    nSurfaces=12)
    annotation (Placement(transformation(extent={{-58,-10},{-38,10}})));
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    V=3.0*3.0*3.0,
    height=3.0,
    calcIdealLoads=true,
    nConstructions=12)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface5
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={6,34})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface7
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={60,12})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={6,-40})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface3
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-28,-12})));
  Modelica.Blocks.Sources.Constant TSetHeating(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{0,6},{2,8}})));
  Modelica.Blocks.Sources.Constant TSetCooling(
    k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{4,4},{6,6}})));
  Modelica.Blocks.Sources.Constant airchange1(
    k=0.5)
    annotation (Placement(transformation(extent={{1,-1},{-1,1}},rotation=180,origin={5,-3})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface6
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={32,34})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={30,-40})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface4
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-28,12})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface8
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={60,-12})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall5(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{0.0,2.0,3.0},{4.0,0.0,3.0},{0.0,0.0,3.0}})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={6,24})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall6(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{0.0,2.0,2.0},{4.0,2.0,3.0},{4.0,0.0,3.0}})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={32,24})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall7(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{4.0,2.0,0.0},{4.0,0.0,3.0},{4.0,2.0,3.0}})
    annotation (Placement(transformation(extent={{42,2},{62,22}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall8(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{4.0,2.0,0.0},{4.0,0.0,0.0},{4.0,0.0,3.0}})
    annotation (Placement(transformation(extent={{42,-22},{62,-2}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall1(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{0.0,0.0,0.0},{4.0,2.0,0.0},{0.0,2.0,0.0}})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={6,-26})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall2(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{0.0,0.0,0.0},{4.0,0.0,0.0},{4.0,2.0,0.0}})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={30,-26})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall4(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{0.0,2.0,0.0},{0.0,2.0,3.0},{0.0,0.0,3.0}})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-18,12})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall3(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{0.0,0.0,0.0},{0.0,2.0,0.0},{0.0,0.0,3.0}})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-18,-12})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface9
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={28,66})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface10
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={54,66})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall9(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{0.0,2.0,0.0},{4.0,2.0,0.0},{4.0,2.0,3.0}})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={28,56})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall10(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{0.0,2.0,0.0},{4.0,2.0,3.0},{0.0,2.0,3.0}})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={54,56})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface11
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-38,-72})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface12
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-12,-72})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall11(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{0.0,0.0,0.0},{4.0,0.0,3.0},{4.0,0.0,0.0}})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-38,-60})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall12(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Global,
    verticesGlobal={{0.0,0.0,0.0},{0.0,0.0,3.0},{4.0,0.0,3.0}})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-12,-60})));
equation
  connect(TSetCooling.y, zone.T_setCooling) annotation (Line(
      points={{6.1,5},{9,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHeating.y, zone.T_setHeating) annotation (Line(
      points={{2.1,7},{9,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambience.TAirRef, zone.TAirAmb) annotation (Line(
      points={{-57,7},{-60,7},{-60,-28},{-6,-28},{-6,-4},{9,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambience.xAir, zone.xAirAmb) annotation (Line(
      points={{-57,5},{-60,5},{-60,-28},{-6,-28},{-6,-8},{9,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airchange1.y, zone.airchange) annotation (Line(
      points={{6.1,-3},{8,-3},{8,-2},{9,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(wall1.toSurfacePort_1, zone.toConstructionPorts[1]) annotation (Line(
        points={{6,-24},{6,-18},{20,-18},{20,-1.83333}}, color={0,0,0}));
  connect(wall2.toSurfacePort_1, zone.toConstructionPorts[2]) annotation (Line(
        points={{30,-24},{30,-18},{20,-18},{20,-1.5}}, color={0,0,0}));
  connect(wall3.toSurfacePort_1, zone.toConstructionPorts[3]) annotation (Line(
        points={{-16,-12},{-8,-12},{-8,-1.16667},{20,-1.16667}}, color={0,0,0}));
  connect(wall4.toSurfacePort_1, zone.toConstructionPorts[4]) annotation (Line(
        points={{-16,12},{-8,12},{-8,0},{20,0},{20,-0.833333}}, color={0,0,0}));
  connect(wall5.toSurfacePort_1, zone.toConstructionPorts[5])
    annotation (Line(points={{6,22},{6,14},{20,14},{20,-0.5}}, color={0,0,0}));
  connect(wall6.toSurfacePort_1, zone.toConstructionPorts[6]) annotation (Line(
        points={{32,22},{32,14},{20,14},{20,-0.166667}}, color={0,0,0}));
  connect(wall7.toSurfacePort_1, zone.toConstructionPorts[7]) annotation (Line(
        points={{50,12},{40,12},{40,0.166667},{20,0.166667}}, color={0,0,0}));
  connect(wall8.toSurfacePort_1, zone.toConstructionPorts[8]) annotation (Line(
        points={{50,-12},{40,-12},{40,0.5},{20,0.5}}, color={0,0,0}));
  connect(wall9.toSurfacePort_1, zone.toConstructionPorts[9]) annotation (Line(
        points={{28,54},{28,40},{20,40},{20,0.833333}}, color={0,0,0}));
  connect(wall10.toSurfacePort_1, zone.toConstructionPorts[10]) annotation (
      Line(points={{54,54},{54,40},{20,40},{20,1.16667}}, color={0,0,0}));
  connect(wall11.toSurfacePort_1, zone.toConstructionPorts[11]) annotation (
      Line(points={{-38,-58},{-38,-52},{20,-52},{20,1.5}}, color={0,0,0}));
  connect(wall12.toSurfacePort_1, zone.toConstructionPorts[12]) annotation (
      Line(points={{-12,-58},{-12,-52},{20,-52},{20,1.83333}}, color={0,0,0}));
  connect(wall1.toSurfacePort_2, surface1.toConstructionPort)
    annotation (Line(points={{6,-28},{6,-39.4}}, color={0,0,0}));
  connect(wall2.toSurfacePort_2, surface2.toConstructionPort)
    annotation (Line(points={{30,-28},{30,-39.4}}, color={0,0,0}));
  connect(wall3.toSurfacePort_2, surface3.toConstructionPort)
    annotation (Line(points={{-20,-12},{-27.4,-12}}, color={0,0,0}));
  connect(wall4.toSurfacePort_2, surface4.toConstructionPort)
    annotation (Line(points={{-20,12},{-27.4,12}}, color={0,0,0}));
  connect(wall5.toSurfacePort_2, surface5.toConstructionPort)
    annotation (Line(points={{6,26},{6,33.4}}, color={0,0,0}));
  connect(wall6.toSurfacePort_2, surface6.toConstructionPort)
    annotation (Line(points={{32,26},{32,33.4}}, color={0,0,0}));
  connect(wall7.toSurfacePort_2, surface7.toConstructionPort)
    annotation (Line(points={{54,12},{59.4,12}}, color={0,0,0}));
  connect(wall8.toSurfacePort_2, surface8.toConstructionPort)
    annotation (Line(points={{54,-12},{59.4,-12}}, color={0,0,0}));
  connect(wall9.toSurfacePort_2, surface9.toConstructionPort)
    annotation (Line(points={{28,58},{28,65.4}}, color={0,0,0}));
  connect(wall10.toSurfacePort_2, surface10.toConstructionPort)
    annotation (Line(points={{54,58},{54,65.4}}, color={0,0,0}));
  connect(wall11.toSurfacePort_2, surface11.toConstructionPort)
    annotation (Line(points={{-38,-62},{-38,-71.4}}, color={0,0,0}));
  connect(wall12.toSurfacePort_2, surface12.toConstructionPort)
    annotation (Line(points={{-12,-62},{-12,-71.4}}, color={0,0,0}));
  connect(surface1.toAirPort, ambience.toAirPorts[1]) annotation (Line(points={{
          2,-40.6},{2,-44},{-39,-44},{-39,-4}}, color={0,0,0}));
  connect(surface2.toAirPort, ambience.toAirPorts[2]) annotation (Line(points={{
          26,-40.6},{26,-44},{-39,-44},{-39,-4}}, color={0,0,0}));
  connect(surface3.toAirPort, ambience.toAirPorts[3]) annotation (Line(points={{
          -28.6,-8},{-32,-8},{-32,-4},{-39,-4}}, color={0,0,0}));
  connect(surface4.toAirPort, ambience.toAirPorts[4]) annotation (Line(points={{
          -28.6,16},{-32,16},{-32,-4},{-39,-4}}, color={0,0,0}));
  connect(surface5.toAirPort, ambience.toAirPorts[5]) annotation (Line(points={{
          10,34.6},{10,36},{-32,36},{-32,-4},{-39,-4}}, color={0,0,0}));
  connect(surface6.toAirPort, ambience.toAirPorts[6]) annotation (Line(points={{
          36,34.6},{36,36},{-32,36},{-32,-4},{-39,-4}}, color={0,0,0}));
  connect(surface7.toAirPort, ambience.toAirPorts[7]) annotation (Line(points={{
          60.6,8},{62,8},{62,-44},{-39,-44},{-39,-4}}, color={0,0,0}));
  connect(surface8.toAirPort, ambience.toAirPorts[8]) annotation (Line(points={{
          60.6,-16},{62,-16},{62,-44},{-39,-44},{-39,-4}}, color={0,0,0}));
  connect(surface9.toAirPort, ambience.toAirPorts[9]) annotation (Line(points={{
          32,66.6},{32,70},{-32,70},{-32,-4},{-39,-4}}, color={0,0,0}));
  connect(surface10.toAirPort, ambience.toAirPorts[10]) annotation (Line(points
        ={{58,66.6},{58,70},{-32,70},{-32,-4},{-39,-4}}, color={0,0,0}));
  connect(surface11.toAirPort, ambience.toAirPorts[11]) annotation (Line(points
        ={{-42,-72.6},{-42,-76},{-50,-76},{-50,-40},{-39,-40},{-39,-4}}, color={
          0,0,0}));
  connect(surface12.toAirPort, ambience.toAirPorts[12]) annotation (Line(points
        ={{-16,-72.6},{-16,-76},{-50,-76},{-50,-40},{-39,-40},{-39,-4}}, color={
          0,0,0}));
  connect(surface1.toSurfacesPort, ambience.toSurfacePorts[1]) annotation (Line(
        points={{10,-40.6},{10,-44},{-39,-44},{-39,4}}, color={0,0,0}));
  connect(surface2.toSurfacesPort, ambience.toSurfacePorts[2]) annotation (Line(
        points={{34,-40.6},{34,-44},{-39,-44},{-39,4}}, color={0,0,0}));
  connect(surface3.toSurfacesPort, ambience.toSurfacePorts[3])
    annotation (Line(points={{-28.6,-16},{-39,-16},{-39,4}}, color={0,0,0}));
  connect(surface4.toSurfacesPort, ambience.toSurfacePorts[4])
    annotation (Line(points={{-28.6,8},{-39,8},{-39,4}}, color={0,0,0}));
  connect(surface5.toSurfacesPort, ambience.toSurfacePorts[5]) annotation (Line(
        points={{2,34.6},{2,36},{-39,36},{-39,4}}, color={0,0,0}));
  connect(surface6.toSurfacesPort, ambience.toSurfacePorts[6]) annotation (Line(
        points={{28,34.6},{28,36},{-39,36},{-39,4}}, color={0,0,0}));
  connect(surface7.toSurfacesPort, ambience.toSurfacePorts[7]) annotation (Line(
        points={{60.6,16},{62,16},{62,-44},{-39,-44},{-39,4}}, color={0,0,0}));
  connect(surface8.toSurfacesPort, ambience.toSurfacePorts[8]) annotation (Line(
        points={{60.6,-8},{62,-8},{62,-44},{-39,-44},{-39,4}}, color={0,0,0}));
  connect(surface9.toSurfacesPort, ambience.toSurfacePorts[9]) annotation (Line(
        points={{24,66.6},{24,70},{-39,70},{-39,4}}, color={0,0,0}));
  connect(surface10.toSurfacesPort, ambience.toSurfacePorts[10]) annotation (
      Line(points={{50,66.6},{50,70},{-39,70},{-39,4}}, color={0,0,0}));
  connect(surface11.toSurfacesPort, ambience.toSurfacePorts[11]) annotation (
      Line(points={{-34,-72.6},{-34,-76},{-50,-76},{-50,-40},{-39,-40},{-39,4}},
        color={0,0,0}));
  connect(surface12.toSurfacesPort, ambience.toSurfacePorts[12]) annotation (
      Line(points={{-8,-72.6},{-8,-76},{-50,-76},{-50,-40},{-39,-40},{-39,4}},
        color={0,0,0}));

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Zones/Examples/SingleZoneThermal1DTriangularWalls.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-100},{100,80}}), graphics={
   Text(extent={{-58,-38},{100,-140}},lineColor={0,0,255},
   textString="Thermal zone model of a box with triangulated walls")}),
   Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-100},{100,80}})),
Documentation(info="<html>
<p>
Example that simulates a thermal zone model of a box with triangulated walls.
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
end SingleZoneThermal1DTriangularWalls;
