within BuildingSystems.Climate.WeatherDataDWD;
record WeatherDataFile_Germany_Potsdam2003 = BuildingSystems.Climate.WeatherData.WeatherDataFile(
  info="Source: DWD",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/WeatherDataNetcdf/Germany_Potsdam_2003_DWD_weather.nc"))
  annotation(Documentation(info="<html>source: Deutscher Wetterdienst</html>"));
