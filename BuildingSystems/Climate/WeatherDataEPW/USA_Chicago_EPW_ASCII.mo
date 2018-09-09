within BuildingSystems.Climate.WeatherDataEPW;
block USA_Chicago_EPW_ASCII
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileASCII(
  info="Source: Energy Plus weather data base",
  filNam=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"),
  final tabNam="tab1",
  final timeFac = 1.0,
  final columns={
    9,  // global horizontalradiation
    11, // diffuse horizontal radiation
    2,  // air temperature
    17, // wind speed
    16, // wind direction
    4,  // relative humidity
    19  // cloud cover
    },
  final scaleFac = {1.0,1.0,1.0,1.0,1.0,0.01,0.1*8.0},
  final latitudeDeg = 37.62,
  final longitudeDeg = -122.4,
  final longitudeDeg_0 = -8.0);
  annotation(Documentation(info="<html>source: EnergyPlus weather data base https://energyplus.net/weather </html>"));
end USA_Chicago_EPW_ASCII;
