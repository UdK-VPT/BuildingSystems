within BuildingSystems.Fluid.Storage.Examples;
model StratifiedEnhancedInternalHex
  "Example showing the use of StratifiedEnhancedInternalHex"
  extends Modelica.Icons.Example;

  package MediumTan = BuildingSystems.Media.Water "Medium in the tank";
  package MediumHex = BuildingSystems.Media.Water "Medium in the heat exchanger";

  parameter Modelica.Units.SI.PressureDifference dpHex_nominal=2500
    "Pressure drop across the heat exchanger at nominal conditions";

  parameter Modelica.Units.SI.MassFlowRate mHex_flow_nominal=0.278
    "Mass flow rate of heat exchanger";

  BuildingSystems.Fluid.Sources.Boundary_pT bouWat(redeclare package Medium =
        MediumTan, nPorts=3)
    "Boundary condition for water (used to set pressure)" annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={72,-78})));
  BuildingSystems.Fluid.Sources.Boundary_pT solColSup(
    redeclare package Medium = MediumHex,
    nPorts=3,
    use_p_in=true,
    T=353.15) "Water from solar collector" annotation (Placement(transformation(
          extent={{-10,-10},{10,10}}, origin={-30,40})));
  BuildingSystems.Fluid.Sources.Boundary_pT toSolCol(
    redeclare package Medium = MediumHex,
    nPorts=3,
    p(displayUnit="Pa") = 3E5,
    T=283.15) "Water to solar collector" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        origin={-72,-20})));
  BuildingSystems.Fluid.Storage.StratifiedEnhancedInternalHex tanSte(
    redeclare package Medium = MediumTan,
    m_flow_nominal=0.001,
    VTan=0.151416,
    dIns=0.0762,
    redeclare package MediumHex = MediumHex,
    CHex=40,
    Q_flow_nominal=0.278*4200*20,
    hTan=1.746,
    hHex_a=0.995,
    hHex_b=0.1,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    allowFlowReversal=false,
    allowFlowReversalHex=false,
    mHex_flow_nominal=mHex_flow_nominal,
    TTan_nominal=293.15,
    THex_nominal=323.15,
    dpHex_nominal=dpHex_nominal)
    "Tank with heat exchanger configured as steady state"
    annotation (Placement(transformation(extent={{6,56},{40,88}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemSte(
    redeclare package Medium = MediumHex,
    allowFlowReversal=false,
    m_flow_nominal=mHex_flow_nominal,
    tau=0) "Temperature sensor for outlet of steady-state heat exchanger"
    annotation (Placement(transformation(extent={{-20,0},{-40,20}})));
  Modelica.Blocks.Sources.Step step(
    height=dpHex_nominal,
    offset=3E5,
    startTime=300) "Step input for mass flow rate"
    annotation (Placement(transformation(extent={{-80,38},{-60,58}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemDyn(
    redeclare package Medium = MediumHex,
    allowFlowReversal=false,
    m_flow_nominal=mHex_flow_nominal,
    tau=0) "Temperature sensor for outlet of dynamic heat exchanger"
    annotation (Placement(transformation(extent={{-22,-30},{-42,-10}})));
  BuildingSystems.Fluid.Storage.StratifiedEnhancedInternalHex tanDyn(
    redeclare package Medium = MediumTan,
    m_flow_nominal=0.001,
    VTan=0.151416,
    dIns=0.0762,
    redeclare package MediumHex = MediumHex,
    CHex=40,
    Q_flow_nominal=0.278*4200*20,
    hTan=1.746,
    hHex_a=0.995,
    hHex_b=0.1,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    allowFlowReversal=false,
    allowFlowReversalHex=false,
    mHex_flow_nominal=mHex_flow_nominal,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.FixedInitial,
    TTan_nominal=293.15,
    THex_nominal=323.15) "Tank with heat exchanger configured as dynamic"
    annotation (Placement(transformation(extent={{4,-28},{38,4}})));
  BuildingSystems.Fluid.Storage.StratifiedEnhancedInternalHex tanDynSol(
    redeclare package Medium = MediumTan,
    m_flow_nominal=0.001,
    VTan=0.151416,
    dIns=0.0762,
    redeclare package MediumHex = MediumHex,
    CHex=40,
    Q_flow_nominal=0.278*4200*20,
    hTan=1.746,
    hHex_a=0.995,
    hHex_b=0.1,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    allowFlowReversal=false,
    allowFlowReversalHex=false,
    mHex_flow_nominal=mHex_flow_nominal,
    energyDynamicsHex=Modelica.Fluid.Types.Dynamics.SteadyState,
    energyDynamicsHexSolid=Modelica.Fluid.Types.Dynamics.SteadyStateInitial,
    TTan_nominal=293.15,
    THex_nominal=323.15)
    "Tank with heat exchanger configured as steady-state except for metal which is dynamic"
    annotation (Placement(transformation(extent={{6,-76},{40,-44}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemDynSol(
    redeclare package Medium = MediumHex,
    allowFlowReversal=false,
    m_flow_nominal=mHex_flow_nominal,
    tau=0)
    "Temperature sensor for outlet of steady state heat exchanger with solid configured dynamic"
    annotation (Placement(transformation(extent={{-20,-82},{-40,-62}})));
equation
  connect(solColSup.ports[1], tanSte.portHex_a) annotation (Line(
      points={{-20,38.6667},{-4,38.6667},{-4,65.92},{6,65.92}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemSte.port_b, toSolCol.ports[1])
    annotation (Line(points={{-40,10},{-40,10},{-50,10},{-50,-21.3333},{-62,
          -21.3333}},                          color={0,127,255}));
  connect(senTemSte.port_a, tanSte.portHex_b) annotation (Line(points={{-20,10},
          {0,10},{0,59.2},{6,59.2}}, color={0,127,255}));
  connect(senTemDyn.port_a, tanDyn.portHex_b) annotation (Line(points={{-22,-20},
          {0,-20},{0,-24.8},{4,-24.8}}, color={0,127,255}));
  connect(senTemDyn.port_b, toSolCol.ports[2]) annotation (Line(points={{-42,-20},
          {-52,-20},{-62,-20}},           color={0,127,255}));
  connect(tanDynSol.portHex_b, senTemDynSol.port_a) annotation (Line(points={{6,-72.8},
          {-8,-72.8},{-8,-72},{-20,-72}},        color={0,127,255}));
  connect(senTemDynSol.port_b, toSolCol.ports[3]) annotation (Line(points={{-40,-72},
          {-50,-72},{-50,-18.6667},{-62,-18.6667}},                color={0,127,
          255}));
  connect(solColSup.ports[2], tanDyn.portHex_a) annotation (Line(points={{-20,40},
          {-14,40},{-4,40},{-4,-18.08},{4,-18.08}}, color={0,127,255}));
  connect(solColSup.ports[3], tanDynSol.portHex_a) annotation (Line(points={{-20,
          41.3333},{-6,41.3333},{-6,-66.08},{6,-66.08}},               color={0,
          127,255}));
  connect(bouWat.ports[1], tanSte.port_b) annotation (Line(points={{62,-79.3333},
          {52,-79.3333},{52,40},{22,40},{22,56},{23,56}},
                                          color={0,127,255}));
  connect(bouWat.ports[2], tanDyn.port_b)
    annotation (Line(points={{62,-78},{52,-78},{52,-36},{21,-36},{21,-28}},
                                                          color={0,127,255}));
  connect(bouWat.ports[3], tanDynSol.port_b) annotation (Line(points={{62,
          -76.6667},{24,-76.6667},{24,-76},{23,-76}},
                                            color={0,127,255}));
  connect(step.y, solColSup.p_in)
    annotation (Line(points={{-59,48},{-52,48},{-42,48}}, color={0,0,127}));
  annotation ( __Dymola_Commands(file=
          "modelica://BuildingSystems/Resources/Scripts/Dymola/Fluid/Storage/Examples/StratifiedEnhancedInternalHex.mos"
        "Simulate and plot"),
experiment(Tolerance=1e-6, StopTime=1200),
Documentation(info="<html>
<p>
This model provides an example for the
<a href=\"modelica://BuildingSystems.Fluid.Storage.StratifiedEnhancedInternalHex\">
BuildingSystems.Fluid.Storage.StratifiedEnhancedInternalHex</a> model.
There are three tanks.
In the tank on top, the fluid in the heat exchanger and the metal of the
heat exchanger use a steady-state energy balance.
In the middle tank, both use a dynamic balance.
In the bottom tank, the fluid uses a steady-state heat balance
but the metal of the heat exchanger uses a dynamic balance.
</p>
<p>
Each tank starts at the same water temperature, and there is no
water flow through the tank.
The glycol that flows through the heat exchanger starts with zero
mass flow rate, and is set to its design flow rate at <i>t=300</i> seconds.
</p>
</html>",
revisions="<html>
<ul>
<li>
June 7, 2018 by Filip Jorissen:<br/>
Copied model from Buildings and update the model accordingly.
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/314\">#314</a>.
</li>
<li>
January 22, 2016, by Michael Wetter:<br/>
Corrected type declaration of pressure difference.
This is
for <a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/404\">#404</a>.
</li>
<li>
September 28, 2015 by Michael Wetter:<br/>
Changed medium in heat exchanger from
<a href=\"modelica://Modelica.Media.Incompressible.Examples.Glycol47\">
Modelica.Media.Incompressible.Examples.Glycol47</a> to
<a href=\"modelica://BuildingSystems.Media.Water\">
BuildingSystems.Media.Water</a>
to avoid numerical derivative in regression tests.
</li>
<li>
July 2, 2015 by Michael Wetter:<br/>
Modified example to test dynamic versus steady-state heat exchanger
configuration.
</li>
<li>
December 22, 2014 by Michael Wetter:<br/>
Removed <code>Modelica.Fluid.System</code>
to address issue
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/311\">#311</a>.
</li>
<li>
August 29, 2014 by Michael Wetter:<br/>
Revised example to use a different media in the tank and in the
heat exchanger. This is to provide a unit test for
issue <a href=\"https://github.com/lbl-srg/modelica-buildings/issues/271\">#271</a>.
</li>
<li>
April 18, 2014 by Michael Wetter:<br/>
Revised example for new connectors and parameters, and provided
more interesting parameter values that cause a tank stratification.
</li>
<li>
Mar 27, 2013 by Peter Grant:<br/>
First implementation
</li>
</ul>
</html>"));
end StratifiedEnhancedInternalHex;
