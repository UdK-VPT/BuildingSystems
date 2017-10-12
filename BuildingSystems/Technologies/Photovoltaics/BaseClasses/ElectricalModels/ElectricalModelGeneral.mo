within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
partial model ElectricalModelGeneral
  "Basic electrical model of a PV module"
  parameter Integer nCelPar
    "Number of parallel connected cells within the PV module";
  parameter Integer nCelSer
    "Number of serial connected cells within the PV module";
  parameter Real Eg(unit = "eV")
    "Band gap";
  input BuildingSystems.Interfaces.Temp_KInput T
    "Cell temperature"
    annotation (Placement(transformation(extent={{-100,10},{-60,50}}), iconTransformation(extent={{-80,30},{-60,50}})));
  input BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput ITot
    "Effective total solar irradiation on solar cell"
    annotation (Placement(transformation(extent={{-100,-70},{-60,-30}}),iconTransformation(extent={{-80,-50},{-60,-30}})));
  output BuildingSystems.Interfaces.PowerOutput P
    "Module power"
    annotation (Placement(transformation(extent={{60,30},{80,50}}), iconTransformation(extent={{60,30},{80,50}})));
  output Modelica.Blocks.Interfaces.RealOutput I(unit="A", start = 0.0)
    "Module current"
    annotation (Placement(transformation(extent={{60,-50},{80,-30}}), iconTransformation(extent={{60,-50},{80,-30}})));
  Modelica.SIunits.Voltage Ut
    "Temperature voltage";
protected
  final constant Real e(unit = "A.s") = Modelica.Constants.F/Modelica.Constants.N_A
    "Elementary charge";
  final constant Real k(unit = "J/K") = Modelica.Constants.R/Modelica.Constants.N_A
    "Boltzmann constant";
equation
  Ut = k * T / e;

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
    Line(points={{0,40},{-20,0},{20,12},{0,-40}},color={28,108,200},thickness=0.5),
    Polygon(points={{0,-40},{0,-20},{14,-26},{0,-40}},lineColor={28,108,200},
    lineThickness=0.5,fillColor={0,0,255},fillPattern=FillPattern.Solid)}),
Documentation(info="<html>
<p>
This is a basic electrical model of a PV module.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ElectricalModelGeneral;
