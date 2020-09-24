within BuildingSystems.Buildings.Constructions.Examples;
model WallThermalTriangular1DNodesFlexGeo
  "1D thermal wall model with a time dependent height and width"
  extends Modelica.Icons.Example;
  record Construction
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=2,
      thickness={0.1,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
                BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()});
  end Construction;
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall(
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Local,
    angleDegAzi = 0.0,
    angleDegTil = 90.0,
    nNodes={2,2},
    redeclare Construction constructionData,
    geometryType=BuildingSystems.Buildings.Types.GeometryType.Flexible)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2
    annotation (Placement(transformation(extent={{2,-10},{22,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-2,-10},{-22,10}})));
  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces=2,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Blocks.Sources.Constant angleDegTil(
    k=90.0)
    annotation (Placement(transformation(extent={{16,18},{10,24}})));
  Modelica.Blocks.Sources.Constant angleDegAzi(
    k=0.0)
    annotation (Placement(transformation(extent={{16,28},{10,34}})));
  Modelica.Blocks.Sources.Sine x1(amplitude=0.25, freqHz=1/3600)
    annotation (Placement(transformation(extent={{-34,32},{-28,38}})));
  Modelica.Blocks.Sources.Constant x2(k=1.0) annotation (Placement(
        transformation(
        extent={{3,3},{-3,-3}},
        rotation=180,
        origin={-21,35})));
  Modelica.Blocks.Sources.Constant x3(k=0.5) annotation (Placement(
        transformation(
        extent={{3,3},{-3,-3}},
        rotation=180,
        origin={-11,35})));
  Modelica.Blocks.Sources.Constant y1(k=0.0) annotation (Placement(
        transformation(
        extent={{3,3},{-3,-3}},
        rotation=180,
        origin={-31,25})));
  Modelica.Blocks.Sources.Constant y2(k=0.0) annotation (Placement(
        transformation(
        extent={{3,3},{-3,-3}},
        rotation=180,
        origin={-21,25})));
  Modelica.Blocks.Sources.Constant y3(k=1.0) annotation (Placement(
        transformation(
        extent={{3,3},{-3,-3}},
        rotation=180,
        origin={-11,25})));
  Modelica.Blocks.Sources.Constant position[3](k={0.0,0.0,0.0})
    annotation (Placement(transformation(extent={{14,-22},{8,-16}})));
equation
  connect(surface1.toConstructionPort, wall.toSurfacePort_1) annotation (Line(
      points={{-11.4,0},{-2,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall.toSurfacePort_2, surface2.toConstructionPort) annotation (Line(
      points={{2,0},{11.4,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-31,2},{-22,2},{-22,4},{-12.6,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-31,-6},{-22,-6},{-22,-4},{-12.6,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toSurfacePorts[2], surface2.toSurfacesPort) annotation (Line(
      points={{-31,6},{-24,6},{-24,16},{24,16},{24,4},{12.6,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toAirPorts[2], surface2.toAirPort) annotation (Line(
      points={{-31,-2},{-28,-2},{-28,-6},{-24,-6},{-24,-14},{24,-14},{24,-4},{12.6,
          -4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall.angleDegTil_in, angleDegAzi.y) annotation (Line(points={{2.2,-2},
          {6,-2},{6,31},{9.7,31}}, color={0,0,127}));
  connect(wall.angleDegAzi_in, angleDegTil.y) annotation (Line(points={{2.2,-4},
          {8,-4},{8,21},{9.7,21}}, color={0,0,127}));

  connect(x1.y, wall.verticesLocal_in[1, 1]) annotation (Line(points={{-27.7,35},
          {-26,35},{-26,12},{-6,12},{-6,-1.33333},{-2,-1.33333}}, color={0,0,127}));
  connect(y1.y, wall.verticesLocal_in[1, 2]) annotation (Line(points={{-27.7,25},
          {-26,25},{-26,12},{-6,12},{-6,-1.33333},{-2,-1.33333}}, color={0,0,127}));
  connect(x2.y, wall.verticesLocal_in[2, 1]) annotation (Line(points={{-17.7,35},
          {-16,35},{-16,10},{-8,10},{-8,-2},{-2,-2}}, color={0,0,127}));
  connect(y2.y, wall.verticesLocal_in[2, 2]) annotation (Line(points={{-17.7,25},
          {-17.7,24},{-16,24},{-16,10},{-8,10},{-8,-2},{-2,-2}}, color={0,0,127}));
  connect(x3.y, wall.verticesLocal_in[3, 1]) annotation (Line(points={{-7.7,35},
          {-6,35},{-6,-2.66667},{-2,-2.66667}}, color={0,0,127}));
  connect(y3.y, wall.verticesLocal_in[3, 2]) annotation (Line(points={{-7.7,25},
          {-7.7,12},{-6,12},{-6,-2},{-2,-2},{-2,-2.66667}}, color={0,0,127}));
  connect(wall.position_in, position.y) annotation (Line(points={{2.2,-6},{6,-6},
          {6,-19},{7.7,-19}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=31536000,Interval=3600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WallThermal1DNodesFlexGeo.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="1D thermal wall model with a time dependent height and width")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a 1D-layered thermal wall model with a time dependent height and width.
</p>
</html>",
revisions="<html>
<ul>
<li>
April 24, 2019, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WallThermalTriangular1DNodesFlexGeo;
