within BuildingSystems.HAM.HeatConduction;
model MultiLayerHeatConduction1DNodes
  "Multi layered-body with 1D heat conduction and a potential inner discretization of each layer"

  BuildingSystems.HAM.HeatConduction.HeatConduction1DNodes layer[nLayers](
    material=material,
    each lengthY=lengthY,
    each lengthZ=lengthZ,
    lengthX=thickness,
    nNodesX=nNodes,
    T_start=T_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  BuildingSystems.Interfaces.HeatPort heatPort_x1
    "Heat port in direction x1"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0}),
      iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0})));

  BuildingSystems.Interfaces.HeatPort heatPort_x2
    "Heat port in direction x2"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0}),
      iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0})));

  BuildingSystems.Interfaces.HeatPort heatPort_source
    "Heat port for internal heat source"
    annotation(Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,origin={0,20}),
      iconTransformation(extent={{-10,-10},{10,10}})));

  parameter BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral material[nLayers]
    "Thermal properties for each material layer"
    annotation (HideResult=true);

  Modelica.SIunits.Length lengthY = 1.0
    "Length in y dimension";
  Modelica.SIunits.Length lengthZ = 1.0
    "Length in z dimension";
  parameter Integer nLayers = 1
    "Number of material layers in the x dimension";
  parameter Integer nNodes[nLayers] = {1}
    "Number of numerical nodes of layer i";
  parameter Modelica.SIunits.Length thickness[nLayers] = {1.0}
    "Thickness of layer i";
  parameter Modelica.SIunits.Temp_K T_start[nLayers]={293.15 for i in 1:nLayers}
    "Start temperature of the layer i"
    annotation (Dialog(tab="Initialization"));
  parameter Integer layerWithHeatSource = 1
    "Material layer with internal heat source";
  parameter Integer nodeWithHeatSource = 1
    "Numerical node of the specified layer with internal heat source";
equation
  connect(heatPort_source,layer[layerWithHeatSource].heatPort_source[nodeWithHeatSource])
    annotation (Line(points={{0,20},{0,-0.2}}, color={191,0,0}));
  connect(heatPort_x1,layer[1].heatPort_x1)
    annotation (Line(points={{-80,0},{-8,0}}, color={191,0,0}));
  for i in 1:nLayers-1 loop
    connect(layer[i].heatPort_x2,layer[i+1].heatPort_x1);
  end for;
  connect(heatPort_x2,layer[nLayers].heatPort_x2)
    annotation (Line(points={{8,0},{80,0}}, color={191,0,0}));

  annotation(defaultComponentName = "layeredEle",Icon(graphics={
    Rectangle(extent={{-80,80},{-40,-80}},lineColor={255,170,85},fillColor={255,170,85},fillPattern=FillPattern.Solid),
    Rectangle(extent={{0,80},{40,-80}},lineColor={255,170,85},fillColor={255,170,85},fillPattern=FillPattern.Solid),
    Rectangle(extent={{-40,80},{0,-80}},lineColor={255,85,85},fillColor={255,0,0},fillPattern=FillPattern.Solid),
    Rectangle(extent={{40,80},{80,-80}},lineColor={255,85,85},fillColor={255,0,0},fillPattern=FillPattern.Solid),
    Text(extent={{-14,71},{54,5}},lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={255,128,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="1"),
    Text(extent={{-46,-78},{46,-106}},lineColor={0,0,255},fillColor={230,230,230},fillPattern=  FillPattern.Solid,textString="%name")}),
Documentation(info="<html>
<p>
This model describes the one-dimensional heat conduction of a
body in x-direction with <code>nLayers</code> of an individual <code>material</code>. Each
layer can have a different <code>thickness</code> and an edge length <code>dy</code> and <code>dz</code>.
</p>
</html>", revisions="<html>
<ul>
<li>
April 24, 2019 by Christoph Nytsch-Geusen:<br/>
Adaptation to flexible geometries.
</li>
<li>
May 23, 2016 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end MultiLayerHeatConduction1DNodes;
