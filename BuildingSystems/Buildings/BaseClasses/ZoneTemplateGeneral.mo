within BuildingSystems.Buildings.BaseClasses;
partial model ZoneTemplateGeneral
  "Template model of a thermal zone"
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
  parameter Integer nConstructions = 0
    "Number of constructions"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpaths = 0
   "Number of external air paths"
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
    annotation (Placement(transformation(extent={{-24,-84},{24,-36}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts[nConstructions](
      moisturePort(x(each start = 0.005)))
    "Interfaces of the zone to the constructions"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},    rotation=180,origin={0,0}),
      iconTransformation(extent={{-20,-20},{20,20}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts[nAirpaths](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to the air paths"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},origin={-94,-60}, rotation=270),
      iconTransformation(extent={{-40,-10},{40,10}},rotation=180,origin={-60,110})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces(
    nSurfaces=nConstructions,
    surface(each convectionOnSurface = convectionOnSurfaces,
            each alphaConstant = alphaConstant))
    "surface models of the zone"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},origin={-80,40})));
  BuildingSystems.Interfaces.Temp_KOutput TSurfMean
    "Mean surface temperature of the zone"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={40,-60}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={110,-50})));
protected
  parameter Integer nHeatSourcesTotal = 0
    "Overall number of internal heat sources of the thermal zone";
  // Note, that with following three lines it is assumed, that there is always at least ONE construction!
  parameter Integer nSurfaces = max(nConstructions,1)
    "Overall number of surfaces of the zone";
  parameter Integer nAirpathsInternal = if prescribedAirchange then 2 else + nAirpaths
    "Overall number of air paths of the zone";
  constant Modelica.SIunits.Density rho_nominal = 1.2
    "Air density under nominal conditions";
equation
  for i in 1:nConstructions loop
    connect(surfaces.toConstructionPorts[i],toConstructionPorts[i]);
    connect(surfaces.toSurfacesPorts[i],radiationDistribution.toSurfacePorts[i]);
  end for;
  connect(radiationDistribution.TSurfMean, TSurfMean)
    annotation (Line(points={{19.2,-60},{40,-60}}, color={0,0,127}));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-80,80},{80,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid),
    Text(extent={{-46,-132},{46,-160}},lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString="%name"),
  Rectangle(extent={{100,100},{80,-100}},lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid),
  Rectangle(extent={{-80,100},{-100,-100}},lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid),
  Rectangle(extent={{-80,100},{80,80}}, lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid),
  Rectangle(extent={{-80,-80},{80,-100}},lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid)}),
Documentation(info="<html>
<p>
This is a template model of a thermal zone.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ZoneTemplateGeneral;
