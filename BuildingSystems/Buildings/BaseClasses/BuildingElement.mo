within BuildingSystems.Buildings.BaseClasses;
partial model BuildingElement
  "General model of building element"
  parameter BuildingSystems.Buildings.Types.GeometryType geometryType = BuildingSystems.Buildings.Types.GeometryType.Fixed
    "Fixed (default) or flexible geometry"
    annotation (Evaluate=true, Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.Units.SI.Length width=1.0
    "Width (if geometryType == Fixed)"
    annotation (Dialog(tab="General", group="Geometry"));
  output BuildingSystems.Interfaces.LengthOutput width_internal
    "Width";
  input BuildingSystems.Interfaces.LengthInput width_in(
    min=0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
    "Width from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-30,-36}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=180,origin={-30,-20})));
  parameter Modelica.Units.SI.Length height=1.0
    "Height (if geometryType == Fixed)"
    annotation (Dialog(tab="General", group="Geometry"));
  output BuildingSystems.Interfaces.LengthOutput height_internal
    "Height";
  input BuildingSystems.Interfaces.LengthInput height_in(
    min=0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
    "Height from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-30,-46}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=180,origin={-30,-40})));
  parameter Modelica.Units.NonSI.Angle_deg angleDegAzi=0.0
    "Azimuth angle (if geometryType == Fixed) -> south: 0 deg, east: -90 deg, west +90 deg, north: 180 deg"
    annotation (Dialog(tab="General", group="Geometry"));
  output BuildingSystems.Interfaces.Angle_degOutput angleDegAzi_internal
    "Azimuth angle";
  input BuildingSystems.Interfaces.Angle_degInput angleDegAzi_in(
    min=-180.0,
    max=180.0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
    "Azimuth angle from input"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=0,  origin={30,-46}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={30,-40})));
  parameter Modelica.Units.NonSI.Angle_deg angleDegTil=90.0
    "Tilt angle (if geometryType == Fixed) -> bottom: 0 deg, perpendicular: 90 deg, ceiling: 180 deg"
    annotation (Dialog(tab="General", group="Geometry"));
  output BuildingSystems.Interfaces.Angle_degOutput angleDegTil_internal
    "Tilt angle";
  input BuildingSystems.Interfaces.Angle_degInput angleDegTil_in(
    min=0.0,
    max=180.0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
    "Tilt angle from input"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=0,  origin={30,-36}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={30,-20})));
equation
  if geometryType == BuildingSystems.Buildings.Types.GeometryType.Fixed then
    width_internal = width;
    height_internal = height;
    angleDegAzi_internal = angleDegAzi;
    angleDegTil_internal = angleDegTil;
  else
    connect(width_internal, width_in);
    connect(height_internal, height_in);
    connect(angleDegAzi_internal, angleDegAzi_in);
    connect(angleDegTil_internal, angleDegTil_in);
  end if;

  annotation (
Documentation(info="<html>
<p>
This is partial model description of a building element.
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
end BuildingElement;
