within BuildingSystems.Technologies.ElectricalStorages;
model BatteryComplexIU
  extends BuildingSystems.Technologies.ElectricalStorages.BatteryComplex;

  output Modelica.Blocks.Interfaces.RealOutput UBattery(
    start = batteryData.U_nominal)
    "Battery terminal voltage"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={20,64}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={54,-28})));
  output Modelica.Blocks.Interfaces.RealOutput IBattery
    "Current flow to/from battery"
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={40,64}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={54,-50})));

  final parameter Modelica.SIunits.Resistance R_int = batteryData.R_int
    "Internal battery resistance";
  final parameter Real A(unit="1") = batteryData.A
    "Variation of internal battery voltage with SOC";
  final parameter Real C(unit="1") = batteryData.C
    "Variation of internal battery voltage at low SOC";
  Modelica.SIunits.Voltage D
    "Maximum normalized discharge rate";
  Modelica.SIunits.Voltage X
    "Normalized discharge rate";

  Modelica.SIunits.Current IChargeEff
    "Effective current flow to battery";
  Modelica.SIunits.Current ILoadEff
    "Effective Current flow from battery";
  Modelica.SIunits.Current INet
    "Current flow from or to battery";

equation
  INet = PNet/UBattery;
  ILoadEff = PLoadEff/UBattery;
  IChargeEff = PChargeEff/UBattery;
  IBattery = -ILoadEff+IChargeEff;

  UBattery = BuildingSystems.Utilities.Math.Functions.smoothLimit(
              batteryData.U_nominal * 1.06 - ILoadEff * R_int + A * X + C*X /(D-X),
              batteryData.U_nominal * 0.75,
              batteryData.U_nominal * 1.1,
              0.001);

  D = batteryData.U_nominal*1.06;
  X = batteryData.U_nominal*(1-SOC);

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
          pattern=LinePattern.None)}),
        defaultComponentName="bat",
  Documentation(info="<html>
  <p>
  Model for an eletrical battery based on the Kinetic Battery Model (KiBaM) of Manwell and McGowan
  (J. Manwell, J. McGowan, B.-G. E.I., S. W., and L. A., Evaluation of battery models
   for wind/hybrid power system simulation, in Proceedings of the 5th European Wind
   Energy Association Conference (EWEC ’94), 1994, pp. 1182–1187.).
  </p>
  </html>",
  revisions="<html>
  <ul>
  <li>
  November 11, 2017, by Christoph Nytsch-Geusen:<br/>
  Loss factor to bound energy storage shifted and plausible
  limitations of PChargeEff and PLoadEff added.
  </li>
  <li>
  May 31, 2017, by Christoph Nytsch-Geusen:<br/>
  Integration of the Kinetic Battery Model.
  </li>
  <li>
  June 6, 2016, by Christoph Nytsch-Geusen:<br/>
  First implementation.
  </li>
  </ul>
  </html>"),   Dialog(tab = "Advanced"),
    __Dymola_Commands);
end BatteryComplexIU;
