within BuildingSystems.Buildings.BaseClasses;
partial model ConstructionGeneral
  "General model of building constructions (walls, windows, roofs etc.)"
  parameter Modelica.SIunits.Length width
    "Width"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length height
    "Height"
    annotation(Dialog(tab = "General", group = "Geometry"));
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

  annotation (
Documentation(info="<html>
<p>
This is partial model description of a building construction.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ConstructionGeneral;
