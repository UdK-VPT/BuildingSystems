within BuildingSystems.Buildings.BaseClasses;
partial model ZoneTemplateGeneral
  "Common template model for a thermal zone"

  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium in the air model of the zone"
    annotation (choicesAllMatching = true);
  parameter Modelica.SIunits.Volume V = 1.0
    "Air volume of the zone"
    annotation(Dialog(tab="General",group="Zone geometry"));
  parameter Modelica.SIunits.Length height = 1.0
    "Vertical height of the zone"
    annotation(Dialog(tab="General",group="Zone geometry"));
  parameter BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.const
    "Type of convection calculation of the zone surfaces"
    annotation(Dialog(tab="Advanced",group="Convection model on building facades"));
  parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaConstant = 1.0
    "Convective heat transfer coefficient for simplified calculations"
    annotation(Dialog(tab="Advanced",group="Convection model on building facades"));
  parameter Integer nMoistureSources = 0
    "Number of internal moisture sources of the thermal zone"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions1 = 0
    "Number of constructions with orientation 1"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions2 = 0
    "Number of constructions with orientation 2"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions3 = 0
    "Number of constructions with orientation 3"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions4 = 0
    "Number of constructions with orientation 4"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions5 = 0
    "Number of constructions with orientation 5"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions6 = 0
    "Number of constructions orientation 6"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes1 = 0
   "Number of air pathes with orientation 1"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes2 = 0
   "Number of air pathes with orientation 2"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes3 = 0
   "Number of air pathes with orientation 3"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes4 = 0
   "Number of air pathes with orientation 4"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes5 = 0
   "Number of air pathes with orientation 5"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes6 = 0
   "Number of air pathes with orientation 6"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Boolean prescribedAirchange = true
    "True: zone air change rate is prescribed by zone ambient; false: air path calculation"
    annotation(HideResult = true, Dialog(tab="General",group="Air change"));
  parameter Boolean geometricViewFactors = false
    "true: use of geometric view factors, false: use of surface area weighted view factors"
    annotation(HideResult = true, Dialog(tab="Advanced",group="View Factors"));
  parameter BuildingSystems.Types.ViewFactor ViewFac[nSurfaces,nSurfaces]=fill(fill(0.0,nSurfaces),nSurfaces)
    "Geometric view factor matrix of the thermal zone"
    annotation(HideResult = true,Dialog(tab="Advanced",group="View Factors"));
  BuildingSystems.Buildings.BaseClasses.RadiationDistribution radiationDistribution(
    nSurfaces=nSurfaces,
    nHeatSources=nHeatSourcesTotal,
    geometricViewFactors=geometricViewFactors,
    ViewFac=ViewFac)
    "Long-wave and short-wave radiation calculation of the zone"
    annotation (Placement(transformation(extent={{-24,-44},{24,4}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts1[nConstructions1](
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 1"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=180,origin={-94,40}), iconTransformation(extent={{-120,0},{-100,80}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts3[nConstructions3](
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 2"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=180,origin={94,-40}), iconTransformation(extent={{100,-80},{120,0}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts2[nConstructions2](
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 3"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=90,origin={40,94}), iconTransformation(extent={{-10,-40},{10,40}},rotation=90,origin={40,110})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts4[nConstructions4](
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 4"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=90,origin={-40,-94}), iconTransformation(extent={{-10,-40},{10,40}},rotation=90,origin={-40,-110})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts5[nConstructions5](
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 5"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=180,origin={84,80}),  iconTransformation(extent={{80,20},{100,100}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts6[nConstructions6](
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 6"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=180,origin={-84,-80}), iconTransformation(extent={{-10,-40},{10,40}},rotation=180,origin={-90,-60})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts1[nAirpathes1](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 1"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},origin={-94,-60}, rotation=270), iconTransformation(extent={{-40,-10},{40,10}},rotation=90,origin={-110,-40})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts2[nAirpathes2](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 2"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=180,origin={-40,94}), iconTransformation(extent={{-40,-10},{40,10}},rotation=180,origin={-40,110})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts3[nAirpathes3](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 3"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=270,origin={94,60}), iconTransformation(extent={{-40,-10},{40,10}},rotation=270,origin={110,40})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts4[nAirpathes4](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 4"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=180,origin={42,-94}), iconTransformation(extent={{-40,-10},{40,10}},rotation=180,origin={40,-110})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts5[nAirpathes5](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 5"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=270,origin={-84,-40}),iconTransformation(extent={{-40,-10},{40,10}},rotation=90,origin={-90,20})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts6[nAirpathes6](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 6"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=270,origin={84,40}), iconTransformation(extent={{-40,-10},{40,10}},rotation=270,origin={90,-20})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces1(
    nSurfaces=nConstructions1,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 1"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},origin={-80,40})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces2(
    nSurfaces=nConstructions2,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 2"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},rotation=-90,origin={40,80})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces3(
    nSurfaces=nConstructions3,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 3"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},rotation=180,origin={80,-40})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces4(
    nSurfaces=nConstructions4,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 4"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},rotation=90,origin={-40,-80})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces5(
    nSurfaces=nConstructions5,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 5"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},rotation=180,origin={80,-40})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces6(
    nSurfaces=nConstructions6,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 6"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},rotation=90,origin={-40,-80})));
  BuildingSystems.Interfaces.Temp_KOutput TSurfMean
    "Mean surface temperature of the zone"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={36,-20}),  iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-50,70})));
protected
  parameter Integer nHeatSourcesTotal = 0
    "Overall number of internal heat sources of the thermal zone";
	// Note, that with following three lines it is assumed, that there is always at least ONE construction!
  parameter Integer nSumConstructions = nConstructions1 + nConstructions2 + nConstructions3 + nConstructions4 + nConstructions5 + nConstructions6;
  parameter Integer nSurfaces = max(nSumConstructions,1)
    "Overall number of surfaces of the zone";
  parameter Integer nAirpathes = if prescribedAirchange then 2 else + nAirpathes1 + nAirpathes2 + nAirpathes3 + nAirpathes4 + nAirpathes5 + nAirpathes6
    "Overall number of air pathes of the zone";
  constant Modelica.SIunits.Density rho_nominal = 1.2
    "Air density under nominal conditions";
equation
  for i in 1:nConstructions1 loop
    connect(surfaces1.toConstructionPorts[i],toConstructionPorts1[i]);
    connect(surfaces1.toSurfacesPorts[i],radiationDistribution.toSurfacePorts[i]);
  end for;
  for i in 1:nConstructions2 loop
    connect(surfaces2.toConstructionPorts[i],toConstructionPorts2[i]);
    connect(surfaces2.toSurfacesPorts[i],radiationDistribution.toSurfacePorts[nConstructions1+i]);
  end for;
  for i in 1:nConstructions3 loop
    connect(surfaces3.toConstructionPorts[i],toConstructionPorts3[i]);
    connect(surfaces3.toSurfacesPorts[i],radiationDistribution.toSurfacePorts[nConstructions1+nConstructions2+i]);
  end for;
  for i in 1:nConstructions4 loop
    connect(surfaces4.toConstructionPorts[i],toConstructionPorts4[i]);
    connect(surfaces4.toSurfacesPorts[i],radiationDistribution.toSurfacePorts[nConstructions1+nConstructions2+nConstructions3+i]);
  end for;
  for i in 1:nConstructions5 loop
    connect(surfaces5.toConstructionPorts[i],toConstructionPorts5[i]);
    connect(surfaces5.toSurfacesPorts[i],radiationDistribution.toSurfacePorts[nConstructions1+nConstructions2+nConstructions3+nConstructions4+i]);
  end for;
  for i in 1:nConstructions6 loop
    connect(surfaces6.toConstructionPorts[i],toConstructionPorts6[i]);
    connect(surfaces6.toSurfacesPorts[i],radiationDistribution.toSurfacePorts[nConstructions1+nConstructions2+nConstructions3+nConstructions4+nConstructions5+i]);
  end for;
  connect(radiationDistribution.TSurfMean, TSurfMean)
    annotation (Line(points={{19.2,-20},{36,-20},{36,-20}}, color={0,0,127}));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
  Rectangle(extent={{-80,80},{80,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern =FillPattern.Solid),
  Text(extent={{-82,16},{10,-12}}, lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString= "%name"),
  Rectangle(extent={{100,100},{80,-100}},lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid),
  Rectangle(extent={{-80,100},{-100,-100}},lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid),
  Rectangle(extent={{-80,100},{80,80}}, lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid),
  Rectangle(extent={{-80,-80},{80,-100}},lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid)}));
end ZoneTemplateGeneral;
