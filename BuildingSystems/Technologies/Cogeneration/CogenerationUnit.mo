within BuildingSystems.Technologies.Cogeneration;
model CogenerationUnit
  "Cogeneration unit based on a characteristic curve"
  extends BuildingSystems.Fluid.Interfaces.TwoPortHeatMassExchanger(
  redeclare final BuildingSystems.Fluid.MixingVolumes.MixingVolume vol(
    final prescribedHeatFlowRate=true));
  replaceable parameter BuildingSystems.Technologies.Cogeneration.Data.BaseClasses.CogenerationUnitGeneral cogenerationUnitData
    "Characteristic data of the Cogeneration unit"
    annotation(Dialog(tab = "General"),Evaluate=true, choicesAllMatching=true);
  final parameter Modelica.SIunits.HeatFlowRate Q_flow_nominal = cogenerationUnitData.Q_flow_nominal
    "Nominal heat flow rate (at full load)";
  final parameter Modelica.SIunits.HeatFlowRate P_nominal = cogenerationUnitData.P_nominal
    "Nominal electrical power (at full load)";
  Modelica.Blocks.Interfaces.RealInput u(
    min = 0.0,
    max = 1.0)
    "Control input (partial load)"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealOutput Q_flow(unit="W")
    "Heat added to the fluid"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Interfaces.RealOutput P(unit="W")
    "Electrical output"
    annotation (Placement(transformation(extent={{100,12},{120,32}}), iconTransformation(extent={{100,12},{120,32}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow preHea
    "Prescribed heat flow"
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Modelica.Blocks.Sources.RealExpression gaiPow(
    y = if etaEl.y[1] > 0.0 then u * P_nominal else 0.0)
    "Gain for electrical output"
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Modelica.Blocks.Sources.RealExpression gaiHea(
    y = if etaEl.y[1] > 0.0 then etaTh.y[1] / etaEl.y[1] * P else 0.0)
    "Gain for thermal output"
    annotation (Placement(transformation(extent={{-80,62},{-60,82}})));
  Modelica.Blocks.Tables.CombiTable1Ds etaTh(
   columns={2},
   smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
   table = cogenerationUnitData.etaTh)
   "Partial load dependent thermal efficieny"
   annotation (Placement(transformation(extent={{-80,-40},{-60,-20}})));
 Modelica.Blocks.Tables.CombiTable1Ds etaEl(
   columns={2},
   smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
   table=cogenerationUnitData.etaEl)
   "Partial load dependent electrical efficieny"
   annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
 Modelica.Blocks.Sources.RealExpression gaiEFin(
   y = if etaEl.y[1] > 0.0 then P / etaEl.y[1] else 0.0)
   "End energy demand calculation"
   annotation (Placement(transformation(extent={{60,-50},{80,-30}})));
Modelica.Blocks.Interfaces.RealOutput EFin(unit="W")
  "Final energy demand (e.g. gas, petrol)"
  annotation (Placement(transformation(extent={{100,-50},{120,-30}}), iconTransformation(extent={{-10,-10},{10,10}},rotation=0,origin={110,-40})));
equation
  connect(preHea.port, vol.heatPort) annotation (Line(
      points={{-20,60},{-9,60},{-9,-10}},color={191,0,0}));
  connect(gaiPow.y, P) annotation (Line(points={{-59,30},{10,30},{80,30},{80,22},
          {110,22}}, color={0,0,127}));
  connect(gaiHea.y, preHea.Q_flow) annotation (Line(points={{-59,72},{-50,72},{-50,
            60},{-40,60}}, color={0,0,127}));
  connect(gaiHea.y, Q_flow) annotation (Line(points={{-59,72},{10,72},{80,72},{80,
            60},{110,60}}, color={0,0,127}));
  connect(u, etaTh.u) annotation (Line(points={{-120,60},{-106,60},{-90,60},{-90,
          -30},{-82,-30}}, color={0,0,127}));
  connect(u, etaEl.u) annotation (Line(points={{-120,60},{-90,60},{-90,-60},{-82,
          -60}}, color={0,0,127}));
  connect(gaiEFin.y, EFin)
    annotation (Line(points={{81,-40},{110,-40},{110,-40}}, color={0,0,127}));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
        Rectangle(
          extent={{70,60},{100,58}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-56,24},{100,-66}},
          lineColor={255,255,255},
          textString="Q_flow_nominal=%Q_flow_nominal"),
        Rectangle(
          extent={{-100,60},{-70,58}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,127},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-122,106},{-78,78}},
          lineColor={0,0,127},
          textString="u"),
        Text(
          extent={{72,96},{116,68}},
          lineColor={0,0,127},
          textString="Q_flow"),
        Text(
          extent={{72,48},{102,30}},
          lineColor={0,0,127},
          textString="P"),
        Text(
          extent={{-50,54},{50,10}},
          lineColor={0,0,0},
          textString="CHP"),
        Rectangle(
          extent={{-100,8},{101,-5}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{76,-10},{106,-28}},
          lineColor={0,0,127},
          textString="EFin"),
        Text(
          extent={{-58,-4},{80,-74}},
          lineColor={255,255,255},
          textString="P_nominal=%P_nominal")}),
        defaultComponentName="cog",
Documentation(info="<html>
<p>
Model for a cogeneration unit based on a characteristic curve.
</p>
</html>",
revisions="<html>
<ul>
<li>
June 6, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end CogenerationUnit;
