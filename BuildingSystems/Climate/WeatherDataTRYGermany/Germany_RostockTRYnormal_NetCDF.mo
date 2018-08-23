within BuildingSystems.Climate.WeatherDataTRYGermany;
block Germany_RostockTRYnormal_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: German TRY",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Germany_RostockTRYnormal_weather.nc"))
  annotation(Documentation(info="<html>source: German Test Reference Year</html>"));
end Germany_RostockTRYnormal_NetCDF;
