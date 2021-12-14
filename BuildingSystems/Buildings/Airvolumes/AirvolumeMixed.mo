within BuildingSystems.Buildings.Airvolumes;
model AirvolumeMixed
  "Ideal-mixed air volume model for moist air"
  extends BuildingSystems.Buildings.BaseClasses.AirvolumeGeneral(
  redeclare final package Medium = BuildingSystems.Media.Air,
  final nAirElements = 1);
  parameter Integer nHeatSources = 0
    "Number of heat convective sources"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nMoistureSources = 0
    "Number of moisture sources"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  BuildingSystems.Types.RelativeHumidity phi
    "Relative humidity of the air";
  Modelica.SIunits.Mass mH2OLiq(
    start = mH2OLiq_start)
    "Liquid water mass";
  parameter Modelica.SIunits.Mass mH2OLiq_start = 0.0
   "Liquid water mass (start value)"
    annotation (Dialog(tab="Initialization"));
  BuildingSystems.Interfaces.HeatPorts heatSourcesPorts[nHeatSources]
    "Heat ports of the convective heat sources"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-80,40}),
      iconTransformation(extent={{-40,-10},{40,10}},rotation=90,origin={-80,40})));
  BuildingSystems.Interfaces.MoisturePorts moistureSourcesPorts[nMoistureSources]
    "Moisture ports of the moisture sources"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-80,-40}),
      iconTransformation(extent={{-40,-10},{40,10}},rotation=90,origin={-80,-40})));
  parameter BuildingSystems.Buildings.Types.DataSource TSou =
   BuildingSystems.Buildings.Types.DataSource.Calculation
    "Data source for air temperature"
    annotation (Evaluate=true, Dialog(tab="Advanced", group="Data source"));
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
  parameter Modelica.SIunits.MassFraction x_constant = 0.005
    "Vonstant air moisture (used if xSou=Parameter)"
    annotation (Dialog(tab="Advanced", group="Data source"));
  BuildingSystems.Interfaces.Moisture_absInput x_in
    if xSou == BuildingSystems.Buildings.Types.DataSource.Input
    "Prediscribed external air moisture (used if xSou=Input)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={80,0}),
      iconTransformation(extent={{90,-10},{70,10}})));
  constant Modelica.SIunits.Velocity vAir_constant = 0.0
    "Air velocity";
  constant Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAir_constant = 0.0
    "Direction of the air flow";
  BuildingSystems.Buildings.Airvolumes.MixingVolumeMoistAir air(
    redeclare package Medium = Medium,
    geometryType=geometryType,
    V=V,
    m_flow_nominal=0.1,
    nPorts=nAirpaths,
    T_start=T_start[1],
    X_start={x_start[1],1-x_start[1]},
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    if TSou == BuildingSystems.Buildings.Types.DataSource.Calculation
    "Mixed air volume of moist air"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senTem
    if TSou == BuildingSystems.Buildings.Types.DataSource.Calculation
    annotation (Placement(transformation(extent={{-10,-30},{-30,-10}})));
  Modelica.Blocks.Sources.RealExpression pAir(
    y=air.p)
    annotation (Placement(transformation(extent={{44,50},{64,70}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    annotation (Placement(transformation(extent={{-36,-6},{-24,6}})));
  Modelica.Blocks.Sources.RealExpression QSum_flow(
    y=sum(toSurfacePorts.heatPort.Q_flow)+sum(heatSourcesPorts.Q_flow))
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Modelica.Blocks.Sources.RealExpression mWatSum_flow(
    y=sum(toSurfacePorts.moisturePort.m_flow) // water vaper from moisture transfer of surfaces
      + (-0.5 * Modelica.Math.tanh(100.0*(phi-1.0)) + 0.5) * sum(moistureSourcesPorts.m_flow) // water vapor from moisture sources
      + BuildingSystems.Utilities.SmoothFunctions.softcut(1.0-phi,0.0,1.0,0.001) * mH2OLiq) // evaporated water from liquid reservoir
    annotation (Placement(transformation(extent={{-40,10},{-20,30}})));
equation
  // Select source for air temperature
  if TSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    T[1] = T_constant;
  elseif TSou == BuildingSystems.Buildings.Types.DataSource.Calculation then
    connect(T[1], senTem.T)
    annotation (Line(points={{-30,-20},{-40,-20},{-40,-40},{60,-40},{60,20},{80,20}}, color={0,0,127}));
  else
    connect(T[1], T_in);
  end if;

  // Select source for air moisture
  if xSou == BuildingSystems.Buildings.Types.DataSource.Parameter then
    x[1] = x_constant;
  elseif TSou == BuildingSystems.Buildings.Types.DataSource.Calculation then
    connect(x[1], air.X_w)
      annotation (Line(points={{12,-4},{50,-4},{50,-20},{80,-20}},color={0,0,127}));
  else
    connect(x[1], x_in);
  end if;

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

  phi = BuildingSystems.Utilities.Psychrometrics.Functions.phi_pTX(100000,T[1],x[1]);

  // Mass balance of liquid water
   der(mH2OLiq) = (1.0 - (-0.5 * Modelica.Math.tanh(100.0*(phi-1.0)) + 0.5)) * sum(moistureSourcesPorts.m_flow) // water vapor surplus from moisture sources if relative moisture becomes close to 1
    - BuildingSystems.Utilities.SmoothFunctions.softcut(1.0-phi,0.0,1.0,0.001) * mH2OLiq; // evaporated water which leaves the liquid reservoir

  connect(V_in, air.V_in)
    annotation (Line(points={{-80,0},{-64,0},{-64,10},{-20,10},{-20,4},{-12,4}},color={0,0,127}));
  connect(air.ports, airpathPorts)
    annotation (Line(points={{0,-10},{-4.44089e-16,-10},{-4.44089e-16,-80}}, color={0,127,255}));
  connect(air.heatPort, prescribedHeatFlow.port)
    annotation (Line(points={{-10,0},{-24,0}}, color={191,0,0}));
  connect(prescribedHeatFlow.Q_flow, QSum_flow.y)
    annotation (Line(points={{-36,0},{-39,0}}, color={0,0,127}));
  connect(mWatSum_flow.y, air.mWat_flow)
    annotation (Line(points={{-19,20},{-16,20},{-16,8},{-12,8}}, color={0,0,127}));
  connect(senTem.port, air.heatPort)
    annotation (Line(points={{-10,-20},{-10,0}}, color={191,0,0}));
  connect(pAir.y, p[1])
    annotation (Line(points={{65,60},{80,60}}, color={0,0,127}));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100}, {100,100}}), graphics={
    Text(extent={{-18,71},{50,5}},lineColor={255,128,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={255,128,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="0")}),
Documentation(info="<html>
<p>
This is a model of an ideal-mixed air volume for moist air.
</p>
</html>", revisions="<html>
<ul>
<li>
October 28, 2020 by Christoph Nytsch-Geusen:<br/>
Adaptation zti IBPSA library.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end AirvolumeMixed;
