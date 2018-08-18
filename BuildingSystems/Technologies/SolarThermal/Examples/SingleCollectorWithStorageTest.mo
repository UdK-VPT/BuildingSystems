within BuildingSystems.Technologies.SolarThermal.Examples;
model SingleCollectorWithStorageTest
  "Test of the single collector model with a thermal fluid storage"
  extends Modelica.Icons.Example;
  package Medium2 = BuildingSystems.Media.Water;
  package Medium1 = BuildingSystems.Media.Antifreeze.PropyleneGlycolWater(
    X_a=0.40,
    property_T=293.15);

  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(
    redeclare Climate.WeatherDataDWD.WeatherDataFile_Germany_Potsdam2013 weatherDataFile)
    "time Gdot_beam Gdot_diffuse T_air_env"
    annotation (Placement(transformation(extent={{-8,58},{-26,76}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    rhoAmb=0.2)
    annotation (Placement(transformation(extent={{-56,28},{-36,48}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-20,0},{-30,10}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector(
    redeclare package Medium = Medium1,
    m_flow_nominal=1,
    dp_nominal=2,
    angleDegAzi = 0.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData(A=3.17),
    angleDegTil = 30.0)
    annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump(
    redeclare package Medium = Medium1,
    m_flow_nominal=5)
    annotation (Placement(transformation(extent={{-10,-20},{10,0}})));
  Controls.Continuous.LimPID conPID(
    yMin = 0.01,
    controllerType = Modelica.Blocks.Types.SimpleController.PI,
    reverseAction = true,
    k = 0.001,
    Ti = 0.001,
    yMax = 1)
    annotation (Placement(transformation(extent={{60,40},{40,60}})));
  Modelica.Blocks.Sources.RealExpression T_set(
    y=273.15 + 60)
    annotation (Placement(transformation(extent={{94,40},{76,60}})));
  BuildingSystems.Fluid.Sensors.Temperature senTem1(
    redeclare package Medium = Medium1)
    annotation (Placement(transformation(extent={{100,0},{80,20}})));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    redeclare package Medium_HX_1 = Medium1,
    redeclare package Medium_HX_2 = Medium2,
    redeclare package Medium = Medium2,
    redeclare BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1 HeatBuoyancy,
    HX_1 = true,
    HX_2 = false,
    PerfectlyIsolated = true,
    nEle = 4)
    annotation (Placement(transformation(extent={{8,-120},{-32,-80}})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium1,
    V_start = 0.01,
    p_start = 300000)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T consumption(
    redeclare package Medium = Medium2,
    m_flow = 0,
    nPorts = 1,
    use_m_flow_in = true,
    T = 283.15)
    annotation (Placement(transformation(extent={{40,-128},{20,-108}})));
  BuildingSystems.Fluid.Sources.FixedBoundary sink(
    redeclare package Medium = Medium2,
    nPorts = 1)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},origin={30,-82})));
  Modelica.Blocks.Sources.Pulse  consumptionProfile(
    amplitude=0.3,
    width=10,
    period=21600)
    "Mass flow rate"
    annotation (Placement(transformation(extent={{80,-120},{60,-100}})));
equation
  connect(collector.port_b, pump.port_a) annotation (Line(
      points={{-30,-10},{-10,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(conPID.u_s, T_set.y) annotation (Line(
      points={{62,50},{75.1,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump.port_b, senTem1.port) annotation (Line(
      points={{10,-10},{90,-10},{90,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTem1.T, conPID.u_m) annotation (Line(
      points={{83,10},{50,10},{50,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(exp.port_a, collector.port_a) annotation (Line(
      points={{-90,-10},{-50,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(consumption.ports[1], storage.port_a1) annotation (Line(
      points={{20,-118},{2,-118}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_HX_1_a, exp.port_a) annotation (Line(
      points={{-26,-108},{-90,-108},{-90,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_b1, sink.ports[1]) annotation (Line(
      points={{2,-82},{20,-82}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump.m_flow_in, conPID.y) annotation (Line(
      points={{0,2},{0,50},{39,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(consumption.m_flow_in, consumptionProfile.y) annotation (Line(
      points={{42,-110},{59,-110}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector.angleDegAzi, radiation.angleDegAzi) annotation (
      Line(
      points={{-47,-19},{-47,-20},{-58,-20},{-58,32},{-53.6,32}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector.angleDegTil, radiation.angleDegTil) annotation (
      Line(
      points={{-45,-19},{-45,-20},{-58,-20},{-58,36},{-53.6,36}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector.radiationPort, radiation.radiationPort) annotation (
      Line(
      points={{-41,-1},{-41,24.5},{-38,24.5},{-38,37.8}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(collector.heatPortCon, prescribedTemperature.port) annotation (
     Line(
      points={{-35,-1},{-35,5.5},{-30,5.5},{-30,5}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(storage.port_HX_1_b, pump.port_b) annotation (Line(
      points={{-26,-112},{-40,-112},{-40,-38},{90,-38},{90,-10},{10,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(weatherData.latitudeDeg, radiation.latitudeDeg) annotation (Line(
        points={{-26.9,75.1},{-49.8,75.1},{-49.8,45.6}},
                                                       color={0,0,127}));
  connect(radiation.longitudeDeg, weatherData.longitudeDeg) annotation (Line(
        points={{-46,45.6},{-46,73.3},{-26.9,73.3}},                   color={0,
          0,127}));
  connect(weatherData.longitudeDeg0, radiation.longitudeDeg0)
    annotation (Line(points={{-26.9,71.5},{-42,71.5},{-42,45.6}},
                                                            color={0,0,127}));
  connect(weatherData.TAirRef, prescribedTemperature.T) annotation (Line(points
        ={{-10.7,57.1},{-10.7,5},{-19,5}}, color={0,0,127}));
  connect(weatherData.IrrDirHor, radiation.IrrDirHor) annotation (Line(points={{
          -14.3,57.1},{-14.3,50},{-56,50},{-56,44},{-53.6,44}}, color={0,0,127}));
  connect(weatherData.IrrDifHor, radiation.IrrDifHor) annotation (Line(points={{
          -16.1,57.1},{-16.1,52},{-58,52},{-58,40},{-53.6,40}}, color={0,0,127}));

  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{100,80}})),
    experiment(StartTime=10368000, StopTime=10713600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/SolarThermal/Examples/SingleCollectorWithStorageTest.mos" "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.SolarThermal.ThermalCollector\">
BuildingSystems.Technologies.SolarThermal.ThermalCollector</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
August 18, 2018, by Christoph Nytsch-Geusen:<br/>
Adapted to medium BuildingSystems.Media.Anntifreeze.PropyleneGlycolWater in the solar thermal collector loop.
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
end SingleCollectorWithStorageTest;
