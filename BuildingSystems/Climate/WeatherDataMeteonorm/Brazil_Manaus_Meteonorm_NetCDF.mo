within BuildingSystems.Climate.WeatherDataMeteonorm;
block Brazil_Manaus_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Brazil_Manaus_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Brazil_Manaus_Meteonorm_NetCDF;
