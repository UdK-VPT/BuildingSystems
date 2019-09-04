within BuildingSystems.Buildings;
model Ambient
  "Model which calculates the outside climate boundary conditions of one ore more buildings"
  final package Medium = BuildingSystems.Media.Air;

  replaceable block WeatherData =
    BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileGeneral
      constrainedby BuildingSystems.Climate.WeatherData.BaseClasses.WeatherDataFileGeneral
    "Weather data file for the location"
    annotation (choicesAllMatching = true,Dialog(tab = "General", group = "Location"));

  parameter Integer nSurfaces(min=1)
    "Number of building surfaces"
    annotation(HideResult=true, Dialog(tab = "General", group = "Surfaces"));
  parameter Boolean calcLwRad = true
    "True: long-wave radiation exchange on building surfaces is considered; false: no long-wave radiation exchange"
    annotation(HideResult = true,Dialog(tab = "General", group = "Surfaces"));
  parameter Integer nAirpaths = 0
    "Number of airpaths to the building"
    annotation(HideResult=true, Dialog(tab = "General", group = "Airpaths"));
  parameter Modelica.SIunits.Length heightAirpath[nAirpaths] = fill(0.0,nAirpaths)
    "Height of the airpaths to the building facades"
     annotation(Dialog(tab = "General", group = "Airpaths"));
  parameter Real rhoAmb(unit = "1") = 0.2
    "Reflection factor for short-wave radiation of the ground"
    annotation(Dialog(tab = "General", group = "Location"));
  parameter Modelica.SIunits.Length zRefvWind = 10.0 // Standard value of TRY
    "Reference height for wind measurement"
    annotation(Dialog(tab = "General", group = "Location"));
  parameter Real P(unit = "1") = 0.4 // Typical roughness for city districts
    "Roughness exponent for wind profil calculation"
    annotation(Dialog(tab = "General", group = "Location"));
  parameter Modelica.SIunits.Length zRefTAir = 2.0 // Standard value of TRY
    "Reference height air temperature measurement"
    annotation(Dialog(tab = "General", group = "Location"));
  parameter Real gamma(unit = "K/m") = 0.01
    "Temperature gradient of the planetary boundary layer"
    annotation(Dialog(tab = "General", group = "Location"));
  parameter Modelica.SIunits.Pressure pAirRef = 100000.0
    "Static air pressure on reference height"
    annotation(Dialog(tab = "General", group = "Location"));
  BuildingSystems.Climate.WeatherData.WeatherDataReader weatherDataReader(
    redeclare replaceable WeatherData weatherData,
    pAirRef=pAirRef,
    gamma=gamma,
    zRefTAir=zRefTAir)
   "Weather data from file"
    annotation(Placement(transformation(extent={{-40,-10},{-20,10}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toAirPorts[nSurfaces]
    "Climate boundary conditions for the building surfaces dependent on the ambient air"
    annotation (Placement(transformation(extent={{80,-80},{100,0}}),
      iconTransformation(extent={{80,-80},{100,0}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToSurfacesPorts toSurfacePorts[nSurfaces]
    "Climate boundary conditions for the building surfaces dependent on ambient surfaces"
    annotation (Placement(transformation(extent={{80,0},{100,80}}),
      iconTransformation(extent={{80,0},{100,80}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b toAirpathPorts[nAirpaths](
    redeclare each final package Medium = Medium)
    "Climate boundary conditions for the building airpaths"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=270,origin={94,0}),
      iconTransformation(extent={{-40,-90},{40,-70}},rotation=180,origin={60,10})));

  // Absolute humidity of the ambient air
  parameter BuildingSystems.Buildings.Types.DataSource xAirSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for absolute humidity of the ambient air"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.MassFraction xAir_constant = 0.5
    "Absolute humidity of the ambient air (used if xAirSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.Moisture_absOutput xAir
    "Absolute moisture of ambient air"
    annotation (Placement(transformation(extent={{-86,36},{-66,56}}),
      iconTransformation(extent={{-80,40},{-100,60}})));
  input BuildingSystems.Interfaces.Moisture_absInput xAir_in(
    min=0) if xAirSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Absolute moisture of the ambient air from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-50,-74}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={-50,-90})));

  // Air temperature on reference height
  parameter BuildingSystems.Buildings.Types.DataSource TAirRefSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for air temperature on reference height"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.Temp_K TAirRef_constant = 293.15
    "Air temperature on reference height (used if TAirRefSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.Temp_KOutput TAirRef
    "Air temperature on reference height"
    annotation (Placement(transformation(extent={{-86,60},{-66,80}}),
      iconTransformation(extent={{-80,60},{-100,80}})));
  input BuildingSystems.Interfaces.Temp_KInput TAirRef_in
    if TAirRefSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Air temperature on reference height from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-70,-74}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={-70,-90})));

  // Solar beam radiation of horizontal surface
  parameter BuildingSystems.Buildings.Types.DataSource IrrDirHorSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for solar beam radiation of horizontal surface"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.RadiantEnergyFluenceRate IrrDirHor_constant = 0.0
    "Solar beam radiation of horizontal surface (used if IrrDirHorSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.RadiantEnergyFluenceRateOutput IrrDirHor
    "Solar beam radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-86,10},{-66,30}}),
      iconTransformation(extent={{-80,20},{-100,40}})));
  input BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput IrrDirHor_in
    if IrrDirHorSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Solar beam radiation of horizontal surface from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-28,-74}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={-30,-90})));

  // Solar diffuse radiation of horizontal surface
  parameter BuildingSystems.Buildings.Types.DataSource IrrDifHorSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for solar diffuse radiation of horizontal surface"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.RadiantEnergyFluenceRate IrrDifHor_constant = 0.0
    "Solar diffuse radiation of horizontal surface (used if IrrDifHorSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.RadiantEnergyFluenceRateOutput IrrDifHor
    "Solar diffuse radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}}),
      iconTransformation(extent={{-80,0},{-100,20}})));
  input BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput IrrDifHor_in
    if IrrDifHorSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Solar diffuse radiation of horizontal surface from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-10,-74}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={-10,-90})));

  // Wind speed on reference height
  parameter BuildingSystems.Buildings.Types.DataSource vWindRefSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for solar wind speed on reference height"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.Velocity vWindRef_constant = 0.0
    "Wind speed on reference height (used if vWindRefSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.VelocityOutput vWindRef
    "Wind speed on reference height"
    annotation (Placement(transformation(extent={{-86,-28},{-66,-8}}),
      iconTransformation(extent={{-80,-20},{-100,0}})));
  input BuildingSystems.Interfaces.VelocityInput vWindRef_in
    if vWindRefSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Wind speed on reference height from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,-74}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={10,-90})));

  // Wind direction on reference height
  parameter BuildingSystems.Buildings.Types.DataSource angleDegWindRefSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for Angle of wind direction on reference height"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegWindRef_constant = 0.0
    "Angle of wind direction on reference height (used if angleDegWindRefSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.Angle_degOutput angleDegWindRef
    "Angle of wind direction on reference height"
    annotation (Placement(transformation(extent={{-86,-46},{-66,-26}}),
      iconTransformation(extent={{-80,-40},{-100,-20}})));
  input BuildingSystems.Interfaces.Angle_degInput angleDegWindRef_in
    if angleDegWindRefSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Angle of wind direction on reference height from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={30,-74}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={30,-90})));

  // Cloud cover of the sky
  parameter BuildingSystems.Buildings.Types.DataSource cloudCoverSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for cloud cover of the sky"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Real cloudCover_constant(min = 0.0,max = 8.0, unit = "1") = 0.0
    "Cloud cover of the sky (used if cloudCoverSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output Modelica.Blocks.Interfaces.RealOutput cloudCover(min = 0.0,max = 8.0, unit = "1")
    "Cloud cover of the sky"
    annotation (Placement(transformation(extent={{-86,-80},{-66,-60}}), iconTransformation(extent={{-80,-80},{-100,-60}})));
  input Modelica.Blocks.Interfaces.RealInput cloudCover_in(min = 0.0,max = 8.0, unit = "1")
    if cloudCoverSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Cloud cover of the sky from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={50,-74}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={50,-90})));
  output BuildingSystems.Interfaces.Temp_KOutput TSky = weatherDataReader.TSky
    "Sky temperature"
    annotation (Placement(transformation(extent={{-86,-64},{-66,-44}}),
      iconTransformation(extent={{-80,-60},{-100,-40}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation[nSurfaces](
    each rhoAmb=rhoAmb,
    angleDegAzi= toSurfacePorts.angleDegAzi,
    angleDegTil= toSurfacePorts.angleDegTil)
    "Radiation on tilted surfaces"
    annotation(Placement(transformation(extent={{34,2},{54,22}})));
  output BuildingSystems.Interfaces.Angle_degOutput latitudeDeg
    "Latitude"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-70,90}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=90,origin={-70,90})));
  output BuildingSystems.Interfaces.Angle_degOutput longitudeDeg
    "Longitude"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90, origin={-50,90}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=90,origin={-50,90})));
  output BuildingSystems.Interfaces.Angle_degOutput longitudeDeg0
    "Longitude of the local time zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-30,90}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=90,origin={-30,90})));
  output BuildingSystems.Interfaces.Angle_degOutput angleDegAziSun =
    radiation[1].radiationPort.angleDegAziSun
    "Azimuth angle of the sun"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-10,90}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=90,origin={-10,90})));
  output BuildingSystems.Interfaces.Angle_degOutput angleDegHeightSun =
    radiation[1].radiationPort.angleDegHeightSun
    "Height angle of the sun"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={10,90}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=90,origin={10,90})));
equation
  connect(weatherDataReader.latitudeDeg, latitudeDeg)
    annotation (Line(points={{-19,9},{-19,72},{-70,72},{-70,90}}, color={0,0,127}));
  connect(weatherDataReader.longitudeDeg, longitudeDeg)
    annotation (Line(points={{-19,7},{-16,7},{-16,74},{-50,74},{-50,90}}, color={0,0,127}));
  connect(weatherDataReader.longitudeDeg0, longitudeDeg0)
    annotation (Line(points={{-19,5},{-12,5},{-12,76},{-30,76},{-30,90}}, color={0,0,127}));
  for i in 1:nSurfaces loop
    // position of the location
    connect(weatherDataReader.latitudeDeg, radiation[i].latitudeDeg)
      annotation (Line(points={{-19,9},{10,9},{10,26},{40.2,26},{40.2,19.6}}, color={0,0,127}));
    connect(weatherDataReader.longitudeDeg, radiation[i].longitudeDeg)
      annotation (Line(points={{-19,7},{12,7},{12,28},{44,28},{44,19.6}}, color={0,0,127}));
    connect(weatherDataReader.longitudeDeg0, radiation[i].longitudeDeg0)
      annotation (Line(points={{-19,5},{14,5},{14,30},{48,30},{48,19.6}}, color={0,0,127}));
    // Direct horizontal radiation
    IrrDirHor = radiation[i].IrrDirHor;
    // Diffuse horizontal radiation
    IrrDifHor = radiation[i].IrrDifHor;
    // Climate data
    toAirPorts[i].heatPort.T = BuildingSystems.Buildings.Functions.TAir(TAirRef,toSurfacePorts[i].zMean,zRefTAir,gamma);
    toAirPorts[i].moisturePort.x = xAir;
    toAirPorts[i].vAir = BuildingSystems.Buildings.Functions.vWind(vWindRef,toSurfacePorts[i].zMean,zRefvWind,P);
    toAirPorts[i].angleDegAir = 0.0;
    // Further ambient parameters
    if calcLwRad then
      toSurfacePorts[i].heatPortLw.Q_flow = Modelica.Constants.sigma * toSurfacePorts[i].epsilon *
        (toSurfacePorts[i].heatPortLw.T^4 - TSky^4) * toSurfacePorts[i].A;
    else
      toSurfacePorts[i].heatPortLw.Q_flow = 0.0;
    end if;
    toSurfacePorts[i].heatPortSw.Q_flow = - toSurfacePorts[i].abs *
      (radiation[i].radiationPort.IrrDir + radiation[i].radiationPort.IrrDif) * toSurfacePorts[i].A;
    connect(radiation[i].radiationPort, toSurfacePorts[i].radiationPort_in)
      annotation (Line(points={{52,11.8},{52,40},{80,40}},color={0,0,0},pattern=LinePattern.Solid,smooth=Smooth.None));
  end for;
  // Air path calculation
  for i in 1:nAirpaths loop
    toAirpathPorts[i].p = BuildingSystems.Buildings.Functions.pAir(pAirRef,TAirRef,heightAirpath[i],zRefTAir,gamma);
    toAirpathPorts[i].h_outflow = Medium.specificEnthalpy_pTX(p=100000, T=BuildingSystems.Buildings.Functions.TAir(TAirRef,heightAirpath[i],zRefTAir,gamma), X={xAir,1-xAir});
    toAirpathPorts[i].Xi_outflow[1] = xAir;
  end for;

  // Select source for air temperature on reference height
  if TAirRefSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    TAirRef = TAirRef_constant;
  elseif TAirRefSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(TAirRef, weatherDataReader.TAirRef);
  else
    connect(TAirRef, TAirRef_in);
  end if;

  // Select source for absolute humidity of the ambient air
  if xAirSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    xAir = xAir_constant;
  elseif xAirSou == BuildingSystems.Buildings.Types.DataSource.File then
    xAir = weatherDataReader.xAir;
  else
    connect(xAir, xAir_in);
  end if;

  // Select source for solar direct radiation of horizontal surface
  if IrrDirHorSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    IrrDirHor = IrrDirHor_constant;
  elseif IrrDirHorSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(IrrDirHor, weatherDataReader.IrrDirHor);
  else
    connect(IrrDirHor, IrrDirHor_in);
  end if;

  // Select source for solar diffuse radiation of horizontal surface
  if IrrDifHorSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    IrrDifHor = IrrDifHor_constant;
  elseif IrrDifHorSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(IrrDifHor, weatherDataReader.IrrDifHor);
  else
    connect(IrrDifHor, IrrDifHor_in);
  end if;

  // Select source for wind speed on reference height
  if vWindRefSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    vWindRef = vWindRef_constant;
  elseif vWindRefSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(vWindRef, weatherDataReader.vWindRef);
  else
    connect(vWindRef, vWindRef_in);
  end if;

  // Select source for wind direction on reference height
  if angleDegWindRefSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    angleDegWindRef = angleDegWindRef_constant;
  elseif angleDegWindRefSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(angleDegWindRef, weatherDataReader.angleDegWindRef);
  else
    connect(angleDegWindRef, angleDegWindRef_in);
  end if;

  // Select source for cloud cover of the sky
  if cloudCoverSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    cloudCover = cloudCover_constant;
  elseif cloudCoverSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(cloudCover, weatherDataReader.cloudCover);
  else
    connect(cloudCover, cloudCover_in);
  end if;

  annotation (defaultComponentName="ambient",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-80,80},{80,-80}},lineColor={85,170,255},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Text(extent={{90,-94},{182,-122}},lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString = "%name"),
    Ellipse(extent={{-18,58},{58,-14}},lineColor={255,255,0},fillColor={255,255,85},fillPattern = FillPattern.Solid),
    Ellipse(extent={{-72,-36},{-16,-64}},lineColor={0,128,255},fillColor={0,128,255},fillPattern = FillPattern.Solid),
    Ellipse(extent={{-44,-30},{8,-62}},lineColor={0,128,255},fillColor={0,128,255},fillPattern = FillPattern.Solid),
    Ellipse(extent={{-56,-14},{-10,-46}},lineColor={0,128,255},fillColor={0,128,255},fillPattern = FillPattern.Solid)}),
Documentation(info="<html>
<p>
This is a model which calculates the outside climate boundary conditions of one ore more buildings.
</p>
<p>
Under <a href=\"https://github.com/UdK-VPT/BuildingSystems/tree/master/BuildingSystems/Resources/Scripts/WeatherDataConverter\">BuildingSystems.Resources.Scripts.WeatherDataConverter</a>
you will find a short guide, which describes a Python based generation of NetCDF files, which can be read by this component.
</p>
</html>", revisions="<html>
<ul>
<li>
Aug 20, 2019 by Christoph Nytsch-Geusen:<br/>
Outputs for height angle and azimuth of the sun added.
</li>
<li>
June 14, 2018 by Christoph Nytsch-Geusen:<br/>
Adapted to modified NetCDF weather data reader.
</li>
<li>
November 07, 2017 by Christoph Nytsch-Geusen:<br/>
Output for cloud cover added.
</li>
<li>
April 4, 2017 by Christoph Nytsch-Geusen:<br/>
Outputs for latitudeDeg, longitudeDeg and longitudeDeg0 added.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Ambient;
