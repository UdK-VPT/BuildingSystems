within BuildingSystems.Climate.WeatherData;
block WeatherDataNetcdf
  "Weather data reader with Netcdf format"
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
  final fileName = weatherDataFile.fileName,
  y(final quantity={"RadiantEnergyFluenceRate","RadiantEnergyFluenceRate","ThermodynamicTemperature","Velocity","Angle_deg","RelativeHumidity","CloudCover"},
    final unit={"W/m2","W/m2","K","m/s","deg","1","1"},
    final displayUnit={"W/m2","W/m2","degC","m/s","deg","1","1"}));
  output BuildingSystems.Interfaces.Angle_degOutput latitudeDeg = constantVariable[2]
    "Latitude"
    annotation (Placement(transformation(extent={{100,80},{120,100}}), iconTransformation(extent={{100,80},{120,100}})));
  output BuildingSystems.Interfaces.Angle_degOutput longitudeDeg = constantVariable[1]
    "Longitude"
    annotation (Placement(transformation(extent={{100,70},{120,90}}), iconTransformation(extent={{100,60},{120,80}})));
  output BuildingSystems.Interfaces.Angle_degOutput longitudeDeg0 = constantVariable[3]
    "Longitude of the local time zone"
    annotation (Placement(transformation(extent={{100,60},{120,80}}), iconTransformation(extent={{100,40},{120,60}})));
  replaceable parameter BuildingSystems.Climate.WeatherData.WeatherDataFile weatherDataFile
    "Selected weather data file"
    annotation (Dialog(tab="General"),Evaluate=true,choicesAllMatching=true);

  output Interfaces.Temp_KOutput TAirRef = y[3]+273.15
    "Air temperature on reference height"
    annotation (Placement(transformation(extent={{-86,60},{-66,80}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={-70,-110})));
  output Interfaces.Moisture_absOutput xAir=
      BuildingSystems.Utilities.Psychrometrics.Functions.X_pSatpphi(
      BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(y[3]+273.15),
      100000.0,
      y[6])
    "Absolute moisture of ambient air"
    annotation (Placement(transformation(extent={{-86,36},{-66,56}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={-50,-110})));
  output Interfaces.RadiantEnergyFluenceRateOutput IrrDirHor = y[1]
    "Solar beam radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-86,10},{-66,30}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={-30,-110})));
  output Interfaces.RadiantEnergyFluenceRateOutput IrrDifHor = y[2]
    "Solar diffuse radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={-10,-110})));
  output Interfaces.VelocityOutput vWindRef = y[4]
    "Wind speed on reference height"
    annotation (Placement(transformation(extent={{-86,-28},{-66,-8}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={10,-110})));
  output Interfaces.Angle_degOutput angleDegWindRef = y[5]
    "Angle of wind direction on reference height"
    annotation (Placement(transformation(extent={{-86,-46},{-66,-26}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={30,-110})));
  output Interfaces.Temp_KOutput TSky=
      BuildingSystems.Buildings.Functions.TSky(
      TAirRef,
      time,
      cloudCover/8.0,
      xAir,
      pAirRef,
      pGround)
    "Sky temperature"
    annotation (Placement(transformation(extent={{-86,-64},{-66,-44}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={50,-110})));
  output Modelica.Blocks.Interfaces.RealOutput cloudCover(
    min=0.0,
    max=8.0,
    unit="1") = y[7]
    "Cloud cover of the sky"
    annotation (Placement(transformation(extent={{-86,-80},{-66,-60}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={70,-110})));

  Modelica.SIunits.Pressure pGround=
    pAirRef * ((TAirRef - gamma * (0.0 - zRefTAir)) / TAirRef)^(Modelica.Constants.g_n / (gamma * RAir))
    "Air pressure on ground level";
  parameter Modelica.SIunits.Pressure pAirRef = 100000.0
    "Static air pressure on reference height"
    annotation(Dialog(tab = "General", group = "Location"));
  parameter Real gamma(unit = "K/m") = 0.01
    "Temperature gradient of the planetary boundary layer"
    annotation(Dialog(tab = "General", group = "Location"));
  parameter Modelica.SIunits.Length zRefTAir = 2.0 // Standard value of TRY
    "Reference height air temperature measurement"
    annotation(Dialog(tab = "General", group = "Location"));

  constant Real RAir(unit="J/(kg.K)") = 288.0
    "Gas constant dry air";

  annotation (defaultComponentName="weaDat",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-100,100},{100,-100}},lineColor={170,213,255},fillColor={170,213,255},
            fillPattern =                                                                                FillPattern.Solid),
    Ellipse(extent={{-90,-2},{-8,-46}},  lineColor={0,128,255},fillColor={0,128,255},
            fillPattern =                                                                          FillPattern.Solid),
    Ellipse(extent={{-58,22},{20,-32}},  lineColor={0,128,255},fillColor={0,128,255},
            fillPattern =                                                                          FillPattern.Solid),
    Ellipse(extent={{-36,-16},{38,-64}},lineColor={0,128,255},fillColor={0,128,255},
            fillPattern =                                                                         FillPattern.Solid),
    Ellipse(extent={{6,90},{90,8}},    lineColor={255,255,0},fillColor={255,255,85},
            fillPattern =                                                                         FillPattern.Solid),
    Text(extent={{-44,-48},{44,-118}},lineColor={0,0,0},fillColor={255,255,255},
            fillPattern =                                                                   FillPattern.Solid,textString
            =                                                                                                            "NetCDF")}),
Documentation(info="<html>
<p>
This model calculates weather data files in the netCDF format.
</p>
<p>
Under <a href=\"https://github.com/UdK-VPT/BuildingSystems/tree/master/BuildingSystems/Resources/Scripts/WeatherDataConverter\">BuildingSystems.Resources.Scripts.WeatherDataConverter</a>
you will find a short guide, which describes a Python based generation of NetCDF files for this weather data reader.
</p>
</html>", revisions="<html>
<ul>
<li>
June 14, 2018 by Christoph Nytsch-Geusen:<br/>
Individual weather data outputs introduced.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WeatherDataNetcdf;
