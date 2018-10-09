within BuildingSystems.Climate.WeatherDataMeteonorm;
block Canada_Alert_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Canada_Alert.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Canada_Alert_Meteonorm_NetCDF;
