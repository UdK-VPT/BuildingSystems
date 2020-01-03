within BuildingSystems.Buildings.Zones;
model ZoneTemplateAirvolumeMixed
  "Template model for a thermal zone with fully mixed air volume"
  extends BuildingSystems.Buildings.BaseClasses.ZoneTemplateGeneral(
    redeclare final package Medium = BuildingSystems.Media.Air,
    nHeatSourcesTotal = if calcIdealLoads then nHeatSources + 2 else nHeatSources);
  parameter Modelica.SIunits.HeatFlowRate Q_flow_heatingMax = Modelica.Constants.inf
    "Maximal power for ideal heating"
    annotation(Dialog(tab="General",group="Ideal heating and cooling"));
  parameter Modelica.SIunits.HeatFlowRate Q_flow_coolingMax = -Modelica.Constants.inf
    "Maximal power for ideal cooling"
    annotation(Dialog(tab="General",group="Ideal heating and cooling"));
  parameter Real radiationportionIdealHeating = 0.5
    "Radiation portion of the ideal heating"
    annotation(Dialog(tab="General",group="Ideal heating and cooling"));
  parameter Real radiationportionIdealCooling = 0.5
    "Radiation portion of the ideal cooling"
    annotation(Dialog(tab="General",group="Ideal heating and cooling"));
  parameter Modelica.SIunits.Length heightAirpath[nAirpathsInternal]=fill(0.0,nAirpathsInternal)
    "Vertical height of each air path in the zone"
    annotation(Dialog(tab="General",group="Zone geometry"));
  parameter Boolean heatSources = false
    "True: heat sources present; false: no heat sources present"
    annotation(Dialog(tab="General",group="Heat and moisture sources"));
  parameter Integer nHeatSources = 0
    "Number of internal heat sources of the thermal zone"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Heat and moisture sources"));
  parameter Boolean moistureSources = false
    "True: moisture source present; false: no moisture source present"
    annotation(Dialog(tab="General",group="Heat and moisture sources"));
  parameter Boolean calcIdealLoads = true
    "True: calculation of the ideal heating and cooling loads; false: no calculation"
    annotation(Dialog(tab="General",group="Ideal heating and cooling"));
  input BuildingSystems.Interfaces.Temp_KInput T_setHeating if calcIdealLoads
    "Set air temperature for heating of the zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-100,4}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-110,70})));
  input BuildingSystems.Interfaces.Temp_KInput T_setCooling if calcIdealLoads
    "Set air temperature for cooling of the zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-100,-10}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-110,50})));
  parameter Boolean calcThermalComfort = false
    "true: PMV and PPD calculated, false: no thermal comfort assessment"
    annotation(HideResult = true, Dialog(tab="Advanced",group="Thermal comfort"));
  parameter Real clo = 0.5
    "Clothing"
    annotation(HideResult = true, Dialog(tab="Advanced",group="Thermal comfort"));
  parameter Real met = 1.2
    "Metabolism rate"
    annotation(HideResult = true, Dialog(tab="Advanced",group="Thermal comfort"));
  Modelica.Blocks.Interfaces.RealInput wme = 0.0
    "External work"
    annotation(HideResult = true, Dialog(tab="Advanced",group="Thermal comfort"));
  parameter Modelica.SIunits.Velocity vAir = 0.1
     "Mean relative air velocity in the area of user presence"
     annotation(HideResult = true, Dialog(tab="Advanced",group="Thermal comfort"));
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start air temperature of the zone"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.MassFraction x_start = 0.005
    "Start air moisture of the zone"
    annotation (Dialog(tab="Initialization"));
  BuildingSystems.Buildings.Airvolumes.AirvolumeCompressible0D airvolume(
    geometryType = geometryType,
    nSurfaces=nSurfaces,
    V = V,
    height=height,
    heightAirpath = heightAirpath,
    T_start={T_start},
    x_start={x_start},
    nHeatSources=nHeatSourcesTotal,
    nMoistureSources=nMoistureSources,
    nAirpaths=nAirpathsInternal)
    "Air volume model"
    annotation (Placement(transformation(extent={{-24,64},{24,16}})));
  BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relRadConHeating(
    radiationportion=radiationportionIdealHeating) if calcIdealLoads
    annotation (Placement(transformation(extent={{-44,46},{-24,66}})));
  Modelica.Blocks.Continuous.LimPID heatingLoad(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ni=0.25,
    k=V*500,
    yMin=0.0,
    Ti=50.0,
    yMax=Q_flow_heatingMax) if calcIdealLoads
    annotation (Placement(transformation(extent={{-68,62},{-56,50}})));
  BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relRadConCooling(
    radiationportion=radiationportionIdealCooling) if calcIdealLoads
    annotation (Placement(transformation(extent={{-44,18},{-24,38}})));
  Modelica.Blocks.Continuous.LimPID coolingLoad(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ni=0.25,
    k=V*500,
    Ti=50.0,
    yMax=0.0,
    yMin=Q_flow_coolingMax) if calcIdealLoads
   annotation (Placement(transformation(extent={{-68,34},{-56,22}})));
  output BuildingSystems.Interfaces.HeatFlowRateOutput Q_flow_heating if calcIdealLoads
    annotation (Placement(transformation(extent={{-52,28},{-32,48}}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={110,70})));
  output BuildingSystems.Interfaces.HeatFlowRateOutput Q_flow_cooling if calcIdealLoads
    annotation (Placement(transformation(extent={{-52,2},{-32,22}}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={110,50})));
  output BuildingSystems.Interfaces.Temp_KOutput TAir
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={34,36}),   iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={110,-30})));
  output BuildingSystems.Interfaces.Moisture_absOutput xAir
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={34,46}),    iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={110,-90})));
  output BuildingSystems.Interfaces.Temp_KOutput TOperative =
    (airvolume.T[1] + radiationDistribution.TSurfMean) / 2.0
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-100,92}), iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={110,-70})));
  BuildingSystems.Interfaces.HeatPorts conHeatSourcesPorts[nHeatSources] if heatSources
    "Heat ports of the convective heat sources"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-66,80}), iconTransformation(extent={{-29,-7},{29,7}},rotation=180,origin={-49,-107})));
  BuildingSystems.Interfaces.HeatPorts radHeatSourcesPorts[nHeatSources] if heatSources
    "Heat ports of the long-wave radiation heat sources"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=180,origin={-44,-4}), iconTransformation(extent={{-29,-7},{29,7}},rotation=180,origin={49,-107})));
  BuildingSystems.Interfaces.MoisturePorts moistureSourcesPorts[nMoistureSources] if moistureSources
    "Moisture ports of the moisture sources"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-24,80}),
      iconTransformation(extent={{-29,-7},{29,7}}, rotation=180,origin={49,107})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow phfHeating if calcIdealLoads
    annotation (Placement(transformation(extent={{-50,52},{-42,60}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow phfCooling if calcIdealLoads
    annotation (Placement(transformation(extent={{-50,24},{-42,32}})));
  input BuildingSystems.Interfaces.Temp_KInput TAirAmb if prescribedAirchange
    "Air temperature of the building ambience"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={106,0}),
      iconTransformation(extent={{-10,-10},{10,10}},origin={-110,-50})));
  input BuildingSystems.Interfaces.Moisture_absInput xAirAmb if prescribedAirchange
    "Absolute moisture of the building ambience"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={106,-16}),
      iconTransformation(extent={{-10,-10},{10,10}},origin={-110,-70})));
  input BuildingSystems.Interfaces.AirchangeRateInput airchange if prescribedAirchange
    "Air change rate of the thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={106,18}),
      iconTransformation(extent={{-10,-10},{10,10}},origin={-110,-30})));
  Modelica.Blocks.Math.Gain ac2mf(
    k=rho_nominal*airvolume.V/3600.0) if prescribedAirchange
    "Transformation from air change in 1/h into air mass flow rate in kg/s"
    annotation (Placement(transformation(extent={{94,14},{86,22}})));
  Fluid.Sources.MassFlowSource_T airpathIn(
    use_m_flow_in=true,
    use_T_in=true,
    use_Xi_in=true,
    nPorts=1,
    redeclare package Medium = BuildingSystems.Media.Air) if prescribedAirchange
    "Calculates the mass flow rate which is entering the zone"
    annotation (Placement(transformation(extent={{60,-12},{44,4}})));
  Fluid.Sources.MassFlowSource_T airpathOut(
    use_m_flow_in = true,
    nPorts=1,
    redeclare package Medium = BuildingSystems.Media.Air) if prescribedAirchange
    "Calculates the mass flow rate which is leaving the zone"
    annotation (Placement(transformation(extent={{60,72},{44,88}})));
  Modelica.Blocks.Math.Gain mult(
    k = -1.0) if prescribedAirchange
    "Changes the sign of mass flow"
    annotation (Placement(transformation(extent={{80,24},{72,32}})));
  BuildingSystems.Buildings.Comfort.ThermalComfort_DIN_EN_ISO_7730 thermalComfort if calcThermalComfort
    "Thermal comfort assessment accordinng to DIN EN ISO 7730"
    annotation (Placement(transformation(extent={{42,-50},{62,-30}})));
  Modelica.Blocks.Interfaces.RealOutput PMV if calcThermalComfort
    "Predicted mean vote"
    annotation (Placement(transformation(extent={{-7,-7},{7,7}},rotation=0,origin={89,-27}),
      iconTransformation(extent={{100,0},{120,20}})));
  Modelica.Blocks.Interfaces.RealOutput PPD if calcThermalComfort
    "Predicted percentage dissatisfied"
    annotation (Placement(transformation(extent={{-7,-7},{7,7}},rotation=0,origin={73,-37}),
      iconTransformation(extent={{100,-20},{120,0}})));
  Modelica.Blocks.Sources.RealExpression cloVal(
    y=clo) if calcThermalComfort
    annotation (Placement(transformation(extent={{86,-60},{70,-42}})));
  Modelica.Blocks.Sources.RealExpression metVal(
    y=met) if calcThermalComfort
    annotation (Placement(transformation(extent={{86,-72},{70,-54}})));
  Modelica.Blocks.Sources.RealExpression wmeVal(
    y=wme) if calcThermalComfort
    annotation (Placement(transformation(extent={{86,-84},{70,-66}})));
  Modelica.Blocks.Sources.RealExpression vAirVal(
    y=vAir) if calcThermalComfort
    annotation (Placement(transformation(extent={{86,-96},{70,-78}})));
equation
  if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible then
    connect(airvolume.V_in, V_in);
  end if;

  for i in 1:nConstructions loop
    connect(surfaces.toAirPorts[i],airvolume.toSurfacePorts[i]);
  end for;
  if not prescribedAirchange then
    for i in 1:nAirpaths loop
      connect(airpathPorts[i], airvolume.airpathPorts[i]);
    end for;
  end if;
  // Internal heat sources
  for i in 1:nHeatSources loop
    connect(airvolume.heatSourcesPorts[i],conHeatSourcesPorts[i])
      annotation (Line(points={{-19.2,30.4},{-19.2,80},{-66,80}}, color={127,0,0}));
    connect(radiationDistribution.heatSourcesPorts[i],radHeatSourcesPorts[i]);
  end for;
  // Internal moisture sources
  for i in 1:nMoistureSources loop
    connect(moistureSourcesPorts[i], airvolume.moistureSourcesPorts[i])
      annotation (Line(points={{-24,80},{-24,49.6},{-19.2,49.6}}, color={0,0,255}));
  end for;
  // Ideal load calculation
  if calcIdealLoads then
    connect(airvolume.heatSourcesPorts[nHeatSources+1], relRadConHeating.heatPortCv)
      annotation (Line(
        points={{-19.2,30.4},{-26,30.4},{-26,58},{-30,58}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(airvolume.heatSourcesPorts[nHeatSources+2], relRadConCooling.heatPortCv)
      annotation (Line(
        points={{-19.2,30.4},{-30,30.4},{-30,30}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(airvolume.T[1], coolingLoad.u_m) annotation (Line(
        points={{19.2,35.2},{26,35.2},{26,6},{-72,6},{-72,38},{-62,38},{-62,35.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(airvolume.T[1], heatingLoad.u_m) annotation (Line(
        points={{19.2,35.2},{26,35.2},{26,66},{-62,66},{-62,63.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(relRadConHeating.heatPortLw, radiationDistribution.heatSourcesPorts[nHeatSources+1])
      annotation (Line(
        points={{-30,54},{-26,54},{-26,4},{0,4},{0,-41.28}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(relRadConCooling.heatPortLw, radiationDistribution.heatSourcesPorts[nHeatSources+2])
      annotation (Line(
        points={{-30,26},{-30,4},{0,4},{0,-41.28}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(T_setHeating, heatingLoad.u_s) annotation (Line(
        points={{-100,4},{-72,4},{-72,56},{-69.2,56}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_setCooling, coolingLoad.u_s) annotation (Line(
        points={{-100,-10},{-72,-10},{-72,28},{-69.2,28}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(phfHeating.port, relRadConHeating.heatPort) annotation (Line(
      points={{-42,56},{-37,56}},
      color={191,0,0},
      smooth=Smooth.None));
    connect(heatingLoad.y, phfHeating.Q_flow) annotation (Line(
        points={{-55.4,56},{-50,56}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(phfCooling.port, relRadConCooling.heatPort) annotation (Line(
        points={{-42,28},{-37,28}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(phfCooling.Q_flow, coolingLoad.y) annotation (Line(
        points={{-50,28},{-55.4,28}},
        color={0,0,127},
        smooth=Smooth.None));
    //Connect Outputs with ideal heating/cooling loads
    connect(Q_flow_heating, heatingLoad.y)
      annotation (Line(points={{-42,38},{-55.4,38},{-55.4,56}}, color={0,0,127}));
    connect(Q_flow_cooling, coolingLoad.y)
      annotation (Line(points={{-42,12},{-55.4,12},{-55.4,28}}, color={0,0,127}));
  end if;
  // Prescribed air change
  if prescribedAirchange then
    connect(ac2mf.u, airchange) annotation (Line(
        points={{94.8,18},{106,18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(airpathIn.m_flow_in, ac2mf.y) annotation (Line(
      points={{61.6,2.4},{80,2.4},{80,18},{85.6,18}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(airpathIn.T_in, TAirAmb) annotation (Line(
      points={{61.6,-0.8},{86,-0.8},{86,0},{106,0}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(airpathOut.m_flow_in, mult.y) annotation (Line(
        points={{61.6,86.4},{69.075,86.4},{69.075,28},{71.6,28}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(mult.u, ac2mf.y) annotation (Line(
        points={{80.8,28},{85.6,28},{85.6,18}},
        color={0,0,127},
        smooth=Smooth.None));
  end if;
  // Thermal comfort assessment
  if calcThermalComfort then
    connect(TAir, thermalComfort.TAir)
      annotation (Line(points={{34,36},{32,36},{32,-34},{45,-34}}, color={0,0,127}));
    connect(radiationDistribution.TSurfMean, thermalComfort.Tr)
      annotation (Line(points={{19.2,-60},{24,-60},{24,-37},{45,-37}}, color={0,0,127}));
    connect(xAir, thermalComfort.xAir)
      annotation (Line(points={{34,46},{34,-40},{45,-40}}, color={0,0,127}));
    connect(thermalComfort.PMV, PMV)
      annotation (Line(points={{61,-34},{64,-34},{64,-27},{89,-27}}, color={0,0,127}));
    connect(thermalComfort.PPD, PPD)
      annotation (Line(points={{61,-37},{73,-37}}, color={0,0,127}));
    connect(cloVal.y, thermalComfort.clo)
      annotation (Line(points={{69.2,-51},{47,-51},{47,-47}}, color={0,0,127}));
    connect(metVal.y, thermalComfort.met)
      annotation (Line(points={{69.2,-63},{50,-63},{50,-47}}, color={0,0,127}));
    connect(wmeVal.y, thermalComfort.wme)
      annotation (Line(points={{69.2,-75},{53,-75},{53,-47}}, color={0,0,127}));
    connect(vAirVal.y, thermalComfort.vAir)
      annotation (Line(points={{69.2,-87},{42,-87},{42,-43},{45,-43}}, color={0,0,127}));
  end if;
  connect(airvolume.T[1], TAir)
    annotation (Line(points={{19.2,35.2},{22.6,35.2},{22.6,36},{34,36}}, color={0,0,127}));
  connect(airvolume.x[1], xAir)
    annotation (Line(points={{19.2,44.8},{24.6,44.8},{24.6,46},{34,46}}, color={0,0,127}));
  connect(airpathIn.Xi_in[1], xAirAmb) annotation (Line(points={{61.6,-7.2},{80,
          -7.2},{80,-16},{106,-16}}, color={0,0,127}));
  connect(airpathIn.ports[1], airvolume.airpathPorts[1]) annotation (Line(
        points={{44,-4},{44,74},{-4.8,74},{-4.8,59.2}},   color={0,127,255}));
  connect(airpathOut.ports[1], airvolume.airpathPorts[2]) annotation (Line(
        points={{44,80},{4.8,80},{4.8,59.2}},     color={0,127,255}));

  annotation(defaultComponentName="zone",
Documentation(info="<html>
<p>
This is a template model for a thermal zone with fully mixed air volume.
</p>
</html>", revisions="<html>
<ul>
<li>
January 3, 2020 by Christoph Nytsch-Geusen:<br/>
Thermal comfort assessment added.
</li>
<li>
September 19, 2018 by Christoph Nytsch-Geusen:<br/>
Air path models against IBPSA 1 library models exchanged.
</li>
<li>
January 25, 2017 by Christoph Nytsch-Geusen:<br/>
Adapted to discretized air volume model.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ZoneTemplateAirvolumeMixed;
