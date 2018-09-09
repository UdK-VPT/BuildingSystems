within BuildingSystems.Climate.WeatherDataMeteonorm;
block Finland_Helsinki_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Finnland_Helsinki_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Finland_Helsinki_Meteonorm_NetCDF;
