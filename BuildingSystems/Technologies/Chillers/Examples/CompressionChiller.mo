within BuildingSystems.Technologies.Chillers.Examples;
model CompressionChiller
  "Example of a compression chiller"
  extends Modelica.Icons.Example;
  package Medium = BuildingSystems.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 10.0
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.MassFlowRate m_flow = 10.0;
  BuildingSystems.Fluid.Sources.Boundary_pT bou_con(
    redeclare package Medium = Medium,
    nPorts=1,
    p=99999,
    T=293.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={60,20})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T m_flow_con(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=m_flow,
    use_T_in=true)
    annotation (Placement(transformation(extent={{-68,10},{-48,30}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemConIn(
    redeclare package Medium = Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-38,-4},{-18,16}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemConOut(
    redeclare package Medium = Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{18,-4},{38,16}})));
  BuildingSystems.Technologies.Chillers.CompressionChiller chiller(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    m1_flow_nominal = m_flow_nominal,
    m2_flow_nominal = m_flow_nominal,
    dp1_nominal = 1000.0,
    dp2_nominal = 1000.0,
    redeclare BuildingSystems.Technologies.Chillers.Data.CompressionChillers.TurboCoreTT300 chillerData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T m_flow_eva(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=m_flow,
    use_T_in=true)
    annotation (Placement(transformation(extent={{70,-34},{50,-14}})));
  BuildingSystems.Fluid.Sources.Boundary_pT bou_eva(
    redeclare package Medium = Medium,
    nPorts=1,
    p=99999,
    T=293.15)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={-60,-24})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemEvaIn(
    redeclare package Medium = Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{38,-34},{18,-14}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemEvaOut(
    redeclare package Medium = Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-18,-34},{-38,-14}})));
  Modelica.Blocks.Sources.Constant const1(k=273 + 30)
    annotation (Placement(transformation(extent={{-92,18},{-80,30}})));
  Modelica.Blocks.Sources.Constant const2(k=273 + 20)
    annotation (Placement(transformation(extent={{96,-26},{84,-14}})));
  Modelica.Blocks.Sources.BooleanConstant booleanConstant
    annotation (Placement(transformation(extent={{-26,24},{-14,36}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.6,
    duration=3600,
    offset=0.4,
    startTime=0)
    annotation (Placement(transformation(extent={{-26,46},{-16,56}})));
equation
  connect(senTemConIn.port_a, m_flow_con.ports[1]) annotation (Line(
      points={{-38,6},{-42,6},{-42,20},{-48,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemConIn.port_b, chiller.port_a1) annotation (Line(
      points={{-18,6},{-10,6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(chiller.port_b1, senTemConOut.port_a) annotation (Line(
      points={{10,6},{18,6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemConOut.port_b, bou_con.ports[1]) annotation (Line(
      points={{38,6},{42,6},{42,20},{50,20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(m_flow_eva.ports[1], senTemEvaIn.port_a) annotation (Line(
      points={{50,-24},{38,-24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemEvaIn.port_b, chiller.port_a2) annotation (Line(
      points={{18,-24},{10,-24},{10,-6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou_eva.ports[1], senTemEvaOut.port_b) annotation (Line(
      points={{-50,-24},{-38,-24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(chiller.port_b2, senTemEvaOut.port_a) annotation (Line(
      points={{-10,-6},{-10,-24},{-18,-24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, m_flow_con.T_in) annotation (Line(
      points={{-79.4,24},{-70,24}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(const2.y, m_flow_eva.T_in) annotation (Line(
      points={{83.4,-20},{72,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(booleanConstant.y, chiller.on) annotation (Line(
      points={{-13.4,30},{-4,30},{-4,7.6}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(ramp.y, chiller.load) annotation (Line(
      points={{-15.5,51},{0,51},{0,7.6}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (
  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},{100,60}}),
    graphics={Text(extent={{-72,-32},{56,-74}},lineColor={0,0,255},textString="Test of the compression chiller model")}),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/Chillers/Examples/CompressionChiller.mos" "Simulate and plot"),
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
end CompressionChiller;
