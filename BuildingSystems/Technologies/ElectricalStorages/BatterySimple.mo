within BuildingSystems.Technologies.ElectricalStorages;
model BatterySimple
  input BuildingSystems.Interfaces.PowerInput PCharge
    "Power of the electrical source"
    annotation (Placement(transformation(extent={{-80,-20},{-40,20}}),                                                                                                    iconTransformation(extent={{-60,-10},{-40,10}})));
  input BuildingSystems.Interfaces.PowerInput PLoad
    "Power of the electrical load"
    annotation (Placement(transformation(extent={{-18,-18},{18,18}},rotation=180,origin={60,0}), iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={50,0})));
  Modelica.SIunits.Energy E(start = E_nominal * chargeLevel_start)
    "State of charge of the battery";
  Modelica.SIunits.Power PChargeEff
    "Effective power of the electrical source";
  Modelica.SIunits.Power PLoadEff
    "Effective power of the electrical load";
  output Modelica.Blocks.Interfaces.RealOutput chargeLevel
    "Charge level of the battery"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,64}), iconTransformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,54})));
  output BuildingSystems.Interfaces.PowerOutput PGrid
    "Electricity taken from the grid"
    annotation (Placement(transformation(extent={{54,30},{74,50}}), iconTransformation(extent={{44,30},{64,50}})));
  parameter Modelica.SIunits.Energy E_nominal(displayUnit="kWh")= 7200000
    "Nominal battery capacity";
  parameter Modelica.SIunits.Efficiency eta_nominal = 0.9
    "Load efficiency of the battery";
  parameter Real chargeLevelMin = 0.2
    "Minimal accepted load level";
  parameter Modelica.SIunits.Power PLoadMax
    "Max discharging power of battery";
  parameter Real fLoss = 0.000001
    "Loss factor of the battery";
  parameter Real chargeLevel_start = 0.5
    "Start charge level of the battery"
    annotation (Dialog(tab="Initialization"));
equation
  chargeLevel = E / E_nominal;
  PChargeEff = 0.5 * (1.0 - Modelica.Math.tanh(100000.0*(chargeLevel-1.0))) * eta_nominal * PCharge;
  PLoadEff = 0.5 * (1.0 + Modelica.Math.tanh(100000.0*(chargeLevel-1.1*chargeLevelMin))) * BuildingSystems.Utilities.SmoothFunctions.softcut_upper(PLoad,PLoadMax,0.001);
  PGrid = PLoad - PLoadEff;
  der(E) = PChargeEff - PLoadEff - fLoss * E;
    annotation (defaultComponentName="battery", Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
      Rectangle(extent={{-60,60},{60,-60}},
        lineColor={215,215,215},
        fillColor={215,215,215},
        fillPattern=FillPattern.Solid),
      Text(extent={{-40,-62},{44,-96}},
        lineColor={0,0,255},
        textString="%name"),
        Rectangle(
          extent={{-20,32},{20,-52}},
          fillColor={128,255,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-20,-52},{20,-56}},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None),
        Rectangle(
          extent={{-6,36},{6,32}},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None)}));
  end BatterySimple;
