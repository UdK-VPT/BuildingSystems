within BuildingSystems.Buildings.Airvolumes;
model AirvolumeCompressible0D
  "Compressible ideal-mixed air volume model for moist air"
  extends BuildingSystems.Buildings.BaseClasses.AirvolumeGeneral(
  redeclare final package Medium = BuildingSystems.Media.Air,
  final nAirElements = 1);
  parameter Integer nAirpaths = 0
    "Number of air paths"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nHeatSources = 0
    "Number of heat convective sources"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nMoistureSources = 0
    "Number of moisture sources"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Modelica.SIunits.Length heightAirpath[nAirpaths]
    "Vertical height of each air path"
    annotation(Dialog(tab="General",group="Air volume geometry"));
  parameter Modelica.SIunits.Length height = 1.0
    "Vertical height of the air volume"
    annotation(Dialog(tab="General",group="Air volume geometry"));
  BuildingSystems.Types.RelativeHumidity phi
    "Relative humidity of the air";
  Modelica.SIunits.Mass m(
    start = V * rho_nominal)
    "Mass of dry air";
  Modelica.SIunits.Mass mH2OAir(
    start = x_start[1] * V * rho_nominal)
    "Mass of water vapor in the air";
  Modelica.SIunits.Mass mH2OLiq(
    start = mH2OLiq_start)
    "Mass of liquid water";
  Modelica.SIunits.Pressure pMean
    "Mean air pressure in the air volume";
  Modelica.SIunits.EnthalpyFlowRate H_flow_airpath[nAirpaths]
    "Enthalpy flow rate through each air path";
  Modelica.SIunits.EnthalpyFlowRate H_flow_moistureSource[nMoistureSources]
    "Enthalpy flow rate by each moisture source";
  Modelica.SIunits.MassFlowRate m_flow_H2O_airpath[nAirpaths]
    "Mass flow rate of water vapour through each air path";
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts[nAirpaths](
    redeclare each final package Medium=Medium)
    "Flow ports of the air paths"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},origin={0,-80},rotation=180), iconTransformation(extent={{-40,-90},{40,-70}})));
  BuildingSystems.Interfaces.HeatPorts heatSourcesPorts[nHeatSources]
    "Heat ports of the convective heat sources"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-80,40}), iconTransformation(extent={{-40,-10},{40,10}},rotation=90,origin={-80,40})));
  BuildingSystems.Interfaces.MoisturePorts moistureSourcesPorts[nMoistureSources]
    "Moisture ports of the moisture sources"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-80,-40}), iconTransformation(extent={{-40,-10},{40,10}},rotation=90,origin={-80,-40})));
  parameter BuildingSystems.Buildings.Types.DataSource TSou =
   BuildingSystems.Buildings.Types.DataSource.Calculation
    "Data source for air temperature"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  BuildingSystems.Interfaces.Temp_KInput T_internal
    "Calculated air temperature (used if TSou=Calculation)";
  parameter Modelica.SIunits.Temp_K T_constant = 293.15
    "Constant air temperature (used if TSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  BuildingSystems.Interfaces.Temp_KInput T_in
    if TSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Prediscribed external air temperature (used if TSou=Input)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={80,40}),
      iconTransformation(extent={{90,30},{70,50}})));
  parameter BuildingSystems.Buildings.Types.DataSource xSou =
   BuildingSystems.Buildings.Types.DataSource.Calculation
    "Data source for air moisture"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
  BuildingSystems.Interfaces.Moisture_absInput x_internal
    "Calculated air moisture (used if xSou=Calculation)";
  parameter Modelica.SIunits.MassFraction x_constant = 0.005
    "Vonstant air moisture (used if xSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  BuildingSystems.Interfaces.Moisture_absInput x_in
    if xSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Prediscribed external air moisture (used if xSou=Input)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={80,0}),
      iconTransformation(extent={{90,-10},{70,10}})));
protected
  Modelica.SIunits.InternalEnergy U(
    start=((rho_nominal * V * BuildingSystems.Utilities.Psychrometrics.Constants.cpAir
      + rho_nominal * V * x_start[1] * BuildingSystems.Utilities.Psychrometrics.Constants.cpSte
      + mH2OLiq_start * BuildingSystems.Utilities.Psychrometrics.Constants.cpWatLiq) * T_start[1]
      + rH2O * rho_nominal * V * x_start[1]))
    "Internal energy of the air volume";
  constant Modelica.SIunits.Velocity vAir_constant = 0.0
    "Air velocity";
  constant Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAir_constant = 0.0
    "Direction of the air flow";
  constant Modelica.SIunits.Density rho_nominal = 1.2
    "Air density under nominal conditions";
  constant Modelica.SIunits.Temp_K T_nominal = 293.15
    "Air temperature under nominal conditions";
  constant BuildingSystems.Types.WaterVapourGasConstant R = 461.4
    "Gas constant for water vapor";
  constant BuildingSystems.Types.WaterVapourEnthalpy rH2O = Medium.enthalpyOfVaporization(T_nominal)
    "Enthalpy of vaporization for water";
equation
  // Select source for air temperature
  if TSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    T[1] = T_constant;
  elseif TSou == BuildingSystems.Buildings.Types.DataSource.Calculation then
    connect(T[1], T_internal);
  else
    connect(T[1], T_in);
  end if;

  // Select source for air moisture
  if xSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    x[1] = x_constant;
  elseif TSou == BuildingSystems.Buildings.Types.DataSource.Calculation then
    connect(x[1], x_internal);
  else
    connect(x[1], x_in);
  end if;

  // Energy balance of the moist air inclusive the liquid water
  U = (BuildingSystems.Utilities.Psychrometrics.Constants.cpAir * m
    + BuildingSystems.Utilities.Psychrometrics.Constants.cpSte * mH2OAir
    + mH2OLiq * BuildingSystems.Utilities.Psychrometrics.Constants.cpWatLiq) * T_internal + rH2O * mH2OAir;
  der(U) = sum(toSurfacePorts.heatPort.Q_flow) + sum(heatSourcesPorts.Q_flow) + sum(H_flow_airpath) + sum(H_flow_moistureSource);

  // Boundary conditions for heat sources of the air volume
  for i in 1:nHeatSources loop
    heatSourcesPorts[i].T = T[1];
  end for;

  // Boundary conditions for moisture sources of the air volume
  for i in 1:nMoistureSources loop
    moistureSourcesPorts[i].x = x[1];
  end for;

  // Boundary conditions for all surfaces of the air volume
  for i in 1:nSurfaces loop
    toSurfacePorts[i].heatPort.T = T[1];
    toSurfacePorts[i].moisturePort.x = x[1];
    toSurfacePorts[i].angleDegAir = angleDegAir_constant;
    toSurfacePorts[i].vAir = vAir_constant;
  end for;

  // Ideal gas law
  pMean * V_internal = (0.622 + x_internal) * m * R * T_internal;

  // Mass balance of dry air
  der(m) = sum(airpathPorts.m_flow);

  //Mass balance of water vapor in the air
  der(mH2OAir) = sum(toSurfacePorts.moisturePort.m_flow) // water vaper from moisture transfer of surfaces
    + sum(m_flow_H2O_airpath) // water vapor within air mass flows through air paths
    + (-0.5 * Modelica.Math.tanh(100.0*(phi-1.0)) + 0.5) * sum(moistureSourcesPorts.m_flow) // water vapor from moisture sources
    + BuildingSystems.Utilities.SmoothFunctions.softcut(1.0-phi,0.0,1.0,0.001) * mH2OLiq; // evaporated water from liquid reservoir

  mH2OAir = x_internal * m;

  phi = BuildingSystems.Utilities.Psychrometrics.Functions.phi_pTX(100000,T_internal,x_internal);

  // Mass balance of liquid water
  der(mH2OLiq) = (1.0 - (-0.5 * Modelica.Math.tanh(100.0*(phi-1.0)) + 0.5)) * sum(moistureSourcesPorts.m_flow) // water vapor surplus from moisture sources if relative moisture becomes close to 1
    - BuildingSystems.Utilities.SmoothFunctions.softcut(1.0-phi,0.0,1.0,0.001) * mH2OLiq; // evaporated water which leaves the liquid reservoir

  for i in 1:nAirpaths loop
    // Enthalpy flow through each air path
    airpathPorts[i].h_outflow = Medium.specificEnthalpy_pTX(p=100000,T=T_internal,X={x_internal,1-x_internal});
    H_flow_airpath[i] = airpathPorts[i].m_flow * actualStream(airpathPorts[i].h_outflow);

    // Vertical pressure at each air path
    airpathPorts[i].p = pMean - Modelica.Constants.g_n * (heightAirpath[i] - 0.5 * height) * rho_nominal * T_nominal / T_internal;

    // Mass flow rate of water vapour through each air path
    m_flow_H2O_airpath[i] = airpathPorts[i].m_flow * actualStream(airpathPorts[i].Xi_outflow[1]);
    airpathPorts[i].Xi_outflow[1] = x_internal;
  end for;

  // Enthalpy flow by each moisture source
  for i in 1:nMoistureSources loop
    H_flow_moistureSource = rH2O * moistureSourcesPorts.m_flow;
  end for;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100}, {100,100}}), graphics={
    Text(extent={{-18,71},{50,5}},lineColor={255,128,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={255,128,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="0")}),
Documentation(info="<html>
<p>
This is a model of a compressible ideal-mixed air volume for moist air.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end AirvolumeCompressible0D;
