within BuildingSystems.Climate.WeatherDataMeteonorm;
block Russia_Olenek_Meteonorm_NetCDF
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Russia_Olenek.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Russia_Olenek_Meteonorm_NetCDF;
