within BuildingSystems.Climate.WeatherDataMeteonorm;
block Germany_Berlin_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Germany_Berlin_weather.nc"));
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Germany_Berlin_Meteonorm_NetCDF;
