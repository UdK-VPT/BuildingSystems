within BuildingSystems.Technologies.Cogeneration.Examples;
model CogenerationUnit
  "Example of a cogeneration unit"
  import BuildingSystems;
  extends Modelica.Icons.Example;
  package Medium = BuildingSystems.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.1
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.MassFlowRate m_flow = 0.1
    "Current mass flow rate";
  BuildingSystems.Fluid.Sources.Boundary_pT bou_con(
    redeclare package Medium = Medium,
    nPorts=1,
    p=99999,
    T=293.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={60,6})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T m_flow_con(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=m_flow,
    use_T_in=true)
    annotation (Placement(transformation(extent={{-68,-4},{-48,16}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemIn(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-38,-4},{-18,16}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemOut(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{18,-4},{38,16}})));
  BuildingSystems.Technologies.Cogeneration.CogenerationUnit CHP(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal=1,
    redeclare BuildingSystems.Technologies.Cogeneration.Data.GenericCHPs.StandardCHP cogenerationUnitData)
    annotation (Placement(transformation(extent={{-10,-4},{10,16}})));
  Modelica.Blocks.Sources.Constant const1(
    k=273 + 30)
    annotation (Placement(transformation(extent={{-92,4},{-80,16}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=0.6,
    duration=3600,
    offset=0.4,
    startTime=0)
    annotation (Placement(transformation(extent={{-34,26},{-24,36}})));
equation
  connect(senTemIn.port_a, m_flow_con.ports[1]) annotation (Line(
      points={{-38,6},{-48,6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemOut.port_b, bou_con.ports[1]) annotation (Line(
      points={{38,6},{50,6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(const1.y, m_flow_con.T_in) annotation (Line(
      points={{-79.4,10},{-70,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(CHP.port_b, senTemOut.port_a)
    annotation (Line(points={{10,6},{14,6},{18,6}}, color={0,127,255}));
  connect(senTemIn.port_b, CHP.port_a)
    annotation (Line(points={{-18,6},{-14,6},{-10,6}}, color={0,127,255}));
  connect(ramp.y, CHP.u) annotation (Line(points={{-23.5,31},{-16,31},{-16,12},
          {-12,12}}, color={0,0,127}));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-60},{100,60}}),
    graphics={Text(extent={{-66,-18},{62,-60}},lineColor={0,0,255}, textString="Test of the cogeneration unit model")}),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/Cogeneration/Examples/CogenerationUnit.mos" "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.Cogeneration.CogenerationUnit\">
BuildingSystems.Technologies.Cogeneration.CogenerationUnit</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
June 7, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"),
experiment(StartTime=0.0, StopTime=7200));
end CogenerationUnit;
