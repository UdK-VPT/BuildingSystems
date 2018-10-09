within BuildingSystems.Climate.WeatherDataMeteonorm;
block SouthPole_AmundsenScott_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/SouthPole_AmundsenScott.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end SouthPole_AmundsenScott_Meteonorm_NetCDF;
