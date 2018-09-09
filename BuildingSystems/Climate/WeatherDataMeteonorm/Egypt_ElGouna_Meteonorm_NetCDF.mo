within BuildingSystems.Climate.WeatherDataMeteonorm;
block Egypt_ElGouna_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Egypt_ElGouna_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Egypt_ElGouna_Meteonorm_NetCDF;
