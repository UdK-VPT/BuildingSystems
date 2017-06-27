within BuildingSystems.Buildings.Constructions.Windows;
model SlidingWindow
  "Model of a sliding window"
  extends BuildingSystems.Buildings.BaseClasses.OpeningDiscretizedOperable(
    final wOpe = widthOpen,
    final hOpe = height,
    redeclare package Medium = BuildingSystems.Media.Air);
  extends BuildingSystems.Buildings.BaseClasses.ConstructionGeneral(
    final abs_1 = 0.0,
    final abs_2 = 0.0,
    height = 1.0,
    width = 1.0);
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_2(
    A=AFix+AOpe,
    abs = abs_2,
    geo.angleDegAzi=angleDegAzi,
    geo.angleDegTil=angleDegTil,
    geo.width=width,
    geo.height=height,
    geo.zMean = zLevel + Modelica.Math.sin(Modelica.Constants.pi/180.0*angleDegTil) * height,
    geo.point.x={0.0,width,width,0.0},
    geo.point.y={0.0,0.0,height,height},
    geo.point.z={0.0,0.0,0.0,0.0},
    epsilon = epsilon_2)
    annotation (Placement(transformation(extent={{10,-10},{30,10}}), iconTransformation(extent={{10,-10},{30,10}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_1(
    A=AFix+AOpe,
    abs = abs_1,
    geo.angleDegAzi=angleDegAzi,
    geo.angleDegTil=angleDegTil,
    geo.width=width,
    geo.height=height,
    geo.zMean = zLevel + Modelica.Math.sin(Modelica.Constants.pi/180.0*angleDegTil) * height,
    geo.point.x={0.0,width,width,0.0},
    geo.point.y={0.0,0.0,height,height},
    geo.point.z={0.0,0.0,0.0,0.0},
    epsilon = epsilon_1)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}}),
      iconTransformation(extent={{-30,-10},{-10,10}})));
  parameter Modelica.SIunits.Area AFix = height * (width - widthOpen)
    "Fixe area of the sliding window"
    annotation(Dialog(enable = false, tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length widthOpen = 0.5
    "Max. width of the open part (full opened postion)"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Real framePortion = 0.2
    "Frame portion of the window"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length thicknessPane = 0.006
    "Thickness of all panes"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Density rhoPane = 2000.0
    "Density of the panes"
    annotation(Dialog(tab = "General", group = "Thermal properties"));
  parameter Modelica.SIunits.SpecificHeatCapacity cPane = 1000.0
    "Specific heat capacity of the panes"
    annotation(Dialog(tab = "General", group = "Thermal properties"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UVal = 3.0
    "Mean U-value of the window"
    annotation(Dialog(tab = "General", group = "Thermal properties"));
  parameter Real tauDir0 = 0.7
    "Transmittance of direct radiation for perpendicular irradiation"
    annotation(Dialog(tab = "General", group = "Optical properties"));
  parameter Real tauDif = 0.7
    "Transmittance of diffuse radiation"
    annotation(Dialog(tab = "General", group = "Optical properties"));
  parameter Real b0 = 0.7
    "Coefficient for radiation transmision curve"
    annotation(Dialog(tab = "General", group = "Optical properties"));
  parameter Boolean use_GSC_in = false
    "= true, use input for geometric shading coefficient GSC"
    annotation(Dialog(tab = "General", group = "Shadowing"));
  Modelica.Blocks.Interfaces.RealOutput GSC_constant(
    min = 0.0,
    max = 1.0) = 0.0
    "Constant shading coefficient (if use_GSC_in = true)"
    annotation(Dialog(tab = "General", group = "Shadowing"));
  input Modelica.Blocks.Interfaces.RealInput GSC_in if use_GSC_in
    "Shading coefficient"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,90}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,90})));
  parameter Boolean show_TSur = false
    "Show surface temperatures on both sides"
    annotation(Dialog(tab = "Advanced", group = "Surface variables"));
  BuildingSystems.Interfaces.Temp_KOutput TSur_1 = toSurfacePort_1.heatPort.T if show_TSur
    "Temperature on surface side 1"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-46,10}),iconTransformation(extent={{-10,10},{-30,30}})));
  BuildingSystems.Interfaces.Temp_KOutput TSur_2 = toSurfacePort_2.heatPort.T if show_TSur
    "Temperature on surface side 2"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,origin={46,10}),iconTransformation(extent={{10,10},{30,30}})));
  parameter Modelica.SIunits.Temp_K T_start=293.15
    "Start temperature of the window"
    annotation (Dialog(tab="Initialization"));
  BuildingSystems.Buildings.Constructions.Windows.RadiationTransmission.RadiationTransmissionSimple radTra1to2(
    tauDir0=tauDir0,
    b0=b0,
    tauDif=tauDif,
    framePortion=framePortion,
    areaRatioUnglazed = widthOpen/width*y)
    annotation (Placement(transformation(extent={{-10,30},{10,50}})));
  BuildingSystems.Buildings.Constructions.Windows.RadiationTransmission.RadiationTransmissionSimple radTra2to1(
    tauDir0=tauDir0,
    b0=b0,
    tauDif=tauDif,
    framePortion=framePortion,
    areaRatioUnglazed = widthOpen/width*y)
   annotation (Placement(transformation(extent={{-10,-50},{10,-30}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D heatTransfer(
    material(
      lambda = UVal*thicknessPane,
      rho = rhoPane,
      c = cPane),
    lengthX=thicknessPane,
    lengthY=width,
    lengthZ=height,
    T_start=T_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.MoistureFlowFixed moistBcPort1(
    m_flow_constant=0.0)
    annotation (Placement(transformation(extent={{-48,-8},{-32,8}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.MoistureFlowFixed moistBcPort2(
    m_flow_constant=0.0)
    annotation (Placement(transformation(extent={{48,-8},{32,8}})));
  protected
    Modelica.Blocks.Interfaces.RealInput GSC_internal
      "Shading coefficient";
equation
  // Shadowing
  if use_GSC_in then
    connect(GSC_internal,GSC_in);
  else
    connect(GSC_internal,GSC_constant);
  end if;
  connect(GSC_internal, radTra2to1.GSC);
  connect(GSC_internal, radTra1to2.GSC);
  // Solar Transmittance
  connect(radTra1to2.radiationPort_in, toSurfacePort_1.radiationPort_in)
    annotation (Line(
      points={{-1,40},{-18,40},{-18,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(radTra1to2.radiationPort_out, toSurfacePort_2.radiationPort_out)
    annotation (Line(
      points={{1,40},{18,40},{18,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(radTra2to1.radiationPort_in, toSurfacePort_2.radiationPort_in)
    annotation (Line(
      points={{-1,-40},{18,-40},{18,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(radTra2to1.radiationPort_out, toSurfacePort_1.radiationPort_out)
    annotation (Line(
      points={{1,-40},{-18,-40},{-18,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  // Heat transfer
  connect(heatTransfer.heatPort_x2, toSurfacePort_2.heatPort) annotation (Line(
      points={{8,0},{18,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heatTransfer.heatPort_x1, toSurfacePort_1.heatPort) annotation (Line(
      points={{-8,0},{-18,0}},
      color={191,0,0},
      smooth=Smooth.None));
  // Moisture transport
  connect(moistBcPort1.moisturePort, toSurfacePort_1.moisturePort) annotation (
      Line(
      points={{-35.2,0},{-18,0}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(moistBcPort2.moisturePort, toSurfacePort_2.moisturePort) annotation (
      Line(
      points={{35.2,0},{18,0}},
      color={120,0,120},
      smooth=Smooth.None));

  annotation (defaultComponentName="slidingWindow", Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-10,80},{10,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid),
    Rectangle(extent={{6,60},{10,-4}}, lineColor={170,255,255},fillColor={170,255,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-20,80},{20,60}},lineColor={175,175,175},fillColor={175,175,175},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-20,-60},{20,-80}},lineColor={175,175,175},fillColor={175,175,175},fillPattern = FillPattern.Solid),
    Line(points={{-10,60},{-10,-60}},color={0,0,255},smooth=Smooth.None,thickness=0.5),
    Rectangle(extent={{-9,20},{-5,-40}},lineColor={170,255,255},fillColor={170,255,255},fillPattern = FillPattern.Solid),
    Line(points={{0,20},{0,-40}}, color={0,0,0}),
    Polygon(points={{-2,16},{0,20},{2,16},{-2,16}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),
    Polygon(points={{-2,-2},{0,2},{2,-2},{-2,-2}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid,origin={0,-38},rotation=180)}),
Documentation(info="<html>
<p>
This is a model of a sliding window.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
<li>
July 27, 2017 by Christoph Nytsch-Geusen:<br/>
Introduction of an external shadowing coefficient (GSC).
</li>
</ul>
</html>"));
end SlidingWindow;
