within BuildingSystems.Climate.WeatherDataMeteonorm;
block Algeria_Tamanrasset_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Algeria_Tamanrasset_weather.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Algeria_Tamanrasset_Meteonorm_NetCDF;
