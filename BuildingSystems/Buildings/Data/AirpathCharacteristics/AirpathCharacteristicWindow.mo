within BuildingSystems.Buildings.Data.AirpathCharacteristics;
block AirpathCharacteristicWindow
  input BuildingSystems.Interfaces.Angle_degInput angleDegPanes
    "Tilt angle of the panes";
  parameter Modelica.SIunits.Length height
    "Height of the opening";
  parameter Modelica.SIunits.Length width
    "Width of the opening";
  parameter BuildingSystems.Types.CoefficientOfAirChange aF
    "Joint coefficient";
  output Modelica.Blocks.Interfaces.RealOutput k
    "Flow coefficient";
  output Modelica.Blocks.Interfaces.RealOutput m;
  constant Modelica.SIunits.Density rhoAir = 1.2
    "Mean air density";
protected
  Real kClosed, kOpen;
algorithm
  kClosed := aF * (2 * height+width);
  kOpen := CdTiltedPane(height,width,angleDegPanes) * width * height * (2.0/rhoAir)^0.5;
  k := BuildingSystems.Utilities.SmoothFunctions.softswitch(angleDegPanes, 0.1,kClosed,kOpen,0.01);
  m := BuildingSystems.Utilities.SmoothFunctions.softswitch(angleDegPanes, 0.1,0.5,0.666,0.01);
end AirpathCharacteristicWindow;
