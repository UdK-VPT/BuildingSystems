within BuildingSystems.Climate.WeatherDataMeteonorm;
block Brasil_Manaus_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Brasil_Manaus_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Brasil_Manaus_NetCDF;
