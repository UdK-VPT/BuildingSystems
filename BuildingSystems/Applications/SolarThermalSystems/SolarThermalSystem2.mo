within BuildingSystems.Applications.SolarThermalSystems;
model SolarThermalSystem2
  "Example of a solar thermal system with an external heat exchanger"
  extends Modelica.Icons.Example;
  package Medium2 = BuildingSystems.Media.Water;
  package Medium1 = BuildingSystems.Media.Antifreeze.PropyleneGlycolWater(
    X_a=0.40,
    property_T=293.15);

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal= 0.01;
  BuildingSystems.Climate.WeatherData.WeatherDataReader weatherData(
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.Egypt_ElGouna_Meteonorm_ASCII)
    "time IrrDir IrrDif TAirAmb"
    annotation (Placement(transformation(extent={{-126,80},{-110,96}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    rhoAmb=0.2,
    angleDegL=0.0)
    annotation (Placement(transformation(extent={{-100,46},{-80,66}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-80,72},{-72,80}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump1(
    redeclare package Medium = Medium1,
    m_flow=0.01,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-40,-70},{-60,-50}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector(
    redeclare package Medium = Medium1,
    dp_nominal=2,
    angleDegAzi=0,
    angleDegTil=30.0,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.FlatSolarCollector1 collectorData,
    m_flow_nominal=m_flow_nominal,
    allowFlowReversal=true,
    nEle=10,
    width=2,
    AColData=false,
    height=1)
    annotation (Placement(transformation(extent={{-60,30},{-40,50}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pipe1(
    redeclare package Medium = Medium1,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5)
    "Pipe outside of the building"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-80,10})));
  BuildingSystems.Fluid.FixedResistances.Pipe pipe2(
    redeclare package Medium = Medium1,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5)
    "Pipe outside of the building"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-20,10})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium1,
    V_start=0.01)
    "Expansion vessel"
    annotation (Placement(transformation(extent={{-40,-56},{-32,-48}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TAmb(
    T=293.15)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=-90,origin={-70,-40})));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    redeclare BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1 HeatBuoyancy,
    redeclare package Medium = Medium2,
    redeclare package Medium_HX_1 = Medium2,
    redeclare package Medium_HX_2 = Medium2,
    height=2.0,
    nEle=10,
    HX_2=false,
    V=0.4,
    HX_1=false)
    annotation (Placement(transformation(extent={{52,-60},{32,-40}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pipe3(
    redeclare package Medium = Medium1,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5)
    "Pipe inside of the building"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=90,origin={-80,-18})));
  BuildingSystems.Fluid.FixedResistances.Pipe pipe4(
    redeclare package Medium = Medium1,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5)
    "Pipe inside of the building"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=270,origin={-20,-18})));
    Modelica.Blocks.Sources.Constant consumptionProfile(
    k=120.0/24.0/3600.0)
    "Mean hot water demand: 120 liter per day"
    annotation (Placement(transformation(extent={{74,-62},{68,-56}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T consumption(
    redeclare package Medium = Medium2,
    nPorts=1,
    m_flow = 0.0,
    use_m_flow_in = true,
    T=288.15)
    "Flow source"
    annotation (Placement(transformation(extent={{64,-68},{54,-58}})));
  BuildingSystems.Fluid.Sources.Boundary_pT sink(
    redeclare package Medium = Medium2,
    use_T_in=false,
    p(displayUnit="Pa"),
    T=293.15,
    nPorts=1)
    "Sink"
    annotation (Placement(transformation(extent={{3,-3},{-3,3}},origin={97,-19})));
  Modelica.Blocks.Logical.Hysteresis control(
    pre_y_start=false,
    uLow=2.0,
    uHigh=4.0)
    "Two-point controller"
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-50,-28})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(
    realTrue=0.1)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-50,-40})));
  Modelica.Blocks.Math.Add add(
    k1=-1,
    k2=+1)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=-90,origin={-50,-12})));
  BuildingSystems.Fluid.HeatExchangers.Heater_T hea(
    redeclare package Medium = Medium2,
    m_flow_nominal=1,
    dp_nominal=1)
    "Ideal heater for back up energy"
    annotation (Placement(transformation(extent={{68,-28},{88,-10}})));
  Modelica.Blocks.Sources.Constant TSet(
     k=273.15 + 60.0)
     "Set temperature for hot water production"
    annotation (Placement(transformation(extent={{56,-16},{62,-10}})));
  BuildingSystems.Fluid.HeatExchangers.ConstantEffectiveness hex(
    redeclare package Medium1 = Medium1,
    redeclare package Medium2 = Medium2,
    m1_flow_nominal=m_flow_nominal,
    m2_flow_nominal=m_flow_nominal,
    dp1_nominal=1.0,
    dp2_nominal=1.0,
    eps=0.9)
    "External heat exchanger"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={-14,-48})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump2(
    redeclare package Medium = Medium2,
    m_flow=0.01,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{28,-70},{8,-50}})));
equation
  connect(collector.angleDegAzi, radiation.angleDegAzi)
    annotation (Line(points={{-57,31},{-57,30},{-102,30},{-102,50},{-97.6,50}},color={0,0,127}));
  connect(collector.angleDegTil, radiation.angleDegTil)
    annotation (Line(points={{-55,31},{-55,28},{-104,28},{-104,54},{-97.6,54}}, color={0,0,127}));
  connect(pipe1.port_b, collector.port_a)
    annotation (Line(points={{-80,20},{-80,20},{-80,40},{-60,40}}, color={0,127,255}));
  connect(collector.port_b, pipe2.port_a)
    annotation (Line(points={{-40,40},{-20,40},{-20,20}}, color={0,127,255}));
  connect(pipe3.port_b, pipe1.port_a)
    annotation (Line(points={{-80,-8},{-80,0}}, color={0,127,255}));
  connect(pipe4.port_a, pipe2.port_b)
    annotation (Line(points={{-20,-8},{-20,-8},{-20,0}}, color={0,127,255}));
  connect(TAmb.port, pipe3.heatPort)
    annotation (Line(points={{-70,-36},{-70,-18},{-75,-18}}, color={191,0,0}));
  connect(TAmb.port, pipe4.heatPort)
    annotation (Line(points={{-70,-36},{-70,-18},{-25,-18}}, color={191,0,0}));
  connect(prescribedTemperature.port, collector.heatPortCon)
    annotation (Line(points={{-72,76},{-45,76},{-45,49}},          color={191,0,0}));
  connect(radiation.radiationPort, collector.radiationPort)
    annotation (Line(points={{-82,55.8},{-66,55.8},{-66,56},{-51,56},{-51,49}},color={0,0,0},pattern=LinePattern.Solid));
  connect(prescribedTemperature.port, pipe2.heatPort)
    annotation (Line(points={{-72,76},{-6,76},{-6,10},{-15,10}},         color={191,0,0}));
  connect(pipe3.port_a, pump1.port_b)
    annotation (Line(points={{-80,-28},{-80,-60},{-60,-60}}, color={0,127,255}));
  connect(exp.port_a, pump1.port_a)
    annotation (Line(points={{-36,-56},{-36,-56},{-36,-60},{-40,-60}}, color={0,127,255}));
  connect(storage.port_a1, consumption.ports[1])
    annotation (Line(points={{49,-59},{48,-59},{48,-63},{54,-63}},color={0,127,255}));
  connect(consumption.m_flow_in, consumptionProfile.y)
    annotation (Line(points={{65,-59},{67.7,-59}}, color={0,0,127}));
  connect(pump1.m_flow_in, booleanToReal.y)
    annotation (Line(points={{-50,-48},{-50,-48},{-50,-44.4}},   color={0,0,127}));
  connect(control.y, booleanToReal.u)
    annotation (Line(points={{-50,-32.4},{-50,-35.2}}, color={255,0,255}));
  connect(control.u, add.y)
    annotation (Line(points={{-50,-23.2},{-50,-16.4}}, color={0,0,127}));
  connect(add.u2, collector.TSeg[10])
    annotation (Line(points={{-52.4,-7.2},{-52.4,12.4},{-46.8,12.4},{-46.8,30.1}},color={0,0,127},pattern=LinePattern.Dash));
  connect(add.u1, storage.T[1])
    annotation (Line(points={{-47.6,-7.2},{-47.6,-4},{52,-4},{52,-44},{50,-44},{50,-44.9},{49.4,-44.9}},color={0,0,127},pattern=LinePattern.Dash));
  connect(storage.port_b1, hea.port_a)
    annotation (Line(points={{49,-41},{64,-41},{64,-19},{68,-19}},color={0,127,255}));
  connect(hea.port_b, sink.ports[1])
    annotation (Line(points={{88,-19},{94,-19}},color={0,127,255}));
  connect(TSet.y, hea.TSet)
    annotation (Line(points={{62.3,-13},{62.15,-13},{62.15,-11.8},{66,-11.8}}, color={0,0,127}));
  connect(pump2.port_a, storage.port_b2)
    annotation (Line(points={{28,-60},{35,-60},{35,-59}}, color={0,127,255}));
  connect(booleanToReal.y,pump2. m_flow_in)
    annotation (Line(points={{-50,-44.4},{-38,-44.4},{-38,-44},{-26,-44},{-26,-36},
          {18,-36},{18,-48}},                                                                             color={0,0,127},pattern=LinePattern.Dash));
  connect(hex.port_a1, pipe4.port_b) annotation (Line(points={{-20,-38},{-20,-33},
          {-20,-28}}, color={0,127,255}));
  connect(hex.port_b1, pump1.port_a) annotation (Line(points={{-20,-58},{-20,-60},
          {-40,-60}}, color={0,127,255}));
  connect(hex.port_a2, pump2.port_b)
    annotation (Line(points={{-8,-58},{-8,-60},{8,-60}}, color={0,127,255}));
  connect(hex.port_b2, storage.port_a2) annotation (Line(points={{-8,-38},{28,-38},
          {28,-41},{35,-41}}, color={0,127,255}));
  connect(weatherData.latitudeDeg, radiation.latitudeDeg) annotation (Line(
          points={{-109.2,95.2},{-106,95.2},{-106,80},{-93.8,80},{-93.8,63.6}},
          color={0,0,127}));
  connect(weatherData.longitudeDeg, radiation.longitudeDeg) annotation (Line(
        points={{-109.2,93.6},{-106,93.6},{-106,80},{-90,80},{-90,63.6}}, color=
         {0,0,127}));
  connect(weatherData.longitudeDeg0, radiation.longitudeDeg0) annotation (Line(
        points={{-109.2,92},{-86,92},{-86,63.6}},                     color={0,0,127}));

  connect(pipe1.heatPort, prescribedTemperature.port) annotation (Line(points={{
          -85,10},{-108,10},{-108,68},{-72,68},{-72,76}}, color={191,0,0}));
  connect(weatherData.TAirRef, prescribedTemperature.T) annotation (Line(points
        ={{-123.6,79.2},{-123.6,76},{-80.8,76}}, color={0,0,127}));
  connect(weatherData.IrrDirHor, radiation.IrrDirHor) annotation (Line(points={{
          -120.4,79.2},{-120.4,62},{-97.6,62}}, color={0,0,127}));
  connect(weatherData.IrrDifHor, radiation.IrrDifHor) annotation (Line(points={{
          -118.8,79.2},{-118.8,58},{-97.6,58}}, color={0,0,127}));

  annotation (experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/SolarThermalSystems/SolarThermalSystem2.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{100,100}}),
    graphics={Text(extent={{-134,-72},{56,-104}},lineColor={0,0,255},
    textString="Example of a  solar thermal system with an external heat exchanger")}),
Documentation(info="<html>
<p>
Example that simulates a solar thermal system with an external heat exchanger.
</p>
</html>",
revisions="<html>
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
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SolarThermalSystem2;
