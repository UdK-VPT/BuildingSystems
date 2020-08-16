within BuildingSystems.Buildings.Constructions.Examples;
model WindowWithAirpathsFlexGeo
  "Window model with two airpaths and a time dependent height and width under real weather data"
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.Constructions.Windows.Window window(
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
    calcAirchange=true,
    geometryType=BuildingSystems.Buildings.Types.GeometryType.Flexible)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-6,-10},{-26,10}})));
  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces=1,
    nAirpaths=2,
    heightAirpath={0.5,1.5},
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Zones.ZoneTemplateAirvolumeMixed zone(
    V=4*4*2.8,
    height=2.8,
    heightAirpath={0.5,1.5},
    calcIdealLoads=true,
    prescribedAirchange=false,
    nAirpaths=2,
    nConstructions=1)
    annotation (Placement(transformation(extent={{28,-10},{48,10}})));
  Modelica.Blocks.Sources.Constant TSetHeating(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{14,12},{20,18}})));
  Modelica.Blocks.Sources.Constant TSetCooling(
    k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{14,2},{20,8}})));
  Modelica.Blocks.Sources.Trapezoid control(
    amplitude=1.0,
    rising=10,
    falling=10,
    offset=0.0,
    startTime=0.0,
    width=1800,
    period=3600)
    annotation (Placement(transformation(extent={{-8,-20},{-2,-14}})));
  Modelica.Blocks.Sources.Sine height(
    amplitude=0.5,
    freqHz=1/86400,
    offset=1,
    startTime=0)
    annotation (Placement(transformation(extent={{-16,32},{-10,38}})));
  Modelica.Blocks.Sources.Constant angleDegAzi(
    k=0.0)
    annotation (Placement(transformation(extent={{16,32},{10,38}})));
  Modelica.Blocks.Sources.Constant angleDegTil(
    k=90.0)
    annotation (Placement(transformation(extent={{16,22},{10,28}})));
  Modelica.Blocks.Sources.Sine width(
    amplitude=0.5,
    freqHz=1/86400,
    startTime=0,
    offset=2)
    annotation (Placement(transformation(extent={{-16,22},{-10,28}})));
  Modelica.Blocks.Sources.Constant position[3](k={0.0,0.0,1.0})
    annotation (Placement(transformation(extent={{20,-20},{14,-14}})));
equation
  connect(surface1.toConstructionPort, window.toSurfacePort_1) annotation (Line(
      points={{-15.4,0},{-2,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-32,4},{-16.6,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-32,-4},{-16.6,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(TSetHeating.y, zone.T_setHeating) annotation (Line(
      points={{20.3,15},{24,15},{24,7},{27,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambience.toAirpathPorts[1], window.port_a1) annotation (Line(points={{-35,9},
          {-35,12},{-2,12},{-2,6}},      color={0,127,255}));
  connect(ambience.toAirpathPorts[2], window.port_b2) annotation (Line(points={{-39,9},
          {-39,12},{-52,12},{-52,-12},{-2,-12},{-2,-6}},      color={0,127,255}));
  connect(control.y, window.y)
    annotation (Line(points={{-1.7,-17},{0,-17},{0,-9}}, color={0,0,127}));
  connect(TSetCooling.y, zone.T_setCooling)
    annotation (Line(points={{20.3,5},{27,5}}, color={0,0,127}));
  connect(window.toSurfacePort_2, zone.toConstructionPorts[1])
    annotation (Line(points={{2,0},{20,0},{20,0},{38,0}},     color={0,0,0}));
  connect(window.port_b1, zone.airpathPorts[1]) annotation (Line(points={{2,6},{2,
          20},{34,20},{34,11}},     color={0,127,255}));
  connect(window.port_a2, zone.airpathPorts[2]) annotation (Line(points={{2,-6},{
          8,-6},{8,20},{30,20},{30,11}},color={0,127,255}));
  connect(height.y, window.height_in) annotation (Line(points={{-9.7,35},{-6,35},
          {-6,-4},{-2,-4}}, color={0,0,127}));
  connect(width.y, window.width_in) annotation (Line(points={{-9.7,25},{-8,25},{
          -8,-2},{-2,-2}}, color={0,0,127}));
  connect(window.angleDegTil_in, angleDegTil.y) annotation (Line(points={{2.2,-2},
          {4,-2},{4,25},{9.7,25}}, color={0,0,127}));
  connect(window.angleDegAzi_in, angleDegAzi.y) annotation (Line(points={{2.2,-4},
          {6,-4},{6,35},{9.7,35}}, color={0,0,127}));
  connect(window.position_in, position.y) annotation (Line(points={{2.2,2},{10,2},
          {10,-17},{13.7,-17}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=7200.0),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WindowWithAirPathsFlexGeo.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={
    Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="Window model with two airpaths and a time dependent height and width under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a window model with two airpaths and a time dependent height and width under real weather data.
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
end WindowWithAirpathsFlexGeo;
