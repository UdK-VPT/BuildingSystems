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
  parameter Modelica.SIunits.Length heightAirpath[nAirpathes]=fill(0.0,nAirpathes)
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
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-100,4}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={10,70})));
  input BuildingSystems.Interfaces.Temp_KInput T_setCooling if calcIdealLoads
    "Set air temperature for cooling of the zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-100,-10}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={50,70})));
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start air temperature of the zone"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.MassFraction x_start = 0.005
    "Start air moisture of the zone"
    annotation (Dialog(tab="Initialization"));
  BuildingSystems.Buildings.Airvolumes.AirvolumeCompressible0D airvolume(
    nSurfaces=nSurfaces,
    gridSurface=gridSurfaceZone,
    V=V,
    height=height,
    heightAirpath = heightAirpath,
    T_start=T_start,
    x_start=x_start,
    nHeatSources=nHeatSourcesTotal,
    nMoistureSources=nMoistureSources,
    nAirpathes=nAirpathes)
    annotation (Placement(transformation(extent={{-24,64},{24,16}})));
  BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relRadConHeating(
    radiationportion=radiationportionIdealHeating) if calcIdealLoads
    annotation (Placement(transformation(extent={{-44,46},{-24,66}})));
  Modelica.Blocks.Continuous.LimPID heatingLoad(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ni = 0.25,
    k=V*500,
    yMin= 0.0,
    Ti=50.0,
    yMax=Q_flow_heatingMax) if calcIdealLoads
    annotation (Placement(transformation(extent={{-68,62},{-56,50}})));
  BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relRadConCooling(
    radiationportion=radiationportionIdealCooling) if calcIdealLoads
    annotation (Placement(transformation(extent={{-44,18},{-24,38}})));
  Modelica.Blocks.Continuous.LimPID coolingLoad(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ni = 0.25,
    k=V*500,
    Ti=50.0,
    yMax=0.0,
    yMin=Q_flow_coolingMax) if  calcIdealLoads
   annotation (Placement(transformation(extent={{-68,34},{-56,22}})));
  output BuildingSystems.Interfaces.HeatFlowRateOutput Q_flow_heating if calcIdealLoads
    annotation (Placement(transformation(extent={{-52,28},{-32,48}}), iconTransformation(extent={{-10,-10},{10,10}},rotation=-90,origin={30,70})));
  output BuildingSystems.Interfaces.HeatFlowRateOutput Q_flow_cooling if calcIdealLoads
    annotation (Placement(transformation(extent={{-52,2},{-32,22}}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={70,70})));
  output BuildingSystems.Interfaces.Temp_KOutput TAir
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={34,36}),   iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-70,70})));
  output BuildingSystems.Interfaces.Moisture_absOutput xAir
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={34,46}),    iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-10,70})));
  output BuildingSystems.Interfaces.Temp_KOutput TOperative = (airvolume.T + radiationDistribution.TSurfMean) / 2.0
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-100,92}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-30,70})));
  BuildingSystems.Interfaces.HeatPorts conHeatSourcesPorts[nHeatSources] if heatSources
    "Heat ports of the convective heat sources"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-66,80}), iconTransformation(extent={{-29,-7},{29,7}},rotation=180,origin={-51,-73})));
  BuildingSystems.Interfaces.HeatPorts radHeatSourcesPorts[nHeatSources] if heatSources
    "Heat ports of the long-wave radiation heat sources"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=180,origin={-44,-4}), iconTransformation(extent={{-29,-7},{29,7}},rotation=180,origin={7,-73})));
  BuildingSystems.Interfaces.MoisturePorts moistureSourcesPorts[nMoistureSources] if moistureSources
    "Moisture ports of the moisture sources"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-24,80}),  iconTransformation(extent={{-29,-7},{29,7}}, rotation=180,origin={65,-73})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow phfHeating if calcIdealLoads
    annotation (Placement(transformation(extent={{-50,52},{-42,60}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow phfCooling if calcIdealLoads
    annotation (Placement(transformation(extent={{-50,24},{-42,32}})));
  input BuildingSystems.Interfaces.Temp_KInput TAirAmb if prescribedAirchange
    "Air temperature of the building ambient"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={106,0}),  iconTransformation(extent={{-10,-10},{10,10}},origin={110,50})));
  input BuildingSystems.Interfaces.Moisture_absInput xAirAmb if prescribedAirchange
    "Absolute moisture of the building ambient"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={106,-16}),iconTransformation(extent={{-10,-10},{10,10}},origin={110,30})));
  input BuildingSystems.Interfaces.AirchangeRateInput airchange if prescribedAirchange
    "Air change rate of the thermal zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={106,18}),   iconTransformation(extent={{-10,-10},{10,10}},origin={110,70})));
  Modelica.Blocks.Math.Gain ac2mf(k=-rho_nominal*airvolume.V/3600.0) if prescribedAirchange
    "Transformation from air change in 1/h into air mass flow rate in kg/s"
    annotation (Placement(transformation(extent={{76,14},{68,22}})));
  BuildingSystems.Buildings.Airpathes.AirpathPrescribedMassFlowRate airpathIn(
    use_m_flow_in=true,
    use_T_in=true,
    use_x_in=true) if prescribedAirchange
    "Calculates the mass flow rate which is entering the zone"
    annotation (Placement(transformation(extent={{36,4},{56,24}})));
  Airpathes.AirpathPrescribedMassFlowRate airpathOut(
    x = 0.005,
    use_m_flow_in = true,
    T = 293.15) if prescribedAirchange
    "Calculates the mass flow rate which is leaving the zone"
    annotation (Placement(transformation(extent={{36,24},{54,42}})));
  Modelica.Blocks.Math.Gain mult(
    k = -1.0) if prescribedAirchange
    "Changes the sign of mass flow"
    annotation (Placement(transformation(extent={{62,24},{54,32}})));
equation
  for i in 1:nConstructions1 loop
    connect(surfaces1.toAirPorts[i],airvolume.toSurfacePorts[i]);
  end for;
  for i in 1:nConstructions2 loop
    connect(surfaces2.toAirPorts[i],airvolume.toSurfacePorts[nConstructions1+i]);
  end for;
  for i in 1:nConstructions3 loop
    connect(surfaces3.toAirPorts[i],airvolume.toSurfacePorts[nConstructions1+nConstructions2+i]);
  end for;
  for i in 1:nConstructions4 loop
    connect(surfaces4.toAirPorts[i],airvolume.toSurfacePorts[nConstructions1+nConstructions2+nConstructions3+i]);
  end for;
  for i in 1:nConstructions5 loop
    connect(surfaces5.toAirPorts[i],airvolume.toSurfacePorts[nConstructions1+nConstructions2+nConstructions3+nConstructions4+i]);
  end for;
  for i in 1:nConstructions6 loop
    connect(surfaces6.toAirPorts[i],airvolume.toSurfacePorts[nConstructions1+nConstructions2+nConstructions3+nConstructions4+nConstructions5+i]);
  end for;
  if not prescribedAirchange then
    for i in 1:nAirpathes1 loop
      connect(airpathPorts1[i], airvolume.airpathPorts[i]);
    end for;
    for i in 1:nAirpathes2 loop
      connect(airpathPorts2[i], airvolume.airpathPorts[nAirpathes1+i]);
    end for;
    for i in 1:nAirpathes3 loop
      connect(airpathPorts3[i], airvolume.airpathPorts[nAirpathes1+nAirpathes2+i]);
    end for;
    for i in 1:nAirpathes4 loop
      connect(airpathPorts4[i], airvolume.airpathPorts[nAirpathes1+nAirpathes2+nAirpathes3+i]);
    end for;
    for i in 1:nAirpathes5 loop
      connect(airpathPorts5[i], airvolume.airpathPorts[nAirpathes1+nAirpathes2+nAirpathes3+nAirpathes4+i]);
    end for;
    for i in 1:nAirpathes6 loop
      connect(airpathPorts6[i], airvolume.airpathPorts[nAirpathes1+nAirpathes2+nAirpathes3+nAirpathes4+nAirpathes5+i]);
    end for;
  end if;
  // Internal heat sources
  for i in 1:nHeatSources loop
    connect(airvolume.heatSourcesPorts[i],conHeatSourcesPorts[i])
      annotation (Line(points={{-66,80},{-66,72},{-26,72},{-26,30.4},{-19.2,30.4}}, color={127,0,0}));
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
    connect(airvolume.T, coolingLoad.u_m) annotation (Line(
        points={{19.2,35.2},{26,35.2},{26,6},{-72,6},{-72,38},{-62,38},{-62,35.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(airvolume.T, heatingLoad.u_m) annotation (Line(
        points={{19.2,35.2},{26,35.2},{26,66},{-62,66},{-62,63.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(relRadConHeating.heatPortLw, radiationDistribution.heatSourcesPorts[nHeatSources+1])
      annotation (Line(
        points={{-30,54},{-26,54},{-26,4},{0,4},{0,-1.28}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(relRadConCooling.heatPortLw, radiationDistribution.heatSourcesPorts[nHeatSources+2])
      annotation (Line(
        points={{-30,26},{-30,4},{0,4},{0,-1.28}},
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
        points={{76.8,18},{106,18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(airpathIn.m_flow_in, ac2mf.y) annotation (Line(
      points={{49.5,14.1},{55.075,14.1},{55.075,18},{67.6,18}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(airpathIn.x_in, xAirAmb) annotation (Line(
      points={{49.5,12.5},{49.5,-16},{106,-16}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(airpathIn.T_in, TAirAmb) annotation (Line(
      points={{49.5,15.5},{52,15.5},{52,0},{106,0}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(airpathOut.m_flow_in, mult.y) annotation (Line(
        points={{48.15,33.09},{51.075,33.09},{51.075,28},{53.6,28}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(mult.u, ac2mf.y) annotation (Line(
        points={{62.8,28},{67.6,28},{67.6,18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(airpathIn.airpathPort_1, airvolume.airpathPorts[1]) annotation (Line(
        points={{42,14},{32,14},{32,72},{0,72},{0,59.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(airpathOut.airpathPort_1, airvolume.airpathPorts[2]) annotation (Line(
        points={{41.4,33},{41.4,68},{0,68},{0,59.2}},
        color={0,127,255},
        smooth=Smooth.None));
  end if;
  connect(airvolume.T, TAir)
    annotation (Line(points={{19.2,35.2},{22.6,35.2},{22.6,36},{34,36}}, color={0,0,127}));
  connect(airvolume.x, xAir)
    annotation (Line(points={{19.2,44.8},{24.6,44.8},{24.6,46},{34,46}}, color={0,0,127}));

  annotation(defaultComponentName="zone");
end ZoneTemplateAirvolumeMixed;
