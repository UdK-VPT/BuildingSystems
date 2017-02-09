within BuildingSystems.Buildings.BaseClasses;
partial model WallGeneral
  "General wall model"
  extends BuildingSystems.Buildings.BaseClasses.ConstructionGeneral(
  width = 1.0,
  height = 1.0,
  A = height * width - sum(AInnSur));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_2(
    A=A,
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
    A=A,
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
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}}), iconTransformation(extent={{-30,-10},{-10,10}})));
  BuildingSystems.Climate.Sources.RadiationFixed radBcPort1(
    IrrDir_constant = 0.0,
    IrrDif_constant = 0.0,
    angleDegInc_constant = 0.0)
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-20,16})));
  BuildingSystems.Climate.Sources.RadiationFixed radBcPort2(
    IrrDir_constant = 0.0,
    IrrDif_constant = 0.0,
    angleDegInc_constant = 0.0)
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={20,16})));
  parameter Integer nInnSur = 0
    "Number of enclosed surfaces"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Area AInnSur[nInnSur] = fill(0.0,nInnSur)
    "Area of each enclosed surface"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Boolean heatSource = false
    "True: heat source present in specified layer; false: no heat source present in specified layer"
    annotation(HideResult = true,Dialog(tab = "Advanced", group = "Heat sources"));
  parameter Integer layerWithHeatSource = 1
    "Wall layer with internal heat source (used if heatSource = true)"
    annotation(Dialog(tab = "Advanced", group = "Heat sources"));
equation
  connect(radBcPort1.radiationPort, toSurfacePort_1.radiationPort_out) annotation (Line(
      points={{-20,11.2},{-20,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(radBcPort2.radiationPort, toSurfacePort_2.radiationPort_out) annotation (Line(
      points={{20,11.2},{20,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
    Rectangle(extent={{-20,80},{20,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid),
    Line(points={{-20,80},{-20,-80}},color={0,0,255},smooth=Smooth.None,thickness=0.5),
    Text(extent={{8,-76},{100,-104}},lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString= "%name")}));
end WallGeneral;
