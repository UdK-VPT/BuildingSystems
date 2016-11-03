within BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.BaseClasses;
partial model PartialStation
extends BuildingSystems.Fluid.Interfaces.PartialTwoPortInterface;
  Modelica.Blocks.Interfaces.RealInput ambientTAirRef
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=-90,origin={-50,100})));
  Modelica.Blocks.Interfaces.RealInput zoneTAir
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=-90,origin={-10,100})));
  Fluid.HeatExchangers.ConstantEffectiveness hex(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    eps=eps)
    annotation (Placement(transformation(extent={{-40,-80},{-20,-100}})));
  parameter Modelica.SIunits.Efficiency eps=0.9
    "Heat exchanger effectiveness";
  Modelica.Blocks.Interfaces.RealInput Tset
    "Heating set temperature"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=-90,origin={30,100})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Radheat
    annotation (Placement(transformation(extent={{50,80},{70,100}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Conheat
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
equation
  connect(hex.port_b1, port_b) annotation (Line(
      points={{-20,-96},{100,-96},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
    -100},{100,100}})),           Icon(coordinateSystem(
    preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255})}));
end PartialStation;
