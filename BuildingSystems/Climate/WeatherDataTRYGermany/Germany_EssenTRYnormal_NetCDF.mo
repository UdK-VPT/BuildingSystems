within BuildingSystems.Climate.WeatherDataTRYGermany;
block Germany_EssenTRYnormal_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: German TRY",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Germany_EssenTRYnormal_weather.nc"))
  annotation(Documentation(info="<html>source: German Test Reference Year</html>"));
end Germany_EssenTRYnormal_NetCDF;
