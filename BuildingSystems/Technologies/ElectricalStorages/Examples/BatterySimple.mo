within BuildingSystems.Technologies.ElectricalStorages.Examples;
model BatterySimple
  "Example of a electrical battery"
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.ElectricalStorages.BatterySimple battery(
    E_nominal =25200000,
    PLoadMax=2000)
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  Modelica.Blocks.Sources.Pulse gain(
    amplitude=400,
    width=50,
    period=7200)
    annotation (Placement(transformation(extent={{-84,56},{-76,64}})));
  Modelica.Blocks.Sources.Constant load(
    k=300)
    annotation (Placement(transformation(extent={{-36,56},{-44,64}})));
equation
  connect(battery.PCharge, gain.y) annotation (Line(
      points={{-65,60},{-75.6,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(load.y, battery.PLoad) annotation (Line(
      points={{-44.4,60},{-55,60}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},
  {-20,100}}), graphics={
    Text(extent={{-62,22},{-62,18}},lineColor={0,0,255},fontSize=22,
    textString="Test of the simplified battery model")}),
    experiment(StartTime=0.0, StopTime=3.1536e+007),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/ElectricalStorages/Examples/BatterySimple.mos" "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.Electrica.Batteries\">
BuildingSystems.Technologies.Electrical.Batteries</a>.
</p>
</html>", revisions="<html>
<ul>
  <li>
June 16, 2015, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end BatterySimple;
