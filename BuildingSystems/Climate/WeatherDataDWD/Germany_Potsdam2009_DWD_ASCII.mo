within BuildingSystems.Climate.WeatherDataDWD;
block Germany_Potsdam2016_DWD_ASCII
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileASCII(
  info="Source: DWD",
  filNam=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Germany_Potsdam_2009_DWD.txt"),
  final tabNam="tab1",
  final timeFac = 1.0/3600.0,
  final deltaTime = 1800.0,
  final columns={
    5, // beam horizontal radiation
    6, // diffuse horizontal radiation
    3, // air temperature
    8, // wind speed
    9, // wind direction
    4, // relative humidity
    7  // cloud cover
    },
  final scaleFac = {1.0,1.0,1.0,1.0,1.0,0.01,1.0},
  final latitudeDeg = 52.47,
  final longitudeDeg = 13.4,
  final longitudeDeg_0 = 1.0);
  annotation(Documentation(info="<html>source: DWD</html>"));
end Germany_Potsdam2016_DWD_ASCII;
