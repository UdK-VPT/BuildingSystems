within BuildingSystems.Buildings.BaseClasses;
partial model WallTriangularGeneral
  "General wall model"
  extends BuildingSystems.Buildings.BaseClasses.TriangularConstructionGeneral;
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
  parameter Boolean heatSource = false
    "True: heat source present in specified layer; false: no heat source present in specified layer"
    annotation(HideResult = true,Dialog(tab = "Advanced", group = "Heat sources"));
  parameter Integer layerWithHeatSource = 1
    "Wall layer with internal heat source (used if heatSource = true)"
    annotation(Dialog(tab = "Advanced", group = "Heat sources"));
equation
  if coordinateType == BuildingSystems.Buildings.Types.CoordinateType.Local then
    ASur = abs(0.5*(verticesLocal_internal[1,1]*(verticesLocal_internal[2,2]-verticesLocal_internal[3,2])
           +verticesLocal_internal[2,1]*(verticesLocal_internal[3,2]-verticesLocal_internal[1,2])
           +verticesLocal_internal[3,1]*(verticesLocal_internal[1,2]-verticesLocal_internal[2,2])));
  end if;
  if coordinateType == BuildingSystems.Buildings.Types.CoordinateType.Global then
    ASur = 0.5 * Modelica.Math.Vectors.length(cross(verticesGlobal_internal[1]-verticesGlobal_internal[2],verticesGlobal_internal[1]-verticesGlobal_internal[3]));
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
    Polygon(points={{0,80},{-60,-80},{60,-82},{0,80}},lineColor={28,108,200},
      pattern=LinePattern.None,fillColor={230,230,230},fillPattern=FillPattern.Solid),
    Line(points={{0,80},{-60,-80}},  color={0,0,255},smooth=Smooth.None,thickness=1.0)}),
Documentation(info="<html>
<p>
This is partial model description of a wall.
</p>
</html>", revisions="<html>
<ul>
<li>
August 6, 2020 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WallTriangularGeneral;
