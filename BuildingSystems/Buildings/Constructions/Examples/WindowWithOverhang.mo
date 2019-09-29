within BuildingSystems.Buildings.Constructions.Examples;
model WindowWithOverhang
  "Window model with an overhang under real weather data"
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
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    V=4*4*2.8,
    height=2.8,
    calcIdealLoads=true,
    nConstructions=1,
    prescribedAirchange=true)
    annotation (Placement(transformation(extent={{28,-10},{48,10}})));
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{16,12},{22,18}})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{16,2},{22,8}})));
  Modelica.Blocks.Sources.Constant airchange(
    k=0.5)
    annotation (Placement(transformation(extent={{12,-8},{18,-2}})));
  BuildingSystems.Buildings.Constructions.Shadowing.OverhangElement overhang(
    depthOH=0.5,
    heightOH=0.1,
    heightWin=2.0)
    annotation (Placement(transformation(extent={{-10,16},{10,36}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky
    radiation annotation (Placement(transformation(extent={{-28,16},{-8,36}})));
  Modelica.Blocks.Sources.Constant angTil(k=90)
    annotation (Placement(transformation(extent={{-40,22},{-36,26}})));
  Modelica.Blocks.Sources.Constant angAzi(k=0.0)
    annotation (Placement(transformation(extent={{-34,18},{-30,22}})));
equation
  connect(surface1.toConstructionPort, window.toSurfacePort_1) annotation (Line(
      points={{-15.4,0},{-2,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-31,4},{-16.6,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-31,-4},{-16.6,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(TSetHeating.y, zone.T_setHeating) annotation (Line(
      points={{22.3,15},{24,15},{24,7},{27,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCooling.y, zone.T_setCooling)
    annotation (Line(points={{22.3,5},{27,5}}, color={0,0,127}));
  connect(window.toSurfacePort_2, zone.toConstructionPorts[1])
    annotation (Line(points={{2,0},{20,0},{20,0},{38,0}},     color={0,0,0}));
  connect(ambience.TAirRef, zone.TAirAmb) annotation (Line(points={{-49,7},{-52,7},
          {-52,-14},{22,-14},{22,-5},{27,-5}}, color={0,0,127}));
  connect(ambience.xAir, zone.xAirAmb) annotation (Line(points={{-49,5},{-52,5},
          {-52,-14},{26,-14},{26,-7},{27,-7}},color={0,0,127}));
  connect(airchange.y, zone.airchange) annotation (Line(points={{18.3,-5},{20,-5},
          {20,-3},{27,-3}}, color={0,0,127}));
  connect(overhang.SC, window.GSC_in) annotation (Line(points={{0,17},{0,12},{0.1,
          12},{0.1,8.9}}, color={0,0,127}));
  connect(radiation.radiationPort, overhang.radiationPort_in)
    annotation (Line(points={{-10,26},{-4,26}}, color={0,0,0}));
  connect(ambience.IrrDirHor, radiation.IrrDirHor) annotation (Line(points={{-49,
          3},{-54,3},{-54,32},{-25.6,32}}, color={0,0,127}));
  connect(ambience.IrrDifHor, radiation.IrrDifHor) annotation (Line(points={{-49,
          1},{-54,1},{-54,28},{-25.6,28}}, color={0,0,127}));
  connect(ambience.latitudeDeg, radiation.latitudeDeg) annotation (Line(points={
          {-47,9},{-47,38},{-21.8,38},{-21.8,33.6}}, color={0,0,127}));
  connect(ambience.longitudeDeg, radiation.longitudeDeg) annotation (Line(
        points={{-45,9},{-45,38},{-18,38},{-18,33.6}}, color={0,0,127}));
  connect(ambience.longitudeDeg0, radiation.longitudeDeg0) annotation (Line(
        points={{-43,9},{-43,38},{-14,38},{-14,33.6}}, color={0,0,127}));
  connect(angTil.y, radiation.angleDegTil)
    annotation (Line(points={{-35.8,24},{-25.6,24}}, color={0,0,127}));
  connect(angAzi.y, radiation.angleDegAzi)
    annotation (Line(points={{-29.8,20},{-25.6,20}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=31536000,Interval=3600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WindowWithOverhang.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="Window model under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a window model with an overhang under real weather data.
</p>
</html>",
revisions="<html>
<ul>
<li>
September 29, 2019, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WindowWithOverhang;
