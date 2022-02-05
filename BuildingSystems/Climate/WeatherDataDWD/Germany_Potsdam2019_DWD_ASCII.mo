within BuildingSystems.Climate.WeatherDataDWD;
block Germany_Potsdam2019_DWD_ASCII
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileASCII(
  info="Source: DWD",
  filNam=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Germany_Potsdam_2019_DWD.txt"),
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
  final latitudeDeg = 52.383,
  final longitudeDeg = 13.067,
  final longitudeDeg_0 = 1.0);
       // beam horizontal radiation
       // diffuse horizontal radiation
       // air temperature
       // wind speed
       // wind direction
       // relative humidity
       // cloud cover
  annotation(Documentation(info="<html>source: DWD</html>"));
end Germany_Potsdam2019_DWD_ASCII;
