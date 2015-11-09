within BuildingSystems.Buildings.Surfaces;
model SurfacesToSolids
  "Set of surface models between a set of constructions and solid materials"
  parameter Integer nSurfaces=1;
  parameter Integer gridSurface[nSurfaces,2]=fill({1,1},nSurfaces)
    "Grid in y and z dimension of each surface";
  parameter Boolean calcHygroThermal = false
    "Switch for hygro-thermal calculation";
  BuildingSystems.Buildings.Surfaces.SurfaceToSolid surface[nSurfaces](
    each calcHygroThermal=calcHygroThermal,
    nY = gridSurface[:, 1],
    nZ = gridSurface[:, 2])
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts[nSurfaces](
    nY = gridSurface[:,1],
    nZ = gridSurface[:,2])
    annotation (Placement(transformation(extent={{-20,-40},{0,40}}), iconTransformation(extent={{-20,-40},{0,40}})));
  BuildingSystems.Interfaces.HeatPort2D heatPorts[nSurfaces](
    nY = gridSurface[:,1],
    nZ = gridSurface[:,2])
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,40}), iconTransformation(extent={{-40,-10},{40,10}},rotation=90,origin={10,40})));
  BuildingSystems.Interfaces.MoisturePort2D moisturePorts[nSurfaces](
    nY = gridSurface[:,1],
    nZ = gridSurface[:,2]) if calcHygroThermal
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,-40}),iconTransformation(extent={{-40,-10},{40,10}},rotation=90,origin={10,-40})));
equation
  for i in 1:nSurfaces loop
    connect(surface[i].toConstructionPort,toConstructionPorts[i])
        annotation (Line(
        points={{-10,0},{-0.6,0}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surface[i].heatPort,heatPorts[i].heatPort)
        annotation (Line(
        points={{0.6,4},{2,4},{2,40},{10,40}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    if calcHygroThermal then
      connect(surface[i].moisturePort,moisturePorts[i].moisturePort)
          annotation (Line(
          points={{0.6,-4},{2,-4},{2,-40},{10,-40}},
          color={0,0,0},
          pattern=LinePattern.Solid,
          smooth=Smooth.None));
    end if;
  end for;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-6,80},{6,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid)}));
end SurfacesToSolids;
