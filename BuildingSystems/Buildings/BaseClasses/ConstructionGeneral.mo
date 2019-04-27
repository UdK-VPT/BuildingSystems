within BuildingSystems.Buildings.BaseClasses;
partial model ConstructionGeneral
  "General model of building constructions (walls, windows, roofs etc.)"
  parameter BuildingSystems.Buildings.Types.GeometryType geometryType = BuildingSystems.Buildings.Types.GeometryType.Fixed
    "Fixed (default) or flexible geometry"
    annotation (Evaluate=true, Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length width = 1.0
    "Width (if geometryType == Fixed)"
    annotation(Dialog(tab = "General", group = "Geometry"));
  output BuildingSystems.Interfaces.LengthOutput width_internal
    "Width";
  input BuildingSystems.Interfaces.LengthInput width_in(
    min=0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
    "Width from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-30,40}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=180,origin={-20,40})));
  parameter Modelica.SIunits.Length height = 1.0
    "Height (if geometryType == Fixed)"
    annotation(Dialog(tab = "General", group = "Geometry"));
  output BuildingSystems.Interfaces.LengthOutput height_internal
    "Height";
  input BuildingSystems.Interfaces.LengthInput height_in(
    min=0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
    "Height from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={30,40}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=0,  origin={20,40})));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAzi = 0.0
    "Azimuth angle (south: 0 deg, east: -90 deg, west +90 deg, north: 180 deg)"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegTil = 90.0
    "Tilt angle (bottom: 0 deg, perpendicular: 90 deg, ceiling: 180 deg)"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length zLevel = 0.0
    "Vertical position"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter BuildingSystems.Types.Absorptance abs_1 = 0.5
    "Short-wave absorptance side 1"
    annotation(Dialog(tab = "General", group = "Surfaces"));
  parameter BuildingSystems.Types.Absorptance abs_2 = 0.5
    "Short-wave absorptance side 2"
    annotation(Dialog(tab = "General", group = "Surfaces"));
  parameter Modelica.SIunits.Emissivity epsilon_1 = 0.9
    "Long-wave emittance side 1"
    annotation(Dialog(tab = "General", group = "Surfaces"));
  parameter Modelica.SIunits.Emissivity epsilon_2 = 0.9
    "Long-wave emittance side 2"
    annotation(Dialog(tab = "General", group = "Surfaces"));
equation
  if geometryType == BuildingSystems.Buildings.Types.GeometryType.Fixed then
    width_internal = width;
  else
    connect(width_internal, width_in);
  end if;

  if geometryType == BuildingSystems.Buildings.Types.GeometryType.Fixed then
    height_internal = height;
  else
    connect(height_internal, height_in);
  end if;

  annotation (
Documentation(info="<html>
<p>
This is partial model description of a building construction.
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
end ConstructionGeneral;
