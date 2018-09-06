within BuildingSystems.Climate.WeatherDataDWD;
block Germany_Potsdam2016_ASCII
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileASCII(
  info="Source: DWD",
  fileName=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Germany_Potsdam_2016_DWD.txt"),
  final latitudeDeg = 52.47,
  final longitudeDeg = 13.4,
  final longitudeDeg_0 = 1.0);
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Germany_Potsdam2016_ASCII;
