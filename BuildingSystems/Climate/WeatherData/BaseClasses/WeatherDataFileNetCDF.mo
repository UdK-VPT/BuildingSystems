within BuildingSystems.Climate.WeatherData.BaseClasses;
partial block WeatherDataFileNetCDF
  "Template for weather data files (NetCDF format)"
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileGeneral(
    final latitudeDeg = constantVariable[2],
    final longitudeDeg = constantVariable[1],
    final longitudeDeg_0 = constantVariable[3]);
  extends BuildingSystems.Utilities.NetCDF_DataReader.NcDataReader(
  final nout = size(varNameTime,1),
  final varNameTime = {
    "beam_radiation",
    "diffuse_radiation",
    "air_temperature",
    "wind_speed",
    "wind_direction",
    "relative_humidity",
    "cloud_cover"},
  final varTimeLowerLimit = {0.0, 0.0,-100, 0.0, 0.0, 0.0, 0.0},
  final varTimeUpperLimit = {1000.0, 1000.0, 100.0, 100.0, 360.0, 1.0, 8.0},
  final varNameConstant = {"longitude", "latitude", "longitude_0"},
  fileName="",
  y(final quantity={"RadiantEnergyFluenceRate","RadiantEnergyFluenceRate","ThermodynamicTemperature","Velocity","Angle_deg","RelativeHumidity","CloudCover"},
    final unit={"W/m2","W/m2","K","m/s","deg","1","1"},
    final displayUnit={"W/m2","W/m2","degC","m/s","deg","1","1"}));
  parameter String info = "";
equation
  IrrDirHor=y[1];
  IrrDifHor=y[2];
  tAirRef=y[3];
  vWindRef=y[4];
  angleDegWindRef=y[5];
  phiAir=y[6];
  cloudCover=y[7];
  annotation (Icon(graphics={Text(extent={{-90,88},{90,-92}},lineColor={28,108,200},textString="N")}),
Documentation(info="<html>
<p>
This is a partial model for reading weather data sets in the NetCDF data format.
</p>
</html>", revisions="<html>
<ul>
<li>
August 23, 2018 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WeatherDataFileNetCDF;
