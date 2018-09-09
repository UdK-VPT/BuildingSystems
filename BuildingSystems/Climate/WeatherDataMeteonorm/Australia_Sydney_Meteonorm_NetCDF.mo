within BuildingSystems.Climate.WeatherDataMeteonorm;
block Australia_Sydney_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Australia_Sydney_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Australia_Sydney_Meteonorm_NetCDF;
