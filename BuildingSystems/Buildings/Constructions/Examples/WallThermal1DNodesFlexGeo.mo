within BuildingSystems.Buildings.Constructions.Examples;
model WallThermal1DNodesFlexGeo
  "1D thermal wall model with a time dependent height and width under real weather data"
  extends Modelica.Icons.Example;
  record Construction
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=2,
      thickness={0.1,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
                BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()});
  end Construction;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall(
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
  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=2,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Blocks.Sources.Sine width(
    amplitude=0.5,
    freqHz=1/86400,
    startTime=0,
    offset=2)
    annotation (Placement(transformation(extent={{-16,18},{-10,24}})));
  Modelica.Blocks.Sources.Sine height(
    amplitude=0.5,
    freqHz=1/86400,
    offset=1,
    startTime=0)
    annotation (Placement(transformation(extent={{-16,28},{-10,34}})));
  Modelica.Blocks.Sources.Constant AInnSur(
    k=0.0)
    annotation (Placement(transformation(extent={{-14,-22},{-8,-16}})));
  Modelica.Blocks.Sources.Constant angleDegTil(
    k=90.0)
    annotation (Placement(transformation(extent={{16,18},{10,24}})));
  Modelica.Blocks.Sources.Constant angleDegAzi(
    k=0.0)
    annotation (Placement(transformation(extent={{16,28},{10,34}})));
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
  connect(ambient.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-32,2},{-22,2},{-22,4},{-12.6,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-32,-6},{-22,-6},{-22,-4},{-12.6,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toSurfacePorts[2], surface2.toSurfacesPort) annotation (Line(
      points={{-32,6},{-24,6},{-24,16},{24,16},{24,4},{12.6,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toAirPorts[2], surface2.toAirPort) annotation (Line(
      points={{-32,-2},{-28,-2},{-28,-6},{-24,-6},{-24,-14},{24,-14},{24,-4},{12.6,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(width.y, wall.width_in) annotation (Line(points={{-9.7,21},{-6,21},{-6,
          -2},{-2,-2}},
                      color={0,0,127}));
  connect(AInnSur.y, wall.AInnSur_in) annotation (Line(points={{-7.7,-19},{-6,-19},
          {-6,-6},{-2,-6}}, color={0,0,127}));

  connect(height.y, wall.height_in) annotation (Line(points={{-9.7,31},{-8,31},{
          -8,-4},{-2,-4}}, color={0,0,127}));
  connect(wall.angleDegTil_in, angleDegAzi.y) annotation (Line(points={{2.2,-2},
          {6,-2},{6,31},{9.7,31}}, color={0,0,127}));
  connect(wall.angleDegAzi_in, angleDegTil.y) annotation (Line(points={{2.2,-4},
          {8,-4},{8,21},{9.7,21}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=31536000,Interval=3600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WallThermal1DNodesFlexGeo.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="1D thermal wall model with a time dependent height and width under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a 1D-layered thermal wall model with a time dependent height and width under real weather data.
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
end WallThermal1DNodesFlexGeo;
