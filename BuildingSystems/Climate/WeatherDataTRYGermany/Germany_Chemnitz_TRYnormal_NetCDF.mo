within BuildingSystems.Climate.WeatherDataTRYGermany;
block Germany_Chemnitz_TRYnormal_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: German TRY",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Germany_ChemnitzTRYnormal.nc"))
  annotation(Documentation(info="<html>source: German Test Reference Year</html>"));
end Germany_Chemnitz_TRYnormal_NetCDF;
