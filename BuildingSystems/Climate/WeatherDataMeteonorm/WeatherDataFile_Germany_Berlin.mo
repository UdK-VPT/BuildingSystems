within BuildingSystems.Climate.WeatherDataMeteonorm;
record WeatherDataFile_Germany_Berlin = BuildingSystems.Climate.WeatherData.WeatherDataFile(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Germany_Berlin_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
