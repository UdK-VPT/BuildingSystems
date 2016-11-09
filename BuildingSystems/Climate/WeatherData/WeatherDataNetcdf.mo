within BuildingSystems.Climate.WeatherData;
block WeatherDataNetcdf "Weather data reader with Netcdf format"
  extends BuildingSystems.Utilities.NcDataReader2.NcDataReader(
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
  final fileName = weatherDataFile.fileName,
  y(final quantity={"EnergyFluenceRate","EnergyFluenceRate","ThermodynamicTemperature","Velocity","Angle_deg","RelativeHumidity","CloudCover"},
    final unit={"W/m2","W/m2","K","m/s","deg","1","1"},
    final displayUnit={"W/m2","W/m2","degC","m/s","deg","1","1"}));
  output BuildingSystems.Interfaces.Angle_degOutput latitudeDeg = constantVariable[2]
    "Longitude of the local point"
    annotation (Placement(transformation(extent={{100,80},{120,100}}), iconTransformation(extent={{100,80},{120,100}})));
  output BuildingSystems.Interfaces.Angle_degOutput longitudeDeg = constantVariable[1]
    "Latitude of the local point"
    annotation (Placement(transformation(extent={{100,70},{120,90}}), iconTransformation(extent={{100,60},{120,80}})));
  output BuildingSystems.Interfaces.Angle_degOutput longitudeDeg0 = constantVariable[3]
    "Longitude of the local time zone"
    annotation (Placement(transformation(extent={{100,60},{120,80}}), iconTransformation(extent={{100,40},{120,60}})));
  replaceable parameter BuildingSystems.Climate.WeatherData.WeatherDataFile weatherDataFile
    "Selected weather data file"
    annotation (Dialog(tab="General"),Evaluate=true,choicesAllMatching=true);

    annotation (defaultComponentName="weaDat",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
      Rectangle(extent={{-100,100},{100,-100}},lineColor={170,213,255},fillColor={170,213,255},fillPattern=FillPattern.Solid),
      Ellipse(extent={{-90,-2},{-8,-46}},  lineColor={0,128,255},fillColor={0,128,255},fillPattern=  FillPattern.Solid),
      Ellipse(extent={{-58,22},{20,-32}},  lineColor={0,128,255},fillColor={0,128,255},fillPattern=  FillPattern.Solid),
      Ellipse(extent={{-36,-16},{38,-64}},lineColor={0,128,255},fillColor={0,128,255},fillPattern=  FillPattern.Solid),
      Ellipse(extent={{6,90},{90,8}},    lineColor={255,255,0},fillColor={255,255,85},fillPattern=  FillPattern.Solid),
      Text(extent={{-44,-48},{44,-118}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid,textString="NetCDF")}),
      Documentation(info="<html>
      <p>For a guide on how to generate weather data files that are compatible with this component and a corresponding Python script please refer to \\BuildingSystems\\Resources\\Scripts\\WeatherDataConverter\\README.md</p>
      </html>"));
end WeatherDataNetcdf;
