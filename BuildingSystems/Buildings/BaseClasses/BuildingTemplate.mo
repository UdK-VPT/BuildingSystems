within BuildingSystems.Buildings.BaseClasses;
partial model BuildingTemplate
  "General template for building models"
  final package Medium = BuildingSystems.Media.Air;

  parameter Boolean flexibleOrientation = false
    "False (default) or true: building can dynamically rotate (azimuth angle of the building from input)"
    annotation (Evaluate=true, Dialog(tab = "General", group = "Orientation"));
  parameter Modelica.Units.NonSI.Angle_deg angleDegAziBuilding=0.0
    "Fixed azimuth angle of the building: south: 0 deg, east: -90 deg, west +90 deg, north: 180 deg (if flexibleOrientation == false)"
    annotation (Dialog(tab="General", group="Orientation"));
  output BuildingSystems.Interfaces.Angle_degOutput angleDegAziBuilding_internal
    "Azimuth angle of the building";
  input BuildingSystems.Interfaces.Angle_degInput angleDegAziBuilding_in(
    min=-180.0,
    max=180.0) if flexibleOrientation == true
    "Azimuth angle of the building from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={-140,120}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90, origin={-60,98})));
  parameter Integer nZones = 0
    "Number of thermal zones of the building"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nHeatSources = 0
    "Number of heat sources of the building"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nMoistureSources = 0
    "Number of moisture sources of the building"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  final parameter Integer nSurfacesAmbience = surfacesToAmbience.nSurfaces
    "Number of surfaces (with air contact) to the building ambience"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.const
    "Type of convection calculation for outside building surfaces"
    annotation(HideResult = true,Dialog(tab="Advanced",group="Convection model on building facades"));
  parameter Modelica.Units.SI.SurfaceCoefficientOfHeatTransfer alphaConstant=
      10.0 "Convective heat transfer coefficient for simplified calculations"
    annotation (Dialog(tab="Advanced", group=
          "Convection model on building facades"));
  parameter Integer nSurfacesSolid = 0
    "Number of surfaces (with contact to solids) to the building ambience"
    annotation(Dialog(tab="General",group="Solid building ambience"));
  parameter Boolean prescribedAirchange = true
    "Switch for air change calculation"
    annotation(HideResult = true, Dialog(tab="General",group="Air change"));
  parameter Boolean useAirPaths = true
    "True: airpath calculation is possible; false: no airpath calculation"
    annotation(HideResult = true,Dialog(tab = "General", group = "Air change"));
  parameter Integer nAirpaths = 0
    "Number of air paths to the building ambience"
    annotation(Dialog(tab="General",group="Air change"));
  parameter Boolean calcHygroThermal = false
    "Switch for hygro-thermal calculation"
    annotation(HideResult = true);
  parameter Boolean calcIdealLoads = true
    "True: calculation of the ideal heating and cooling load; false: no calculation"
    annotation(HideResult = true,Dialog(tab="General",group="Heat and cooling load calculation"));
  parameter Boolean heatSources = false
    "True: heat source present; false: no heat source present"
    annotation(HideResult = true,Dialog(tab="General",group="Heat and moisture sources"));
  parameter Boolean moistureSources = false
    "True: moisture source present; false: no moisture source present"
    annotation(HideResult = true,Dialog(tab="General",group="Heat and moisture sources"));
  parameter Boolean show_TAir = false
    "Show air temperatures of each building zone as an output (vector)"
    annotation(HideResult = true,Dialog(tab="Advanced",group="Optional"));
  parameter Boolean show_xAir = false
    "Show air humidity of each building zone as an output (vector)"
    annotation(HideResult = true,Dialog(tab="Advanced",group="Optional"));
  parameter Boolean show_TSur = false
    "Show suface temperatures of each building element as an output (vector)"
    annotation(HideResult = true,Dialog(tab="Advanced",group="Optional"));
  parameter Integer nSurfaces = 0
    "if show_TSur = true: Overall number of building surfaces"
    annotation(Dialog(tab = "Advanced", group = "Optional"), HideResult=true);
  input BuildingSystems.Interfaces.Temp_KInput T_setHeating[nZones] if calcIdealLoads
    "Set air temperature for heating of each thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180, origin={180,80}), iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={98,80})));
  input BuildingSystems.Interfaces.Temp_KInput T_setCooling[nZones] if calcIdealLoads
    "Set air temperature for cooling of each thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={180,60}),   iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={98,60})));
  input BuildingSystems.Interfaces.AirchangeRateInput airchange[nZones] if prescribedAirchange
    "Air change rate of each thermal zone"
     annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={180,40}),   iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={98,40})));
  input BuildingSystems.Interfaces.Temp_KInput TAirAmb if prescribedAirchange
    "Air temperature of the building ambience"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={50,120}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={62,98})));
  input BuildingSystems.Interfaces.Moisture_absInput xAirAmb if prescribedAirchange
    "Absolute moisture of the building ambience"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={70,120}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={84,98})));
  output BuildingSystems.Interfaces.Temp_KOutput TAir[nZones] if show_TAir
    "Air temperature of each thermal zone"
    annotation (Placement(transformation(extent={{180,-80},{200,-60}}), iconTransformation(extent={{180,-80},{200,-60}})));
  output BuildingSystems.Interfaces.Moisture_absOutput xAir[nZones] if show_xAir
    "Air humidity  of each thermal zone" annotation (Placement(transformation(
    extent={{180,-100},{200,-80}}), iconTransformation(extent={{180,-100},{200,-80}})));
  output BuildingSystems.Interfaces.Temp_KOutput TSur[nSurfaces] if show_TSur
    "Surface temperatures of the individual building elements"
    annotation (Placement(transformation(extent={{180,-60},{200,-40}}),iconTransformation(extent={{180,-60},{200,-40}})));
  output BuildingSystems.Interfaces.HeatFlowRateOutput Q_flow_cooling[nZones] if calcIdealLoads
    "Cooling power of each thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-80,-122}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-90,-110})));
  output BuildingSystems.Interfaces.HeatFlowRateOutput Q_flow_heating[nZones] if calcIdealLoads
    "Heating power of each thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={80,-122}),  iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={90,-110})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b toAmbienceAirpathPorts[nAirpaths](
    redeclare each final package Medium = Medium) if useAirPaths
    "Interfaces for air paths to the building ambience"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=90,origin={180,1}),iconTransformation(extent={{-40,-90},{40,-70}},rotation=270,origin={170,-20})));
  BuildingSystems.Buildings.Interfaces.SurfaceToSurfacesPorts toAmbienceSurfacesPorts[nSurfacesAmbience]
    "Interfaces between outside building surfaces to surfaces of the building ambience"
    annotation (Placement(transformation(extent={{-8,-30},{8,30}},rotation=180,origin={-180,40}),iconTransformation(extent={{-100,0},{-80,80}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toAmbienceAirPorts[nSurfacesAmbience]
    "Interfaces between outside building surfaces to the air of the building ambience"
    annotation (Placement(transformation(extent={{-8,-30},{8,30}}, rotation=180,origin={-180,-40}),iconTransformation(extent={{-100,-80},{-80,0}})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfacesToAmbience(
    surface(each convectionOnSurface = convectionOnSurfaces,
    each alphaConstant = alphaConstant))
    "Model for all building surfaces to the building ambience"
    annotation (Placement(transformation(extent={{-31,-28},{31,28}},rotation=180,origin={-177,0})));
  BuildingSystems.Interfaces.HeatPorts toSolidHeatPorts[nSurfacesSolid]
    "Heat port to the ground under the building"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=180,origin={-42,-118}),iconTransformation(extent={{-80,-100},{0,-80}})));
  BuildingSystems.Interfaces.HeatPorts conHeatSourcesPorts[nHeatSources] if heatSources
    "Heat port to internal convective heat sources of the building" annotation (
     Placement(transformation(extent={{-54,110},{-34,130}}), iconTransformation(extent={{-10,90},{10,110}})));
  BuildingSystems.Interfaces.HeatPorts radHeatSourcesPorts[nHeatSources] if heatSources
    "Heat port to internal long-wave radiation heat sources of the building"
    annotation (Placement(transformation(extent={{-10,110},{10,130}}),iconTransformation(extent={{10,90},{30,110}})));
  BuildingSystems.Interfaces.MoisturePorts moisturePorts[nMoistureSources] if moistureSources
    "Moisture port to internal moisture sources"
    annotation (Placement(transformation(extent={{-98,110},{-78,130}}),iconTransformation(extent={{-40,90},{-20,110}})));
  BuildingSystems.Interfaces.MoisturePorts toSolidMoisturePorts[nSurfacesSolid] if calcHygroThermal
    "Mosture port to the ground under the building"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=180,origin={42,-118}),iconTransformation(extent={{0,-100},{80,-80}})));
  BuildingSystems.Buildings.Surfaces.SurfacesToSolids surfacesToSolids(calcHygroThermal=calcHygroThermal,nSurfaces=nSurfacesSolid)
    "Model for all building surfaces to the ground under the building"
    annotation (Placement(transformation(extent={{-32,-30},{32,30}},rotation=270,origin={0,-116})));
equation
  if flexibleOrientation == false then
    angleDegAziBuilding_internal = angleDegAziBuilding;
  else
    connect(angleDegAziBuilding_internal, angleDegAziBuilding_in);
  end if;
  for i in 1:nSurfacesAmbience loop
    connect(surfacesToAmbience.toAirPorts[i],toAmbienceAirPorts[i]);
    connect(surfacesToAmbience.toSurfacesPorts[i],toAmbienceSurfacesPorts[i]);
  end for;
  for i in 1:nSurfacesSolid loop
    connect(surfacesToSolids.heatPorts[i],toSolidHeatPorts[i]);
    if calcHygroThermal then
      connect(surfacesToSolids.moisturePorts[i],toSolidMoisturePorts[i]);
    end if;
  end for;

  annotation (defaultComponentName="building", Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
    Rectangle(extent={{-80,80},{80,-80}},lineColor={0,0,0},fillColor={230,230,230},fillPattern = FillPattern.Solid),
    Rectangle(extent={{20,62},{40,22}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-40,62},{-20,22}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-70,62},{-50,22}},fillColor={170,213,255},fillPattern=FillPattern.Solid,pattern=LinePattern.None,lineColor={0,0,0}),
    Rectangle(extent={{-10,62},{10,22}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{50,62},{70,22}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-70,12},{-50,-28}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-40,12},{-20,-28}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-10,12},{10,-28}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{20,12},{40,-28}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{50,12},{70,-28}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Polygon(points={{-80,80},{-60,100},{100,100},{80,80},{-80,80}},lineColor={0,0,0},smooth=Smooth.None,fillColor={255,0,0},fillPattern = FillPattern.Solid),
    Polygon(points={{80,-80},{100,-60},{100,100},{80,80},{80,-80}},lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-40,-38},{40,-78}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{50,-38},{70,-78}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-70,-38},{-50,-78}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Text(extent={{102,-94},{194,-122}},lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString = "%name")}),
    Diagram(coordinateSystem(extent={{-180,-120},{180,120}})),
Documentation(info="<html>
<p>
This is partial model description of a building template.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end BuildingTemplate;
