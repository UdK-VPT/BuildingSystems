within BuildingSystems.Climate.WeatherDataDWD;
block Germany_Potsdam2012_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: DWD",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Germany_Potsdam_2012_DWD_weather.nc"))
  annotation(Documentation(info="<html>source: Deutscher Wetterdienst</html>"));
end Germany_Potsdam2012_NetCDF;
