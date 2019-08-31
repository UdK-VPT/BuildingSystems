within BuildingSystems.Technologies.SolarThermal.Examples;
model BigCollectorInstallationWithStorage
  "Six solar thermal collectors connected to a thermal fluid storage via an external heat exchanger"
  extends Modelica.Icons.Example;
  package Medium2 = BuildingSystems.Media.Water;
  package Medium1 = BuildingSystems.Media.Antifreeze.PropyleneGlycolWater(
    X_a=0.40,
    property_T=293.15);

  BuildingSystems.Climate.WeatherData.WeatherDataReader weatherData(
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.Germany_Berlin_Meteonorm_ASCII)
    "time Gdot_beam Gdot_diffuse T_air_env"
    annotation (Placement(transformation(extent={{24,52},{8,68}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation2(
    rhoAmb=0.2)
    annotation (Placement(transformation(extent={{-108,18},{-88,38}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{4,4},{-6,14}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector3(
    redeclare package Medium = Medium1,
    m_flow_nominal = 1.0,
    dp_nominal = 2.0,
    angleDegAzi = 0.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData(A=3.17),
    angleDegTil = 30.0)
    annotation (Placement(transformation(extent={{-86,-24},{-66,-4}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump1(
    redeclare package Medium = Medium1,
    m_flow_nominal = 5.0,
    riseTime(displayUnit="min") = 60-0)
    annotation (Placement(transformation(extent={{24,-24},{44,-4}})));
  BuildingSystems.Controls.Continuous.LimPID conPID(
    yMin = 0.01,
    controllerType = Modelica.Blocks.Types.SimpleController.PI,
    reverseAction = true,
    k = 20.0,
    Ti = 5.0,
    yMax = 4.0)
    annotation (Placement(transformation(extent={{72,40},{52,60}})));
  Modelica.Blocks.Sources.RealExpression T_set(y=273.15 + 80.0)
    annotation (Placement(transformation(extent={{100,40},{80,60}})));
  BuildingSystems.Fluid.Sensors.Temperature senTem1(
    redeclare package Medium = Medium1)
    annotation (Placement(transformation(extent={{100,0},{80,20}})));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    redeclare package Medium = Medium2,
    redeclare package Medium_HX_1 = Medium2,
    redeclare package Medium_HX_2 = Medium2,
    redeclare BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1 HeatBuoyancy,
    HX_2 = false,
    PerfectlyIsolated = true,
    HX_1 = false,
    height = 2,
    nEle = 6,
    V(displayUnit= "l"),
    T_start=323.15)
    annotation (Placement(transformation(extent={{12,-222},{-28,-182}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T consumption(
    redeclare package Medium = Medium2,
    m_flow = 0,
    nPorts = 1,
    use_m_flow_in = true,
    T = 283.15)
    annotation (Placement(transformation(extent={{40,-230},{20,-210}})));
  BuildingSystems.Fluid.Sources.Boundary_pT sink(
    redeclare package Medium = Medium2,
    nPorts = 1)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},origin={90,-184})));
  Modelica.Blocks.Sources.Pulse consumptionProfile(
    amplitude=0.3,
    width=10,
    period=21600) "Mass flow rate"
    annotation (Placement(transformation(extent={{80,-222},{60,-202}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector1(
    redeclare package Medium = Medium1,
    m_flow_nominal = 1.0,
    dp_nominal = 2.0,
    angleDegAzi = 0.0,
    angleDegTil = 30.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData(A=3.17))
    annotation (Placement(transformation(extent={{-56,-24},{-36,-4}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector2(
    redeclare package Medium = Medium1,
    m_flow_nominal = 1.0,
    dp_nominal = 2.0,
    angleDegAzi = 0.0,
    angleDegTil = 30.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData(A=3.17))
    annotation (Placement(transformation(extent={{-26,-24},{-6,-4}})));
  BuildingSystems.Fluid.HeatExchangers.ConstantEffectiveness HX(
    redeclare package Medium1 = Medium1,
    redeclare package Medium2 = Medium2,
    m1_flow_nominal=2,
    m2_flow_nominal=2,
    dp1_nominal=1,
    dp2_nominal=1,
    show_T=true,
    allowFlowReversal1=false,
    allowFlowReversal2=false,
    eps=0.9)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={-88,-192})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump2(
    redeclare package Medium = Medium2,
    m_flow_nominal=5)
    annotation (Placement(transformation(extent={{-60,-194},{-40,-174}})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium1,
    V_start = 0.01,
    p_start=300000)
    annotation (Placement(transformation(extent={{-120,-140},{-100,-120}})));
  Modelica.Blocks.Sources.BooleanExpression booleanControl2(y=conPID.y > 0.1)
    annotation (Placement(transformation(extent={{78,-160},{40,-142}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{2,-162},{-20,-140}})));
  Modelica.Blocks.Sources.RealExpression systemOff(y=0)
    annotation (Placement(transformation(extent={{60,-178},{22,-160}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollectorInSeries collectorInSeries(
    redeclare package Medium = Medium1,
    nCol=3,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData(A=3.17),
    angleDegAzi = 0.0,
    angleDegTil = 30.0,
    m_flow_nominal = 1-0,
    dp_nominal(displayUnit="Pa") = 6,
    show_T=true)
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature1
    annotation (Placement(transformation(extent={{2,-42},{-8,-32}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation1(
    rhoAmb=0.2)
    annotation (Placement(transformation(extent={{-124,-10},{-104,10}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollectorInParallel collectorInParallel(
    redeclare package Medium = Medium1,
    m_flow_nominal=1,
    nCol=3,
    nArr=2,
    dp_nominal(displayUnit="Pa") = 6,
    angleDegAzi = 0.0,
    angleDegTil = 30.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData(A=3.17),
    show_T=true)
    annotation (Placement(transformation(extent={{-48,-110},{-28,-90}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{98,-68},{76,-46}})));
  Modelica.Blocks.Sources.RealExpression systemOff1(
    y=0)
    annotation (Placement(transformation(extent={{160,-96},{120,-78}})));
  Modelica.Blocks.Sources.BooleanExpression booleanControl1(
    y=radiation1.radiationPort.IrrDir > 100)
    annotation (Placement(transformation(extent={{160,-66},{120,-48}})));
equation
  connect(conPID.u_s, T_set.y) annotation (Line(
      points={{74,50},{79,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump1.port_b, senTem1.port) annotation (Line(
      points={{44,-14},{90,-14},{90,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTem1.T, conPID.u_m) annotation (Line(
      points={{83,10},{62,10},{62,38}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(consumption.ports[1], storage.port_a1) annotation (Line(
      points={{20,-220},{6,-220}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_b1, sink.ports[1]) annotation (Line(
      points={{6,-184},{80,-184}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(consumption.m_flow_in, consumptionProfile.y) annotation (Line(
      points={{42,-212},{59,-212}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector3.port_b, collector1.port_a) annotation (Line(
      points={{-66,-14},{-56,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(collector1.port_b, collector2.port_a) annotation (Line(
      points={{-36,-14},{-26,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(collector2.port_b, pump1.port_a) annotation (Line(
      points={{-6,-14},{24,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(HX.port_b2, pump2.port_a) annotation (Line(
      points={{-82,-182},{-72,-182},{-72,-184},{-60,-184}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump2.port_b, storage.port_a2) annotation (Line(
      points={{-40,-184},{-22,-184}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(HX.port_a2, storage.port_b2) annotation (Line(
      points={{-82,-202},{-82,-220},{-22,-220}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump1.port_b, HX.port_a1) annotation (Line(
      points={{44,-14},{56,-14},{56,-132},{-94,-132},{-94,-182}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(HX.port_b1, collector3.port_a) annotation (Line(
      points={{-94,-202},{-130,-202},{-130,-14},{-86,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(exp.port_a, HX.port_a1) annotation (Line(
      points={{-110,-140},{-110,-152},{-94,-152},{-94,-182}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(switch2.u2, booleanControl2.y) annotation (Line(
      points={{4.2,-151},{38.1,-151}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(switch2.u1, conPID.y) annotation (Line(
      points={{4.2,-142.2},{10,-142.2},{10,-142},{48,-142},{48,50},{51,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch2.u3, systemOff.y) annotation (Line(
      points={{4.2,-159.8},{20.1,-159.8},{20.1,-169}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump2.m_flow_in, switch2.y) annotation (Line(
      points={{-50,-172},{-50,-172},{-50,-150},{-21.1,-150},{-21.1,-151}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(HX.port_b1, collectorInSeries.port_a) annotation (Line(
      points={{-94,-202},{-130,-202},{-130,-50},{-60,-50}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(collectorInSeries.port_b, pump1.port_a) annotation (Line(
      points={{-40,-50},{24,-50},{24,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(radiation1.radiationPort, collectorInSeries.radiationPort)
    annotation (Line(
      points={{-106,-0.2},{-106,-42},{-53,-42}},
      color={0,0,0},
      pattern=LinePattern.None,
      smooth=Smooth.None));
  connect(HX.port_b1, collectorInParallel.port_a) annotation (Line(
      points={{-94,-202},{-130,-202},{-130,-100},{-48,-100}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(collectorInParallel.port_b, pump1.port_a) annotation (Line(
      points={{-28,-100},{24,-100},{24,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(switch1.u1, conPID.y) annotation (Line(
      points={{100.2,-48.2},{104,-48.2},{104,-48},{108,-48},{108,68},{48,68},{48,
          50},{51,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.u3, systemOff1.y) annotation (Line(
      points={{100.2,-65.8},{100,-65.8},{100,-66},{108,-66},{108,-87},{118,-87}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, pump1.m_flow_in) annotation (Line(
      points={{74.9,-57},{68,-57},{68,2},{34,2},{34,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.u2, booleanControl1.y) annotation (Line(
      points={{100.2,-57},{118,-57}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(collector1.radiationPort, radiation2.radiationPort) annotation (
     Line(
      points={{-47,-5},{-47,27.8},{-90,27.8}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(collectorInSeries.heatPortCon, prescribedTemperature1.port)
    annotation (Line(
      points={{-47,-42},{-46,-42},{-46,-37},{-8,-37}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(collectorInParallel.heatPortCon, prescribedTemperature1.port)
    annotation (Line(
      points={{-35,-91},{-8,-91},{-8,-36},{-10,-36},{-10,-37},{-8,-37}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(radiation1.radiationPort, collectorInParallel.radiationPort)
    annotation (Line(
      points={{-106,-0.2},{-100,-0.2},{-100,-92},{-41,-92},{-41,-91}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
      connect(collector3.angleDegAzi, radiation2.angleDegAzi)
    annotation (Line(
      points={{-83,-23},{-83,-24},{-134,-24},{-134,22},{-105.6,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector3.angleDegTil, radiation2.angleDegTil)
    annotation (Line(
      points={{-81,-23},{-81,-24},{-134,-24},{-134,26},{-105.6,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collectorInParallel.angleDegAzi, radiation1.angleDegAzi)
    annotation (Line(
      points={{-39,-109},{-39,-110},{-126,-110},{-126,-6},{-121.6,-6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collectorInParallel.angleDegTil, radiation1.angleDegTil)
    annotation (Line(
      points={{-37,-109},{-37,-110},{-126,-110},{-126,-2},{-121.6,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(radiation2.latitudeDeg, weatherData.latitudeDeg) annotation (Line(
        points={{-101.8,35.6},{-101.8,67.2},{7.2,67.2}}, color={0,0,127}));
  connect(weatherData.longitudeDeg, radiation2.longitudeDeg) annotation (Line(
        points={{7.2,65.6},{-98,65.6},{-98,35.6}},   color={0,0,127}));
  connect(radiation2.longitudeDeg0, weatherData.longitudeDeg0) annotation (Line(
        points={{-94,35.6},{-94,64},{7.2,64}},          color={0,0,127}));
  connect(radiation1.latitudeDeg, weatherData.latitudeDeg) annotation (Line(
        points={{-117.8,7.6},{-117.8,67.2},{7.2,67.2}},  color={0,0,127}));
  connect(radiation1.longitudeDeg, weatherData.longitudeDeg) annotation (Line(
        points={{-114,7.6},{-114,66},{-8,66},{-8,65.6},{7.2,65.6}},
        color={0,0,127}));
  connect(weatherData.longitudeDeg0, radiation1.longitudeDeg0) annotation (Line(
        points={{7.2,64},{-110,64},{-110,7.6}},
                        color={0,0,127}));
  connect(collector3.radiationPort, radiation2.radiationPort)
    annotation (Line(points={{-77,-5},{-77,27.8},{-90,27.8}}, color={0,0,0}));
  connect(collector2.radiationPort, radiation2.radiationPort)
    annotation (Line(points={{-17,-5},{-17,27.8},{-90,27.8}}, color={0,0,0}));
  connect(prescribedTemperature.port, collector3.heatPortCon) annotation (Line(
        points={{-6,9},{-38,9},{-38,8},{-71,8},{-71,-5}}, color={191,0,0}));
  connect(prescribedTemperature.port, collector1.heatPortCon) annotation (Line(
        points={{-6,9},{-20,9},{-20,10},{-41,10},{-41,-5}}, color={191,0,0}));
  connect(collector2.heatPortCon, prescribedTemperature.port) annotation (Line(
        points={{-11,-5},{-11,8.5},{-6,8.5},{-6,9}}, color={191,0,0}));
  connect(weatherData.TAirRef, prescribedTemperature.T)
    annotation (Line(points={{21.6,51.2},{21.6,9},{5,9}}, color={0,0,127}));
  connect(prescribedTemperature1.T, weatherData.TAirRef) annotation (Line(
        points={{3,-37},{21.6,-37},{21.6,51.2}}, color={0,0,127}));
  connect(weatherData.IrrDirHor, radiation2.IrrDirHor) annotation (Line(points={
          {18.4,51.2},{18.4,42},{-124,42},{-124,34},{-105.6,34}}, color={0,0,127}));
  connect(weatherData.IrrDifHor, radiation2.IrrDifHor) annotation (Line(points={
          {16.8,51.2},{16.8,46},{-124,46},{-124,30},{-105.6,30}}, color={0,0,127}));
  connect(weatherData.IrrDirHor, radiation1.IrrDirHor) annotation (Line(points={
          {18.4,51.2},{18.4,42},{-128,42},{-128,6},{-121.6,6}}, color={0,0,127}));
  connect(weatherData.IrrDifHor, radiation1.IrrDifHor) annotation (Line(points={
          {16.8,51.2},{16.8,44},{-128,44},{-128,2},{-121.6,2}}, color={0,0,127}));

  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-240},{160,80}})),
    experiment(StartTime=10368000, StopTime=10713600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/SolarThermal/Examples/BigCollectorInstallationWithStorage.mos" "Simulate and plot"),
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
end BigCollectorInstallationWithStorage;
