within BuildingSystems.Climate.WeatherData;
block WeatherDataReader
  "Weather data reader"

  replaceable block WeatherData =
    BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileGeneral
      constrainedby BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileGeneral
    "Weather data file for the location"
    annotation (choicesAllMatching = true,Dialog(tab = "General", group = "Location"));

  replaceable WeatherData weatherData
    constrainedby BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileGeneral
    annotation (Dialog(enable = false, tab = "General", group = "Location"));

  output BuildingSystems.Interfaces.Angle_degOutput latitudeDeg = weatherData.latitudeDeg
    "Latitude"
    annotation (Placement(transformation(extent={{100,80},{120,100}}), iconTransformation(extent={{100,80},{120,100}})));
  output BuildingSystems.Interfaces.Angle_degOutput longitudeDeg = weatherData.longitudeDeg
    "Longitude"
    annotation (Placement(transformation(extent={{100,70},{120,90}}), iconTransformation(extent={{100,60},{120,80}})));
  output BuildingSystems.Interfaces.Angle_degOutput longitudeDeg0 = weatherData.longitudeDeg_0
    "Longitude of the local time zone"
    annotation (Placement(transformation(extent={{100,60},{120,80}}), iconTransformation(extent={{100,40},{120,60}})));
  output Interfaces.Temp_KOutput TAirRef = weatherData.tAirRef+273.15
    "Air temperature on reference height"
    annotation (Placement(transformation(extent={{-86,60},{-66,80}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={-70,-110})));
  output Interfaces.Moisture_absOutput xAir=
      BuildingSystems.Utilities.Psychrometrics.Functions.X_pSatpphi(
      BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(weatherData.tAirRef+273.15),
      100000.0,
      weatherData.phiAir)
    "Absolute moisture of ambient air"
    annotation (Placement(transformation(extent={{-86,36},{-66,56}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={-50,-110})));
  output Interfaces.RadiantEnergyFluenceRateOutput IrrDirHor = weatherData.IrrDirHor
    "Solar beam radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-86,10},{-66,30}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={-30,-110})));
  output Interfaces.RadiantEnergyFluenceRateOutput IrrDifHor = weatherData.IrrDifHor
    "Solar diffuse radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={-10,-110})));
  output Interfaces.VelocityOutput vWindRef = weatherData.vWindRef
    "Wind speed on reference height"
    annotation (Placement(transformation(extent={{-86,-28},{-66,-8}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={10,-110})));
  output Interfaces.Angle_degOutput angleDegWindRef = weatherData.angleDegWindRef
    "Angle of wind direction on reference height"
    annotation (Placement(transformation(extent={{-86,-46},{-66,-26}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={30,-110})));
  output Interfaces.Temp_KOutput TSky=
    BuildingSystems.Buildings.Functions.TSky(TAirRef,time,cloudCover/8.0,xAir,pAirRef,pGround)
    "Sky temperature"
    annotation (Placement(transformation(extent={{-86,-64},{-66,-44}}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=90,origin={50,-110})));
  output Modelica.Blocks.Interfaces.RealOutput cloudCover(
    min=0.0,
    max=8.0,
    unit="1") = weatherData.cloudCover
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
    Rectangle(extent={{-100,100},{100,-100}},lineColor={170,213,255},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Ellipse(extent={{-90,-2},{-8,-46}},lineColor={0,128,255},fillColor={0,128,255},fillPattern = FillPattern.Solid),
    Ellipse(extent={{-58,22},{20,-32}},lineColor={0,128,255},fillColor={0,128,255},fillPattern = FillPattern.Solid),
    Ellipse(extent={{-36,-16},{38,-64}},lineColor={0,128,255},fillColor={0,128,255},fillPattern = FillPattern.Solid),
    Ellipse(extent={{6,90},{90,8}},lineColor={255,255,0},fillColor={255,255,85},fillPattern = FillPattern.Solid)}),
Documentation(info="<html>
<p>
This model calculates weather data files from different formats (netCDF, ASCII).
</p>
<p>
Under <a href=\"https://github.com/UdK-VPT/BuildingSystems/tree/master/BuildingSystems/Resources/Scripts/WeatherDataConverter\">BuildingSystems.Resources.Scripts.WeatherDataConverter</a>
you will find a short guide, which describes a Python based generation of NetCDF files for this weather data reader.
</p>
</html>", revisions="<html>
<ul>
<li>
August 23, 2018 by Christoph Nytsch-Geusen:<br/>
ASCII file format introduced.
</li>
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
end WeatherDataReader;
