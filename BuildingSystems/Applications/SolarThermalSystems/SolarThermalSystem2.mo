within BuildingSystems.Applications.SolarThermalSystems;
model SolarThermalSystem2
  "Example of a  solar thermal system with an external heat exchanger"
  extends Modelica.Icons.Example;
  replaceable package Medium = BuildingSystems.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal= 0.01;
  Climate.WeatherData.WeatherDataNetcdf weatherData(
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Egypt_ElGouna weatherDataFile)
    "time IrrDir IrrDif TAirAmb"
    annotation (Placement(transformation(extent={{-126,62},{-110,78}})));
  Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    latitudeDeg = weatherData.latitudeDeg,
    longitudeDeg = weatherData.longitudeDeg,
    longitudeDeg0 = weatherData.longitudeDeg0,
    rhoAmb=0.2,
    angleDegL=0.0)
    annotation (Placement(transformation(extent={{-100,60},{-80,80}})));
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation (Placement(transformation(extent={{-100,82},{-92,90}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature
    annotation (Placement(transformation(extent={{-88,82},{-80,90}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump1(
    redeclare package Medium = Medium,
    m_flow=0.01,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-40,-70},{-60,-50}})));
  Technologies.SolarThermal.ThermalCollector collector(
    redeclare package Medium = Medium,
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
  Fluid.FixedResistances.Pipe pipe1(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5) "Pipe outside of the building"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-80,10})));
  Fluid.FixedResistances.Pipe pipe2(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5) "Pipe outside of the building"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-20,10})));
  Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium,
    V_start=0.01) "Expansion vessel"
    annotation (Placement(transformation(extent={{-40,-56},{-32,-48}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TAmb(
    T=293.15)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=-90,origin={-70,-40})));
  Technologies.ThermalStorages.FluidStorage storage(
    redeclare
      BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1
                                                                                                HeatBuoyancy,
    redeclare package Medium = Medium,
    height=2.0,
    nEle=10,
    HX_2=false,
    V=0.4,
    HX_1=false)
    annotation (Placement(transformation(extent={{52,-60},{32,-40}})));
  Fluid.FixedResistances.Pipe pipe3(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5) "Pipe inside of the building"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=90,origin={-80,-18})));
  Fluid.FixedResistances.Pipe pipe4(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=5) "Pipe inside of the building"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=270,origin={-20,-18})));
    Modelica.Blocks.Sources.Constant consumptionProfile(
    k=120.0/24.0/3600.0) "Mean hot water demand: 120 liter per day"
    annotation (Placement(transformation(extent={{74,-62},{68,-56}})));
BuildingSystems.Fluid.Sources.MassFlowSource_T consumption(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow = 0.0,
    use_m_flow_in = true,
    T=288.15) "Flow source"
    annotation (Placement(transformation(extent={{64,-68},{54,-58}})));
  Fluid.Sources.Boundary_pT sink(
    redeclare package Medium = Medium,
    use_T_in=false,
    p(displayUnit="Pa"),
    T=293.15,
    nPorts=1) "Sink"
    annotation (Placement(transformation(extent={{3,-3},{-3,3}},origin={97,-19})));
  Modelica.Blocks.Logical.Hysteresis control(
    pre_y_start=false,
    uLow=2.0,
    uHigh=4.0) "Two-point controller"
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-50,-28})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(
    realTrue=0.1)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-50,-40})));
  Modelica.Blocks.Math.Add add(
    k1=-1,
    k2=+1)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=-90,origin={-50,-12})));
  Fluid.HeatExchangers.HeaterCooler_T hea(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal=1) "Ideal heater for back up energy"
    annotation (Placement(transformation(extent={{68,-28},{88,-10}})));
  Modelica.Blocks.Sources.Constant TSet(
     k=273.15 + 60.0) "Set temperature for hoit water production"
    annotation (Placement(transformation(extent={{56,-16},{62,-10}})));
  Fluid.HeatExchangers.ConstantEffectiveness hex(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    m1_flow_nominal=m_flow_nominal,
    m2_flow_nominal=m_flow_nominal,
    dp1_nominal=1.0,
    dp2_nominal=1.0,
    eps=0.9) "External heat exchanger"
    annotation (Placement(transformation(extent={{-20,-64},{0,-44}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump2(
    redeclare package Medium = Medium,
    m_flow=0.01,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{28,-70},{8,-50}})));
equation
  connect(weatherData.y[1], radiation.IrrDirHor)
    annotation (Line(points={{-109.2,69.3143},{-104,69.3143},{-104,76},{-97.6,
          76}},                                                                    color={0,0,127}));
  connect(weatherData.y[2], radiation.IrrDifHor)
    annotation (Line(points={{-109.2,69.5429},{-104,69.5429},{-104,72},{-97.6,
          72}},                                                                      color={0,0,127}));
  connect(collector.angleDegAzi, radiation.angleDegAzi)
    annotation (Line(points={{-57,31},{-57,30},{-102,30},{-102,64},{-97.6,64}},color={0,0,127}));
  connect(collector.angleDegTil, radiation.angleDegTil)
    annotation (Line(points={{-55,31},{-55,28},{-104,28},{-104,68},{-97.6,68}}, color={0,0,127}));
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
  connect(from_degC.y, prescribedTemperature.T)
    annotation (Line(points={{-91.6,86},{-88.8,86}}, color={0,0,127}));
  connect(weatherData.y[3], from_degC.u)
    annotation (Line(points={{-109.2,69.7714},{-104,69.7714},{-104,86},{-100.8,86}}, color={0,0,127}));
  connect(prescribedTemperature.port, collector.heatPortCon)
    annotation (Line(points={{-80,86},{-64,86},{-45,86},{-45,49}}, color={191,0,0}));
  connect(radiation.radiationPort, collector.radiationPort)
    annotation (Line(points={{-82,69.8},{-66,69.8},{-66,70},{-51,70},{-51,49}},color={0,0,0},pattern=LinePattern.Solid));
  connect(prescribedTemperature.port, pipe2.heatPort)
    annotation (Line(points={{-80,86},{-44,86},{-6,86},{-6,10},{-15,10}},color={191,0,0}));
  connect(prescribedTemperature.port, pipe1.heatPort)
    annotation (Line(points={{-80,86},{-78,86},{-78,88},{-78,96},{-134,96},{-134,10},{-85,10}},color={191,0,0}));
  connect(pipe3.port_a, pump1.port_b)
    annotation (Line(points={{-80,-28},{-80,-60},{-60,-60}}, color={0,127,255}));
  connect(exp.port_a, pump1.port_a)
    annotation (Line(points={{-36,-56},{-36,-56},{-36,-60},{-40,-60}}, color={0,127,255}));
  connect(storage.port_a1, consumption.ports[1])
    annotation (Line(points={{49,-59},{48,-59},{48,-63},{54,-63}},color={0,127,255}));
  connect(consumption.m_flow_in, consumptionProfile.y)
    annotation (Line(points={{64,-59},{67.7,-59}}, color={0,0,127}));
  connect(pump1.m_flow_in, booleanToReal.y)
    annotation (Line(points={{-49.8,-48},{-50,-48},{-50,-44.4}}, color={0,0,127}));
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
    annotation (Line(points={{62.3,-13},{62.15,-13},{62.15,-13.6},{66,-13.6}}, color={0,0,127}));
  connect(hex.port_a1, pipe4.port_b)
    annotation (Line(points={{-20,-48},{-20,-38},{-20,-28}}, color={0,127,255}));
  connect(pump1.port_a, hex.port_b2)
    annotation (Line(points={{-40,-60},{-30,-60},{-20,-60}}, color={0,127,255}));
  connect(pump2.port_a, storage.port_b2)
    annotation (Line(points={{28,-60},{35,-60},{35,-59}}, color={0,127,255}));
  connect(hex.port_a2,pump2. port_b)
    annotation (Line(points={{0,-60},{4,-60},{8,-60}}, color={0,127,255}));
  connect(hex.port_b1, storage.port_a2)
    annotation (Line(points={{0,-48},{0,-41},{35,-41}}, color={0,127,255}));
  connect(booleanToReal.y,pump2. m_flow_in)
    annotation (Line(points={{-50,-44.4},{-38,-44.4},{-38,-44},{-26,-44},{-26,-36},{18.2,-36},{18.2,-48}},color={0,0,127},pattern=LinePattern.Dash));

  annotation (experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/SolarThermalSystems/SolarThermalSystem2.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-140,-100},{100,100}}),
    graphics={Text(extent={{-134,-72},{56,-104}},lineColor={0,0,255},
    textString="Example of a  solar thermal system with an external heat exchanger")}));
end SolarThermalSystem2;
