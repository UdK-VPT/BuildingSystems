within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone0D
  "Low order building model with 3 thermal capacities"
  extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nZones = 1,
    final prescribedAirchange = true,
    final useAirPaths = false,
    final nAirpaths = 0,
    final calcHygroThermal = false,
    final convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.const,
    final alphaConstant = 15.0,
    final nSurfacesSolid=1,
    surfacesToAmbience(nSurfaces=nWindows+1),
    surfacesToSolids(nSurfaces=nSurfacesSolid));

  parameter Modelica.Units.SI.Length height=3.0 "Height of the building"
    annotation (Evaluate=false, Dialog(tab="General", group="Geometry building"));
  parameter Integer nWindows = 1
    "Number of windows"
    annotation(Dialog(tab="Constructions",group="Windows"));
  parameter Modelica.Units.SI.Area AAmb=1.0
    "Surface area of the building constructions with air contact to the environment"
    annotation (Evaluate=false, Dialog(tab="Constructions", group=
          "Ambience constructions"));
  parameter Modelica.Units.SI.Area AInn=1.0
    "Surface area of both sides of the internal building constructions"
    annotation (Evaluate=false, Dialog(tab="Constructions", group=
          "Inner constructions"));
  parameter Modelica.Units.SI.Area AGro=1.0
    "Surface area of the building constructions with contact to the ground"
    annotation (Evaluate=false, Dialog(tab="Constructions", group=
          "Ground constructions"));
  parameter Modelica.Units.SI.Area AWin[nWindows]={1.0} "Area of each window"
    annotation (Evaluate=false, Dialog(tab="Constructions", group="Windows"));
  parameter Modelica.Units.NonSI.Angle_deg angleDegAziWin[nWindows]=fill(0.0,
      nWindows) "Azimuth angle of each window" annotation (Evaluate=false,
      Dialog(tab="General", group="Geometry windows"));
  parameter Modelica.Units.NonSI.Angle_deg angleDegTilWin[nWindows]=fill(90.0,
      nWindows) "Tilt angle of each window" annotation (Evaluate=false, Dialog(
        tab="General", group="Geometry windows"));
  parameter Modelica.Units.SI.Volume VAir=1.0
    "Inner (Air) volume of the building";
  parameter Modelica.Units.SI.HeatCapacity CAmb=1.0
    "Total heat capacity of the building envelope" annotation (Evaluate=false,
      Dialog(tab="Constructions", group="Ambience constructions"));
  parameter Modelica.Units.SI.HeatCapacity CInn=1.0
    "Total heat capacity of the internal building construction" annotation (
      Evaluate=false, Dialog(tab="Constructions", group="Inner constructions"));
  parameter Modelica.Units.SI.HeatCapacity CGro=1.0
    "Total heat capacity of the building groundplate" annotation (Evaluate=
        false, Dialog(tab="Constructions", group="Ground constructions"));
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer UValAmb=1.0
    "Mean heat loss coefficient of the building envelope" annotation (Evaluate=
        false, Dialog(tab="Constructions", group="Ambience constructions"));
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer UValGro=1.0
    "Mean heat loss coefficient of the building groundplate" annotation (
      Evaluate=false, Dialog(tab="Constructions", group="Ground constructions"));
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer UValInn=1.0
    "Mean heat loss coefficient of internal building construction" annotation (
      Evaluate=false, Dialog(tab="Constructions", group="Inner constructions"));
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer UValWin[nWindows]=fill(
      1.0, nWindows) "Heat loss coefficient of each window"
    annotation (Evaluate=false, Dialog(tab="Constructions", group="Windows"));
  parameter Real gWin[nWindows](each unit = "1") = fill(0.6,nWindows)
    "g-value of the window"
    annotation(Evaluate=false, Dialog(tab = "Constructions", group = "Windows"));
  parameter Real framePortionWin[nWindows](each unit = "1") = fill(0.2,nWindows)
    "Frame portion of the window"
    annotation(Evaluate=false, Dialog(tab = "Constructions", group = "Windows"));

  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    final prescribedAirchange = prescribedAirchange,
    final V=VAir,
    final calcIdealLoads=calcIdealLoads,
    final heatSources=heatSources,
    final nHeatSources=nHeatSources,
    nConstructions=4+nWindows)
    "Zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));

  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ambientConstructions(
    final abs_2 = 0.0,
    final abs_1 = 0.5,
    final epsilon_2 = 0.9,
    final width=AAmb*2.0/height,
    final height=0.5*height,
    nNodes={1},
    constructionData(
    final thickness = {1.0},
    material(
      final rho = {1000.0},
      final c = {CAmb/(ambientConstructions.constructionData.material[1].rho*AAmb*ambientConstructions.constructionData.thickness[1])},
      final lambda = {(1.0/(-1.0/alphaAmb-1.0/alphaIns+1.0/UValAmb)*ambientConstructions.constructionData.thickness[1])})))
    "Opaque constructions in contact to the ambience"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-40,-20})));

  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes groundConstructions(
    final abs_1 = 0.5,
    final abs_2 = 0.0,
    final epsilon_1 = 0.9,
    final epsilon_2 = 0.0,
    final width=sqrt(AGro),
    final height=sqrt(AGro),
    nNodes={1},
    constructionData(
    final thickness = {1.0},
    material(
      final rho = {1000.0},
      final c = {CGro/(groundConstructions.constructionData.material[1].rho*AGro*groundConstructions.constructionData.thickness[1])},
      final lambda = {(1.0/(-1.0/alphaIns-1.0/alphaGro+1.0/UValGro)*groundConstructions.constructionData.thickness[1])})))
    "Opaque constructions in contact to the ground"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-42})));

  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes innerConstructions(
    final abs_1 = 0.5,
    final abs_2 = 0.5,
    final epsilon_2 = 0.9,
    final epsilon_1 = 0.9,
    final width=1.0,
    final height=0.5*AInn,
    nNodes={1},
    constructionData(
    final thickness = {1.0},
    material(
      final rho = {1000.0},
      final c = {CInn/(innerConstructions.constructionData.material[1].rho*0.5*AInn*innerConstructions.constructionData.thickness[1])},
      final lambda = {(1.0/(-1.0/alphaIns-1.0/alphaIns+1.0/UValInn)*innerConstructions.constructionData.thickness[1])})))
    "Inner constructions of the building"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={38,0})));

  BuildingSystems.Buildings.Constructions.Windows.Window window[nWindows](
    final angleDegAzi= {angleDegAziWin[i] + angleDegAziBuilding for i in 1:nWindows},
    final angleDegTil = angleDegTilWin,
    constructionData(
      final UValGla = UValWin,
      final UValFra = UValWin,
      final g = gWin,
      each final b0 = 0.7),
    final framePortion = framePortionWin,
    final width = {AWin[i]*2.0/height for i in 1:nWindows},
    each final height=0.5*height)
    "Transparent constructions in contact to the ambience"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-40,20})));

  final parameter Modelica.Units.SI.SurfaceCoefficientOfHeatTransfer alphaIns=
      7.692
    "Heat transfer coefficient (convection + radiation) inside of the building"; // after German DIN 4701 Teil2 tabular 16"
  final parameter Modelica.Units.SI.SurfaceCoefficientOfHeatTransfer alphaAmb=
      25.0
    "Heat transfer coefficient (convection + radiation) outside of the building"; // after german DIN 4701 Teil2 tabular 16"
  final parameter Modelica.Units.SI.SurfaceCoefficientOfHeatTransfer alphaGro=
      100.0 "Heat transfer coefficient (conduction) to the ground";

equation
  connect(zone.TAir, TAir[1]) annotation (Line(
    points={{11,-3},{11,-30},{88,-30},{88,-70},{190,-70}},
    color={0,0,127},
    smooth=Smooth.None));

  // Building construction
  connect(ambientConstructions.toSurfacePort_1, zone.toConstructionPorts[1])
    annotation (Line(
      points={{-38,-20},{-28,-20},{-28,0},{0,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambientConstructions.toSurfacePort_2, surfacesToAmbience.toConstructionPorts[nSurfacesAmbience])
    annotation (Line(
      points={{-42,-20},{-52,-20},{-52,3.55271e-15},{-170.8,3.55271e-15}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(innerConstructions.toSurfacePort_1, zone.toConstructionPorts[2])
    annotation (Line(
      points={{40,-2.22045e-16},{50,-2.22045e-16},{50,-16},{28,-16},{28,0},{0,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(zone.toConstructionPorts[3], innerConstructions.toSurfacePort_2)
    annotation (Line(
      points={{0,0},{28,0},{28,4.44089e-16},{36,4.44089e-16}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(window[1:nWindows].toSurfacePort_1, zone.toConstructionPorts[5:4+nWindows])
    annotation (Line(
      points={{-38,20},{-28,20},{-28,0},{0,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(window[1:nWindows].toSurfacePort_2, surfacesToAmbience.toConstructionPorts[1:nWindows])
   annotation (Line(
      points={{-42,20},{-52,20},{-52,3.55271e-15},{-170.8,3.55271e-15}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(groundConstructions.toSurfacePort_2, surfacesToSolids.toConstructionPorts[1])
    annotation (Line(
      points={{-4.44089e-16,-44},{-4.44089e-16,-109.6},{8.88178e-16,-109.6}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(groundConstructions.toSurfacePort_1, zone.toConstructionPorts[4])
    annotation (Line(
      points={{4.44089e-16,-40},{4.44089e-16,0},{0,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));

  // Ideal heat load calculation - depends on boolean calcIdealLoads
    connect(zone.T_setCooling, T_setCooling[1]) annotation (Line(
        points={{-11,5},{-18,5},{-18,60},{180,60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone.T_setHeating, T_setHeating[1]) annotation (Line(
        points={{-11,7},{-16,7},{-16,80},{180,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
      points={{11,5},{11,4},{20,4},{20,-50},{-80,-50},{-80,-122}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
      points={{11,7},{15,7},{15,-50},{80,-50},{80,-122}},
      color={0,0,127},
      smooth=Smooth.None));

  // Prescribed airchange - depends on boolean prescribedAirchange
    connect(zone.TAirAmb, TAirAmb) annotation (Line(
      points={{-11,-5},{-22,-5},{-22,86},{50,86},{50,120}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.xAirAmb, xAirAmb) annotation (Line(
      points={{-11,-7},{-24,-7},{-24,84},{70,84},{70,120}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone.airchange, airchange[1]) annotation (Line(
      points={{-11,-3},{-20,-3},{-20,40},{180,40}},
      color={0,0,127},
      smooth=Smooth.None));

  // Ideal heat load calculation - depends on boolean heatSources
    connect(conHeatSourcesPorts, zone.conHeatSourcesPorts) annotation (Line(
       points={{-44,120},{-44,82},{-14,82},{-14,-16},{-4.9,-16},{-4.9,-10.7}},
       color={127,0,0}));
    connect(zone.radHeatSourcesPorts, radHeatSourcesPorts) annotation (Line(
       points={{4.9,-10.7},{4.9,-16},{24,-16},{24,82},{0,82},{0,120}},
       color={127,0,0}));

    annotation(Dialog(tab="Constructions",group="Windows"),
      defaultComponentName="building",
Documentation(info="<html>
<p>
This is a low order building model with 3 thermal capacities.
</p>
</html>", revisions="<html>
<ul>
<li>
January 24, 2017 by Christoph Nytsch-Geusen:<br/>
Adaptation to new zone model.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Building1Zone0D;
