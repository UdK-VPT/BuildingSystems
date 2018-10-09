within BuildingSystems.Climate.WeatherDataMeteonorm;
block USA_SanFrancisco_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/USA_SanFrancisco.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end USA_SanFrancisco_Meteonorm_NetCDF;
