within BuildingSystems.Buildings.Data.AirpathCharacteristics;
function CdTiltedPane
  input Modelica.SIunits.Length height "Height of the opening";
  input Modelica.SIunits.Length width "Width of the opening";
  input Real angleDegPanes "Tilt angle of the panes";
  output Real value;
algorithm
  value := 0.0147 * angleDegPanes - 0.0928 * height / width + 0.4116;
end CdTiltedPane;
