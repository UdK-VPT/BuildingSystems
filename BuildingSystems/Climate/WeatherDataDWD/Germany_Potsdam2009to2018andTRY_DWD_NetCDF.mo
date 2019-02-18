within BuildingSystems.Climate.WeatherDataDWD;
block Germany_Potsdam2009to2018andTRY_DWD_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: DWD",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Germany_Potsdam_2009_to_2018_and_TRY_DWD.nc"))
  annotation(Documentation(info="<html>source: Deutscher Wetterdienst</html>"));
end Germany_Potsdam2009to2018andTRY_DWD_NetCDF;
