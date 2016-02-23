within BuildingSystems.Buildings.Constructions.Walls;
model WallThermal3D
  "Thermal wall model with 3D heat conduction"
  extends BuildingSystems.Buildings.BaseClasses.WallThermalGeneral(
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData);
  BuildingSystems.Interfaces.HeatPorts heatPorts_y1[constructionData.nLayers,nZ]
    annotation (Placement(transformation(extent={{-4,-44},{4,-36}}),iconTransformation(extent={{-12,-82},{12,-76}})));
  BuildingSystems.Interfaces.HeatPorts heatPorts_y2[constructionData.nLayers,nZ]
    annotation (Placement(transformation(extent={{-4,36},{4,44}}), iconTransformation(extent={{-12,76},{12,82}})));
  BuildingSystems.Interfaces.HeatPorts heatPorts_z2[constructionData.nLayers,nY]
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=90,origin={20,34}), iconTransformation(extent={{-10,-3},{10,3}},rotation=90,origin={19,60})));
  BuildingSystems.Interfaces.HeatPorts heatPorts_z1[constructionData.nLayers,nY]
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=90,origin={-20,-34}), iconTransformation(extent={{-10,-3},{10,3}},rotation=90, origin={-19,-60})));
  BuildingSystems.HAM.HeatConduction.OneLayerHeatConduction3D layer[constructionData.nLayers](
    thickness=constructionData.thickness,
    material=constructionData.material,
    T_start=T_start,
    each nY=nY,
    each nZ=nZ,
    each lengthSegY=lengthSegY,
    each lengthSegZ=lengthSegZ)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Interfaces.HeatPorts heatSourcePorts[nY,nZ] if heatSource
    annotation (Placement(transformation(extent={{10,-48},{30,-28}}), iconTransformation(extent={{10,-48},{30,-28}})));
equation
  // Moisture and radiation boundary conditions
  for j in 1:nY loop
    for k in 1:nZ loop
      connect(toSurfacePort_1.moisturePort[j,k], moistBcPort1.moisturePort) annotation (Line(
        points={{-20,0},{-20,-11.2}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
      connect(toSurfacePort_2.moisturePort[j,k], moistBcPort2.moisturePort) annotation (Line(
          points={{20,0},{20,-11.2}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(radBcPort1.radiationPort, toSurfacePort_1.radiationPort_out[j,k]) annotation (Line(
          points={{-20,11.2},{-20,0}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
      connect(radBcPort2.radiationPort, toSurfacePort_2.radiationPort_out[j,k]) annotation (Line(
          points={{20,11.2},{20,0}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
    end for;
  end for;
  // Internal heat sources
  for j in 1:nY loop
    for k in 1:nZ loop
      connect(heatSourcePorts[j,k],layer[layerWithHeatSource].cell[j,k].heatPort_source);
    end for;
  end for;
  // Connections for heat conduction between the layers
  for i in 1:constructionData.nLayers-1 loop
    connect(layer[i].heatPorts_x2,layer[i+1].heatPorts_x1);
  end for;
  // Connections for heat conduction of the first and last layer to the outer surface connectors
  connect(toSurfacePort_1.heatPort, layer[1].heatPorts_x1) annotation (Line(
      points={{-20,0},{-8,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(layer[constructionData.nLayers].heatPorts_x2, toSurfacePort_2.heatPort) annotation (Line(
      points={{8,0},{20,0}},
      color={191,0,0},
      smooth=Smooth.None));

  // Connections for heat conduction to the outer solid connectors
  // y-dimension
  for i in 1:constructionData.nLayers loop
    for k in 1:nZ loop
      connect(layer[i].heatPorts_y1[k], heatPorts_y1[i,k]) annotation (Line(
          points={{0,-8},{0,-40}},
          color={127,0,0},
          smooth=Smooth.None));
      connect(layer[i].heatPorts_y2[k], heatPorts_y2[i,k]) annotation (Line(
          points={{0,8},{0,40}},
          color={127,0,0},
          smooth=Smooth.None));
    end for;
  end for;
  // z-dimension
  for i in 1:constructionData.nLayers loop
    for j in 1:nY loop
      connect(layer[i].heatPorts_z1[j], heatPorts_z1[i,j]) annotation (Line(
          points={{-6,-8},{-8,-8},{-8,-34},{-20,-34}},
          color={127,0,0},
          smooth=Smooth.None));
      connect(layer[i].heatPorts_z2[j], heatPorts_z2[i,j]) annotation (Line(
          points={{6,8},{6,34},{20,34}},
          color={127,0,0},
          smooth=Smooth.None));
    end for;
  end for;

  annotation (defaultComponentName="wall", Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
    Text(extent={{-16,81},{16,38}}, lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="3D")}));
end WallThermal3D;
