within BuildingSystems.Technologies.SolarThermal.Examples;
model SingleCollectorWithStorageTest
  "Test of the single collector model with a thermal fluid storage"
  extends Modelica.Icons.Example;
  replaceable package Medium = BuildingSystems.Media.Water;

  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(
    redeclare Climate.WeatherDataDWD.WeatherDataFile_Germany_Potsdam2013 weatherDataFile)
    "time Gdot_beam Gdot_diffuse T_air_env"
    annotation (Placement(transformation(extent={{22,72},{4,88}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    latitudeDeg=weatherData.latitudeDeg,
    longitudeDeg=weatherData.longitudeDeg,
    longitudeDeg0=weatherData.longitudeDeg0,
    rhoAmb=0.2)
    annotation (Placement(transformation(extent={{-56,42},{-36,62}})));
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation (Placement(transformation(extent={{-10,34},{-18,42}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-22,6},{-32,16}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal=2,
    angleDegAzi = 0.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData(A=3.17),
    angleDegTil = 30.0)
    annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump(
    redeclare package Medium = Medium,
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
  Modelica.Blocks.Sources.RealExpression T_set(y=273.15 + 60)
    annotation (Placement(transformation(extent={{96,40},{76,60}})));
  BuildingSystems.Fluid.Sensors.Temperature senTem1(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{100,0},{80,20}})));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    redeclare package Medium = Medium,
    redeclare
      BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1
                                                                                                HeatBuoyancy,
    HX_2 = false,
    PerfectlyIsolated = true,
    nEle = 4)
    annotation (Placement(transformation(extent={{10,-130},{-30,-90}})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium,
    V_start = 1.0,
    p_start = 300000)
    annotation (Placement(transformation(extent={{-100,-10},{-80,10}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T consumption(
    redeclare package Medium = Medium,
    m_flow = 0,
    nPorts = 1,
    use_m_flow_in = true,
    T = 283.15)
    annotation (Placement(transformation(extent={{40,-140},{20,-120}})));
  BuildingSystems.Fluid.Sources.FixedBoundary sink(
    redeclare package Medium = Medium,
    nPorts = 1)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},origin={50,-92})));
  Modelica.Blocks.Sources.Pulse  consumptionProfile(
    amplitude=0.3,
    width=10,
    period=21600)
    "Mass flow rate"
    annotation (Placement(transformation(extent={{92,-132},{72,-112}})));
equation
  connect(from_degC.y, prescribedTemperature.T) annotation (Line(
    points={{-18.4,38},{-20,38},{-20,12},{-21,12},{-21,11}},
    color={0,0,127},
    smooth=Smooth.None));
  connect(collector.port_b, pump.port_a) annotation (Line(
      points={{-30,-10},{-10,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(conPID.u_s, T_set.y) annotation (Line(
      points={{62,50},{75,50}},
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
      points={{20,-130},{14,-130},{14,-128},{4,-128}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_HX_1_a, exp.port_a) annotation (Line(
      points={{-24,-118},{-90,-118},{-90,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_b1, sink.ports[1]) annotation (Line(
      points={{4,-92},{40,-92}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump.m_flow_in, conPID.y) annotation (Line(
      points={{-0.2,2},{-0.2,50},{39,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(consumption.m_flow_in, consumptionProfile.y) annotation (Line(
      points={{40,-122},{71,-122}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector.angleDegAzi, radiation.angleDegAzi) annotation (
      Line(
      points={{-41,-19},{-41,-20},{-58,-20},{-58,46},{-53.6,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector.angleDegTil, radiation.angleDegTil) annotation (
      Line(
      points={{-39,-19},{-39,-20},{-58,-20},{-58,50},{-53.6,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(radiation.IrrDifHor, weatherData.y[2]) annotation (Line(
      points={{-53.6,54},{-88,54},{-88,79.5429},{3.1,79.5429}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(radiation.IrrDirHor, weatherData.y[1]) annotation (Line(
      points={{-53.6,58},{-64,58},{-64,60},{-74,60},{-74,79.3143},{3.1,79.3143}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector.radiationPort, radiation.radiationPort) annotation (
      Line(
      points={{-41,-1},{-41,24.5},{-38,24.5},{-38,51.8}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(from_degC.u, weatherData.y[3]) annotation (Line(
      points={{-9.2,38},{-8,38},{-8,79.7714},{3.1,79.7714}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(collector.heatPortCon, prescribedTemperature.port) annotation (
     Line(
      points={{-35,-1},{-35,5.5},{-32,5.5},{-32,11}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(storage.port_HX_1_b, pump.port_b) annotation (Line(
      points={{-24,-122},{-48,-122},{-48,-34},{94,-34},{94,-10},{10,-10}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -140},{100,80}}),                                                                    graphics),
    experiment(StartTime=10368000, StopTime=10713600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/SolarThermal/Examples/SingleCollectorWithStorageTest.mos"
        "Simulate and plot"),
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
end SingleCollectorWithStorageTest;
