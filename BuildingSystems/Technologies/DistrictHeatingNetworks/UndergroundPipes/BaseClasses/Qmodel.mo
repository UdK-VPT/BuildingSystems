within BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses;
model Qmodel
  parameter Boolean InteractionBetweenPipes = true
    "Set false to avoid modelling interaction between pipes";
  Modelica.SIunits.ThermalConductivity U1
    "Thermal conductivity specific to length";
  Modelica.SIunits.ThermalConductivity U2
    "Thermal conductivity specific to length";
  final parameter Integer nPipes=2 "Number of pipes";
  parameter Integer nEle= 2 "Number of elements used in the discretization";
  parameter Modelica.SIunits.Length len "pipe's length";
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow[nEle] ThermalCollectorQ1S
    "Heat input into radiator from convective heat transfer" annotation (      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,60})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow[nEle] ThermalCollectorQ2S
    "Heat input into radiator from convective heat transfer" annotation (      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,60})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow[nEle] ThermalCollectorQ1R
    "Heat input into radiator from convective heat transfer" annotation (      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={-40,-60})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow[nEle] ThermalCollectorQ2R
    "Heat input into radiator from convective heat transfer" annotation (
      Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={30,-60})));
  Modelica.Blocks.Sources.RealExpression Q1S[nEle](y=if InteractionBetweenPipes
         then -(U1 - U2)*len/nEle .* (Q_supply.T .- BC.T) else -(U1)*len/nEle
         .* (Q_supply.T .- BC.T)) "Convective heat flow rate"
    annotation (Placement(transformation(extent={{-80,30},{-60,50}})));
  Modelica.Blocks.Sources.RealExpression Q1R[nEle](y=if InteractionBetweenPipes
         then -(U1 - U2)*len/nEle .* (Q_return.T .- BC.T) else -(U1)*len/nEle
         .* (Q_return.T .- BC.T)) "Convective heat flow rate"
    annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
  Modelica.Blocks.Sources.RealExpression Q1R2[nEle](y=if
        InteractionBetweenPipes then -(U2)*len/nEle .* (Q_supply.T .- Q_return.T)
         else zeros(nEle)) "Convective heat flow rate"
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector[2] thermalCollector(each m=
        nEle) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-46,0})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow[nEle,2] AllHeat
    "Heat input into radiator from convective heat transfer" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={8,0})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector1(m=2) annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={-76,0})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector[nEle] thermalCollectorQ1(each m=2)
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=0,
        origin={0,66})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector[nEle] thermalCollectorQ2(each m=2)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={0,-64})));
  Modelica.Blocks.Sources.RealExpression Q1R1[nEle](y=if
        InteractionBetweenPipes then -Q1R2.y else zeros(nEle))
    "Convective heat flow rate"
    annotation (Placement(transformation(extent={{0,-50},{20,-30}})));
  Modelica.Fluid.Interfaces.HeatPorts_a[nEle] Q_supply annotation (Placement(
        transformation(extent={{-10,80},{10,100}}), iconTransformation(extent={{-40,80},
            {40,100}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a BC
    annotation (Placement(transformation(extent={{-106,-10},{-86,10}}),
        iconTransformation(extent={{-106,-10},{-86,10}})));
  Modelica.Fluid.Interfaces.HeatPorts_a[nEle] Q_return annotation (Placement(
        transformation(extent={{-10,-100},{10,-80}}), iconTransformation(extent={{-40,
            -100},{40,-80}})));
  Modelica.Blocks.Interfaces.RealInput[nPipes] U annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=180,
        origin={100,0})));
equation
  U2 = U[2];
  U1 = U[1];
  connect(Q1S.y, ThermalCollectorQ1S.Q_flow) annotation (Line(
      points={{-59,40},{-40,40},{-40,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q1R.y, ThermalCollectorQ1R.Q_flow) annotation (Line(
      points={{-59,-40},{-40,-40},{-40,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q1R2.y, ThermalCollectorQ2S.Q_flow) annotation (Line(
      points={{21,40},{40,40},{40,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ThermalCollectorQ1S.port, thermalCollectorQ1.port_a[1]) annotation (
      Line(
      points={{-40,70},{-20,70},{-20,55.5},{0,55.5}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollectorQ1.port_a[2], ThermalCollectorQ2S.port) annotation (
      Line(
      points={{0,56.5},{20,56.5},{20,78},{40,78},{40,70},{40,70}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollectorQ2.port_a[2], ThermalCollectorQ2R.port) annotation (
      Line(
      points={{0,-54.5},{18,-54.5},{18,-78},{30,-78},{30,-70}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ThermalCollectorQ1R.port, thermalCollectorQ2.port_a[1]) annotation (
      Line(
      points={{-40,-70},{-40,-80},{-30,-80},{-30,-53.5},{0,-53.5}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector1.port_a, thermalCollector.port_b) annotation (Line(
      points={{-66,0},{-56,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector[1].port_a, AllHeat[:, 1].port) annotation (Line(
      points={{-36,0},{-2,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector[2].port_a, AllHeat[:, 2].port) annotation (Line(
      points={{-36,0},{-2,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(BC, thermalCollector1.port_b) annotation (Line(
      points={{-96,0},{-86,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Q_supply, thermalCollectorQ1.port_b) annotation (Line(
      points={{0,90},{0,76}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(thermalCollectorQ2.port_b, Q_return) annotation (Line(
      points={{0,-74},{0,-90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(Q1R1.y, ThermalCollectorQ2R.Q_flow) annotation (Line(
      points={{21,-40},{30,-40},{30,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q1S.y, AllHeat[:, 1].Q_flow) annotation (Line(
      points={{-59,40},{-20,40},{-20,20},{40,20},{40,0},{18,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Q1R.y, AllHeat[:, 2].Q_flow) annotation (Line(
      points={{-59,-40},{-20,-40},{-20,-20},{40,-20},{40,0},{18,0}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation ( Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}),
                   graphics={Ellipse(
          extent={{-80,80},{80,-80}},
          lineColor={255,0,0},
          fillPattern=FillPattern.Sphere,
          fillColor={255,0,0})}),                Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(info="<html>

<p>
Heat transfer model for two pipes based on steady-state theory.
</p>

<h4>Main equations</h4>
<p>
<code>
Q_flow_supply = U1s * (Tsupply - Tground) - U2s(Treturn-Tground)
</code>
</p>
<p>
<code>
Q_flow_return = U1r * (Treturn - Tground) - U2r(Tsupply-Tground)
</code>
</p>

<h4>Options</h4>

<p>
1- Different models for the <code>U1</code> and <code>U2</code> values can be choosen. <a href=\"BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels\"> U models Package</a>.
</p>

</html>"));
end Qmodel;
