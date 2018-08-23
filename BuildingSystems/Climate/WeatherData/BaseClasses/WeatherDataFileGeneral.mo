within BuildingSystems.Climate.WeatherData.BaseClasses;
partial block WeatherDataFileGeneral
  "Template for weather data files"
  parameter String info="";
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg latitudeDeg
    "Latitude";
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg longitudeDeg
    "Longitude";
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg longitudeDeg_0
    "longitude_0";
  Modelica.SIunits.RadiantEnergyFluenceRate IrrDirHor
    "Solar beam radiation of horizontal surface";
  Modelica.SIunits.RadiantEnergyFluenceRate IrrDifHor
    "Solar diffuse radiation of horizontal surface";
  Modelica.SIunits.Temp_C tAirRef
    "Air temperature";
  Modelica.SIunits.Velocity vWindRef
    "Wind speed on reference height";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegWindRef
    "Angle of wind direction on reference height";
  BuildingSystems.Types.RelativeHumidity phiAir
    "Relative humidity";
  Real cloudCover(min=0.0,max=8.0,unit="1")
    "Cloud cover";
  annotation (
Documentation(info="<html>
<p>
This is a partial model for reading weather data sets.
</p>
</html>", revisions="<html>
<ul>
<li>
August 23, 2018 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WeatherDataFileGeneral;
