within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone0D
  "Strong simplified building model with 3 thermal capacities"
  extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    final nZones = 1,
    final prescribedAirchange = true,
    final useAirPathes = false,
    final nAirpathes = 0,
    final calcHygroThermal = false,
    final convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.const,
    final alphaConstant = alphaAmb,
    surfacesToAmbient(nSurfaces=nWindows+1),
    //final gridSurface[surfacesToAmbient.nSurfaces,2]=fill({1,1},surfacesToAmbient.nSurfaces),
    final nSurfacesSolid=1,
    surfacesToSolids(nSurfaces=nSurfacesSolid));
  parameter Integer nWindows = 1
    "Number of windows"
    annotation(Dialog(tab="Constructions",group="Windows"));
  parameter Modelica.SIunits.Area AAmbient = 1.0
    "Surface area of the building constructions with air contact to the environment"
    annotation(Dialog(tab="Constructions",group="Ambient constructions"));
  parameter Modelica.SIunits.Area AInner = 1.0
    "Surface area of both sides of the internal building constructions"
    annotation(Dialog(tab="Constructions",group="Inner constructions"));
  parameter Modelica.SIunits.Area AGround = 1.0
    "Surface area of the building constructions with contact to the ground"
    annotation(Dialog(tab="Constructions",group="Ground constructions"));
  parameter Modelica.SIunits.Area AWindow[nWindows] = {1.0}
    "Area of each window"
    annotation(Dialog(tab="Constructions",group="Windows"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAziWindow[nWindows] = fill(0.0,nWindows)
    "Azimuth angle of each window"
    annotation(Dialog(tab="Constructions",group="Windows"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegTilWindow[nWindows] = fill(90.0,nWindows)
    "Tilt angle of each window"
    annotation(Dialog(tab="Constructions",group="Windows"));
  parameter Modelica.SIunits.Volume VAir = 1.0
    "Inner (Air) volume of the building";
  parameter Modelica.SIunits.HeatCapacity CAmbient = 1.0
    "Total heat capacity of the building envelope"
    annotation(Dialog(tab="Constructions",group="Ambient constructions"));
  parameter Modelica.SIunits.HeatCapacity CInner = 1.0
    "Total heat capacity of the internal building construction"
    annotation(Dialog(tab="Constructions",group="Inner constructions"));
  parameter Modelica.SIunits.HeatCapacity CGround = 1.0
    "Total heat capacity of the building groundplate"
    annotation(Dialog(tab="Constructions",group="Ground constructions"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UAmbient = 1.0
    "Mean heat loss coefficient of the building envelope"
    annotation(Dialog(tab="Constructions",group="Ambient constructions"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UGround = 1.0
    "Mean heat loss coefficient of the building groundplate"
    annotation(Dialog(tab="Constructions",group="Ground constructions"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UInner = 1.0
    "Mean heat loss coefficient of internal building construction"
    annotation(Dialog(tab="Constructions",group="Inner constructions"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UWindow[nWindows] = fill(1.0,nWindows)
    "Heat loss coefficient of each window"
    annotation(Dialog(tab="Constructions",group="Windows"));
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    final prescribedAirchange = prescribedAirchange,
    V=VAir,
    nConstructions4=1,
    nConstructions1=1,
    nConstructions3=2,
    nConstructions2=nWindows,
    calcIdealLoads=calcIdealLoads,
    heatSources=heatSources,
    nHeatSources=nHeatSources)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ambientConstructions(
    final abs_2 = 0.0,
    final epsilon_2 = 0.0,
    final width=1.0,
    final height=AAmbient/ambientConstructions.width,
    nNodes={1},
    final constructionData.thickness={1.0},
    final constructionData.material.rho={1000.0},
    final constructionData.material.c={CAmbient/(ambientConstructions.constructionData.material[1].rho*AAmbient*ambientConstructions.constructionData.thickness[1])},
    final constructionData.material.lambda={(1.0/(-1.0/alphaAmb-1.0/alphaIns+1.0/UAmbient)*ambientConstructions.constructionData.thickness[1])})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-40,-20})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes groundConstructions(
    final abs_2 = 0.0,
    final epsilon_2 = 0.0,
    final width=1.0,
    final height=AGround/groundConstructions.width,
    nNodes={1},
    final constructionData.thickness={1.0},
    final constructionData.material.rho={1000.0},
    final constructionData.material.c={CGround/(groundConstructions.constructionData.material[1].rho*AGround*groundConstructions.constructionData.thickness[1])},
    final constructionData.material.lambda={(1.0/(-1.0/alphaIns-1.0/alphaGround+1.0/UGround)*groundConstructions.constructionData.thickness[1])})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-4,-42})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes innerConstructions(
    final abs_2 = 0.0,
    final epsilon_2 = 0.0,
    final width=1.0,
    final height=AInner/innerConstructions.width,
    nNodes={1},
    final constructionData.thickness={1.0},
    final constructionData.material.rho={1000.0},
    final constructionData.material.c={CInner/(innerConstructions.constructionData.material[1].rho*AInner*innerConstructions.constructionData.thickness[1])},
    final constructionData.material.lambda={(1.0/(-1.0/alphaIns-1.0/alphaIns+1.0/UInner)*innerConstructions.constructionData.thickness[1])})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={40,-2})));
  BuildingSystems.Buildings.Constructions.Windows.Window window[nWindows](
    final angleDegAzi= {angleDegAziWindow[i] + angleDegAziBuilding for i in 1:nWindows},
    final angleDegTil = angleDegTilWindow,
    UValue = UWindow,
    each width = 1.0,
    final height={AWindow[i]/window[i].width for i in 1:nWindows})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-40,20})));
protected
  parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaIns = 7.692
    "Heat transfer coefficient (convection + radiation) inside of the building"; // after German DIN 4701 Teil2 Tabelle 16"
  parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaAmb = 25.0
    "Heat transfer coefficient (convection + radiation) outside of the building"; // after german DIN 4701 Teil2 Tabelle 16"
  parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaGround = 100.0
    "Heat transfer coefficient (conduction) to the ground";
equation
  connect(zone.TAir, TAir[1]) annotation (Line(
    points={{-7,7},{-7,-30},{88,-30},{88,-70},{110,-70}},
    color={0,0,127},
    smooth=Smooth.None));

  // Building construction
  connect(ambientConstructions.toSurfacePort_1, zone.toConstructionPorts1[1])
    annotation (Line(
      points={{-38,-20},{-20,-20},{-20,2},{-11,2}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambientConstructions.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[nSurfacesAmbient])
    annotation (Line(
      points={{-89.9,0},{-60,0},{-60,-20},{-42,-20}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(innerConstructions.toSurfacePort_1, zone.toConstructionPorts3[1])
    annotation (Line(
      points={{42,-2},{46,-2},{46,-12},{18,-12},{18,-6},{11,-6}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(zone.toConstructionPorts3[2], innerConstructions.toSurfacePort_2)
    annotation (Line(
      points={{11,-2},{38,-2}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(window.toSurfacePort_1, zone.toConstructionPorts2)
    annotation (Line(
      points={{-38.2,20},{-20,20},{-20,6},{-11,6}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(window[1:nWindows].toSurfacePort_2, surfacesToAmbient.toConstructionPorts[1:nWindows])
   annotation (Line(
      points={{-89.9,0},{-60,0},{-60,20},{-41.8,20}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(groundConstructions.toSurfacePort_2, surfacesToSolids.toConstructionPorts[1])
    annotation (Line(
      points={{-4,-44},{-4,-68},{-4,-90.8},{8.88178e-016,-90.8}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(groundConstructions.toSurfacePort_1, zone.toConstructionPorts4[1])
    annotation (Line(
      points={{-4,-40},{-4,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));

  // Ideal heat load calculation - depends on boolean calcIdealLoads
    connect(zone.T_setCooling, T_setCooling[1]) annotation (Line(
        points={{6,-7},{8,-7},{8,-12},{80,-12},{80,60},{100,60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone.T_setHeating, T_setHeating[1]) annotation (Line(
        points={{4,-7},{4,-14},{74,-14},{74,80},{100,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
      points={{7,7},{7,-80},{-80,-80},{-80,-100}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
      points={{3,7},{3,-34},{80,-34},{80,-100}},
      color={0,0,127},
      smooth=Smooth.None));

  // Prescribed airchange - depends on boolean prescribedAirchange
    connect(zone.TAirAmb, TAirAmb) annotation (Line(
      points={{11,5},{16,5},{16,82},{50,82},{50,100}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.xAirAmb, xAirAmb) annotation (Line(
      points={{11,3},{18,3},{18,80},{70,80},{70,100}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.airchange, airchange[1]) annotation (Line(
      points={{11,7},{26,7},{26,40},{100,40}},
      color={0,0,127},
      smooth=Smooth.None));

  // Ideal heat load calculation - depends on boolean heatSources
    connect(zone.heatSourcesPorts, heatSourcesPorts) annotation (Line(
      points={{0.7,-7.3},{0.7,46.35},{0,46.35},{0,100}},
      color={127,0,0},
      smooth=Smooth.None));

end Building1Zone0D;
