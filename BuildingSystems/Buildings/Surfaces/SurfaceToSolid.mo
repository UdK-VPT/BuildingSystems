within BuildingSystems.Buildings.Surfaces;
model SurfaceToSolid
  "Surface model between a constructions and a solid material"
  extends Buildings.BaseClasses.SurfaceGeneral;
  BuildingSystems.Interfaces.HeatPort heatPort
    annotation (Placement(transformation(extent={{0,-50},{20,-30}}),iconTransformation(extent={{0,-46},{12,-34}})));
  BuildingSystems.Interfaces.MoisturePort moisturePort if calcHygroThermal
    annotation (Placement(transformation(extent={{0,30},{20,50}}), iconTransformation(extent={{0,34},{12,46}})));
  BuildingSystems.Climate.Sources.RadiationFixed radBc(
    IrrDir_constant=0.0,
    IrrDif_constant=0.0,
    angleDegInc_constant=0.0)
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=180,origin={10,0})));
  parameter Boolean calcHygroThermal = false
    "Switch for hygro-thermal calculation"
    annotation(HideResult = true);
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.AbsoluteMoistureFixed moistBc(x_constant=0.0) if not calcHygroThermal
    "Dummy boundary condition for absolute moisture";
equation
  connect(toConstructionPort.moisturePort,moistBc.moisturePort);
  connect(toConstructionPort.radiationPort_in,radBc.radiationPort) annotation (Line(
    points={{-6,0},{5.2,0}},color={0,0,0},pattern=LinePattern.Solid,smooth=Smooth.None));
  connect(toConstructionPort.moisturePort,moisturePort);
  connect(toConstructionPort.heatPort,heatPort);
end SurfaceToSolid;
