within BuildingSystems.Buildings.Comfort.Examples;
model ThermalComfort_DIN_EN_ISO_7730_Dynamic
  "Example that simulates the PMV and PPD indeces for an indoor space"
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.Comfort.ThermalComfort_DIN_EN_ISO_7730 thermalComfort
  annotation (Placement(transformation(extent={{-50,50},{-30,70}})));
  Modelica.Blocks.Sources.Sine TAir(
    offset=293.15,
    amplitude=12.0,
    freqHz=1.0/3600.0,
    startTime=0.0)
    "Air temperature"
    annotation (Placement(transformation(extent={{-74,68},{-66,76}})));
  Modelica.Blocks.Sources.Sine Tr(
    offset=293.15,
    freqHz=1.0/3600.0,
    startTime=0.0,
    amplitude=14.0)
    "Mean radiant temperature"
    annotation (Placement(transformation(extent={{-74,54},{-66,62}})));
  Modelica.Blocks.Sources.Constant xAir(
    k=0.008)
    "Absolute air moisture"
    annotation (Placement(transformation(extent={{-74,38},{-66,46}})));
  Modelica.Blocks.Sources.Constant vAir(
    k=0.1)
    "Relative air velocity"
    annotation (Placement(transformation(extent={{-74,24},{-66,32}})));
  Modelica.Blocks.Sources.Constant clo(
    k=1.0)
    "Clothing"
    annotation (Placement(transformation(extent={{-54,40},{-46,48}})));
  Modelica.Blocks.Sources.Constant met(
    k=1.2)
    "Metabolism rate"
    annotation (Placement(transformation(extent={{-54,28},{-46,36}})));
  Modelica.Blocks.Sources.Constant wme(
    k=0.0)
    "External work"
    annotation (Placement(transformation(extent={{-54,16},{-46,24}})));
equation
  connect(TAir.y, thermalComfort.TAir)
    annotation (Line(points={{-65.6,72},{-58,72},{-58,66},{-47,66}}, color={0,0,127}));
  connect(Tr.y, thermalComfort.Tr)
    annotation (Line(points={{-65.6,58},{-60,58},{-60,63},{-47,63}}, color={0,0,127}));
  connect(xAir.y, thermalComfort.xAir)
    annotation (Line(points={{-65.6,42},{-58,42},{-58,60},{-47,60}}, color={0,0,127}));
  connect(vAir.y, thermalComfort.vAir)
    annotation (Line(points={{-65.6,28},{-56,28},{-56,57},{-47,57}}, color={0,0,127}));
  connect(clo.y, thermalComfort.clo)
    annotation (Line(points={{-45.6,44},{-45,44},{-45,53}}, color={0,0,127}));
  connect(met.y, thermalComfort.met)
    annotation (Line(points={{-45.6,32},{-42,32},{-42,53}}, color={0,0,127}));
  connect(wme.y, thermalComfort.wme)
    annotation (Line(points={{-45.6,20},{-39,20},{-39,53}}, color={0,0,127}));

    annotation(experiment(StartTime=0, StopTime=7200.0),
      __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Comfort/Examples/ThermalComfort_DIN_EN_ISO_7730_Dynamic.mos" "Simulate and plot"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{-20,80}}),
      graphics={Text(extent={{-84,20},{-40,-4}},lineColor={28,108,200},
      textString="Calculation of PMV and PPD
  according to DIN EN ISO 7730")}),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{-20,80}})),
  Documentation(info="<html>
  <p>
  Example that simulates the PMV and PPD indices for an indoor space under dynamic temperatures.
  </p>
  </html>",
  revisions="<html>
  <ul>
  <li>
  January 2, 2020, by Christoph Nytsch-Geusen:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end ThermalComfort_DIN_EN_ISO_7730_Dynamic;
