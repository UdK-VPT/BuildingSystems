within BuildingSystems.Buildings.Constructions.Examples;
model Window
  "Window model under real weather data"
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.Constructions.Windows.Window window(
    height=2.0,
    width=1.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionData,
    calcAirchange=false,
    use_GSC_in=true)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-6,-10},{-26,10}})));
  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces=1,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Zones.ZoneTemplateAirvolumeMixed zone(
    V=4*4*2.8,
    height=2.8,
    calcIdealLoads=true,
    nConstructions=1,
    prescribedAirchange=true)
    annotation (Placement(transformation(extent={{28,-10},{48,10}})));
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{12,12},{18,18}})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{12,2},{18,8}})));
  Modelica.Blocks.Sources.Trapezoid control(
    amplitude=1.0,
    rising=10,
    falling=10,
    offset=0.0,
    startTime=0.0,
    width=1800,
    period=3600)
    annotation (Placement(transformation(extent={{-10,12},{-4,18}})));
  Modelica.Blocks.Sources.Constant airchange(
    k=0.5)
    annotation (Placement(transformation(extent={{12,-8},{18,-2}})));
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
      points={{18.3,15},{24,15},{24,7},{27,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCooling.y, zone.T_setCooling)
    annotation (Line(points={{18.3,5},{27,5}}, color={0,0,127}));
  connect(window.toSurfacePort_2, zone.toConstructionPorts[1])
    annotation (Line(points={{2,0},{20,0},{20,0},{38,0}},     color={0,0,0}));

  connect(control.y, window.GSC_in)
    annotation (Line(points={{-3.7,15},{0.1,15},{0.1,8.9}}, color={0,0,127}));
  connect(ambience.TAirRef, zone.TAirAmb) annotation (Line(points={{-49,7},{-52,7},
          {-52,-14},{22,-14},{22,-5},{27,-5}}, color={0,0,127}));
  connect(ambience.xAir, zone.xAirAmb) annotation (Line(points={{-49,5},{-54,5},{
          -54,-16},{24,-16},{24,-7},{27,-7}}, color={0,0,127}));
  connect(airchange.y, zone.airchange) annotation (Line(points={{18.3,-5},{20,-5},
          {20,-3},{27,-3}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=31536000,Interval=3600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/Window.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="Window model under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a window model under real weather data.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
<li>
June 27, 2017, by Christoph Nytsch-Geusen:<br/>
Dynamic shadowing factor added.
</li>
</ul>
</html>"));
end Window;
