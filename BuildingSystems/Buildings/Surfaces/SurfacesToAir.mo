within BuildingSystems.Buildings.Surfaces;
model SurfacesToAir
  "Set of surfaces between a set of constructions and the air"
  parameter Integer nSurfaces=0 "Number of surfaces"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface[nSurfaces]
    "Set of surfaces"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts[nSurfaces]
    "Set of ports to the constructions"
    annotation (Placement(transformation(extent={{-20,-40},{0,40}}), iconTransformation(extent={{-20,-40},{0,40}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToSurfacesPorts toSurfacesPorts[nSurfaces]
    "Set of ports to other surfaces"
    annotation (Placement(transformation(extent={{0,0},{20,80}}), iconTransformation(extent={{0,0},{20,80}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toAirPorts[nSurfaces]
    "Set of ports to the air"
    annotation (Placement(transformation(extent={{0,-80},{20,0}}), iconTransformation(extent={{0,-80},{20,0}})));
equation
  for i in 1:nSurfaces loop
    connect(surface[i].toConstructionPort,toConstructionPorts[i]) annotation (Line(
        points={{-10,0},{-0.6,0}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surface[i].toSurfacesPort,toSurfacesPorts[i]) annotation (Line(
        points={{0.6,4},{2,4},{2,40},{10,40}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface[i].toAirPort,toAirPorts[i]) annotation (Line(
        points={{0.6,-4},{2,-4},{2,-40},{10,-40}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
  end for;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-6,80},{6,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid)}));
end SurfacesToAir;
