within BuildingSystems.Climate.WeatherData;
block WeatherDataNetcdf "Weather data reader with Netcdf format"
  extends BuildingSystems.Utilities.NcDataReader2.NcDataReader(
  varNameTime = {
    "beam_radiation",
    "diffuse_radiation",
    "air_temperature",
    "wind_speed",
    "wind_direction",
    "relative_humidity",
    "cloud_cover"},
     varTimeLowerLimit = {0.0, 0.0,-100, 0.0, 0.0, 0.0, 0.0},
     varTimeUpperLimit = {1000.0, 1000.0, 100.0, 100.0, 360.0, 1.0, 8.0},
     varNameConstant = {"longitude", "latitude", "longitude_0"},
     fileName = weatherDataFile.fileName);
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg longitudeDeg = constantVariable[1]
    "Longitude of the local point";
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg latitudeDeg = constantVariable[2]
    "Latitude of the local point";
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg longitudeDeg0 = constantVariable[3]
    "Longitude of the local time zone";
  replaceable parameter BuildingSystems.Climate.WeatherData.WeatherDataFile weatherDataFile
    "Selected weather data file"
    annotation (Dialog(tab="General"),Evaluate=true,choicesAllMatching=true);

    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
      Rectangle(extent={{-100,100},{100,-100}},lineColor={170,213,255},fillColor={170,213,255},fillPattern=FillPattern.Solid),
      Ellipse(extent={{-90,-2},{-8,-46}},  lineColor={0,128,255},fillColor={0,128,255},fillPattern=  FillPattern.Solid),
      Ellipse(extent={{-58,22},{20,-32}},  lineColor={0,128,255},fillColor={0,128,255},fillPattern=  FillPattern.Solid),
      Ellipse(extent={{-36,-16},{38,-64}},lineColor={0,128,255},fillColor={0,128,255},fillPattern=  FillPattern.Solid),
      Ellipse(extent={{6,90},{90,8}},    lineColor={255,255,0},fillColor={255,255,85},fillPattern=  FillPattern.Solid),
      Text(extent={{-44,-48},{44,-118}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid,textString="NetCDF")}));
end WeatherDataNetcdf;
