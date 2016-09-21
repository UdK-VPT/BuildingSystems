within BuildingSystems.Climate.Examples;
model WeatherDataReaderTest
  "Test model for reading weather data ftom TMY3 and NetCDF format"
  extends Modelica.Icons.Example;
  BuildingSystems.Climate.WeatherData.WeatherDataReader weaDatTMY3(
    NetCDF=false,
    filNamTMY3="modelica://BuildingSystems/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos")
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  BuildingSystems.Climate.WeatherData.WeatherDataReader weaDatNetCDF(
    NetCDF=true,
    redeclare BuildingSystems.Climate.WeatherDataDWD.WeatherDataFile_Germany_Potsdam2003 filNamNetCDF)
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
  annotation (uses(BuildingSystems(version="0.1")));
end WeatherDataReaderTest;
