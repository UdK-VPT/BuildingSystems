within BuildingSystems.Climate.WeatherDataMeteonorm;
block Germany_Berlin_Tempelhof_Meteonorm_ASCII
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileASCII(
  info="Source: Meteonorm 7.0",
  filNam=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Germany_Berlin_Tempelhof.txt"),
  final tabNam="tab1",
  final timeFac = 1.0/3600.0,
  final deltaTime = 1800.0,
  final columns={
    5,
    6,
    3,
    8,
    9,
    4,
    7},
  final scaleFac = {1.0,1.0,1.0,1.0,1.0,0.01,1.0},
  final latitudeDeg = 52.47,
  final longitudeDeg = 13.40,
  final longitudeDeg_0 = 1.0);
       // beam horizontal radiation
       // diffuse horizontal radiation
       // air temperature
       // wind speed
       // wind direction
       // relative humidity
       // cloud cover
  annotation(Documentation(info="<html>source: Meteonorm 7.0</html>"));
end Germany_Berlin_Tempelhof_Meteonorm_ASCII;
