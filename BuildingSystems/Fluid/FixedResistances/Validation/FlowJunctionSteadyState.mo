within BuildingSystems.Fluid.FixedResistances.Validation;
model FlowJunctionSteadyState
  "Test model for the three way splitter/mixer model configured as steady-state"
  extends Modelica.Icons.Example;

 package Medium = BuildingSystems.Media.Air "Medium model";

  BuildingSystems.Fluid.FixedResistances.Junction spl(
    redeclare package Medium = Medium,
    m_flow_nominal={2,2,2},
    dp_nominal={5,10,15},
    energyDynamics=Modelica.Fluid.Types.Dynamics.SteadyState) "Splitter"
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));

  BuildingSystems.Fluid.Sources.Boundary_pT bou1(
    redeclare package Medium = Medium,
    T=273.15 + 10,
    use_p_in=true,
    nPorts=1)
    "Pressure boundary condition"
     annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

  BuildingSystems.Fluid.Sources.Boundary_pT bou2(
    redeclare package Medium = Medium,
    T=273.15 + 20,
    p(displayUnit="Pa") = 101325,
    nPorts=1)
    "Pressure boundary condition"
    annotation (Placement(transformation(
          extent={{90,-10},{70,10}})));

  BuildingSystems.Fluid.Sources.Boundary_pT bou3(
    redeclare package Medium = Medium,
    T=273.15 + 30,
    use_p_in=true,
    nPorts=1)
    "Pressure boundary condition"
    annotation (Placement(transformation(
          extent={{-60,-70},{-40,-50}})));

  Modelica.Blocks.Sources.Ramp P1(
    offset=101320,
    height=10,
    duration=20,
    startTime=20) "Ramp pressure signal"
    annotation (Placement(transformation(extent={{-90,-2},{-70,18}})));

  Modelica.Blocks.Sources.Ramp P3(
    offset=101320,
    height=10,
    duration=20,
    startTime=70) "Ramp pressure signal"
    annotation (Placement(transformation(extent={{-92,-62},{-72,-42}})));

  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTem1(
    redeclare package Medium = Medium,
    m_flow_nominal=1)
    "Temperature sensor"
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));

  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTem2(
    redeclare package Medium = Medium,
    m_flow_nominal=2)
    "Temperature sensor"
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));

  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTem3(
    redeclare package Medium = Medium,
    m_flow_nominal=3)
    "Temperature sensor"
    annotation (Placement(transformation(extent={{-20,-70},{0,-50}})));
equation
  connect(P1.y, bou1.p_in)
    annotation (Line(points={{-69,8},{-69,8},{-62,8}},
                    color={0,0,127}));
  connect(bou3.p_in, P3.y)
    annotation (Line(points={{-62,-52},{-62,-52},{-71,-52}},
                                                   color={0,0,127}));
  connect(bou3.ports[1], senTem3.port_a) annotation (Line(points={{-40,-60},{-40,
          -60},{-20,-60}}, color={0,127,255}));
  connect(senTem3.port_b, spl.port_3)
    annotation (Line(points={{0,-60},{20,-60},{20,-10}}, color={0,127,255}));
  connect(bou1.ports[1], senTem1.port_a)
    annotation (Line(points={{-40,0},{-30,0},{-20,0}}, color={0,127,255}));
  connect(senTem1.port_b, spl.port_1)
    annotation (Line(points={{0,0},{5,0},{10,0}}, color={0,127,255}));
  connect(spl.port_2, senTem2.port_a)
    annotation (Line(points={{30,0},{35,0},{40,0}}, color={0,127,255}));
  connect(senTem2.port_b, bou2.ports[1])
    annotation (Line(points={{60,0},{70,0}},        color={0,127,255}));
  annotation (experiment(Tolerance=1e-6, StopTime=100),
__Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Fluid/FixedResistances/Validation/FlowJunctionSteadyState.mos"
        "Simulate and plot"),
Documentation(info="<html>
<p>
This model validates the use of the splitter and mixer model
for different flow directions.
The example is configured such that the flow changes its direction in
each flow leg between <i>t = 0</i> seconds to <i>t = 100</i> seconds.
The splitter model has been configured as a steady-state model.
</p>
</html>", revisions="<html>
<ul>
<li>
January 18, 2017, by Michael Wetter:<br/>
Changed <code>spl.m_flow_nominal</code>, boundary condition and enabled sensor dynamics.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/657\">issue 657</a>.
</li>
<li>
October 14, 2016, by Michael Wetter:<br/>
First implementation.<br/>
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/451\">issue 451</a>.
</li>
</ul>
</html>"));
end FlowJunctionSteadyState;
