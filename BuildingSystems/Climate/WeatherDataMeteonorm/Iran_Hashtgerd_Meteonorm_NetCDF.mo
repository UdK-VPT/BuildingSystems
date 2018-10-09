within BuildingSystems.Climate.WeatherDataMeteonorm;
block Iran_Hashtgerd_Meteonorm_NetCDF
extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileNetCDF(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Iran_Hashtgerd.nc"))
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Iran_Hashtgerd_Meteonorm_NetCDF;
