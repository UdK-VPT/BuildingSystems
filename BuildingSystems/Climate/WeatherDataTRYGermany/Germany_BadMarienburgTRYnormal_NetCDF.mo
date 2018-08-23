within BuildingSystems.Climate.WeatherDataTRYGermany;
block Germany_BadMarienburgTRYnormal_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: German TRY",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Germany_BadMarienburgTRYnormal_weather.nc"))
  annotation(Documentation(info="<html>source: German Test Reference Year</html>"));
end Germany_BadMarienburgTRYnormal_NetCDF;
