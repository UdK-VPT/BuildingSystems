within BuildingSystems.Technologies.SolarThermal.Examples;
model SingleCollectorTest
"Test of the single collector model"
  extends Modelica.Icons.Example;
  replaceable package Medium = BuildingSystems.Media.Water;

  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(
    redeclare Climate.WeatherDataDWD.WeatherDataFile_Germany_Potsdam2013 weatherDataFile)
    "time Gdot_beam Gdot_diffuse T_air_env"
    annotation (Placement(transformation(extent={{-112,60},{-94,76}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    rhoAmb=0.2)
    annotation (Placement(transformation(extent={{-70,46},{-50,66}})));
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation (Placement(transformation(extent={{-14,34},{-22,42}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-28,28},{-38,38}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T boundary(
    nPorts = 1,
    m_flow = 0.01,
    redeclare package Medium = Medium,
    T=283.15)
    annotation (Placement(transformation(extent={{-100,-20},{-80,0}})));
  BuildingSystems.Fluid.Sources.FixedBoundary bou(
    redeclare package Medium = Medium,
    nPorts=1)
    annotation (Placement(transformation(extent={{0,-20},{-20,0}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal = 2.0,
    angleDegAzi = 0.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.ComercialsCollectors.FlatPlate.AgenaAZUR8plus_AC28H collectorData,
    angleDegTil = 30.0)
    annotation (Placement(transformation(extent={{-54,-20},{-34,0}})));
equation
  connect(boundary.ports[1], collector.port_a) annotation (Line(
    points={{-80,-10},{-54,-10}},
    color={0,127,255},
    smooth=Smooth.None));
  connect(collector.port_b, bou.ports[1]) annotation (Line(
    points={{-34,-10},{-20,-10}},
    color={0,127,255},
    smooth=Smooth.None));
  connect(collector.heatPortCon, prescribedTemperature.port) annotation (
     Line(
      points={{-39,-1},{-39,33},{-38,33}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(collector.angleDegAzi, radiation.angleDegAzi) annotation (
      Line(
      points={{-45,-19},{-45,-20},{-74,-20},{-74,50},{-67.6,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector.angleDegTil, radiation.angleDegTil) annotation (
      Line(
      points={{-43,-19},{-43,-20},{-74,-20},{-74,54},{-67.6,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(prescribedTemperature.T, from_degC.y) annotation (Line(
      points={{-27,33},{-24.5,33},{-24.5,38},{-22.4,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weatherData.y[3], from_degC.u) annotation (Line(
      points={{-93.1,67.7714},{-8,67.7714},{-8,38},{-13.2,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(radiation.IrrDifHor, weatherData.y[2]) annotation (Line(
      points={{-67.6,58},{-82,58},{-82,67.5429},{-93.1,67.5429}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(weatherData.y[1], radiation.IrrDirHor) annotation (Line(
      points={{-93.1,67.3143},{-76,67.3143},{-76,62},{-67.6,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(radiation.radiationPort, collector.radiationPort) annotation (
      Line(
      points={{-52,55.8},{-50,55.8},{-50,54},{-44,54},{-44,-1},{-45,-1}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));

  connect(radiation.latitudeDeg, weatherData.latitudeDeg) annotation (Line(
        points={{-63.8,63.6},{-63.8,75.2},{-93.1,75.2}}, color={0,0,127}));
  connect(weatherData.longitudeDeg, radiation.longitudeDeg) annotation (Line(
        points={{-93.1,73.6},{-60,73.6},{-60,63.6}}, color={0,0,127}));
  connect(weatherData.longitudeDeg0, radiation.longitudeDeg0) annotation (Line(
        points={{-93.1,72},{-72,72},{-56,72},{-56,63.6}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{0,80}}), graphics={
    Text(extent={{-94,-26},{-4,-46}},lineColor={0,0,255},textString="Solar thermal collector under real weather data")}),
    experiment(StartTime=10368000, StopTime=10713600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/SolarThermal/Examples/SingleCollectorTest.mos" "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.SolarThermal.ThermalCollector\">
BuildingSystems.Technologies.SolarThermal.ThermalCollector</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
April 10, 2015, by Carles Ribas Tugores:<br/>
</li>
</ul>
</html>"));
end SingleCollectorTest;
