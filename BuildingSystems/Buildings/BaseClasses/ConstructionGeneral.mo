within BuildingSystems.Buildings.BaseClasses;
partial model ConstructionGeneral
  "General model of building constructions (walls, windows, roofs etc.)"
  parameter Modelica.SIunits.Length width
    "Width"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length height
    "Height"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Area A
    "Net area (gross area minus enclosed surfaces)"
    annotation(Dialog(enable = false, tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAzi = 0.0
    "Azimuth angle"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegTil = 90.0
    "Tilt angle"
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
end ConstructionGeneral;
