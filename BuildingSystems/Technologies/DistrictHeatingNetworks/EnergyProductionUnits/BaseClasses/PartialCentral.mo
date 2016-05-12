within BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyProductionUnits.BaseClasses;
partial model PartialCentral
  extends BuildingSystems.Fluid.Interfaces.PartialTwoPortInterface;
  BuildingSystems.Fluid.HeatExchangers.ConstantEffectiveness hex(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    m1_flow_nominal=mProduction_flow_nominal,
    m2_flow_nominal=mDHN_flow_nominal,
    dp1_nominal=dpProduction_nominal,
    dp2_nominal=dpDHN_nominal,
    eps=eps,
    allowFlowReversal1=false,
    allowFlowReversal2=false)
    annotation (Placement(transformation(extent={{10,-4},{-10,16}})));
  parameter Modelica.SIunits.MassFlowRate mProduction_flow_nominal
    "Nominal mass flow rate";
  parameter Modelica.SIunits.MassFlowRate mDHN_flow_nominal
    "Nominal mass flow rate";
  parameter Modelica.SIunits.Pressure dpProduction_nominal;
  parameter Modelica.SIunits.Pressure dpDHN_nominal;
  parameter Real eps=0.8
    "Heat exchanger effectiveness";
equation
  connect(port_a, hex.port_a2) annotation (Line(
      points={{-100,0},{-10,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hex.port_b2, port_b) annotation (Line(
      points={{10,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
    -100},{100,100}}), graphics), Icon(coordinateSystem(
    preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Polygon(
    points={{-80,-70},{-80,54},{-60,54},{-60,-6},{-20,34},{-20,-6},{20,34},
        {20,-6},{60,34},{60,-6},{80,-6},{80,-70},{-80,-70}},
    lineColor={0,0,0},
    smooth=Smooth.None,
    lineThickness=0.5), Polygon(
    points={{-44,62},{-66,52},{-52,76},{-36,88},{-22,102},{0,94},{18,96},{
        42,78},{38,72},{38,66},{26,58},{12,68},{2,70},{-28,70},{-44,62}},
    lineColor={0,0,0},
    lineThickness=0.5,
    smooth=Smooth.Bezier,
    fillColor={215,215,215},
    fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
    </html>"));
end PartialCentral;
