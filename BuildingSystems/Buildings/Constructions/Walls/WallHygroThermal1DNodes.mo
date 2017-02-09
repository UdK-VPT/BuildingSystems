within BuildingSystems.Buildings.Constructions.Walls;
model WallHygroThermal1DNodes
  "Hygro-thermal wall model with 1D discritisation of the single layers"
  extends BuildingSystems.Buildings.BaseClasses.WallHygroThermalGeneral;
  BuildingSystems.Interfaces.HeatPort heatSourcePort = construction.layer[layerWithHeatSource].heatPort_source[nodeWithHeatSource]if heatSource
    annotation (Placement(transformation(extent={{10,-48},{30,-28}}), iconTransformation(extent={{10,-48},{30,-28}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.MultiLayerHeatAndMoistureTransfer1DNodes construction(
    lengthY = width,
    lengthZ = height,
    nLayers = constructionData.nLayers,
    nNodes = nNodes,
    thickness = constructionData.thickness,
    T_start = T_start,
    phi_start = phi_start,
    material = constructionData.material)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  parameter Integer nNodes[constructionData.nLayers] = fill(1,constructionData.nLayers)
    "Number of numerical nodes of each layer"
    annotation(Dialog(tab ="Advanced",group="Heat sources"));
  parameter Integer nodeWithHeatSource = 1
    "Numerical node of the specified layer with internal heat source"
    annotation(Dialog(tab = "Advanced", group = "Heat sources"));
  parameter Boolean show_TSur = false
    "Show surface temperatures on both sides"
    annotation(Dialog(tab = "Advanced", group = "Surface variables"));
  parameter Boolean show_xSur = false
    "Show surface moisture on both sides"
    annotation(Dialog(tab = "Advanced", group = "Surface variables"));
  BuildingSystems.Interfaces.Temp_KOutput TSur_1 = toSurfacePort_1.heatPort.T if show_TSur
    "Temperature on surface side 1"
    annotation (Placement(transformation(extent={{-60,10},{-40,30}}), iconTransformation(extent={{-20,10},{-40,30}})));
  BuildingSystems.Interfaces.Temp_KOutput TSur_2 = toSurfacePort_2.heatPort.T if show_TSur
    "Temperature on surface side 2"
    annotation (Placement(transformation(extent={{-60,10},{-40,30}}), iconTransformation(extent={{20,10},{40,30}})));
  BuildingSystems.Interfaces.Moisture_absOutput xSur_1 = toSurfacePort_1.moisturePort.x if show_xSur
    "Absolute moisture on surface side 1"
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}}),iconTransformation(extent={{-20,-30},{-40,-10}})));
  BuildingSystems.Interfaces.Moisture_absOutput xSur_2 = toSurfacePort_2.moisturePort.x if show_xSur
    "Absolute moisture on surface side 2"
    annotation (Placement(transformation(extent={{-60,10},{-40,30}}), iconTransformation(extent={{20,-30},{40,-10}})));
equation
  connect(construction.heatPort_x2, toSurfacePort_2.heatPort) annotation (Line(
      points={{8,0},{20,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(toSurfacePort_1.heatPort, construction.heatPort_x1) annotation (Line(
      points={{-20,0},{-8,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(construction.moisturePort_x2, toSurfacePort_2.moisturePort) annotation (Line(
      points={{8,0},{20,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(toSurfacePort_1.moisturePort, construction.moisturePort_x1) annotation (Line(
      points={{-20,0},{-8,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  annotation (defaultComponentName="wall", Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
    Text(extent={{-16,81},{16,38}}, lineColor={120,0,120},lineThickness=0.5,fillColor={120,0,120},fillPattern=FillPattern.Solid,textString="1D")}));
end WallHygroThermal1DNodes;
