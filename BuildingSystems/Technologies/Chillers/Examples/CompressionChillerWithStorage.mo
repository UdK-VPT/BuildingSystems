within BuildingSystems.Technologies.Chillers.Examples;
model CompressionChillerWithStorage
  "Example of a compression chiller with cold water storage"
  extends Modelica.Icons.Example;
  package Medium = BuildingSystems.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 1.0
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.MassFlowRate m_flow = 1.0;
  BuildingSystems.Fluid.Sources.Boundary_pT bou_con(
    redeclare package Medium = Medium,
    nPorts=1,
    p=99999,
    T=293.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={60,30})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T m_flow_con(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=m_flow,
    use_T_in=true)
    annotation (Placement(transformation(extent={{-68,20},{-48,40}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemConIn(
    redeclare package Medium = Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-38,6},{-18,26}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemConOut(
    redeclare package Medium = Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{18,6},{38,26}})));
  BuildingSystems.Technologies.Chillers.CompressionChiller chiller(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    m1_flow_nominal = m_flow_nominal,
    m2_flow_nominal = m_flow_nominal,
    dp1_nominal = 1000.0,
    dp2_nominal = 1000.0,
    redeclare BuildingSystems.Technologies.Chillers.Data.CompressionChillers.StandardChiller2000W chillerData)
    annotation (Placement(transformation(extent={{-10,0},{10,20}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemEvaIn(
    redeclare package Medium = Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{38,-24},{18,-4}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemEvaOut(
    redeclare package Medium = Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-18,-24},{-38,-4}})));
  Modelica.Blocks.Sources.Constant const1(k=273 + 30)
    annotation (Placement(transformation(extent={{-92,28},{-80,40}})));
  ThermalStorages.FluidStorage storage(
    redeclare package Medium = Medium,
    height=1.5,
    HX_2=false,
    HX_1=false,
    redeclare BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1 HeatBuoyancy,
    nEle=4,
    PerfectlyIsolated=false,
    V=1.0,
    T_start=293.15)
    annotation (Placement(transformation(extent={{56,-56},{76,-36}})));
  Fluid.Movers.FlowControlled_m_flow pump(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-38,-64},{-18,-44}})));
  Modelica.Blocks.Logical.Hysteresis controller(
    uLow=273.15 + 2.0,
    uHigh=273.15 + 4.0,
    pre_y_start=true)
    annotation (Placement(transformation(extent={{10,34},{2,42}})));
  Modelica.Blocks.Sources.Constant const2(k=0.5)
    annotation (Placement(transformation(extent={{10,24},{4,30}})));
  Modelica.Blocks.Sources.Constant const3(k=m_flow)
    annotation (Placement(transformation(extent={{-16,-38},{-22,-32}})));
  Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium,
    V_start=0.1) "Expansion vessel model"
    annotation (Placement(transformation(extent={{-12,-50},{0,-38}})));
equation
  connect(senTemConIn.port_a, m_flow_con.ports[1]) annotation (Line(
      points={{-38,16},{-42,16},{-42,30},{-48,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemConIn.port_b, chiller.port_a1) annotation (Line(
      points={{-18,16},{-10,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(chiller.port_b1, senTemConOut.port_a) annotation (Line(
      points={{10,16},{18,16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemConOut.port_b, bou_con.ports[1]) annotation (Line(
      points={{38,16},{42,16},{42,30},{50,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemEvaIn.port_b, chiller.port_a2) annotation (Line(
      points={{18,-14},{10,-14},{10,4}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(chiller.port_b2, senTemEvaOut.port_a) annotation (Line(
      points={{-10,4},{-10,-14},{-18,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, m_flow_con.T_in) annotation (Line(
      points={{-79.4,34},{-70,34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(senTemEvaOut.port_b, pump.port_a) annotation (Line(
      points={{-38,-14},{-60,-14},{-60,-54},{-38,-54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump.port_b, storage.port_a1) annotation (Line(
      points={{-18,-54},{-10,-54},{-10,-55},{59,-55}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_b1, senTemEvaIn.port_a) annotation (Line(
      points={{59,-37},{59,-14},{38,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(chiller.on, controller.y) annotation (Line(
      points={{-4,17.6},{-4,38},{1.6,38}},
      color={255,0,255},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(controller.u, storage.T[3]) annotation (Line(
      points={{10.8,38},{14,38},{14,-39.75},{58.6,-39.75}},
      color={0,0,127},
      smooth=Smooth.None,
      pattern=LinePattern.Dot));
  connect(const2.y, chiller.load) annotation (Line(
      points={{3.7,27},{0,27},{0,17.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const3.y, pump.m_flow_in) annotation (Line(
      points={{-22.3,-35},{-28.2,-35},{-28.2,-42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(exp.port_a, pump.port_b) annotation (Line(
      points={{-6,-50},{-6,-54},{-18,-54}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (
  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,60}}),
    graphics={Text(extent={{-62,-66},{66,-108}},lineColor={0,0,255},
    textString="Test of the compression chiller model
    which loads a cold water storage")}),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/Chillers/Examples/CompressionChillerWithStorage.mos" "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.Chillers.CompressionChiller\">
BuildingSystems.Technologies.Chillers.CompressionChiller</a>.
</p>
</html>", revisions="<html>
<ul>
  <li>
June 20, 2015, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"),
experiment(StartTime=0.0, StopTime=7200));
end CompressionChillerWithStorage;
