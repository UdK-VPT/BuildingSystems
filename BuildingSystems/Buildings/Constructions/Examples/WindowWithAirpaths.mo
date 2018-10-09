within BuildingSystems.Buildings.Constructions.Examples;
model WindowWithAirpaths
  "Window model with two airpaths under real weather data"
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.Constructions.Windows.Window window(
    height=2.0,
    width=1.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
    calcAirchange=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-2,-10},{-22,10}})));
  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=1,
    nAirpaths=2,
    heightAirpath={0.5,1.5},
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Zones.ZoneTemplateAirvolumeMixed zone(
    nAirpaths=2,
    V=4*4*2.8,
    height=2.8,
    heightAirpath={0.5,1.5},
    calcIdealLoads=true,
    prescribedAirchange=false,
    nConstructions=1)
    annotation (Placement(transformation(extent={{28,-10},{48,10}})));
  Modelica.Blocks.Sources.Ramp anglePan(
    height=30.0,
    duration=10.0,
    startTime=3600)
    annotation (Placement(transformation(extent={{-10,18},{-4,24}})));
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{14,12},{20,18}})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{14,2},{20,8}})));
equation
  connect(surface1.toConstructionPort, window.toSurfacePort_1) annotation (Line(
      points={{-11.4,0},{-2,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-32,4},{-22,4},{-22,4},{-12.6,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-32,-4},{-22,-4},{-22,-4},{-12.6,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(anglePan.y, window.angleDegPanes) annotation (Line(
      points={{-3.7,21},{0,21},{0,7.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient.toAirpathPorts[1], window.airpathPortDown_1) annotation (Line(
      points={{-35,9},{-35,12},{-52,12},{-52,-14},{-6,-14},{-6,-4},{-1.8,-4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ambient.toAirpathPorts[2], window.airpathPortUp_1) annotation (Line(
      points={{-39,9},{-39,12},{-6,12},{-6,4},{-1.8,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TSetHeating.y, zone.T_setHeating) annotation (Line(
      points={{20.3,15},{24,15},{24,7},{27,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCooling.y, zone.T_setCooling) annotation (Line(
      points={{20.3,5},{27,5}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(window.toSurfacePort_2, zone.toConstructionPorts[1])
    annotation (Line(points={{2,0},{20,0},{20,0.2},{38,0.2}}, color={0,0,0}));
  connect(window.airpathPortDown_2, zone.airpathPorts[1]) annotation (Line(
        points={{1.8,-4},{12,-4},{12,20},{32,20},{32,11}}, color={0,127,255}));
  connect(window.airpathPortUp_2, zone.airpathPorts[2]) annotation (Line(points
        ={{1.8,4},{12,4},{12,20},{32,20},{32,11}}, color={0,127,255}));
  annotation(experiment(StartTime=0, StopTime=4500.0),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WindowWithAirPaths.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={
    Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="Window model with two airpaths under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a window model with two airpaths under real weather data.
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
end WindowWithAirpaths;
