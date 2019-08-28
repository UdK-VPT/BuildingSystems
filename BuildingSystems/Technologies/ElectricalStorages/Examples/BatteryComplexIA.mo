within BuildingSystems.Technologies.ElectricalStorages.Examples;
model BatteryComplexIA
  "Example of a electrical battery with Voltage and Current calculation"
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.ElectricalStorages.BatteryComplexIA
    battery(nBat=1,
            redeclare Data.LeadAcid.Chloride200Ah batteryData(SOC_min=0.01),
            SOC_start=1.0)
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  Modelica.Blocks.Sources.Constant load(k=120)
    annotation (Placement(transformation(extent={{-36,56},{-44,64}})));
  Modelica.Blocks.Sources.Constant gain(k=0)
    annotation (Placement(transformation(extent={{-84,56},{-76,64}})));
equation
  connect(load.y, battery.PLoad) annotation (Line(
      points={{-44.4,60},{-55,60}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(gain.y, battery.PCharge)
    annotation (Line(points={{-75.6,60},{-65,60}}, color={0,0,127}));
  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{-20,100}}), graphics={
    Text(extent={{-58,24},{-58,20}},lineColor={0,0,255},fontSize=22,
          textString="Test of the extended complex battery model")}),
    experiment(StartTime=0.0, StopTime=3.1536e+007),
    __Dymola_Commands(file=
          "Resources/Scripts/Dymola/Technologies/ElectricalStorages/Examples/BatteryComplexIA.mos"
        "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.ElectricalStorages.BatterySimple\">
BuildingSystems.Technologies.ElectricalStorages.BatterySimple</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
June 16, 2015, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end BatteryComplexIA;
