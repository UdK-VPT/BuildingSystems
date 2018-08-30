within BuildingSystems.Technologies.SolarThermal.Examples;
model SingleCollectorTest
"Test of the single collector model"
  extends Modelica.Icons.Example;
  package Medium = BuildingSystems.Media.Antifreeze.PropyleneGlycolWater(
    X_a=0.40,
    property_T=293.15);
  BuildingSystems.Climate.WeatherData.WeatherDataReader weatherData(
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataDWD.Germany_Potsdam2013_NetCDF)
    "time Gdot_beam Gdot_diffuse T_air_env"
    annotation (Placement(transformation(extent={{-96,62},{-82,76}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    rhoAmb=0.2)
    annotation (Placement(transformation(extent={{-70,30},{-50,50}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-26,16},{-36,26}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T bou1(
    nPorts=1,
    m_flow=0.01,
    redeclare package Medium = Medium,
    T=283.15) annotation (Placement(transformation(extent={{-98,-18},{-78,2}})));
  BuildingSystems.Fluid.Sources.FixedBoundary bou2(
    redeclare package Medium = Medium,
    nPorts=1)
    annotation (Placement(transformation(extent={{-2,-18},{-22,2}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal = 2.0,
    angleDegAzi = 0.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.ComercialsCollectors.FlatPlate.AgenaAZUR8plus_AC28H collectorData,
    angleDegTil = 30.0)
    annotation (Placement(transformation(extent={{-54,-18},{-34,2}})));
equation
  connect(bou1.ports[1], collector.port_a) annotation (Line(
      points={{-78,-8},{-54,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(collector.port_b, bou2.ports[1]) annotation (Line(
      points={{-34,-8},{-22,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(collector.heatPortCon, prescribedTemperature.port) annotation (
     Line(
      points={{-39,1},{-39,21},{-36,21}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(collector.angleDegAzi, radiation.angleDegAzi) annotation (
      Line(
      points={{-51,-17},{-51,-20},{-74,-20},{-74,34},{-67.6,34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector.angleDegTil, radiation.angleDegTil) annotation (
      Line(
      points={{-49,-17},{-49,-20},{-74,-20},{-74,38},{-67.6,38}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(radiation.radiationPort, collector.radiationPort) annotation (
      Line(
      points={{-52,39.8},{-50,39.8},{-50,40},{-44,40},{-44,1},{-45,1}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));

  connect(radiation.latitudeDeg, weatherData.latitudeDeg) annotation (Line(
        points={{-63.8,47.6},{-63.8,75.3},{-81.3,75.3}}, color={0,0,127}));
  connect(weatherData.longitudeDeg, radiation.longitudeDeg) annotation (Line(
        points={{-81.3,73.9},{-60,73.9},{-60,47.6}}, color={0,0,127}));
  connect(weatherData.longitudeDeg0, radiation.longitudeDeg0) annotation (Line(
        points={{-81.3,72.5},{-56,72.5},{-56,47.6}},      color={0,0,127}));
  connect(weatherData.TAirRef, prescribedTemperature.T) annotation (Line(points
        ={{-93.9,61.3},{-93.9,52},{-22,52},{-22,21},{-25,21}}, color={0,0,127}));
  connect(weatherData.IrrDirHor, radiation.IrrDirHor) annotation (Line(points={{
          -91.1,61.3},{-91.1,46},{-67.6,46}}, color={0,0,127}));
  connect(weatherData.IrrDifHor, radiation.IrrDifHor) annotation (Line(points={{
          -89.7,61.3},{-89.7,42},{-67.6,42}}, color={0,0,127}));

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
August 18, 2018, by Christoph Nytsch-Geusen:<br/>
Adapted to medium BuildingSystems.Media.Anntifreeze.PropyleneGlycolWater.
</li>
<li>
June 14, 2018, by Christoph Nytsch-Geusen:<br/>
Adaptation to the new interfaces of the weather data reader.
</li>
<li>
April 10, 2015, by Carles Ribas Tugores:<br/>
</li>
</ul>
</html>"));
end SingleCollectorTest;
