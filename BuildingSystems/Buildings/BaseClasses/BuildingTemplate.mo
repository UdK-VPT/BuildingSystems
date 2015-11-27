within BuildingSystems.Buildings.BaseClasses;
partial model BuildingTemplate
  "Template model for a building"
  final package Medium = BuildingSystems.Media.Air;

  parameter Integer nZones = 0
    "Number of thermal zones of the building"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nHeatSources = 0
    "Number of heat sources of the building"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nMoistureSources = 0
    "Number of moisture sources of the building"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  final parameter Integer nSurfacesAmbient = surfacesToAmbient.nSurfaces
    "Number of surfaces (with air contact) to the building ambient"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.const
    "Type of convection calculation for outside building surfaces"
    annotation(HideResult = true,Dialog(tab="Advanced",group="Convection model on building facades"));
  parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaConstant= 10.0
    "Convective heat transfer coefficient for simplified calculations"
    annotation(Dialog(tab="Advanced",group="Convection model on building facades"));
  parameter Integer gridSurface[surfacesToAmbient.nSurfaces,2]=fill({1,1},surfacesToAmbient.nSurfaces)
   "Grid in y and z dimension of each surface"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter Integer nSurfacesSolid = 0
    "Number of surfaces (with contact to solids) to the building ambient"
    annotation(Dialog(tab="General",group="Ports"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAziBuilding = 0.0
    "Azimuth angle of the building"
    annotation(Dialog(tab="General",group="Orientation"));
  parameter Boolean prescribedAirchange = true
    "Switch for air change calculation"
    annotation(HideResult = true, Dialog(tab="General",group="Air change"));
  parameter Boolean useAirPathes = true
    "True: airpath calculation is possible; false: no airpath calculation"
    annotation(HideResult = true,Dialog(tab = "General", group = "Air change"));
  parameter Integer nAirpathes = 0
    "Number of air pathes to the building ambient"
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
  input BuildingSystems.Interfaces.Temp_KInput T_setHeating[nZones] if calcIdealLoads
    "Set air temperature for heating of each thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180, origin={100,80}), iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={98,80})));
  input BuildingSystems.Interfaces.Temp_KInput T_setCooling[nZones] if calcIdealLoads
    "Set air temperature for cooling of each thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={100,60}),   iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={98,60})));
  input BuildingSystems.Interfaces.AirchangeRateInput airchange[nZones] if prescribedAirchange
    "Air change rate of each thermal zone"
     annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={100,40}),   iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={98,40})));
  input BuildingSystems.Interfaces.Temp_KInput TAirAmb if prescribedAirchange
    "Air temperature of the building ambient"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={50,100}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={62,98})));
  input BuildingSystems.Interfaces.Moisture_absInput xAirAmb if prescribedAirchange
    "Absolute moisture of the building ambient"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={70,100}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={84,98})));
  output BuildingSystems.Interfaces.Temp_KOutput TAir[nZones] if show_TAir
    "Air temperature of each thermal zone"
    annotation (Placement(transformation(extent={{100,-80},{120,-60}}), iconTransformation(extent={{100,-80},{120,-60}})));
  output BuildingSystems.Interfaces.Moisture_absOutput xAir[nZones] if show_xAir
    "Air humidity  of each thermal zone" annotation (Placement(transformation(
    extent={{100,-100},{120,-80}}), iconTransformation(extent={{100,-100},{120,-80}})));
  output BuildingSystems.Interfaces.HeatFlowRateOutput Q_flow_cooling[nZones] if calcIdealLoads
    "Cooling power of each thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-80,-100}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-90,-110})));
  output BuildingSystems.Interfaces.HeatFlowRateOutput Q_flow_heating[nZones] if calcIdealLoads
    "Heating power of each thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={80,-100}),  iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={90,-110})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b toAmbientAirpathPorts[nAirpathes](
    redeclare each final package Medium = Medium) if useAirPathes
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=90,origin={96,1}),iconTransformation(extent={{-40,-90},{40,-70}},rotation=270,origin={170,-20})));
  BuildingSystems.Buildings.Interfaces.SurfaceToSurfacesPorts toAmbientSurfacesPorts[nSurfacesAmbient](
    nY=gridSurface[:,1],
    nZ=gridSurface[:,2])
    annotation (Placement(transformation(extent={{-8,-30},{8,30}},rotation=180,origin={-96,40}), iconTransformation(extent={{-100,0},{-80,80}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toAmbientAirPorts[nSurfacesAmbient](
    nY=gridSurface[:,1],
    nZ=gridSurface[:,2])
    annotation (Placement(transformation(extent={{-8,-30},{8,30}}, rotation=180,origin={-96,-40}),iconTransformation(extent={{-100,-80},{-80,0}})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfacesToAmbient(
    gridSurface=gridSurface,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant= alphaConstant)
    annotation (Placement(transformation(extent={{-31,-28},{31,28}},rotation=180,origin={-93,0})));
  BuildingSystems.Interfaces.HeatPort2D toSolidHeatPorts[nSurfacesSolid]
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=180,origin={-42,-96}), iconTransformation(extent={{-80,-100},{0,-80}})));
  BuildingSystems.Interfaces.HeatPorts heatSourcesPorts[nHeatSources] if heatSources
    annotation (Placement(transformation(extent={{-10,90},{10,110}}), iconTransformation(extent={{-8,92},{52,108}})));
  BuildingSystems.Interfaces.MoisturePorts moisturePorts[nMoistureSources] if moistureSources
    annotation (Placement(transformation(extent={{-60,90},{-40,110}}), iconTransformation(extent={{-68,92},{-8,106}})));
  BuildingSystems.Interfaces.MoisturePort2D toSolidMoisturePorts[nSurfacesSolid] if calcHygroThermal
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=180,origin={42,-96}),iconTransformation(extent={{0,-100},{80,-80}})));
  BuildingSystems.Buildings.Surfaces.SurfacesToSolids surfacesToSolids(calcHygroThermal=calcHygroThermal,nSurfaces=nSurfacesSolid) annotation (Placement(
    transformation(extent={{-32,-30},{32,30}},rotation=270,origin={0,-94})));
equation
  for i in 1:nSurfacesAmbient loop
    connect(surfacesToAmbient.toAirPorts[i],toAmbientAirPorts[i]);
    connect(surfacesToAmbient.toSurfacesPorts[i],toAmbientSurfacesPorts[i]);
  end for;
  for i in 1:nSurfacesSolid loop
    connect(surfacesToSolids.heatPorts[i],toSolidHeatPorts[i]);
    if calcHygroThermal then
      connect(surfacesToSolids.moisturePorts[i],toSolidMoisturePorts[i]);
    end if;
  end for;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
    Rectangle(extent={{-80,80},{80,-80}},lineColor={0,0,0},fillColor={230,230,230},fillPattern=FillPattern.Solid),
    Rectangle(extent={{20,62},{40,22}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Rectangle(extent={{-40,62},{-20,22}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Rectangle(extent={{-70,62},{-50,22}},fillColor={170,213,255},fillPattern=FillPattern.Solid,pattern=LinePattern.None,lineColor={0,0,0}),
    Rectangle(extent={{-10,62},{10,22}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Rectangle(extent={{50,62},{70,22}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Rectangle(extent={{-70,12},{-50,-28}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Rectangle(extent={{-40,12},{-20,-28}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Rectangle(extent={{-10,12},{10,-28}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Rectangle(extent={{20,12},{40,-28}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Rectangle(extent={{50,12},{70,-28}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Polygon(points={{-80,80},{-60,100},{100,100},{80,80},{-80,80}},lineColor={0,0,0},smooth=Smooth.None,fillColor={255,0,0},fillPattern=FillPattern.Solid),
    Polygon(points={{80,-80},{100,-60},{100,100},{80,80},{80,-80}},lineColor={0,0,0},smooth=Smooth.None,fillColor={215,215,215},fillPattern=FillPattern.Solid),
    Rectangle(extent={{-40,-38},{40,-78}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Rectangle(extent={{50,-38},{70,-78}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Rectangle(extent={{-70,-38},{-50,-78}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={170,213,255},fillPattern=FillPattern.Solid),
    Text(extent={{102,-94},{194,-122}},lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString = "%name")}));
end BuildingTemplate;
