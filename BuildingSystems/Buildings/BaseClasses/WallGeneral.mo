within BuildingSystems.Buildings.BaseClasses;
partial model WallGeneral
  "General wall model"
  extends BuildingSystems.Buildings.BaseClasses.ConstructionGeneral;
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_2(
    A=ASur,
    abs = abs_2,
    geo.angleDegAzi=angleDegAzi,
    geo.angleDegTil=angleDegTil,
    geo.width=width_internal,
    geo.height=height_internal,
    geo.zMean = zLevel + Modelica.Math.sin(Modelica.Constants.pi/180.0*angleDegTil) * height_internal,
    geo.point.x={0.0,width_internal,width_internal,0.0},
    geo.point.y={0.0,0.0,height_internal,height_internal},
    geo.point.z={0.0,0.0,0.0,0.0},
    epsilon = epsilon_2)
    "Interface to surface on side 2"
    annotation (Placement(transformation(extent={{10,-10},{30,10}}), iconTransformation(extent={{10,-10},{30,10}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_1(
    A=ASur,
    abs = abs_1,
    geo.angleDegAzi=angleDegAzi,
    geo.angleDegTil=angleDegTil,
    geo.width=width_internal,
    geo.height=height_internal,
    geo.zMean = zLevel + Modelica.Math.sin(Modelica.Constants.pi/180.0*angleDegTil) * height_internal,
    geo.point.x={0.0,width_internal,width_internal,0.0},
    geo.point.y={0.0,0.0,height_internal,height_internal},
    geo.point.z={0.0,0.0,0.0,0.0},
    epsilon = epsilon_1)
    "Interface to surface on side 1"
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}}), iconTransformation(extent={{-30,-10},{-10,10}})));
  BuildingSystems.Climate.Sources.RadiationFixed radBcPort1(
    IrrDir_constant = 0.0,
    IrrDif_constant = 0.0,
    angleDegInc_constant = 0.0)
    "Interface to short-wave radiation on side 1"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-20,16})));
  BuildingSystems.Climate.Sources.RadiationFixed radBcPort2(
    IrrDir_constant = 0.0,
    IrrDif_constant = 0.0,
    angleDegInc_constant = 0.0)
    "Interface to short-wave radiation on side 2"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={20,16})));
  Modelica.SIunits.Area ASur = height_internal * width_internal - AInnSur_internal
    "Net surface area (gross area minus enclosed surfaces)"
    annotation(Dialog(enable = false, tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Area AInnSur = 0.0
    "Area of all enclosed surfaces (if geometryType == Fixed)"
    annotation(Dialog(tab = "General", group = "Geometry"));
  output BuildingSystems.Interfaces.AreaOutput AInnSur_internal
    "Area of all enclosed surfaces";
  input BuildingSystems.Interfaces.AreaInput AInnSur_in(
    min=0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
    "Area of all enclosed surfaces from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-30,40}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=180,origin={-20,-40})));
  parameter Boolean heatSource = false
    "True: heat source present in specified layer; false: no heat source present in specified layer"
    annotation(HideResult = true,Dialog(tab = "Advanced", group = "Heat sources"));
  parameter Integer layerWithHeatSource = 1
    "Wall layer with internal heat source (used if heatSource = true)"
    annotation(Dialog(tab = "Advanced", group = "Heat sources"));
equation
  if geometryType == BuildingSystems.Buildings.Types.GeometryType.Fixed then
    AInnSur_internal = AInnSur;
  else
    connect(AInnSur_internal, AInnSur_in);
  end if;

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
    Line(points={{-20,80},{-20,-80}},color={0,0,255},smooth=Smooth.None,thickness=0.5)}),
Documentation(info="<html>
<p>
This is partial model description of a wall.
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
end WallGeneral;
