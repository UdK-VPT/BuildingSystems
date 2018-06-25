within BuildingSystems.Technologies.ElectricalStorages.Examples;
model BatteryComplex
  import BuildingSystems;
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Pulse gain(
    width=50,
    startTime=3600,
    period=72000,
    amplitude=battery_1C.batteryData.PCharge_max/battery_1C.batteryData.etaCharge)
    annotation (Placement(transformation(extent={{-84,76},{-76,84}})));
  BuildingSystems.Technologies.ElectricalStorages.BatteryComplex battery_1C(
    redeclare BuildingSystems.Technologies.ElectricalStorages.Data.LeadAcid.Chloride200Ah batteryData,
    SOC_start=1.0)
    annotation (Placement(transformation(extent={{-70,70},{-50,90}})));
  Modelica.Blocks.Sources.Pulse load_1C(
    width=5,
    period=72000,
    amplitude=battery_1C.batteryData.E_nominal*battery_1C.batteryData.etaLoad/(1*3600))
    annotation (Placement(transformation(extent={{-36,76},{-44,84}})));
  BuildingSystems.Technologies.ElectricalStorages.BatteryComplex battery_C20(
    redeclare BuildingSystems.Technologies.ElectricalStorages.Data.LeadAcid.Chloride200Ah batteryData,
    SOC_start=1.0)
    annotation (Placement(transformation(extent={{-70,30},{-50,50}})));
  Modelica.Blocks.Sources.Pulse load_C20(
    period=72000,
    width=100,
    amplitude=battery_1C.batteryData.E_nominal*battery_1C.batteryData.etaLoad/(20*3600))
    annotation (Placement(transformation(extent={{-36,36},{-44,44}})));
  Modelica.Blocks.Sources.Constant noLoad(
    k=0)
    annotation (Placement(transformation(extent={{-84,36},{-76,44}})));
equation
  connect(gain.y, battery_1C.PCharge)
    annotation (Line(points={{-75.6,80},{-65,80}}, color={0,0,127}));
  connect(load_1C.y, battery_1C.PLoad)
    annotation (Line(points={{-44.4,80},{-55,80}}, color={0,0,127}));
  connect(load_C20.y, battery_C20.PLoad)
    annotation (Line(points={{-44.4,40},{-55,40}}, color={0,0,127}));
  connect(noLoad.y, battery_C20.PCharge)
    annotation (Line(points={{-75.6,40},{-65,40}}, color={0,0,127}));

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-110,0},{-10,100}},initialScale=0.1), graphics={
      Text(extent={{-60,94},{-60,90}},lineColor={0,0,255},fontSize=22,textString="Battery discharging at 1C-rate (load == capacity in A)"),
      Text(extent={{-60,12},{-60,8}}, lineColor={0,0,255},fontSize=22,
        textString="Test of the extended battery model"),
      Text(extent={{-60,52},{-60,48}},lineColor={0,0,255},fontSize=22,
        textString="Battery discharging at C20-rate (load == capacity/20hrs in A)")}),
      experiment(StartTime=0.0, StopTime=3.1536e+007),
      __Dymola_Commands(file="Resources/Scripts/Dymola/Technologies/ElectricalStorages/Examples/BatteryComplex.mos""Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.ElectricalStorages.BatteryComplex\">
BuildingSystems.Technologies.ElectricalStorages.BatteryComplex</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
June 25, 2018, by Christoph Banhardt:<br/>
First implementation.
</li>
</ul>
</html>"));
end BatteryComplex;
