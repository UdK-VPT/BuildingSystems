within BuildingSystems.Climate.WeatherDataMeteonorm;
record WeatherDataFile_Chile_Punta_Arenas = BuildingSystems.Climate.WeatherData.WeatherDataFile(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Chile_Punta_Arenas_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
