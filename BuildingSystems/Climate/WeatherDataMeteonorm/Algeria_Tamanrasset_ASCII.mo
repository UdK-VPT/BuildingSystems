within BuildingSystems.Climate.WeatherDataMeteonorm;
block Algeria_Tamanrasset_ASCII
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileASCII(
  info="Source: Meteonorm 7.0",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Algeria_Tamanrasset.txt"),
  final latitudeDeg = 22.783,
  final longitudeDeg = 5.517,
  final longitudeDeg_0 = 1.0);
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Algeria_Tamanrasset_ASCII;
