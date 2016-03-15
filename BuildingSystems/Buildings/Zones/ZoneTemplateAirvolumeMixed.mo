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
  parameter Real radiationportionHeatSource[nHeatSources]=fill(0.5,nHeatSources)
    "Radiation portion of each heating source"
    annotation(Dialog(tab="General",group="Heat and moisture sources"));
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
    annotation (Placement(transformation(extent={{-44,42},{-24,62}})));
  Modelica.Blocks.Continuous.LimPID heatingLoad(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ni = 0.25,
    k=V*500,
    yMin= 0.0,
    Ti=50.0,
    yMax=Q_flow_heatingMax) if calcIdealLoads
    annotation (Placement(transformation(extent={{-66,58},{-54,46}})));
  BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relRadConCooling(
    radiationportion=radiationportionIdealCooling) if calcIdealLoads
    annotation (Placement(transformation(extent={{-44,16},{-24,36}})));
  Modelica.Blocks.Continuous.LimPID coolingLoad(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ni = 0.25,
    k=V*500,
    Ti=50.0,
    yMax=0.0,
    yMin=Q_flow_coolingMax) if  calcIdealLoads
   annotation (Placement(transformation(extent={{-66,32},{-54,20}})));
  output BuildingSystems.Interfaces.HeatFlowRateOutput Q_flow_heating if calcIdealLoads
    annotation (Placement(transformation(extent={{90,80},{110,100}}), iconTransformation(extent={{-10,-10},{10,10}},rotation=-90,origin={30,70})));
  output BuildingSystems.Interfaces.HeatFlowRateOutput Q_flow_cooling if calcIdealLoads
    annotation (Placement(transformation(extent={{90,62},{110,82}}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={70,70})));
  BuildingSystems.Buildings.BaseClasses.RelationRadiationConvection relRadConHeatSource[nHeatSources](
    radiationportion=radiationportionHeatSource) if heatSources;
  output BuildingSystems.Interfaces.Temp_KOutput TAir = airvolume.T
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-100,-74}),iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-70,70})));
  output BuildingSystems.Interfaces.Moisture_absOutput xAir = airvolume.x
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-100,-92}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-10,70})));
  output BuildingSystems.Interfaces.Temp_KOutput TOperative = (airvolume.T + radiationDistribution.TSurfMean) / 2.0
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-100,92}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-30,70})));
  BuildingSystems.Interfaces.HeatPorts heatSourcesPorts[nHeatSources] if heatSources
    "Heat ports of the heat sources"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-80,40}), iconTransformation(extent={{-29,-7},{29,7}},rotation=180,origin={7,-73})));
  BuildingSystems.Interfaces.MoisturePorts moistureSourcesPorts[nMoistureSources] if moistureSources
    "Moisture ports of the moisture sources"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-80,-40}), iconTransformation(extent={{-29,-7},{29,7}}, rotation=180,origin={-51,-73})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow phfHeating if  calcIdealLoads
    annotation (Placement(transformation(extent={{-50,48},{-42,56}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow phfCooling if  calcIdealLoads
    annotation (Placement(transformation(extent={{-50,22},{-42,30}})));
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
    annotation (Placement(transformation(extent={{72,14},{64,22}})));
  BuildingSystems.Buildings.Airpathes.AirpathPrescribedMassFlowRate airpathIn(
    use_m_flow_in=true,
    use_T_in=true,
    use_x_in=true) if prescribedAirchange
    "Calculates the mass flow rate which is entering the zone"
    annotation (Placement(transformation(extent={{34,4},{54,24}})));
  Airpathes.AirpathPrescribedMassFlowRate airpathOut(
    x = 0.005,
    use_m_flow_in = true,
    T = 293.15) if prescribedAirchange
    "Calculates the mass flow rate which is leaving the zone"
    annotation (Placement(transformation(extent={{34,24},{52,42}})));
  Modelica.Blocks.Math.Gain mult(
    k = -1.0) if prescribedAirchange
    "Changes the sign of mass flow"
    annotation (Placement(transformation(extent={{58,24},{50,32}})));
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
    connect(airvolume.heatSourcesPorts[i],relRadConHeatSource[i].heatPortCv);
    connect(radiationDistribution.heatSourcesPorts[1],relRadConHeatSource[i].heatPortLw);
    connect( heatSourcesPorts[i], relRadConHeatSource[i].heatPort);
  end for;
  // Ideal load calculation
  if calcIdealLoads then
    connect(airvolume.heatSourcesPorts[nHeatSources+1], relRadConHeating.heatPortCv)
      annotation (Line(
        points={{-19.2,30.4},{-26,30.4},{-26,54},{-30,54}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(airvolume.heatSourcesPorts[nHeatSources+2], relRadConCooling.heatPortCv)
      annotation (Line(
        points={{-19.2,30.4},{-30,30.4},{-30,28}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(airvolume.T, coolingLoad.u_m) annotation (Line(
        points={{19.2,35.2},{26,35.2},{26,14},{-70,14},{-70,38},{-60,38},{-60,33.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(airvolume.T, heatingLoad.u_m) annotation (Line(
        points={{19.2,35.2},{26,35.2},{26,64},{-60,64},{-60,59.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(relRadConHeating.heatPortLw, radiationDistribution.heatSourcesPorts[nHeatSources+1])
      annotation (Line(
        points={{-30,50},{-26,50},{-26,6},{0,6},{0,-1.28}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(relRadConCooling.heatPortLw, radiationDistribution.heatSourcesPorts[nHeatSources+2])
      annotation (Line(
        points={{-30,24},{-30,6},{0,6},{0,-1.28}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(T_setHeating, heatingLoad.u_s) annotation (Line(
        points={{-100,4},{-72,4},{-72,52},{-67.2,52}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(T_setCooling, coolingLoad.u_s) annotation (Line(
        points={{-100,-10},{-67.2,-10},{-67.2,26}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(phfHeating.port, relRadConHeating.heatPort) annotation (Line(
      points={{-42,52},{-37,52}},
      color={191,0,0},
      smooth=Smooth.None));
    connect(heatingLoad.y, phfHeating.Q_flow) annotation (Line(
        points={{-53.4,52},{-50,52}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(phfCooling.port, relRadConCooling.heatPort) annotation (Line(
        points={{-42,26},{-37,26}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(phfCooling.Q_flow, coolingLoad.y) annotation (Line(
        points={{-50,26},{-53.4,26}},
        color={0,0,127},
        smooth=Smooth.None));

	//Connect Outputs with ideal heating/cooling loads
	connect(Q_flow_heating, heatingLoad.y);
	connect(Q_flow_cooling, coolingLoad.y);
  end if;
  // Internal moisture sources
  for i in 1:nMoistureSources loop
    connect(moistureSourcesPorts[i], airvolume.moistureSourcesPorts[i]);
  end for;
  // Prescribed air change
  if prescribedAirchange then
    connect(ac2mf.u, airchange) annotation (Line(
        points={{72.8,18},{106,18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(airpathIn.m_flow_in, ac2mf.y) annotation (Line(
      points={{47.5,14.1},{55.075,14.1},{55.075,18},{63.6,18}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(airpathIn.x_in, xAirAmb) annotation (Line(
      points={{47.5,12.5},{47.5,-16},{106,-16}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(airpathIn.T_in, TAirAmb) annotation (Line(
      points={{47.5,15.5},{52,15.5},{52,0},{106,0}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(airpathOut.m_flow_in, mult.y) annotation (Line(
        points={{46.15,33.09},{49.075,33.09},{49.075,28},{49.6,28}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(mult.u, ac2mf.y) annotation (Line(
        points={{58.8,28},{63.6,28},{63.6,18}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(airpathIn.airpathPort_1, airvolume.airpathPorts[1]) annotation (Line(
        points={{40,14},{32,14},{32,72},{-4.8,72},{-4.8,59.2}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(airpathOut.airpathPort_1, airvolume.airpathPorts[2]) annotation (Line(
        points={{39.4,33},{39.4,68},{4.8,68},{4.8,59.2}},
        color={0,127,255},
        smooth=Smooth.None));
  end if;

  annotation(defaultComponentName="zone");
end ZoneTemplateAirvolumeMixed;
