within BuildingSystems.Climate.WeatherDataMeteonorm;
record WeatherDataFile_Australia_Sydney = BuildingSystems.Climate.WeatherData.WeatherDataFile(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Australia_Sydney_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
