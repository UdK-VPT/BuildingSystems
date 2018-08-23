within BuildingSystems.Climate.WeatherDataMeteonorm;
block Germany_Berlin_ASCII
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileASCII(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Germany_Berlin.txt"),
  final latitudeDeg = 52.47,
  final longitudeDeg = 13.4,
  final longitudeDeg_0 = 1.0);
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Germany_Berlin_ASCII;
