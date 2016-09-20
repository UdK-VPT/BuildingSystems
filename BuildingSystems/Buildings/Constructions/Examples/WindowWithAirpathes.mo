within BuildingSystems.Buildings.Constructions.Examples;
model WindowWithAirpathes
  "Window model with two airpathes under real weather data"
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.Constructions.Windows.Window window(
    height=2.0,
    width=1.0,
    UVal=0.5,
    calcAirchange=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-2,-10},{-22,10}})));
  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=1,
    nAirpathes=2,
    heightAirpath={0.5,1.5},
    gridSurface={{1,1}},
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Zones.ZoneTemplateAirvolumeMixed zone(
    nConstructions1=1,
    gridSurface1={{1,1}},
    nAirpathes1=2,
    V=4*4*2.8,
    height=2.8,
    heightAirpath={0.5,1.5},
    calcIdealLoads=true,
    prescribedAirchange=false)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  Modelica.Blocks.Sources.Ramp anglePan(
    height=30.0,
    duration=10.0,
    startTime=3600)
    annotation (Placement(transformation(extent={{-10,18},{-4,24}})));
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{16,-6},{20,-2}})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{22,-2},{26,2}})));
equation
  connect(surface1.toConstructionPort, window.toSurfacePort_1) annotation (Line(
      points={{-11.4,0},{-1.8,0}},
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
  connect(window.toSurfacePort_2, zone.toConstructionPorts1[1]) annotation (Line(
      points={{1.8,0},{4,0},{4,2},{9,2}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(zone.airpathPorts1[1], window.airpathPortDown_2)
    annotation (Line(
      points={{9,-6},{6,-6},{6,-4},{1.8,-4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(zone.airpathPorts1[2], window.airpathPortUp_2)
    annotation (Line(
      points={{9,-2},{6,-2},{6,4},{1.8,4}},
      color={0,0,255},
      smooth=Smooth.None));
  connect(anglePan.y, window.angleDegPanes) annotation (Line(
      points={{-3.7,21},{0,21},{0,7.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient.toAirpathPorts[1], window.airpathPortDown_1) annotation (Line(
      points={{-38,9},{-38,12},{-52,12},{-52,-14},{-6,-14},{-6,-4},{-1.8,-4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ambient.toAirpathPorts[2], window.airpathPortUp_1) annotation (Line(
      points={{-42,9},{-42,12},{-6,12},{-6,4},{-1.8,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(TSetHeating.y, zone.T_setHeating) annotation (Line(
      points={{20.2,-4},{25,-4},{25,-7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCooling.y, zone.T_setCooling) annotation (Line(
      points={{26.2,0},{27,0},{27,-7}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=4500.0),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WindowWithAirPathes.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={
    Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="Window model with two airpathes under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a window model with two airpathes under real weather data.
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
end WindowWithAirpathes;
