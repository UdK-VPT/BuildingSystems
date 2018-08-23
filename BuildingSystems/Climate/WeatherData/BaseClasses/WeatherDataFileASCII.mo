within BuildingSystems.Climate.WeatherData.BaseClasses;
partial block WeatherDataFileASCII
  "Template for weather data files (ASCII format)"
  extends BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileGeneral;
  extends Modelica.Blocks.Sources.CombiTimeTable(
    final tableOnFile=true,
    fileName="",
    final smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
    final extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic,
    final tableName="tab1",
    final columns={
      5, // beam_radiation
      6, // diffuse_radiation
      3, // air_temperature
      8, // wind_speed
      9, // wind_direction
      4, // relative_humidity
      7 // cloud_cover
      },
    final timeScale=3600,
    y(final quantity={"RadiantEnergyFluenceRate","RadiantEnergyFluenceRate","ThermodynamicTemperature","Velocity","Angle_deg","RelativeHumidity","CloudCover"},
      final unit={"W/m2","W/m2","K","m/s","deg","1","1"},
      final displayUnit={"W/m2","W/m2","degC","m/s","deg","1","1"}));
equation
  IrrDirHor=y[1];
  IrrDifHor=y[2];
  tAirRef=y[3];
  vWindRef=y[4];
  angleDegWindRef=y[5];
  phiAir=y[6];
  cloudCover=y[7];
  annotation (
Documentation(info="<html>
<p>
This is a partial model for reading weather data sets in the ASCII data format.
</p>
</html>", revisions="<html>
<ul>
<li>
August 23, 2018 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WeatherDataFileASCII;
