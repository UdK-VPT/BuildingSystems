within BuildingSystems.Climate.WeatherDataEPW;
block USA_Chicago_EPW_ASCII
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileASCII(
  info="Source: Energy Plus weather data base",
  filNam=Modelica.Utilities.Files.loadResource("modelica://BuildingSystems/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"),
  final tabNam="tab1",
  final timeFac = 1.0,
  final columns={
    9,
    11,
    2,
    17,
    16,
    4,
    19},
  final scaleFac = {1.0,1.0,1.0,1.0,1.0,0.01,0.1*8.0},
  final latitudeDeg = 37.62,
  final longitudeDeg = -122.4,
  final longitudeDeg_0 = -8.0);
        // global horizontalradiation
        // diffuse horizontal radiation
        // air temperature
        // wind speed
        // wind direction
        // relative humidity
        // cloud cover
  annotation(Documentation(info="<html>source: EnergyPlus weather data base https://energyplus.net/weather </html>"));
end USA_Chicago_EPW_ASCII;
