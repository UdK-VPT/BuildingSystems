within BuildingSystems.HAM.HeatAndMoistureTransport;
model MultiLayerHeatAndMoistureTransfer1DNodes
  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport1DNodes layer[nLayers](
    material=material,
    each lengthY=lengthY,
    each lengthZ=lengthZ,
    lengthX=thickness,
    nNodesX=nNodes,
    T_start=T_start,
    phi_start=phi_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  BuildingSystems.Interfaces.HeatPort heatPort_x1
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0}),
      iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0})));

  BuildingSystems.Interfaces.HeatPort heatPort_x2
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0}),
      iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0})));

  BuildingSystems.Interfaces.HeatPort heatPort_source
    "Heat port for internal heat source"
    annotation(Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,origin={0,20}),
      iconTransformation(extent={{-10,-10},{10,10}})));

  BuildingSystems.Interfaces.MoisturePort moisturePort_x1
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,20}),
      iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,20})));

  BuildingSystems.Interfaces.MoisturePort moisturePort_x2
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,20}),
      iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,20})));

  parameter BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral material[nLayers]
    annotation (HideResult=true);
  parameter Modelica.SIunits.Length lengthY
    "Length in y dimension";
  parameter Modelica.SIunits.Length lengthZ
    "Length in z dimension";
  parameter Integer nLayers = 1
    "Number of material layers in the x dimension";
  parameter Integer nNodes[nLayers] = {1}
    "Number of numerical nodes of layer i"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Modelica.SIunits.Length thickness[nLayers]
    "Thickness of each layer";
  parameter Modelica.SIunits.Temp_K T_start[nLayers]={293.15 for i in 1:nLayers}
    "Start temperature of each layer"
    annotation (Dialog(tab="Initialization"));
  parameter BuildingSystems.Types.RelativeHumidity phi_start[nLayers]={0.5 for i in 1:nLayers}
    "Start relative humidity of each layer"
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
  connect(moisturePort_x1,layer[1].moisturePort_x1)
    annotation (Line(points={{-80,20},{-20,20},{-20,2},{-8,2}}, color={120,0,120}));
  for i in 1:nLayers-1 loop
    connect(layer[i].heatPort_x2,layer[i+1].heatPort_x1);
    connect(layer[i].moisturePort_x2,layer[i+1].moisturePort_x1);
  end for;
  connect(heatPort_x2,layer[nLayers].heatPort_x2)
    annotation (Line(points={{8,0},{80,0}}, color={191,0,0}));
  connect(moisturePort_x2,layer[nLayers].moisturePort_x2)
    annotation (Line(points={{80,20},{20,20},{20,2},{8,2}}, color={120,0,120}));

  annotation(defaultComponentName = "multiLayerHeatAndMoistureTransfer1DNodes",Icon(graphics={
    Rectangle(extent={{-80,80},{-40,-80}},lineColor={255,170,85},fillColor={255,170,85},fillPattern=FillPattern.Solid),
    Rectangle(extent={{0,80},{40,-80}},lineColor={255,170,85},fillColor={255,170,85},fillPattern=FillPattern.Solid),
    Rectangle(extent={{-40,80},{0,-80}},lineColor={255,85,85},fillColor={255,0,0},fillPattern=FillPattern.Solid),
    Rectangle(extent={{40,80},{80,-80}},lineColor={255,85,85},fillColor={255,0,0},fillPattern=FillPattern.Solid),
    Text(extent={{-14,71},{54,5}},lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={120,0,120},lineThickness=0.5,fillColor={120,0,120},fillPattern=FillPattern.Solid,textString="1"),
    Text(extent={{-46,-78},{46,-106}},lineColor={0,0,255},fillColor={230,230,230},fillPattern=  FillPattern.Solid,textString="%name")}));
end MultiLayerHeatAndMoistureTransfer1DNodes;
