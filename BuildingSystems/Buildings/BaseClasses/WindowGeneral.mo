within BuildingSystems.Buildings.BaseClasses;
partial model WindowGeneral
  "General window model"
  extends BuildingSystems.Buildings.BaseClasses.ConstructionGeneral(
  final abs_1 = 0.0,
  final abs_2 = 0.0);
  final package Medium = BuildingSystems.Media.Air;
  replaceable parameter BuildingSystems.Buildings.Data.Constructions.TransparentConstruction constructionData
    "Data of the thermal construction"
    annotation(Dialog(tab = "General", group = "Construction"), choicesAllMatching=true);
  // Geometry
  parameter Real framePortion = 0.2
    "Frame portion of the window"
    annotation(Dialog(tab = "General", group = "Geometry"));
  final parameter Modelica.SIunits.Length thicknessPane = sum(constructionData.thickness)
    "Thickness of all panes"
    annotation(Dialog(tab = "General", group = "Geometry"));
  // Thermal properties
  constant Modelica.SIunits.Density rhoPane = 2000.0
    "Density of the panes"
    annotation(Dialog(tab = "General", group = "Thermal properties"));
  constant Modelica.SIunits.SpecificHeatCapacity cPane = 1000.0
    "Specific heat capacity of the panes"
    annotation(Dialog(tab = "General", group = "Thermal properties"));
  final parameter Modelica.SIunits.CoefficientOfHeatTransfer UVal
    = (1.0 - framePortion) * constructionData.UValGla + framePortion * constructionData.UValFra
    "Mean U-value of the window"
    annotation(Dialog(tab = "General", group = "Thermal properties"));
  // Optical properties
  final parameter Real tauDir0 = constructionData.g
    "Transmittance of direct radiation for perpendicular irradiation"
    annotation(Dialog(tab = "General", group = "Optical properties"));
  final parameter Real tauDif = constructionData.g
    "Transmittance of diffuse radiation"
    annotation(Dialog(tab = "General", group = "Optical properties"));
  final parameter Real b0 = constructionData.g
    "Coefficient for radiation transmision curve"
    annotation(Dialog(tab = "General", group = "Optical properties"));
  // Shadowing
  parameter Boolean use_GSC_in = false
    "true: use input for geometric shading coefficient GSC"
    annotation(Dialog(tab = "Shadowing", group = "External shadowing"));
  Modelica.Blocks.Interfaces.RealOutput GSC_constant(
    min = 0.0,
    max = 1.0) = 0.0
    "Constant shading coefficient (if use_GSC_in == true)"
    annotation(Dialog(tab = "Shadowing", group = "External shadowing"));
  input Modelica.Blocks.Interfaces.RealInput GSC_in if use_GSC_in
    "Input for external shading coefficient"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={0,-62}),
      iconTransformation(extent={{-9,-9},{9,9}},rotation=270,origin={1,89})));
  parameter Boolean calcEmbrasure = false
    "true: shadowing effect of embrasure is considered"
    annotation(Dialog(tab = "Shadowing", group = "Shadowing embrasure"));
  parameter Modelica.SIunits.Length depthEmbrasure = 0.0
    "Depth of the embrasure (if calcEmbrasure == true)"
    annotation(Dialog(tab = "Shadowing", group = "Shadowing embrasure"));
  // Ventilation
  parameter Boolean calcAirchange = false
    "true: calculation of air exchange through the window, false: no air exchange"
    annotation(Dialog(tab = "Air change", group = "Air change calculation"));
  parameter Integer nCom=10
    "Number of compartments for the discretization"
    annotation(Dialog(tab = "Air change", group = "Air change calculation"));
  parameter Modelica.SIunits.Area LClo(min=0)=0.001
    "Effective leakage area of closed window"
    annotation(Dialog(tab = "Air change", group = "Air change calculation"));
  // Advanced parameters
  parameter Boolean show_TSur = false
    "Show surface temperatures on both sides"
    annotation(Dialog(tab = "Advanced", group = "Surface variables"));
  BuildingSystems.Interfaces.Temp_KOutput TSur_1 = toSurfacePort_1.heatPort.T if show_TSur
    "Temperature on surface side 1"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-46,10}),iconTransformation(extent={{-10,10},{-30,30}})));
  BuildingSystems.Interfaces.Temp_KOutput TSur_2 = toSurfacePort_2.heatPort.T if show_TSur
    "Temperature on surface side 2"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={46,10}),iconTransformation(extent={{10,10},{30,30}})));
  parameter Modelica.SIunits.Temp_K T_start=293.15
    "Start temperature of the window"
    annotation (Dialog(tab="Initialization"));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_2(
    A=ASur,
    abs = abs_2,
    geo(
      angleDegAzi = angleDegAzi,
      angleDegTil = angleDegTil,
      width = width_internal,
      height = height_internal,
      zMean = zLevel + Modelica.Math.sin(Modelica.Constants.pi/180.0*angleDegTil) * height_internal,
      point(
        x = {0.0,width_internal,width_internal,0.0},
        y = {0.0,0.0,height_internal,height_internal},
        z = {0.0,0.0,0.0,0.0})),
        epsilon = epsilon_2)
    annotation (Placement(transformation(extent={{10,-10},{30,10}}), iconTransformation(extent={{10,-10},{30,10}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_1(
    A=ASur,
    abs = abs_1,
    geo(
      angleDegAzi = angleDegAzi,
      angleDegTil = angleDegTil,
      width = width_internal,
      height = height_internal,
      zMean = zLevel + Modelica.Math.sin(Modelica.Constants.pi/180.0*angleDegTil) * height_internal,
      point(
        x = {0.0,width_internal,width_internal,0.0},
        y = {0.0,0.0,height_internal,height_internal},
        z = {0.0,0.0,0.0,0.0})),
      epsilon = epsilon_1)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}}), iconTransformation(extent={{-30,-10},{-10,10}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D heatTransfer(
    material(
      lambda = UVal*thicknessPane,
      rho = rhoPane,
      c = cPane),
    lengthX=thicknessPane,
    lengthY=width_internal,
    lengthZ=height_internal,
    T_start=T_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.FixedMoistureFlow moistBcPort1(
    m_flow_constant=0.0)
    annotation (Placement(transformation(extent={{-48,-8},{-32,8}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.FixedMoistureFlow moistBcPort2(
    m_flow_constant=0.0)
    annotation (Placement(transformation(extent={{48,-8},{32,8}})));
  BuildingSystems.Buildings.Constructions.Windows.RadiationTransmission.RadiationTransmissionSimple radTra1to2(
    tauDir0=tauDir0,
    b0=b0,
    tauDif=tauDif,
    framePortion=framePortion)
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  BuildingSystems.Buildings.Constructions.Windows.RadiationTransmission.RadiationTransmissionSimple radTra2to1(
    tauDir0=tauDir0,
    b0=b0,
    tauDif=tauDif,
    framePortion=framePortion)
    annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  BuildingSystems.Airflow.Multizone.DoorDiscretizedOperable ope(
    redeclare package Medium = Medium,
    LClo=LClo,
    nCom=nCom) if calcAirchange
    "Opening of the window"
    annotation (Placement(transformation(extent={{-10,70},{10,90}})));
  input Modelica.Blocks.Interfaces.RealInput y(
    min=0,
    max=1,
    unit="1") if calcAirchange
    "Percentage of the openable part of the opening (1.0 = 100 % open, 0.0 = 100 % closed)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-28,80}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=90, origin={0,-90})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(
    redeclare final package Medium = Medium) if calcAirchange
    "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-30,50},{-10,70}}),
      iconTransformation(extent={{-30,50},{-10,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(
     redeclare final package Medium = Medium) if calcAirchange
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{30,50},{10,70}}),
      iconTransformation(extent={{30,50},{10,70}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a2(
     redeclare final package Medium = Medium) if calcAirchange
    "Fluid connector a2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{10,-70},{30,-50}}),
      iconTransformation(extent={{10,-70},{30,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b2(
     redeclare final package Medium = Medium) if calcAirchange
    "Fluid connector b2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{-10,-70},{-30,-50}}),
      iconTransformation(extent={{-10,-70},{-30,-50}})));
  BuildingSystems.Buildings.Constructions.Shadowing.Embrasure embrasure(
    width=width,
    height=height,
    depth=depthEmbrasure) if calcEmbrasure
    "Shadowing caused by embrasure"
    annotation (Placement(transformation(extent={{20,-50},{0,-30}})));
protected
  Modelica.Blocks.Interfaces.RealInput GSC_internal
    "Shading coefficient";
equation
  // Geometry
  ASur = height_internal * width_internal;
  // Shadowing
  if use_GSC_in then
    connect(GSC_internal,GSC_in);
  else
    connect(GSC_internal,GSC_constant);
  end if;
  connect(GSC_internal, radTra2to1.GSC);
  connect(GSC_internal, radTra1to2.GSC);
  // Sun angles
  toSurfacePort_1.radiationPort_in.angleDegAziSun = toSurfacePort_2.radiationPort_out.angleDegAziSun;
  toSurfacePort_1.radiationPort_in.angleDegHeightSun = toSurfacePort_2.radiationPort_out.angleDegHeightSun;
  toSurfacePort_2.radiationPort_in.angleDegAziSun = toSurfacePort_1.radiationPort_out.angleDegAziSun;
  toSurfacePort_2.radiationPort_in.angleDegHeightSun = toSurfacePort_1.radiationPort_out.angleDegHeightSun;
  // Solar Transmittance
  connect(radTra1to2.radiationPort_in, toSurfacePort_1.radiationPort_in)
    annotation (Line(
      points={{-1,40},{-20,40},{-20,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  if calcEmbrasure then
    connect(radTra2to1.radiationPort_in, embrasure.radiationPort_out)
      annotation (Line(points={{1,-40},{6,-40}}, color={0,0,0}));
    connect(embrasure.radiationPort_in, toSurfacePort_2.radiationPort_in)
      annotation (Line(points={{14,-40},{20,-40},{20,0}}, color={0,0,0}));
  else
    connect(radTra2to1.radiationPort_in, toSurfacePort_2.radiationPort_in)
      annotation (Line(points={{-1,-40},{20,-40},{20,0}},
        color={0,0,0},pattern=LinePattern.Solid,smooth=Smooth.None));
  end if;
  connect(radTra1to2.radiationPort_out, toSurfacePort_2.radiationPort_out)
    annotation (Line(
      points={{1,40},{20,40},{20,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(radTra2to1.radiationPort_out, toSurfacePort_1.radiationPort_out)
    annotation (Line(
      points={{1,-40},{-20,-40},{-20,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  // Heat transfer
  connect(heatTransfer.heatPort_x2, toSurfacePort_2.heatPort) annotation (Line(
      points={{8,0},{20,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heatTransfer.heatPort_x1, toSurfacePort_1.heatPort) annotation (Line(
      points={{-8,0},{-20,0}},
      color={191,0,0},
      smooth=Smooth.None));
  // Moisture transport
  connect(moistBcPort1.moisturePort, toSurfacePort_1.moisturePort) annotation (
      Line(
      points={{-35.2,0},{-20,0}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(moistBcPort2.moisturePort, toSurfacePort_2.moisturePort) annotation (
      Line(
      points={{35.2,0},{20,0}},
      color={120,0,120},
      smooth=Smooth.None));
  // Ventilation
  connect(ope.y, y)
      annotation (Line(points={{-11,80},{-28,80}}, color={0,0,127}));
  connect(ope.port_b1, port_b1) annotation (Line(points={{10,86},{40,86},{40,60},
            {20,60}}, color={0,127,255}));
  connect(ope.port_a1, port_a1) annotation (Line(points={{-10,86},{-40,86},{-40,
          60},{-20,60}}, color={0,127,255}));
  connect(ope.port_a2, port_a2) annotation (Line(points={{10,74},{60,74},{60,-60},
          {20,-60}}, color={0,127,255}));
  connect(ope.port_b2, port_b2) annotation (Line(points={{-10,74},{-60,74},{-60,
          -60},{-20,-60}}, color={0,127,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
    Rectangle(extent={{-20,80},{20,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid),
    Line(points={{-20,80},{-20,-80}},color={0,0,255},smooth=Smooth.None,thickness=0.5),
    Text(extent={{-4,144},{128,104}},lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString = "%name")}),
Documentation(info="<html>
<p>
This is partial model description of a win dow.
</p>
</html>", revisions="<html>
<ul>
<li>
April 24, 2019 by Christoph Nytsch-Geusen:<br/>
Adaptation to flexible geometries.
</li>
<li>
January 14, 2018 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WindowGeneral;
