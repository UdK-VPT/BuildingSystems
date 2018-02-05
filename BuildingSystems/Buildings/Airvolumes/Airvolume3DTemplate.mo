within BuildingSystems.Buildings.Airvolumes;
model Airvolume3DTemplate
  "Generic air volume model"
  extends BuildingSystems.Buildings.BaseClasses.AirvolumeGeneral;
  BuildingSystems.Interfaces.VelocityOutput v[nAirElements]
    "Air velocity (magnitude)"
    annotation (Placement(transformation(extent={{70,-70},{90,-50}}), iconTransformation(extent={{70,-70},{90,-50}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter surfaceAdapter[nSurfaces]
  (each posX = 0.0,
   each posY = 0.0,
   each posZ = 0.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={0,60})));
equation
  connect(surfaceAdapter.surfaceToAirPort, toSurfacePorts)
    annotation (Line(points={{0,61},{0,70.5},{0,80}}, color={0,0,0}));
end Airvolume3DTemplate;
