within BuildingSystems.Technologies.SolarThermal.Examples;
model BigCollectorInstallationWithStorage
  "Six solar thermal collectors connected to a thermal fluid storage via an external heat exchanger"
  extends Modelica.Icons.Example;
  replaceable package Medium = BuildingSystems.Media.Water;

  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(
    redeclare Climate.WeatherDataDWD.WeatherDataFile_Germany_Potsdam2013 weatherDataFile)
    "time Gdot_beam Gdot_diffuse T_air_env"
    annotation (Placement(transformation(extent={{26,64},{8,80}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation2(
    rhoAmb=0.2)
    annotation (Placement(transformation(extent={{-112,52},{-92,72}})));
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation (Placement(transformation(extent={{-16,44},{-24,52}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-40,44},{-50,54}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector3(
    redeclare package Medium = Medium,
    m_flow_nominal = 1.0,
    dp_nominal = 2.0,
    angleDegAzi = 0.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData(A=3.17),
    angleDegTil = 30.0)
    annotation (Placement(transformation(extent={{-76,-24},{-56,-4}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump1(
    redeclare package Medium = Medium,
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
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{100,0},{80,20}})));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    redeclare package Medium = Medium,
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
    redeclare package Medium = Medium,
    m_flow = 0,
    nPorts = 1,
    use_m_flow_in = true,
    T = 283.15)
    annotation (Placement(transformation(extent={{40,-230},{20,-210}})));
  BuildingSystems.Fluid.Sources.FixedBoundary sink(
    redeclare package Medium = Medium,
    nPorts = 1)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},origin={90,-184})));
  Modelica.Blocks.Sources.Pulse consumptionProfile(
    amplitude=0.3,
    width=10,
    period=21600) "Mass flow rate"
    annotation (Placement(transformation(extent={{100,-240},{80,-220}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector1(
    redeclare package Medium = Medium,
    m_flow_nominal = 1.0,
    dp_nominal = 2.0,
    angleDegAzi = 0.0,
    angleDegTil = 30.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData(A=3.17))
    annotation (Placement(transformation(extent={{-40,-24},{-20,-4}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector2(
    redeclare package Medium = Medium,
    m_flow_nominal = 1.0,
    dp_nominal = 2.0,
    angleDegAzi = 0.0,
    angleDegTil = 30.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData(A=3.17))
    annotation (Placement(transformation(extent={{-12,-24},{8,-4}})));
  BuildingSystems.Fluid.HeatExchangers.ConstantEffectiveness HX(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
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
    redeclare package Medium = Medium,
    m_flow_nominal=5)
    annotation (Placement(transformation(extent={{-60,-194},{-40,-174}})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium,
    V_start = 1.0,
    p_start=300000)
    annotation (Placement(transformation(extent={{-120,-140},{-100,-120}})));
  Modelica.Blocks.Sources.BooleanExpression booleanControl2(y=conPID.y > 0.1)
    annotation (Placement(transformation(extent={{100,-160},{40,-140}})));
  Modelica.Blocks.Logical.Switch switch2
    annotation (Placement(transformation(extent={{2,-162},{-20,-140}})));
  Modelica.Blocks.Sources.RealExpression systemOff(y=0)
    annotation (Placement(transformation(extent={{60,-178},{20,-160}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollectorInSeries collectorInSeries(
    redeclare package Medium = Medium,
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
    annotation (Placement(transformation(extent={{-120,10},{-100,30}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollectorInParallel collectorInParallel(
    redeclare package Medium = Medium,
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
    annotation (Placement(transformation(extent={{162,-96},{122,-78}})));
  Modelica.Blocks.Sources.BooleanExpression booleanControl1(
    y=radiation1.radiationPort.IrrDir > 100)
    annotation (Placement(transformation(extent={{178,-68},{118,-48}})));
equation
  connect(from_degC.y, prescribedTemperature.T) annotation (Line(
    points={{-24.4,48},{-39,48},{-39,49}},
    color={0,0,127},
    smooth=Smooth.None));
  connect(weatherData.y[3], from_degC.u) annotation (Line(
    points={{7.1,71.7714},{-10,71.7714},{-10,48},{-15.2,48}},
    color={0,0,127},
    smooth=Smooth.None));
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
      points={{40,-212},{60,-212},{60,-230},{79,-230}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector3.port_b, collector1.port_a) annotation (Line(
      points={{-56,-14},{-40,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(collector1.port_b, collector2.port_a) annotation (Line(
      points={{-20,-14},{-12,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(collector2.port_b, pump1.port_a) annotation (Line(
      points={{8,-14},{24,-14}},
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
      points={{-94,-202},{-130,-202},{-130,-14},{-76,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(exp.port_a, HX.port_a1) annotation (Line(
      points={{-110,-140},{-110,-152},{-94,-152},{-94,-182}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(switch2.u2, booleanControl2.y) annotation (Line(
      points={{4.2,-151},{38,-151},{38,-150},{37,-150}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(switch2.u1, conPID.y) annotation (Line(
      points={{4.2,-142.2},{24,-142.2},{24,-142},{51,-142},{51,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch2.u3, systemOff.y) annotation (Line(
      points={{4.2,-159.8},{18,-159.8},{18,-169}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pump2.m_flow_in, switch2.y) annotation (Line(
      points={{-50.2,-172},{-50,-172},{-50,-150},{-21.1,-150},{-21.1,-151}},
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
  connect(prescribedTemperature1.T, prescribedTemperature.T) annotation (Line(
      points={{3,-37},{18,-37},{18,22},{-39,22},{-39,49}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(radiation1.radiationPort, collectorInSeries.radiationPort)
    annotation (Line(
      points={{-102,19.8},{-102,-42},{-53,-42}},
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
      points={{100.2,-48.2},{124,-48.2},{124,64},{44,64},{44,52},{51,52},{51,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.u3, systemOff1.y) annotation (Line(
      points={{100.2,-65.8},{100.2,-87},{120,-87}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.y, pump1.m_flow_in) annotation (Line(
      points={{74.9,-57},{68,-57},{68,0},{38,0},{38,-2},{33.8,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(switch1.u2, booleanControl1.y) annotation (Line(
      points={{100.2,-57},{113.6,-57},{113.6,-58},{115,-58}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(radiation2.IrrDifHor, weatherData.y[2]) annotation (Line(
      points={{-109.6,64},{-116,64},{-116,71.5429},{7.1,71.5429}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weatherData.y[2], radiation1.IrrDifHor) annotation (Line(
      points={{7.1,71.5429},{-48,71.5429},{-48,74},{-120,74},{-120,22},{-117.6,22}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(radiation2.IrrDirHor, weatherData.y[1]) annotation (Line(
      points={{-109.6,68},{-116,68},{-116,71.3143},{7.1,71.3143}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weatherData.y[1], radiation1.IrrDirHor) annotation (Line(
      points={{7.1,71.3143},{-117.6,71.3143},{-117.6,26}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(radiation2.radiationPort, collector3.radiationPort) annotation (
      Line(
      points={{-94,61.8},{-94,-4},{-67,-4},{-67,-5}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(collector1.radiationPort, radiation2.radiationPort) annotation (
     Line(
      points={{-31,-5},{-31,61.8},{-94,61.8}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(collector2.radiationPort, radiation2.radiationPort) annotation (
     Line(
      points={{-3,-5},{-3,61.8},{-94,61.8}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(collector3.heatPortCon, prescribedTemperature.port) annotation (
     Line(
      points={{-61,-5},{-61,49},{-50,49}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(collector2.heatPortCon, prescribedTemperature.port)
    annotation (Line(
      points={{3,-5},{3,32},{-50,32},{-50,49}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(collector1.heatPortCon, prescribedTemperature.port)
    annotation (Line(
      points={{-25,-5},{-25,32},{-50,32},{-50,49}},
      color={191,0,0},
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
      points={{-102,19.8},{-100,19.8},{-100,-92},{-41,-92},{-41,-91}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
      connect(collector3.angleDegAzi, radiation2.angleDegAzi)
    annotation (Line(
      points={{-67,-23},{-67,-24},{-134,-24},{-134,56},{-109.6,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector3.angleDegTil, radiation2.angleDegTil)
    annotation (Line(
      points={{-65,-23},{-65,-24},{-134,-24},{-134,60},{-109.6,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collectorInParallel.angleDegAzi, radiation1.angleDegAzi)
    annotation (Line(
      points={{-39,-109},{-39,-110},{-126,-110},{-126,14},{-117.6,14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collectorInParallel.angleDegTil, radiation1.angleDegTil)
    annotation (Line(
      points={{-37,-109},{-37,-110},{-126,-110},{-126,18},{-117.6,18}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(radiation2.latitudeDeg, weatherData.latitudeDeg) annotation (Line(
        points={{-105.8,69.6},{-105.8,79.2},{7.1,79.2}}, color={0,0,127}));
  connect(weatherData.longitudeDeg, radiation2.longitudeDeg) annotation (Line(
        points={{7.1,77.6},{-102,77.6},{-102,69.6}}, color={0,0,127}));
  connect(radiation2.longitudeDeg0, weatherData.longitudeDeg0) annotation (Line(
        points={{-98,69.6},{-98,74},{7.1,74},{7.1,76}}, color={0,0,127}));
  connect(radiation1.latitudeDeg, weatherData.latitudeDeg) annotation (Line(
        points={{-113.8,27.6},{-113.8,79.2},{7.1,79.2}}, color={0,0,127}));
  connect(radiation1.longitudeDeg, weatherData.longitudeDeg) annotation (Line(
        points={{-110,27.6},{-110,27.6},{-110,86},{-8,86},{-8,77.6},{7.1,77.6}},
        color={0,0,127}));
  connect(weatherData.longitudeDeg0, radiation1.longitudeDeg0) annotation (Line(
        points={{7.1,76},{-24,76},{-24,78},{-86,78},{-86,36},{-86,32},{-106,32},
          {-106,27.6}}, color={0,0,127}));
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
April 10, 2015, by Carles Ribas Tugores:<br/>
</li>
</ul>
</html>"));
end BigCollectorInstallationWithStorage;
