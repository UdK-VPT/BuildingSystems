within BuildingSystems.Technologies.DistrictHeatingNetworks.Examples;
model DistrictHeatingNetwork_m_flow
  "Example of a DHN with decentralized pumps which control the mass flow rate of the DHN."
  extends Modelica.Icons.Example;
  replaceable package Medium = BuildingSystems.Media.Water;
  BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow station(
    redeclare package Medium = Medium,
    m_flow_nominal=50,
    allowFlowReversal=false,
    show_T=true,
    Q_nominal(displayUnit="kW") = 1500000,
    dp_nominalDHN(displayUnit="kPa"),
    Tsupply_max=353.15,
    Tsupply_min=328.15)
    annotation (Placement(transformation(extent={{-42,42},{-62,62}})));
  BuildingSystems.Fluid.HeatExchangers.HeaterCooler_T central(
    redeclare package Medium = Medium,
    m_flow_nominal=1,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{54,30},{34,50}})));
  BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow station1(
    redeclare package Medium = Medium,
    m_flow_nominal=50,
    allowFlowReversal=false,
    show_T=true,
    factor_Tsupply=15,
    Q_nominal(displayUnit="kW") = 1500000,
    Tsupply_max=353.15,
    Tsupply_min=333.15)
    annotation (Placement(transformation(extent={{-46,-70},{-66,-50}})));
  BuildingSystems.Technologies.DistrictHeatingNetworks.BoundaryConditions.GroundTemperature0D kusuda0D(
    A=8,
    z=1,
    t0(displayUnit="d") = 15552000,
    Tmean=283.15)
    annotation (Placement(transformation(extent={{-220,-40},{-200,-20}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D building(
    AInn=10*10,
    AGro=10*10,
    nWindows=1,
    AWin={2*3},
    CAmb=100000,
    CInn=100000,
    CGro=100000,
    UValAmb=0.2,
    UValInn=1.0,
    UValGro=0.2,
    calcIdealLoads=false,
    heatSources=true,
    nHeatSources=1,
    show_TAir=true,
    AAmb=2*(2*50 + 2*60)*28 + 50*60,
    VAir=2*50*60*28) "Building model"
    annotation (Placement(transformation(extent={{-66,76},{-46,96}})));
  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient,
    redeclare BuildingSystems.Climate.WeatherDataDWD.WeatherDataFile_Germany_Potsdam2003 weatherDataFile)
    "Ambient model"
    annotation (Placement(transformation(extent={{-96,76},{-76,96}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D building1(
    AInn=10*10,
    AGro=10*10,
    nWindows=1,
    AWin={2*3},
    CAmb=100000,
    CInn=100000,
    CGro=100000,
    UValAmb=0.2,
    UValInn=1.0,
    UValGro=0.2,
    calcIdealLoads=false,
    heatSources=true,
    nHeatSources=1,
    show_TAir=true,
    AAmb=2*(2*50 + 2*60)*28 + 50*60,
    VAir=2*50*60*28) "Building model"
    annotation (Placement(transformation(extent={{-66,-32},{-46,-12}})));
  BuildingSystems.Buildings.Ambient ambient1(redeclare
    BuildingSystems.Climate.WeatherDataDWD.WeatherDataFile_Germany_Potsdam2003
    weatherDataFile, nSurfaces=building1.nSurfacesAmbient)
    "Ambient model"
    annotation (Placement(transformation(extent={{-92,-32},{-72,-12}})));
  Modelica.Blocks.Sources.Constant airchange(
    k=0.5)
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},rotation=180,origin={-26,94})));
  Modelica.Blocks.Sources.Constant airchange1(
    k=0.5)
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},rotation=180,origin={-10,-20})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium,
    V_start=1,
    p_start=300000)
    annotation (Placement(transformation(extent={{54,60},{66,72}})));
  BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.ParallelPipes parallelPipes(
    redeclare package Medium = Medium,
    length=200,
    redeclare BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels.UPreinsulated Umodel(
      d_i=0.3,
      H_real=1,
      E=0.5),
    m_flow_nominal=30)
    annotation (Placement(transformation(extent={{-6,20},{-26,40}})));
  BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.ParallelPipes parallelPipes1(
    redeclare package Medium = Medium,
    redeclare BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels.UPreinsulated Umodel(
      d_i=0.2,
      H_real=1,
      E=0.4),
    length=400,
    m_flow_nominal=15)
    annotation (Placement(transformation(extent={{-94,20},{-114,40}})));
  BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.ParallelPipes parallelPipes2(
    redeclare package Medium = Medium,
    length=200,
    redeclare BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels.UPreinsulated Umodel(
      d_i=0.2,
      H_real=1,
      E=0.4),
    m_flow_nominal=15)
    annotation (Placement(transformation(extent={{0,-80},{-20,-60}})));
  BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.Station_m_flow station2(
    redeclare package Medium = Medium,
    m_flow_nominal=50,
    allowFlowReversal=false,
    show_T=true,
    Q_nominal(displayUnit="kW") = 1500000,
    Tsupply_max(displayUnit="K") = 353.15,
    Tsupply_min(displayUnit="K") = 328.15)
    annotation (Placement(transformation(extent={{-154,32},{-174,52}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D building2(
    AInn=10*10,
    AGro=10*10,
    nWindows=1,
    AWin={2*3},
    CAmb=100000,
    CInn=100000,
    CGro=100000,
    UValAmb=0.2,
    UValInn=1.0,
    UValGro=0.2,
    calcIdealLoads=false,
    heatSources=true,
    nHeatSources=1,
    show_TAir=true,
    AAmb=2*(2*50 + 2*60)*28 + 50*60,
    VAir=2*50.0*60.0*28)
    "Building model"
    annotation (Placement(transformation(extent={{-178,68},{-158,88}})));
  BuildingSystems.Buildings.Ambient ambient2(
    redeclare BuildingSystems.Climate.WeatherDataDWD.WeatherDataFile_Germany_Potsdam2003 weatherDataFile,
    nSurfaces=building2.nSurfacesAmbient)
    "Ambient model"
    annotation (Placement(transformation(extent={{-208,68},{-188,88}})));
  Modelica.Blocks.Sources.Constant airchange2(
    k=0.5)
    annotation (Placement(transformation(extent={{-6,6},{6,-6}},rotation=180,origin={-134,84})));
  Modelica.Blocks.Sources.TimeTable SupplyTemperature(
    table=[0.0,273.15 + 85;
      0.0,273.15 + 85;
      13140000,273.15 + 85;
      13140000,273.15 + 70;
      21024000,273.15 + 70;
      21024000,273.15 + 85;
      31536000,273.15 + 85])
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=180,origin={90,50})));
  Modelica.Blocks.Sources.Constant TsetHeating2(
    k=273.15 + 20)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},rotation=180,origin={-210,10})));
  Modelica.Blocks.Sources.Constant TsetHeating1(
    k=273.15 + 20)
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},rotation=180,origin={-110,-70})));
  Modelica.Blocks.Sources.Constant TsetHeating(
    k=273.15 + 20)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=180,origin={-10,70})));
equation
  connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts) annotation (
      Line(
      points={{-78,90},{-65,90}},
      color={0,255,0},
      smooth=Smooth.None));
  connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
      points={{-78,82},{-65,82}},
      color={85,170,255},
      smooth=Smooth.None));
  connect(building.TAir[1], station.zoneTAir) annotation (Line(
      points={{-37,79},{-34,79},{-34,72},{-51,72},{-51,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient.TAirRef, station.ambientTAirRef) annotation (Line(
      points={{-95,93},{-100,93},{-100,66},{-47,66},{-47,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient1.TAirRef, station1.ambientTAirRef) annotation (Line(
      points={{-91,-15},{-100,-15},{-100,-46},{-51,-46},{-51,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(station1.zoneTAir, building1.TAir[1]) annotation (Line(
      points={{-55,-50},{-56,-50},{-56,-42},{-36,-42},{-36,-29},{-37,-29}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient1.toSurfacePorts, building1.toAmbientSurfacesPorts)
    annotation (Line(
      points={{-74,-18},{-65,-18}},
      color={0,255,0},
      smooth=Smooth.None));
  connect(ambient1.toAirPorts, building1.toAmbientAirPorts) annotation (Line(
      points={{-74,-26},{-65,-26}},
      color={85,170,255},
      smooth=Smooth.None));
  connect(building.airchange[1], airchange.y) annotation (Line(
      points={{-46.2,90},{-38,90},{-38,94},{-32.6,94}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building1.airchange[1], airchange1.y) annotation (Line(
      points={{-46.2,-18},{-32,-18},{-32,-20},{-16.6,-20}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building1.TAirAmb, ambient1.TAirRef) annotation (Line(
      points={{-49.8,-12.2},{-49.8,-4},{-96,-4},{-96,-15},{-91,-15}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building1.xAirAmb, ambient1.xAir) annotation (Line(
      points={{-47.6,-12.2},{-47.6,-2},{-98,-2},{-98,-17},{-91,-17}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient.TAirRef, building.TAirAmb) annotation (Line(
      points={{-95,93},{-96,93},{-96,100},{-49.8,100},{-49.8,95.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.xAirAmb, ambient.xAir) annotation (Line(
      points={{-47.6,95.8},{-47.6,102},{-98,102},{-98,91},{-95,91}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(parallelPipes.port_a1, central.port_b) annotation (Line(
      points={{-6,36},{12,36},{12,40},{34,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipes.port_b1, station.port_a) annotation (Line(
      points={{-26,36},{-30,36},{-30,52},{-42,52}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(station.port_b, parallelPipes.port_a2) annotation (Line(
      points={{-62,52},{-72,52},{-72,24},{-26,24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipes.port_b2, central.port_a) annotation (Line(
      points={{-6,24},{60,24},{60,40},{54,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipes1.port_a1, parallelPipes.port_b1) annotation (Line(
      points={{-94,36},{-26,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipes1.port_b2, parallelPipes.port_a2) annotation (Line(
      points={{-94,24},{-26,24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(station1.port_a, parallelPipes2.port_b1) annotation (Line(
      points={{-46,-60},{-32,-60},{-32,-64},{-20,-64}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipes2.port_a1, central.port_b) annotation (Line(
      points={{0,-64},{34,-64},{34,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(station1.port_b, parallelPipes2.port_a2) annotation (Line(
      points={{-66,-60},{-88,-60},{-88,-76},{-20,-76}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(parallelPipes2.port_b2, central.port_a) annotation (Line(
      points={{0,-76},{68,-76},{68,40},{54,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(ambient2.toSurfacePorts, building2.toAmbientSurfacesPorts)
    annotation (Line(
      points={{-190,82},{-177,82}},
      color={0,255,0},
      smooth=Smooth.None));
  connect(ambient2.toAirPorts, building2.toAmbientAirPorts) annotation (Line(
      points={{-190,74},{-177,74}},
      color={85,170,255},
      smooth=Smooth.None));
  connect(building2.TAir[1], station2.zoneTAir) annotation (Line(
      points={{-149,71},{-146,71},{-146,62},{-163,62},{-163,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient2.TAirRef, station2.ambientTAirRef) annotation (Line(
      points={{-207,85},{-212,85},{-212,58},{-159,58},{-159,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building2.airchange[1], airchange2.y) annotation (Line(
      points={{-158.2,82},{-150,82},{-150,84},{-140.6,84}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient2.TAirRef, building2.TAirAmb) annotation (Line(
      points={{-207,85},{-208,85},{-208,92},{-161.8,92},{-161.8,87.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building2.xAirAmb, ambient2.xAir) annotation (Line(
      points={{-159.6,87.8},{-159.6,94},{-210,94},{-210,83},{-207,83}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(station2.port_a, parallelPipes1.port_b1) annotation (Line(
      points={{-154,42},{-140,42},{-140,36},{-114,36}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(station2.port_b, parallelPipes1.port_a2) annotation (Line(
      points={{-174,42},{-192,42},{-192,24},{-114,24}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(kusuda0D.port[1], parallelPipes1.port_a) annotation (Line(
      points={{-201,-30},{-124,-30},{-124,50},{-104,50},{-104,39.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(kusuda0D.port[2], parallelPipes.port_a) annotation (Line(
      points={{-201,-30},{-124,-30},{-124,14},{6,14},{6,50},{-16,50},{-16,39.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(kusuda0D.port[3], parallelPipes2.port_a) annotation (Line(
      points={{-201,-30},{-124,-30},{-124,-86},{14,-86},{14,-42},{-10,-42},{-10,
          -60.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TsetHeating2.y, station2.Tset) annotation (Line(
      points={{-199,10},{-184,10},{-184,56},{-167,56},{-167,52}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TsetHeating1.y, station1.Tset) annotation (Line(
      points={{-99,-70},{-99,-44},{-59,-44},{-59,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(station.Tset, TsetHeating.y) annotation (Line(
      points={{-55,62},{-55,70},{-21,70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(central.TSet, SupplyTemperature.y) annotation (Line(
      points={{56,46},{68,46},{68,50},{79,50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(exp.port_a, central.port_a) annotation (Line(
      points={{60,60},{60,40},{54,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(station1.Radheat, building1.radHeatSourcesPorts[1]) annotation (Line(
        points={{-62,-51},{-62,-36},{-32,-36},{-32,-8},{-53,-8},{-53,-12}},
        color={191,0,0}));
  connect(building1.conHeatSourcesPorts[1], station1.Conheat) annotation (Line(
        points={{-56,-12},{-56,-8},{-65,-8},{-65,-51}}, color={127,0,0}));
  connect(station.Radheat, building.radHeatSourcesPorts[1]) annotation (Line(
        points={{-58,61},{-58,74},{-42,74},{-42,106},{-52,106},{-52,96},{-53,96}},
        color={191,0,0}));
  connect(building.conHeatSourcesPorts[1], station.Conheat) annotation (Line(
        points={{-56,96},{-58,96},{-58,104},{-58,106},{-68,106},{-68,61},{-61,
          61}}, color={127,0,0}));
  connect(station2.Conheat, building2.conHeatSourcesPorts[1]) annotation (Line(
        points={{-173,51},{-173,62},{-184,62},{-184,100},{-168,100},{-168,88}},
        color={191,0,0}));
  connect(station2.Radheat, building2.radHeatSourcesPorts[1]) annotation (Line(
        points={{-170,51},{-170,64},{-154,64},{-154,92},{-165,92},{-165,88}},
        color={191,0,0}));
  annotation (__Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/DistrictHeatingNetworks/Examples/DistrictHeatingNetwork_m_flow.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-220,-100},{100,120}})),
    experiment(StopTime=3.1536e+007),               _Dymola_Documentation(info="<html>
<p>
Example that simulates a district heating network with decentralized pumps which control the mass flow rate of the DHN.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Carles Ribas Tugores:<br/>
First implementation.
</li>
</ul>
</html>"));
end DistrictHeatingNetwork_m_flow;
