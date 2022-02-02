within BuildingSystems.Climate.WeatherDataIbat;
block office228_ASCII
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileASCII(
  info="Source: meteoblue - Location = Basel",
  filNam=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Climate/weather/Switzerland_Basel_office228Rad0.txt"),
  final tabNam="tab1",
  final timeFac = 1.0/3600.0,
  final deltaTime = 3600.0,
  final columns={
    3, // beam horizontal radiation
    4, // diffuse horizontal radiation
    2, // air temperature
    7, // wind speed
    8, // wind direction
    5, // relative humidity
    6  // cloud cover
    },
  final scaleFac = {1.0,1.0,1.0,1.0,1.0,0.01,0.01},
  final latitudeDeg = 48.3444,
  final longitudeDeg = 7.4549,
  final longitudeDeg_0 = 1.0);
  annotation(Documentation(info="<html>source: meteoblue</html>"));
end office228_ASCII;