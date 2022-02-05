within BuildingSystems.Buildings.BaseClasses;
partial model ZoneTemplateGeneral
  "Template model of a thermal zone"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium in the air model of the zone"
    annotation (choicesAllMatching = true);
  parameter BuildingSystems.Buildings.Types.GeometryType geometryType=
    BuildingSystems.Buildings.Types.GeometryType.Fixed
    "Fixed (default) or flexible geometry"
    annotation (Evaluate=true, Dialog(tab = "Geometry", group = "Zone geometry"));
  parameter Modelica.Units.SI.Volume V=1.0
    "Air volume of the zone (if geometryType == Fixed)"
    annotation (Dialog(tab="Geometry", group="Zone geometry"));
  input BuildingSystems.Interfaces.VolumeInput V_in(
    min=0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
    "Air volume of the zone from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-110,0}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=180,origin={-110,0})));
  parameter Modelica.Units.SI.Length position[3]={0.0,0.0,0.0}
    "Position (if geometryType == Fixed)"
    annotation (Dialog(tab="Geometry", group="Zone geometry"));
  input BuildingSystems.Interfaces.LengthInput position_in[3]
    if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
    "Position from input"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={-110,20}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-110,20})));
  output BuildingSystems.Interfaces.LengthOutput position_internal[3]
    "Position"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={110,20}),
          iconTransformation(extent={{-10,-10},{10,10}},rotation=0,origin={110,50})));
  parameter Modelica.Units.SI.Length height=1.0 "Vertical height of the zone"
    annotation (Dialog(tab="General", group="Air change"));
  parameter BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.const
    "Type of convection calculation of the zone surfaces"
    annotation(Dialog(tab="Advanced",group="Convection model on building facades"));
  parameter Modelica.Units.SI.SurfaceCoefficientOfHeatTransfer alphaConstant=
      1.0 "Convective heat transfer coefficient for simplified calculations"
    annotation (Dialog(tab="Advanced", group=
          "Convection model on building facades"));
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
    "True: zone air change rate is prescribed by zone ambience; false: air path calculation"
    annotation(HideResult = true, Dialog(tab="General",group="Air change"));
  parameter Boolean geometricViewFactors = false
    "true: use of geometric view factors, false: use of surface area weighted view factors"
    annotation(HideResult = true, Dialog(tab="Geometry",group="View Factors"));
  parameter BuildingSystems.Types.ViewFactor ViewFac[nSurfaces,nSurfaces]=fill(fill(0.0,nSurfaces),nSurfaces)
    "Geometric view factor matrix of the thermal zone"
    annotation(HideResult = true,Dialog(tab="Geometry",group="View Factors"));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts[nConstructions](
      moisturePort(x(each start = 0.005)))
    "Interfaces of the zone to the constructions"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=180,origin={0,0}),
      iconTransformation(extent={{-20,-20},{20,20}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts[nAirpaths](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to the air paths"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},origin={-94,-60}, rotation=270),
      iconTransformation(extent={{-40,-10},{40,10}},rotation=180,origin={-60,110})));
  BuildingSystems.Interfaces.Temp_KOutput TSurfMean
    "Mean surface temperature of the zone"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={40,-60}),
     iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={110,-30})));
protected
  output BuildingSystems.Interfaces.VolumeOutput V_internal
    "Air volume of the zone";
  BuildingSystems.Buildings.BaseClasses.RadiationDistribution radiationDistribution(
    nSurfaces=nSurfaces,
    nHeatSources=nHeatSourcesTotal,
    geometricViewFactors=geometricViewFactors,
    ViewFac=ViewFac)
    "Long-wave and short-wave radiation calculation of the zone"
    annotation (Placement(transformation(extent={{-24,-84},{24,-36}})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces(
    nSurfaces=nConstructions,
    surface(each convectionOnSurface = convectionOnSurfaces,
            each alphaConstant = alphaConstant))
    "surface models of the zone"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},origin={-80,40})));
  parameter Integer nHeatSourcesTotal = 0
    "Overall number of internal heat sources of the thermal zone";
  // Note, that with following three lines it is assumed, that there is always at least ONE construction!
  parameter Integer nSurfaces = max(nConstructions,1)
    "Overall number of surfaces of the zone";
  parameter Integer nAirpathsInternal = if prescribedAirchange then 2 else + nAirpaths
    "Overall number of air paths of the zone";
  constant Modelica.Units.SI.Density rho_nominal=1.2
    "Air density under nominal conditions";
equation
  if geometryType == BuildingSystems.Buildings.Types.GeometryType.Fixed then
    V_internal = V;
    position_internal = position;
  else
    connect(V_internal, V_in);
    connect(position_internal, position_in);
  end if;

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
April 24, 2019 by Christoph Nytsch-Geusen:<br/>
Adaptation to flexible geometries.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ZoneTemplateGeneral;
