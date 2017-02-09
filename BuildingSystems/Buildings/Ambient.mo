within BuildingSystems.Buildings;
model Ambient
  "Model which calculates the outside climate boundary conditions of one ore more buildings"
  final package Medium = BuildingSystems.Media.Air;
  function x
    "Absolute humidity dependent on air pressure, saturation pressure and relative humidity"
    input Modelica.SIunits.Pressure p;
    input Modelica.SIunits.Pressure pSat;
    input BuildingSystems.Types.RelativeHumidity phi;
    output  Modelica.SIunits.MassFraction value;
  algorithm
    value := 0.622 * phi * pSat / (p - phi * pSat);
  end x;

  parameter Integer nSurfaces(min=1)
    "Number of building surfaces"
    annotation(HideResult=true, Dialog(tab = "General", group = "Surfaces"));
  parameter Boolean calcLwRad = true
    "True: long-wave radiation exchange on building surfaces is considered; false: no long-wave radiation exchange"
    annotation(HideResult = true,Dialog(tab = "General", group = "Surfaces"));
  parameter Integer nAirpathes = 0
    "Number of airpathes to the building"
    annotation(HideResult=true, Dialog(tab = "General", group = "Airpathes"));
  parameter Modelica.SIunits.Length heightAirpath[nAirpathes] = fill(0.0,nAirpathes)
    "Height of the airpathes to the building facades"
     annotation(Dialog(tab = "General", group = "Airpathes"));
  replaceable parameter BuildingSystems.Climate.WeatherData.WeatherDataFile weatherDataFile
    constrainedby BuildingSystems.Climate.WeatherData.WeatherDataFile
    "Weather data file for the location"
    annotation(choicesAllMatching=true,Dialog(tab = "General", group = "Location"));
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
  constant Real RAir(unit="J/(kg.K)") = 288.0
    "Gas constant dry air";
  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(weatherDataFile=weatherDataFile)
    "Weather data from file"
    annotation(Placement(transformation(extent={{-40,-10},{-20,10}})));
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation(Placement(transformation(extent={{-2,-38},{14,-22}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toAirPorts[nSurfaces]
    "Climate boundary conditions for the building surfaces dependent on the ambient air"
    annotation (Placement(transformation(extent={{70,-80},{90,0}}), iconTransformation(extent={{70,-80},{90,0}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToSurfacesPorts toSurfacePorts[nSurfaces]
    "Climate boundary conditions for the building surfaces dependent on ambient surfaces"
    annotation (Placement(transformation(extent={{70,0},{90,80}}), iconTransformation(extent={{70,0},{90,80}})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b toAirpathPorts[nAirpathes](
    redeclare each final package Medium = Medium)
    "Climate boundary conditions for the building airpathes"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=270,origin={94,0}), iconTransformation(extent={{-40,-90},{40,-70}},rotation=180,origin={0,10})));
  Modelica.SIunits.Pressure pGround =
    pAirRef * ((TAirRef - gamma * (0.0 - zRefTAir)) / TAirRef)^(Modelica.Constants.g_n / (gamma * RAir))
    "Air pressure on ground level";
  output BuildingSystems.Interfaces.Moisture_absOutput xAir =
    BuildingSystems.Utilities.Psychrometrics.Functions.X_pSatpphi(BuildingSystems.Utilities.Psychrometrics.Functions.saturationPressure(from_degC.y),100000.0,phi)
    "Absolute moisture of ambient air"
    annotation (Placement(transformation(extent={{-86,36},{-66,56}}), iconTransformation(extent={{-72,40},{-92,60}})));

  // Air temperature on reference height
  parameter BuildingSystems.Buildings.Types.DataSource TAirRefSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for air temperature on reference height"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.Temp_K TAirRef_constant = 293.15
    "Air temperature on reference height (used if TAirRefSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.Temp_KOutput TAirRef
    "Air temperature on reference height"
    annotation (Placement(transformation(extent={{-86,60},{-66,80}}), iconTransformation(extent={{-72,60},{-92,80}})));
  input BuildingSystems.Interfaces.Temp_KInput TAirRef_in if TAirRefSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Air temperature on reference height from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-70,-74}),iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={-70,-78})));

  // Relative humidity of the ambient air
  parameter BuildingSystems.Buildings.Types.DataSource phiSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for relative humidity of the ambient air"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter BuildingSystems.Types.RelativeHumidity phi_constant = 0.5
    "Relative humidity of the ambient air (used if phiSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  BuildingSystems.Types.RelativeHumidity phi
    "Relative humidity of the ambient air";
  input Modelica.Blocks.Interfaces.RealInput phi_in(
      min=0,
      max=1.01,
      unit="1") if phiSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Relative humidity of the ambient air from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-50,-74}),iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={-50,-78})));

  // Solar beam radiation of horizontal surface
  parameter BuildingSystems.Buildings.Types.DataSource IrrDirHorSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for solar beam radiation of horizontal surface"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.RadiantEnergyFluenceRate IrrDirHor_constant = 0.0
    "Solar beam radiation of horizontal surface (used if IrrDirHorSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.RadiantEnergyFluenceRateOutput IrrDirHor
    "Solar beam radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-86,10},{-66,30}}), iconTransformation(extent={{-72,20},{-92,40}})));
  input BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput IrrDirHor_in if IrrDirHorSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Solar beam radiation of horizontal surface from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-28,-74}),iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={-30,-78})));

  // Solar diffuse radiation of horizontal surface
  parameter BuildingSystems.Buildings.Types.DataSource IrrDifHorSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for solar diffuse radiation of horizontal surface"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.RadiantEnergyFluenceRate IrrDifHor_constant = 0.0
    "Solar diffuse radiation of horizontal surface (used if IrrDifHorSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.RadiantEnergyFluenceRateOutput IrrDifHor
    "Solar diffuse radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-86,-10},{-66,10}}),iconTransformation(extent={{-72,0},{-92,20}})));
  input BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput IrrDifHor_in if IrrDifHorSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Solar diffuse radiation of horizontal surface from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-10,-74}),iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={-10,-78})));

  // Wind speed on reference height
  parameter BuildingSystems.Buildings.Types.DataSource vWindRefSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for solar wind speed on reference height"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.Velocity vWindRef_constant = 0.0
    "Wind speed on reference height (used if vWindRefSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.VelocityOutput vWindRef
    "Wind speed on reference height"
    annotation (Placement(transformation(extent={{-86,-28},{-66,-8}}), iconTransformation(extent={{-72,-20},{-92,0}})));
  input BuildingSystems.Interfaces.VelocityInput vWindRef_in if vWindRefSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Wind speed on reference height from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,-74}), iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={10,-78})));

  // Wind direction on reference height
  parameter BuildingSystems.Buildings.Types.DataSource angleDegWindRefSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for Angle of wind direction on reference height"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegWindRef_constant = 0.0
    "Angle of wind direction on reference height (used if angleDegWindRefSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  output BuildingSystems.Interfaces.Angle_degOutput angleDegWindRef
    "Angle of wind direction on reference height"
    annotation (Placement(transformation(extent={{-86,-46},{-66,-26}}), iconTransformation(extent={{-72,-40},{-92,-20}})));
  input BuildingSystems.Interfaces.Angle_degInput angleDegWindRef_in if angleDegWindRefSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Angle of wind direction on reference height from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={30,-74}), iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={30,-78})));

  // Cloud cover of the sky
  parameter BuildingSystems.Buildings.Types.DataSource cloudCoverSou = BuildingSystems.Buildings.Types.DataSource.File
    "Data source for cloud cover of the sky"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  parameter Real cloudCover_constant(min = 0.0,max = 8.0, unit = "1") = 0.0
    "Cloud cover of the sky (used if cloudCoverSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  Real cloudCover(min = 0.0,max = 8.0, unit = "1")
    "Cloud cover of the sky";
  input Modelica.Blocks.Interfaces.RealInput cloudCover_in(min = 0.0,max = 8.0, unit = "1") if cloudCoverSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Cloud cover of the sky from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={50,-74}), iconTransformation(extent={{10,-10},{-10,10}},rotation=270,origin={50,-78})));

  output BuildingSystems.Interfaces.Temp_KOutput TSky =
    BuildingSystems.Buildings.Functions.TSky(TAirRef,time,cloudCover/8.0,xAir,pAirRef,pGround)
    "Sky temperature"
    annotation (Placement(transformation(extent={{-86,-64},{-66,-44}}),iconTransformation(extent={{-72,-60},{-92,-40}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation[nSurfaces](
    each rhoAmb=rhoAmb,
    angleDegAzi =toSurfacePorts.angleDegAzi,
    angleDegTil =toSurfacePorts.angleDegTil)
    "Radiation on tilted surfaces"
    annotation(Placement(transformation(extent={{34,2},{54,22}})));
equation
  for i in 1:nSurfaces loop
    // position of the location
    connect(weatherData.longitudeDeg0, radiation[i].longitudeDeg0);
    connect(weatherData.latitudeDeg, radiation[i].latitudeDeg);
    connect(weatherData.longitudeDeg, radiation[i].longitudeDeg);
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
      toSurfacePorts[i].heatPortLw.Q_flow = Modelica.Constants.sigma * toSurfacePorts[i].epsilon * (toSurfacePorts[i].heatPortLw.T^4 - TSky^4) * toSurfacePorts[i].A;
    else
      toSurfacePorts[i].heatPortLw.Q_flow = 0.0;
    end if;
    toSurfacePorts[i].heatPortSw.Q_flow = - toSurfacePorts[i].abs * (radiation[i].radiationPort.IrrDir + radiation[i].radiationPort.IrrDif) * toSurfacePorts[i].A;
    connect(radiation[i].radiationPort, toSurfacePorts[i].radiationPort_in) annotation (Line(
      points={{52,11.8},{52,40},{80,40}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  end for;
  // Air path calculation
  for i in 1:nAirpathes loop
    toAirpathPorts[i].p = BuildingSystems.Buildings.Functions.pAir(pAirRef,TAirRef,heightAirpath[i],zRefTAir,gamma);
    toAirpathPorts[i].h_outflow = Medium.specificEnthalpy_pTX(p=100000, T=BuildingSystems.Buildings.Functions.TAir(TAirRef,heightAirpath[i],zRefTAir,gamma), X={xAir,1-xAir});
    toAirpathPorts[i].Xi_outflow[1] = xAir;
  end for;
  connect(weatherData.y[3], from_degC.u)
      annotation (Line(
      points={{-19,-0.285714},{-12,-0.285714},{-12,-30},{-3.6,-30}},
      color={0,0,127},
      smooth=Smooth.None));

  // Select source for air temperature on reference height
  if TAirRefSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    TAirRef = TAirRef_constant;
  elseif TAirRefSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(TAirRef, from_degC.y);
  else
    connect(TAirRef, TAirRef_in);
  end if;

  // Select source for relative humidity of the ambient air
  if phiSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    phi = phi_constant;
  elseif phiSou == BuildingSystems.Buildings.Types.DataSource.File then
    phi = weatherData.y[6];
  else
    connect(phi, phi_in);
  end if;

  // Select source for solar diffuse radiation of horizontal surface
  if IrrDirHorSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    IrrDirHor = IrrDirHor_constant;
  elseif IrrDirHorSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(IrrDirHor, weatherData.y[1]);
  else
    connect(IrrDirHor, IrrDirHor_in);
  end if;

  // Select source for solar diffuse radiation of horizontal surface
  if IrrDifHorSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    IrrDifHor = IrrDifHor_constant;
  elseif IrrDifHorSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(IrrDifHor, weatherData.y[2]);
  else
    connect(IrrDifHor, IrrDifHor_in);
  end if;

  // Select source for Wind speed on reference height
  if vWindRefSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    vWindRef = vWindRef_constant;
  elseif vWindRefSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(vWindRef, weatherData.y[4]);
  else
    connect(vWindRef, vWindRef_in);
  end if;

  // Select source for wind direction on reference height
  if angleDegWindRefSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    angleDegWindRef = angleDegWindRef_constant;
  elseif angleDegWindRefSou == BuildingSystems.Buildings.Types.DataSource.File then
    connect(angleDegWindRef, weatherData.y[5]);
  else
    connect(angleDegWindRef, angleDegWindRef_in);
  end if;

  // Select source for Cloud cover of the sky
  if cloudCoverSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    cloudCover = cloudCover_constant;
  elseif angleDegWindRefSou == BuildingSystems.Buildings.Types.DataSource.File then
    cloudCover = weatherData.y[7];
  else
    connect(cloudCover, cloudCover_in);
  end if;

  annotation (defaultComponentName="ambient",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-80,80},{80,-80}},lineColor={85,170,255},fillColor={170,213,255},fillPattern = FillPattern.Solid),
    Text(extent={{46,106},{138,78}}, lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString = "%name"),
    Ellipse(extent={{-18,58},{58,-14}},lineColor={255,255,0},fillColor={255,255,85},fillPattern = FillPattern.Solid),
    Ellipse(extent={{-72,-36},{-16,-64}},lineColor={0,128,255},fillColor={0,128,255},fillPattern = FillPattern.Solid),
    Ellipse(extent={{-44,-30},{8,-62}},lineColor={0,128,255},fillColor={0,128,255},fillPattern = FillPattern.Solid),
    Ellipse(extent={{-56,-14},{-10,-46}},lineColor={0,128,255},fillColor={0,128,255},fillPattern = FillPattern.Solid)}),
    Documentation(info="<html>
    <p>For a guide on how to generate weather data files that are compatible with this component and a corresponding Python script please refer to \\BuildingSystems\\Resources\\Scripts\\WeatherDataConverter\\README.md</p>
    </html>"));
end Ambient;
