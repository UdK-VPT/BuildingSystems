within BuildingSystems.Fluid.Movers.Examples;
model MoverContinuous
  "Example model of movers using a real input for setting the stage"
  extends MoverParameter(
    pump_m_flow(inputType=BuildingSystems.Fluid.Types.InputType.Continuous),
    pump_y(inputType=BuildingSystems.Fluid.Types.InputType.Continuous),
    pump_dp(inputType=BuildingSystems.Fluid.Types.InputType.Continuous));
  Modelica.Blocks.Sources.Ramp ramp(duration=1) "Ramp input for all movers"
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Math.Gain gai_m_flow(k=m_flow_nominal)
    "Nominal mass flow rate"
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
  Modelica.Blocks.Math.Gain gai_dp(k=dp_nominal) "Nominal pressure drop"
    annotation (Placement(transformation(extent={{-40,-70},{-20,-50}})));
equation
  connect(gai_dp.y, pump_dp.dp_in) annotation (Line(points={{-19,-60},{-10,-60},
          {0,-60},{0,-68}},       color={0,0,127}));
  connect(gai_m_flow.y, pump_m_flow.m_flow_in)
    annotation (Line(points={{-19,20},{0,20},{0,12}},       color={0,0,127}));
  connect(gai_m_flow.u, ramp.y) annotation (Line(points={{-42,20},{-50,20},{-50,
          70},{-59,70}}, color={0,0,127}));
  connect(gai_dp.u, ramp.y) annotation (Line(points={{-42,-60},{-50,-60},{-50,
          70},{-59,70}}, color={0,0,127}));
  connect(pump_y.y, ramp.y) annotation (Line(points={{0,-28},{0,-20},{-50,-20},{
          -50,70},{-59,70}},       color={0,0,127}));
  annotation (
    Documentation(info="<html>
<p>
This example demonstrates the use of a <code>RealInput</code>
connector for a mover model.
</p>
</html>", revisions="<html>
<ul>
<li>
March 21, 2023, by Hongxiang Fu:<br/>
Deleted the mover with <code>Nrpm</code> signal.
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1704\">IBPSA, #1704</a>.
</li>
<li>
August 24, 2015, by Filip Jorissen:<br/>
First implementation.
</li>
</ul>
</html>"),
experiment(Tolerance=1e-06, StopTime=1),
__Dymola_Commands(file=
          "modelica://BuildingSystems/Resources/Scripts/Dymola/Fluid/Movers/Examples/MoverContinuous.mos"
        "Simulate and plot"));
end MoverContinuous;
