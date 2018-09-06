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
    final startTime = -1800.0,
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
  IrrDirHor=BuildingSystems.Utilities.Math.Functions.smoothMax(y[1],0.0,0.1);
  IrrDifHor=BuildingSystems.Utilities.Math.Functions.smoothMax(y[2],0.0,0.1);
  tAirRef=y[3];
  vWindRef=BuildingSystems.Utilities.Math.Functions.smoothMax(y[4],0.0,0.1);
  angleDegWindRef=y[5];
  phiAir=BuildingSystems.Utilities.Math.Functions.smoothMax(y[6]/10.0,0.0,0.1);
  cloudCover=BuildingSystems.Utilities.Math.Functions.smoothMax(y[7],0.0,0.1);
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
