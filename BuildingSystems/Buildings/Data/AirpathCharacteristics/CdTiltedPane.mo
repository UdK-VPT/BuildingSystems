within BuildingSystems.Buildings.Data.AirpathCharacteristics;
function CdTiltedPane
  "Calculates the Cd value of a tilted pane"
  input Modelica.Units.SI.Length height "Height of the opening";
  input Modelica.Units.SI.Length width "Width of the opening";
  input Modelica.Units.NonSI.Angle_deg angleDegPanes "Tilt angle of the panes";
  output Real value;
algorithm
  value := 0.0147 * angleDegPanes - 0.0928 * height / width + 0.4116;
end CdTiltedPane;
