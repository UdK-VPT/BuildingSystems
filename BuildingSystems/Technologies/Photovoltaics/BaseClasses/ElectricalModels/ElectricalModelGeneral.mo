within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
partial model ElectricalModelGeneral
  "Basic PV electrical model"
  parameter Integer nCelPar
    "Number of parallel connected cells within the PV module";
  parameter Integer nCelSer
    "Number of serial connected cells within the PV module";
  parameter Real Eg(final unit = "eV")
    "Band gap in eV";
  BuildingSystems.Interfaces.Temp_KInput T
    "Cell temperature"
    annotation (Placement(transformation(extent={{-100,10},{-60,50}}), iconTransformation(extent={{-80,30},{-60,50}})));
  BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput ITot
    "Effective total solar irradiation on solar cell"
    annotation (Placement(transformation(extent={{-100,-70},{-60,-30}}),iconTransformation(extent={{-80,-50},{-60,-30}})));
  Interfaces.PowerOutput P
    "Module power"
    annotation (Placement(transformation(extent={{60,30},{80,50}}), iconTransformation(extent={{60,30},{80,50}})));
  Modelica.Blocks.Interfaces.RealOutput I(unit="A", start = 0.0)
    "Module current"
    annotation (Placement(transformation(extent={{60,-50},{80,-30}}), iconTransformation(extent={{60,-50},{80,-30}})));
  Modelica.SIunits.Voltage Ut
    "Temperature voltage";
protected
  final constant Real e = Modelica.Constants.F/Modelica.Constants.N_A
    "Elementary charge in A.s";
  final constant Real k = Modelica.Constants.R/Modelica.Constants.N_A
    "Boltzmann constant in J/K";
equation
  Ut = k * T / e;
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-60,60},{60,-60}}, lineColor={28,108,200}),
    Line(points={{0,40},{-20,0},{20,12},{0,-40}},color={28,108,200},thickness=0.5),
    Polygon(points={{0,-40},{0,-20},{14,-26},{0,-40}},lineColor={28,108,200},lineThickness=0.5,fillColor={0,0,255},fillPattern=FillPattern.Solid)}));
end ElectricalModelGeneral;
