within BuildingSystems.Climate.WeatherDataMeteonorm;
record WeatherDataFile_England_London = BuildingSystems.Climate.WeatherData.WeatherDataFile(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/England_London_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
