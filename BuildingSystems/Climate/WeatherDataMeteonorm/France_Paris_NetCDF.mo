within BuildingSystems.Climate.WeatherDataMeteonorm;
block France_Paris_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/France_Paris_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end France_Paris_NetCDF;
