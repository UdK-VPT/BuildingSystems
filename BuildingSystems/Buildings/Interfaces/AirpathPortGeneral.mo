within BuildingSystems.Buildings.Interfaces;
connector AirpathPortGeneral
  "Port for air exchange through an air path (complex connector type)"
  BuildingSystems.Interfaces.FlowPort flowPort(
    redeclare final package Medium = BuildingSystems.Media.Air)
    "Port for air mas flow";
  BuildingSystems.Types.FlowCoefficient k
    "Air path coefficient";
  Real nd
    "Air path exponent (between 0.5 and 1)";
end AirpathPortGeneral;
