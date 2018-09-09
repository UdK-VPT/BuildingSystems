within BuildingSystems.Climate.WeatherDataMeteonorm;
block India_Bombay_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/India_Bombay_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end India_Bombay_Meteonorm_NetCDF;
