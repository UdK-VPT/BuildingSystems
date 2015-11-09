within BuildingSystems.Buildings.Constructions.Walls;
model WallHygroThermal1DNodes
  "Hygro-thermal wall model with 1D discritisation of the single layers"
  extends BuildingSystems.Buildings.BaseClasses.WallHygroThermalGeneral(
    final nY=1,
    final nZ=1);
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
equation
  connect(construction.heatPort_x2, toSurfacePort_2.heatPort[1,1]) annotation (Line(
      points={{8,0},{20,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(toSurfacePort_1.heatPort[1,1], construction.heatPort_x1) annotation (Line(
      points={{-20,0},{-8,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(construction.moisturePort_x2, toSurfacePort_2.moisturePort[1,1]) annotation (Line(
      points={{8,0},{20,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(toSurfacePort_1.moisturePort[1,1], construction.moisturePort_x1) annotation (Line(
      points={{-20,0},{-8,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
    Text(extent={{-16,81},{16,38}}, lineColor={120,0,120},lineThickness=0.5,fillColor={120,0,120},fillPattern=FillPattern.Solid,textString="1D")}));
end WallHygroThermal1DNodes;
