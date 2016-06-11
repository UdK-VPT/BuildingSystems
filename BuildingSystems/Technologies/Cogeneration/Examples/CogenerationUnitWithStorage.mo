within BuildingSystems.Technologies.Cogeneration.Examples;
model CogenerationUnitWithStorage
  "Example of a cogeneration unit with warm water storage"
  import BuildingSystems;
  extends Modelica.Icons.Example;
  package Medium = BuildingSystems.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.1
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.MassFlowRate m_flow = 0.1;
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemIn(
    redeclare package Medium = Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{18,-24},{38,-4}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemOut(
    redeclare package Medium = Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-38,-24},{-18,-4}})));
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
    annotation (Placement(transformation(extent={{76,-56},{56,-36}})));
  Fluid.Movers.FlowControlled_m_flow pump(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-34,-65},{-54,-45}})));
  Modelica.Blocks.Sources.Constant TSet(
    k=273.15 + 60.0)
    annotation (Placement(transformation(extent={{-56,30},{-50,36}})));
  Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium,
    V_start=0.01)
    "Expansion vessel model"
    annotation (Placement(transformation(extent={{-16,-50},{-4,-38}})));
  BuildingSystems.Technologies.Cogeneration.CogenerationUnit CHP(
    redeclare package Medium = Medium,
    redeclare BuildingSystems.Technologies.Cogeneration.Data.GenericCHPs.StandardCHP cogenerationUnitData,
    m_flow_nominal=0.1,
    dp_nominal=1)
    annotation (Placement(transformation(extent={{-10,-24},{10,-4}})));
  Modelica.Blocks.Math.Add add(
    k1=-1,
    k2=+1)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=-90,origin={-44,26})));
  Modelica.Blocks.Logical.Hysteresis control(
    pre_y_start=false,
    uLow=0.0,
    uHigh=2.0)
    "Two-point controller"
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-44,16})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal1(
    realTrue=0.1)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-44,4})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal2(
    realTrue=1.0)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-14,4})));
equation
  connect(senTemOut.port_b, CHP.port_a) annotation (Line(points={{-18,-14},{-14,
          -14},{-10,-14}}, color={0,127,255}));
  connect(CHP.port_b, senTemIn.port_a)
    annotation (Line(points={{10,-14},{14,-14},{18,-14}}, color={0,127,255}));
  connect(senTemIn.port_b, storage.port_a2) annotation (Line(points={{38,-14},{46,
          -14},{52,-14},{52,-37},{59,-37}}, color={0,127,255}));
  connect(pump.port_a, storage.port_b2) annotation (Line(points={{-34,-55},{-34,
          -55},{59,-55}}, color={0,127,255}));
  connect(pump.port_b, senTemOut.port_a) annotation (Line(points={{-54,-55},{-54,
          -55},{-60,-55},{-60,-14},{-38,-14}}, color={0,127,255}));
  connect(pump.port_a, exp.port_a) annotation (Line(points={{-34,-55},{-10,-55},
          {-10,-50}}, color={0,127,255}));
  connect(pump.m_flow_in, booleanToReal1.y) annotation (Line(points={{-43.8,-43},
          {-43.8,-40.5},{-44,-40.5},{-44,-0.4}}, color={0,0,127}));
  connect(booleanToReal1.u, control.y)
    annotation (Line(points={{-44,8.8},{-44,11.6}}, color={255,0,255}));
  connect(control.u, add.y)
    annotation (Line(points={{-44,20.8},{-44,21.6}}, color={0,0,127}));
  connect(TSet.y, add.u2) annotation (Line(points={{-49.7,33},{-46.4,33},{-46.4,
          30.8}}, color={0,0,127}));
  connect(add.u1, storage.T[4]) annotation (Line(points={{-41.6,30.8},{-41.6,34},
          {76,34},{76,-40.75},{73.4,-40.75}}, color={0,0,127}));
  connect(booleanToReal2.y, CHP.u)
    annotation (Line(points={{-14,-0.4},{-14,-8},{-12,-8}}, color={0,0,127}));
  connect(control.y, booleanToReal2.u) annotation (Line(points={{-44,11.6},{-44,
          10},{-14,10},{-14,8.8}}, color={255,0,255}));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-80,-100},{100,40}},initialScale=0.1),
    graphics={Text(extent={{-62,-66},{66,-108}},lineColor={0,0,255},
    textString="Test of the cogeneration unit  model which loads a warm water storage")}),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/Cogeneration/Examples/CogenerationUnitWithStorage.mos" "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.Cogeneration.CogenerationUnit\">
BuildingSystems.Technologies.Cogeneration.CogenerationUnit</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
June 10, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"),
experiment(StartTime=0.0, StopTime=20000));
end CogenerationUnitWithStorage;
