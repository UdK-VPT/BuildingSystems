within BuildingSystems.Climate.WeatherDataMeteonorm;
block China_Beijing_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/China_Beijing_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end China_Beijing_Meteonorm_NetCDF;
