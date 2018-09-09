within BuildingSystems.Applications.DistrictSimulation;
model HCBC
  "Model including buildings of the university campus Berlin-Charlottenburg (HCBC) without DHN"
  extends Modelica.Icons.Example;
  Modelica.SIunits.Heat Q_district(displayUnit="kWh")
    "Heating load of all buildings";
  model Building
    "Building model with four capacities used in conjunction with parameter maps for campus simulations"
  extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    nSurfacesSolid=1,
    surfacesToAmbient(nSurfaces=5),
    nZones=1);
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    nConstructions=8,
    V=parameterMap.VZon,
    height=parameterMap.heightZon,
    Q_flow_heatingMax=parameterMap.Q_flowHea,
    Q_flow_coolingMax=parameterMap.Q_flowCoo,
    nHeatSources=nHeatSources,
    heatSources=heatSources)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes outerCapacity(
    constructionData=outerConstruction,
    abs_2=0.75,
    width=parameterMap.widthOutCap,
    height=parameterMap.heightOutCap,
    abs_1=0.0)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes innerCapacity(
    constructionData=innerConstruction,
    abs_2=0.75,
    abs_1=0.75,
    width=parameterMap.widthInnCap,
    height=parameterMap.heightInnCap)
    annotation (Placement(transformation(extent={{-40,0},{-20,20}})));
  BuildingSystems.Buildings.Constructions.Windows.Window leftWindow(
    width=parameterMap.widthWin1,
    height=parameterMap.heightWin1,
    angleDegAzi=parameterMap.angleDegAziWin1,
    constructionData.UValGla=parameterMap.windowU,
    constructionData.UValFra=parameterMap.windowU,
    constructionData.g = 0.6,
    constructionData.b0 = 0.7)
    annotation (Placement(transformation(extent={{-40,-60},{-20,-40}})));
  BuildingSystems.Buildings.Constructions.Windows.Window rightWindow(
    width=parameterMap.widthWin2,
    height=parameterMap.heightWin2,
    angleDegAzi=parameterMap.angleDegAziWin2,
    constructionData.UValGla=parameterMap.windowU,
    constructionData.UValFra=parameterMap.windowU,
    constructionData.g = 0.6,
    constructionData.b0 = 0.7)
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  BuildingSystems.Buildings.Constructions.Windows.Window frontWindow(
    width=parameterMap.widthWin3,
    height=parameterMap.heightWin3,
    angleDegAzi=parameterMap.angleDegAziWin3,
    constructionData.UValGla=parameterMap.windowU,
    constructionData.UValFra=parameterMap.windowU,
    constructionData.g = 0.6,
    constructionData.b0 = 0.7)
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  BuildingSystems.Buildings.Constructions.Windows.Window backWindow(
    width=parameterMap.widthWin4,
    height=parameterMap.heightWin4,
    angleDegAzi=parameterMap.angleDegAziWin4,
    constructionData.UValGla=parameterMap.windowU,
    constructionData.UValFra=parameterMap.windowU,
    constructionData.g = 0.6,
    constructionData.b0 = 0.7)
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction
    outerConstruction(
    nLayers=1,
    thickness={parameterMap.thickness},
    material={
      BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral(
      lambda=parameterMap.lambdaOut,
      c=parameterMap.cOut,
      rho=parameterMap.rhoOut)})
    annotation (Placement(transformation(extent={{-78,40},{-58,60}})));
  BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction
    innerConstruction(thickness={parameterMap.thickness},
    material={
      BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral(
      lambda=parameterMap.lambdaInn,
      c=parameterMap.cInn,
      rho=parameterMap.rhoInn)})
    annotation (Placement(transformation(extent={{-52,40},{-32,60}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes baseCapacity(
    constructionData=baseConstruction,
    abs_1=0.0,
    abs_2=0.75,
    width=parameterMap.widthBasCap,
    height=parameterMap.lengthBasCap)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={70,-50})));
  BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction baseConstruction(
    thickness={parameterMap.thickness},
    material={
      BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral(
      lambda=parameterMap.lambdaBas,
      c=parameterMap.cBas,
      rho=parameterMap.rhoBas)})
    annotation (Placement(transformation(extent={{-26,40},{-6,60}})));
  replaceable parameter ParameterMap parameterMap
    annotation (choicesAllMatching=true, Placement(transformation(extent={{20,40},{40,60}})));
  equation

  connect(surfacesToAmbient.toConstructionPorts[1], outerCapacity.toSurfacePort_1)
    annotation (Line(points={{-173.9,0},{-40,0},{-40,30},{-32,30}},color={127,0,0}));
  connect(surfacesToAmbient.toConstructionPorts[2], leftWindow.toSurfacePort_1)
    annotation (Line(points={{-173.9,0},{-40,0},{-40,-50},{-32,-50}},  color={127,0,0}));
  connect(surfacesToAmbient.toConstructionPorts[3], rightWindow.toSurfacePort_1)
    annotation (Line(points={{-173.9,0},{-173.9,0},{-40,0},{-40,-64},{-18,-64},{-18,-50},{-12,-50}},color={127,0,0}));
  connect(surfacesToAmbient.toConstructionPorts[4], frontWindow.toSurfacePort_1)
    annotation (Line(points={{-173.9,0},{-173.9,0},{-40,0},{-40,-64},{2,-64},{2,
          -50},{8,-50}},color={127,0,0}));
  connect(surfacesToAmbient.toConstructionPorts[5], backWindow.toSurfacePort_1)
    annotation (Line(points={{-173.9,0},{-173.9,0},{-40,0},{-40,-64},{22,-64},{22,
          -50},{28,-50}},color={127,0,0}));
  connect(zone.toConstructionPorts[1], outerCapacity.toSurfacePort_2)
    annotation (Line(points={{-11,0.5},{-16,0.5},{-20,0.5},{-20,30},{-28,30}},
                     color={127,0,0}));
  connect(zone.toConstructionPorts[2], innerCapacity.toSurfacePort_2)
    annotation (Line(points={{-11,1.5},{-18,1.5},{-20,1.5},{-20,10},{-28,10}},
                     color={127,0,0}));
  connect(leftWindow.toSurfacePort_2, zone.toConstructionPorts[3]) annotation (
     Line(points={{-28,-50},{-22,-50},{-22,-36},{-20,-36},{-20,2.5},{-11,2.5}},
        color={0,0,0}));
  connect(rightWindow.toSurfacePort_2, zone.toConstructionPorts[4])
    annotation (Line(points={{-8,-50},{-2,-50},{-2,-36},{-20,-36},{-20,6.66667},
          {-11,6.66667},{-11,3.5}},
                                  color={0,0,0}));
  connect(frontWindow.toSurfacePort_2, zone.toConstructionPorts[5])
    annotation (Line(points={{12,-50},{18,-50},{18,-36},{-20,-36},{-20,6.66667},
          {-11,6.66667},{-11,4.5}},     color={0,0,0}));
  connect(backWindow.toSurfacePort_2, zone.toConstructionPorts[6]) annotation (
     Line(points={{32,-50},{38,-50},{38,-36},{-20,-36},{-20,5.5},{-11,5.5}},
        color={0,0,0}));
  connect(baseCapacity.toSurfacePort_2, zone.toConstructionPorts[7])
    annotation (Line(points={{70,-48},{70,-36},{-20,-36},{-20,7.33333},{-11,
          7.33333},{-11,6.5}},
                          color={0,0,0}));
  connect(baseCapacity.toSurfacePort_1, surfacesToSolids.toConstructionPorts[1])
    annotation (Line(points={{70,-52},{70,-52},{70,-80},{0,-80},{0,-112.8}},
        color={0,0,0}));
  connect(innerCapacity.toSurfacePort_1, zone.toConstructionPorts[8])
    annotation (Line(points={{-32,10},{-36,10},{-36,-4},{-20,-4},{-20,2.85714},
          {-11,2.85714},{-11,7.5}}, color={0,0,0}));
  connect(airchange[1], zone.airchange) annotation (Line(points={{180,40},{180,40},
            {60,40},{60,7},{11,7}},   color={0,0,127}));
  connect(TAirAmb, zone.TAirAmb)
    annotation (Line(points={{50,120},{50,5},{11,5}}, color={0,0,127}));
  connect(xAirAmb, zone.xAirAmb)
    annotation (Line(points={{70,120},{70,3},{11,3}}, color={0,0,127}));
  connect(T_setHeating[1], zone.T_setHeating) annotation (Line(points={{180,80},
            {180,80},{82,80},{82,20},{1,20},{1,7}},color={0,0,127}));
  connect(T_setCooling[1], zone.T_setCooling) annotation (Line(points={{180,60},
            {180,60},{82,60},{82,18},{5,18},{5,7}},color={0,0,127}));
  connect(zone.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(points={{7,7},{7,
            -22},{-80,-22},{-80,-122}},  color={0,0,127}));
    connect(zone.Q_flow_heating, Q_flow_heating[1]) annotation (Line(points={{3,
            7},{3,-20},{80,-20},{80,-122}}, color={0,0,127}));
    connect(zone.conHeatSourcesPorts, conHeatSourcesPorts) annotation (Line(
          points={{-5.1,-7.3},{-5.1,92},{-44,92},{-44,120}}, color={127,0,0}));
    connect(radHeatSourcesPorts, zone.radHeatSourcesPorts)
      annotation (Line(points={{0,120},{0,-7.3},{0.7,-7.3}}, color={127,0,0}));
  end Building;

  record ParameterMap
    "Parameter map for building information from ATES database"
    extends Modelica.Icons.Record;
    // General information
    parameter Integer id = 0
      annotation (Dialog(group = "General information"));
    parameter String name = ""
      annotation (Dialog(group = "General information"));
    // Geometry related input parameters
    parameter Modelica.SIunits.Length thickness = 1
      annotation (Dialog(group = "Geometry related input"));
    parameter Integer nFloors = 1
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Length heightBui = 1
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Volume VBui = 1
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Area ABuiGro = 1
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Area AWal1 = 1
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Area AWal2 = 1
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Area AWal3 = 1
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Area AWal4 = 1
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAziWin1 = 0
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAziWin2 = 0
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAziWin3 = 0
      annotation (Dialog(group = "Geometry related input"));
    parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAziWin4 = 0
      annotation (Dialog(group = "Geometry related input"));
    // Heat flow rate heating/cooling
    parameter Modelica.SIunits.HeatFlowRate Q_flowHea = 100000
      annotation (Dialog(group = "Heat flow rate heating/cooling"));
    parameter Modelica.SIunits.HeatFlowRate Q_flowCoo = -100000
      annotation (Dialog(group = "Heat flow rate heating/cooling"));
    // Optimization input parameters
    parameter Modelica.SIunits.Temp_K TSetHea = 273.15+20
      annotation (Dialog(group = "Optimization parameters"));
    parameter Modelica.SIunits.Temp_K TSetCoo = 273.15+24
      annotation (Dialog(group = "Optimization parameters"));
    parameter BuildingSystems.Types.AirchangeRate airchange = 0.5
      annotation (Dialog(group = "Optimization parameters"));
    parameter BuildingSystems.Types.VolumeHeatCapacity VHCOut = 1000000
      annotation (Dialog(group = "Optimization parameters"));
    parameter BuildingSystems.Types.VolumeHeatCapacity VHCInn = 1000000
      annotation (Dialog(group = "Optimization parameters"));
    parameter BuildingSystems.Types.VolumeHeatCapacity VHCBas = 1000000
      annotation (Dialog(group = "Optimization parameters"));
    parameter Modelica.SIunits.CoefficientOfHeatTransfer envelopeU = 1.2
      annotation (Dialog(group = "Optimization parameters"));
    parameter Modelica.SIunits.CoefficientOfHeatTransfer innerU = 1.2
      annotation (Dialog(group = "Optimization parameters"));
    parameter Modelica.SIunits.CoefficientOfHeatTransfer baseU = 1.2
      annotation (Dialog(group = "Optimization parameters"));
    parameter Modelica.SIunits.CoefficientOfHeatTransfer windowU = 3.0
      annotation (Dialog(group = "Optimization parameters"));
    parameter Real ratio = 0.3
      annotation (Dialog(group = "Optimization parameters"));
    // Derived from previous parameters
    parameter Modelica.SIunits.SpecificHeatCapacity cOut = sqrt(VHCOut)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Density rhoOut = sqrt(VHCOut)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.SpecificHeatCapacity cInn = sqrt(VHCInn)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Density rhoInn = sqrt(VHCInn)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.SpecificHeatCapacity cBas = sqrt(VHCBas)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Density rhoBas = sqrt(VHCBas)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.ThermalConductivity lambdaOut = envelopeU * thickness
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.ThermalConductivity lambdaInn = innerU * thickness
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.ThermalConductivity lambdaBas = baseU * thickness
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length heightWin1 = sqrt(ratio) * heightBui
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length widthWin1 = sqrt(ratio) * AWal1 / heightBui
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length heightWin2 = sqrt(ratio) * heightBui
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length widthWin2 = sqrt(ratio) * AWal2 / heightBui
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length heightWin3 = sqrt(ratio) * heightBui
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length widthWin3 = sqrt(ratio) * AWal3 / heightBui
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length heightWin4 = sqrt(ratio) * heightBui
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length widthWin4 = sqrt(ratio) * AWal4 / heightBui
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Area AHul = ratio * (AWal1 + AWal2 + AWal3 + AWal4) + ABuiGro
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length heightOutCap = sqrt(AHul)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length widthOutCap = sqrt(AHul)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length heightInnCap = lengthBasCap * sqrt(nFloors)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length widthInnCap = widthBasCap * sqrt(nFloors)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length lengthBasCap = sqrt(ABuiGro)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length widthBasCap = sqrt(ABuiGro)
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Volume VZon = VBui
      annotation (Dialog(group = "Derived model parametrization"));
    parameter Modelica.SIunits.Length heightZon = heightBui
      annotation (Dialog(group = "Derived model parametrization"));
  end ParameterMap;

  ParameterMap parameterMap1(
    nFloors = 9,
    heightBui = 22,
    VBui = 110000,
    ABuiGro = 5100,
    AWal1 = 2100,
    AWal2 = 3400,
    AWal3 = 2100,
    AWal4 = 3600,
    angleDegAziWin1 = -7,
    angleDegAziWin2 = 80,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -117,
    Q_flowHea(displayUnit = "kW") = 1300000,
    Q_flowCoo(displayUnit = "kW") = -1300000,
    TSetHea = 292.75,
    TSetCoo = 297.15,
    VHCOut = 62000,
    VHCInn = 6200,
    VHCBas = 1000000,
    envelopeU = 0.7,
    innerU = 1.2,
    baseU = 1.2,
    windowU = 4.0,
    airchange = 0.5,
    ratio = 0.28);
  ParameterMap parameterMap2(
    nFloors = 3,
    heightBui = 5,
    VBui = 1700,
    ABuiGro = 370,
    AWal1 = 130,
    AWal2 = 63,
    AWal3 = 130,
    AWal4 = 63,
    angleDegAziWin1 = 27,
    angleDegAziWin2 = 119,
    angleDegAziWin3 = -153,
    angleDegAziWin4 = -61,
    Q_flowHea(displayUnit = "kW") = 73000,
    Q_flowCoo(displayUnit = "kW") = -73000,
    TSetHea = 291.15,
    TSetCoo = 393.15,
    VHCOut = 1600000,
    VHCInn = 2400000,
    VHCBas = 1000000,
    envelopeU = 1.8,
    innerU = 1.2,
    baseU = 2.4,
    windowU = 3.5,
    airchange = 0.5,
    ratio = 0.6);
  ParameterMap parameterMap3(
    nFloors = 4,
    heightBui = 12,
    VBui = 8300,
    ABuiGro = 720,
    AWal1 = 610,
    AWal2 = 160,
    AWal3 = 610,
    AWal4 = 150,
    angleDegAziWin1 = 28,
    angleDegAziWin2 = 117,
    angleDegAziWin3 = -151,
    angleDegAziWin4 = -62,
    Q_flowHea(displayUnit = "kW") = 150000,
    Q_flowCoo(displayUnit = "kW") = -150000,
    TSetHea = 292.15,
    TSetCoo = 393.15,
    VHCOut = 160000,
    VHCInn = 50000,
    VHCBas = 1000000,
    envelopeU = 1.69,
    innerU = 1.2,
    baseU = 2.2,
    windowU = 6,
    airchange = 0.2,
    ratio = 0.19);
  ParameterMap parameterMap5(
    nFloors = 5,
    heightBui = 15,
    VBui = 10000,
    ABuiGro = 720,
    AWal1 = 370,
    AWal2 = 410,
    AWal3 = 400,
    AWal4 = 420,
    angleDegAziWin1 = 31,
    angleDegAziWin2 = 119,
    angleDegAziWin3 = -152,
    angleDegAziWin4 = -62,
    Q_flowHea(displayUnit = "kW") = 210000,
    Q_flowCoo(displayUnit = "kW") = -210000,
    TSetHea = 294.95,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 13000,
    VHCBas = 1000000,
    envelopeU = 1.6,
    innerU = 1.2,
    baseU = 0.5,
    windowU = 4.9,
    airchange = 0.36,
    ratio = 0.46);
  ParameterMap parameterMap6(
    nFloors = 7,
    heightBui = 24,
    VBui = 90000,
    ABuiGro = 3800,
    AWal1 = 2700,
    AWal2 = 1600,
    AWal3 = 3000,
    AWal4 = 1500,
    angleDegAziWin1 = 38,
    angleDegAziWin2 = 132,
    angleDegAziWin3 = -148,
    angleDegAziWin4 = -63,
    Q_flowHea(displayUnit = "kW") = 1800000,
    Q_flowCoo(displayUnit = "kW") = -1800000,
    TSetHea = 294.75,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 0.7,
    innerU = 1.2,
    baseU = 2.1,
    windowU = 3.9,
    airchange = 0.5,
    ratio = 0.4);
  ParameterMap parameterMap7(
    nFloors = 3,
    heightBui = 17,
    VBui = 89000,
    ABuiGro = 5400,
    AWal1 = 5400,
    AWal2 = 1400,
    AWal3 = 2500,
    AWal4 = 1100,
    angleDegAziWin1 = -7,
    angleDegAziWin2 = 86,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -94,
    Q_flowHea(displayUnit = "kW") = 2200000,
    Q_flowCoo(displayUnit = "kW") = -2200000,
    TSetHea = 294.35,
    TSetCoo = 297.15,
    VHCOut = 2400000,
    VHCInn = 2400000,
    VHCBas = 1000000,
    envelopeU = 2.1,
    innerU = 1.2,
    baseU = 0.54,
    windowU = 6,
    airchange = 0.9,
    ratio = 0.6);
  ParameterMap parameterMap8(
    nFloors = 5,
    heightBui = 2,
    VBui = 35000,
    ABuiGro = 3100,
    AWal1 = 440,
    AWal2 = 1200,
    AWal3 = 490,
    AWal4 = 1200,
    angleDegAziWin1 = -5,
    angleDegAziWin2 = 84,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -99,
    Q_flowHea(displayUnit = "kW") = 330000,
    Q_flowCoo(displayUnit = "kW") = -330000,
    TSetHea = 293.15,
    TSetCoo = 297.15,
    VHCOut = 2400000,
    VHCInn = 390000,
    VHCBas = 1000000,
    envelopeU = 0.5,
    innerU = 1.2,
    baseU = 1.1,
    windowU = 4.8,
    airchange = 0.3,
    ratio = 0.05);
  ParameterMap parameterMap9(
    nFloors = 5,
    heightBui = 21,
    VBui = 94000,
    ABuiGro = 4200,
    AWal1 = 3700,
    AWal2 = 710,
    AWal3 = 3100,
    AWal4 = 2200,
    angleDegAziWin1 = 29,
    angleDegAziWin2 = 84,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -92,
    Q_flowHea(displayUnit = "kW") = 1000000,
    Q_flowCoo(displayUnit = "kW") = -1000000,
    TSetHea = 293.15,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 13000,
    VHCBas = 1000000,
    envelopeU = 1,
    innerU = 1.2,
    baseU = 1.0,
    windowU = 2.5,
    airchange = 0.4,
    ratio = 0.3);
  ParameterMap parameterMap10(
    nFloors = 4,
    heightBui = 14,
    VBui = 48000,
    ABuiGro = 3300,
    AWal1 = 1500,
    AWal2 = 1700,
    AWal3 = 1500,
    AWal4 = 1700,
    angleDegAziWin1 = -7,
    angleDegAziWin2 = 84,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -96,
    Q_flowHea(displayUnit = "kW") = 580000,
    Q_flowCoo(displayUnit = "kW") = -580000,
    TSetHea = 291.65,
    TSetCoo = 297.15,
    VHCOut = 2400000,
    VHCInn = 2400000,
    VHCBas = 1000000,
    envelopeU = 0.6,
    innerU = 1.2,
    baseU = 0.6,
    windowU = 4.1,
    airchange = 0.4,
    ratio = 0.4);
  ParameterMap parameterMap11(
    nFloors = 9,
    heightBui = 29,
    VBui = 97000,
    ABuiGro = 3500,
    AWal1 = 2000,
    AWal2 = 3300,
    AWal3 = 2000,
    AWal4 = 3100,
    angleDegAziWin1 = -5,
    angleDegAziWin2 = 84,
    angleDegAziWin3 = 175,
    angleDegAziWin4 = -95,
    Q_flowHea(displayUnit = "kW") = 1300000,
    Q_flowCoo(displayUnit = "kW") = -1300000,
    TSetHea = 296.15,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 1.4,
    innerU = 1.2,
    baseU = 2.5,
    windowU = 3.4,
    airchange = 0.5,
    ratio = 0.6);
  ParameterMap parameterMap12(
    nFloors = 5,
    heightBui = 11,
    VBui = 47000,
    ABuiGro = 4200,
    AWal1 = 1600,
    AWal2 = 1500,
    AWal3 = 1400,
    AWal4 = 1700,
    angleDegAziWin1 = -6,
    angleDegAziWin2 = 107,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -96,
    Q_flowHea(displayUnit = "kW") = 750000,
    Q_flowCoo(displayUnit = "kW") = -750000,
    TSetHea = 292.05,
    TSetCoo = 297.15,
    VHCOut = 69000,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 1.2,
    innerU = 1.2,
    baseU = 0.7,
    windowU = 3.5,
    airchange = 0.4,
    ratio = 0.2);
  ParameterMap parameterMap13(
    nFloors = 7,
    heightBui = 28,
    VBui = 390000,
    ABuiGro = 14000,
    AWal1 = 8400,
    AWal2 = 3500,
    AWal3 = 8000,
    AWal4 = 3300,
    angleDegAziWin1 = 6,
    angleDegAziWin2 = 84,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -96,
    Q_flowHea(displayUnit = "kW") = 3000000,
    Q_flowCoo(displayUnit = "kW") = -3000000,
    TSetHea = 294.15,
    TSetCoo = 297.15,
    VHCOut = 2400000,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 0.5,
    innerU = 1.2,
    baseU = 2.1,
    windowU = 5.1,
    airchange = 0.5,
    ratio = 0.1);
  ParameterMap parameterMap14(
    nFloors = 9,
    heightBui = 32,
    VBui = 43000,
    ABuiGro = 1300,
    AWal1 = 890,
    AWal2 = 2000,
    AWal3 = 900,
    AWal4 = 2100,
    angleDegAziWin1 = -6,
    angleDegAziWin2 = 84,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -96,
    Q_flowHea(displayUnit = "kW") = 390000,
    Q_flowCoo(displayUnit = "kW") = -390000,
    TSetHea = 292.65,
    TSetCoo = 297.15,
    VHCOut = 50000,
    VHCInn = 100000,
    VHCBas = 1000000,
    envelopeU = 1.1,
    innerU = 1.2,
    baseU = 1.5,
    windowU = 2.8,
    airchange = 0.6,
    ratio = 0.05);
  ParameterMap parameterMap16(
    nFloors = 7,
    heightBui = 21,
    VBui = 26000,
    ABuiGro = 1300,
    AWal1 = 880,
    AWal2 = 1200,
    AWal3 = 870,
    AWal4 = 1200,
    angleDegAziWin1 = -5,
    angleDegAziWin2 = 84,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -96,
    Q_flowHea(displayUnit = "kW") = 480000,
    Q_flowCoo(displayUnit = "kW") = -480000,
    TSetHea = 296.15,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 1.8,
    innerU = 1.2,
    baseU = 2.5,
    windowU = 5.4,
    airchange = 0.6,
    ratio = 0.5);
  ParameterMap parameterMap17(
    nFloors = 3,
    heightBui = 10,
    VBui = 17000,
    ABuiGro = 1700,
    AWal1 = 700,
    AWal2 = 460,
    AWal3 = 690,
    AWal4 = 450,
    angleDegAziWin1 = -6,
    angleDegAziWin2 = 85,
    angleDegAziWin3 = -175,
    angleDegAziWin4 = -95,
    Q_flowHea(displayUnit = "kW") = 300000,
    Q_flowCoo(displayUnit = "kW") = -300000,
    TSetHea = 295.85,
    TSetCoo = 297.15,
    VHCOut = 2300000,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 0.7,
    innerU = 1.2,
    baseU = 2.2,
    windowU = 4.3,
    airchange = 0.2,
    ratio = 0.26);
  ParameterMap parameterMap21(
    nFloors = 3,
    heightBui = 10,
    VBui = 12000,
    ABuiGro = 1140,
    AWal1 = 490,
    AWal2 = 940,
    AWal3 = 470,
    AWal4 = 980,
    angleDegAziWin1 = -7,
    angleDegAziWin2 = 97,
    angleDegAziWin3 = 187,
    angleDegAziWin4 = -97,
    Q_flowHea(displayUnit = "kW") = 320000,
    Q_flowCoo(displayUnit = "kW") = -320000,
    TSetHea = 294.9,
    TSetCoo = 297.15,
    VHCOut = 2400000,
    VHCInn = 1200000,
    VHCBas = 1000000,
    envelopeU = 1,
    innerU = 1.2,
    baseU = 1.6,
    windowU = 2.5,
    airchange = 0.4,
    ratio = 0.3);
  ParameterMap parameterMap23(
    nFloors = 5,
    heightBui = 12,
    VBui = 5700,
    ABuiGro = 470,
    AWal1 = 160,
    AWal2 = 400,
    AWal3 = 160,
    AWal4 = 400,
    angleDegAziWin1 = 20,
    angleDegAziWin2 = 70,
    angleDegAziWin3 = 161,
    angleDegAziWin4 = -70,
    Q_flowHea(displayUnit = "kW") = 370000,
    Q_flowCoo(displayUnit = "kW") = -370000,
    TSetHea = 296.15,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 1.6,
    innerU = 1.2,
    baseU = 2.5,
    windowU = 4.4,
    airchange = 0.6,
    ratio = 0.4);
  ParameterMap parameterMap25(
    nFloors = 7,
    heightBui = 23,
    VBui = 130000,
    ABuiGro = 5800,
    AWal1 = 3700,
    AWal2 = 3200,
    AWal3 = 3500,
    AWal4 = 3500,
    angleDegAziWin1 = -2,
    angleDegAziWin2 = 84,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -87,
    Q_flowHea(displayUnit = "kW") = 1700000,
    Q_flowCoo(displayUnit = "kW") = -1700000,
    TSetHea = 296.05,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 1.03,
    innerU = 1.2,
    baseU = 2.45,
    windowU = 2.8,
    airchange = 0.37,
    ratio = 0.28);
  ParameterMap parameterMap27(
    nFloors = 3,
    heightBui = 14,
    VBui = 10000,
    ABuiGro = 760,
    AWal1 = 750,
    AWal2 = 310,
    AWal3 = 700,
    AWal4 = 320,
    angleDegAziWin1 = 37,
    angleDegAziWin2 = 128,
    angleDegAziWin3 = -143,
    angleDegAziWin4 = -65,
    Q_flowHea(displayUnit = "kW") = 150000,
    Q_flowCoo(displayUnit = "kW") = -150000,
    TSetHea = 293.95,
    TSetCoo = 397.15,
    VHCOut = 25000,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 0.8,
    innerU = 1.2,
    baseU = 1.9,
    windowU = 2.6,
    airchange = 0.4,
    ratio = 0.26);
  ParameterMap parameterMap29(
    nFloors = 5,
    heightBui = 16,
    VBui = 10000,
    ABuiGro = 640,
    AWal1 = 530,
    AWal2 = 380,
    AWal3 = 530,
    AWal4 = 410,
    angleDegAziWin1 = 24,
    angleDegAziWin2 = 115,
    angleDegAziWin3 = -159,
    angleDegAziWin4 = -66,
    Q_flowHea(displayUnit = "kW") = 210000,
    Q_flowCoo(displayUnit = "kW") = -210000,
    TSetHea = 294.65,
    TSetCoo = 297.15,
    VHCOut = 50000,
    VHCInn = 50000,
    VHCBas = 1000000,
    envelopeU = 1.4,
    innerU = 1.2,
    baseU = 1.8,
    windowU = 2.5,
    airchange = 0.6,
    ratio = 0.3);
  ParameterMap parameterMap30(
    nFloors = 4,
    heightBui = 23,
    VBui = 170000,
    ABuiGro = 7500,
    AWal1 = 5200,
    AWal2 = 1700,
    AWal3 = 4900,
    AWal4 = 2600,
    angleDegAziWin1 = 50,
    angleDegAziWin2 = 118,
    angleDegAziWin3 = -150,
    angleDegAziWin4 = -63,
    Q_flowHea(displayUnit = "kW") = 3000000,
    Q_flowCoo(displayUnit = "kW") = -3000000,
    TSetHea = 296.15,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 2.4,
    innerU = 1.2,
    baseU = 2.5,
    windowU = 6.0,
    airchange = 0.9,
    ratio = 0.4);
  ParameterMap parameterMap33(
    nFloors = 4,
    heightBui = 14,
    VBui = 22000,
    ABuiGro = 1700,
    AWal1 = 1300,
    AWal2 = 710,
    AWal3 = 1300,
    AWal4 = 710,
    angleDegAziWin1 = -6,
    angleDegAziWin2 = 85,
    angleDegAziWin3 = 175,
    angleDegAziWin4 = -96,
    Q_flowHea(displayUnit = "kW") = 51000,
    Q_flowCoo(displayUnit = "kW") = -51000,
    TSetHea = 290.15,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 0.5,
    innerU = 1.2,
    baseU = 0.5,
    windowU = 2.5,
    airchange = 0.2,
    ratio = 0.05);
  ParameterMap parameterMap34(
    nFloors = 5,
    heightBui = 18,
    VBui = 67000,
    ABuiGro = 3800,
    AWal1 = 1700,
    AWal2 = 2000,
    AWal3 = 1700,
    AWal4 = 2000,
    angleDegAziWin1 = -6,
    angleDegAziWin2 = 84,
    angleDegAziWin3 = 174,
    angleDegAziWin4 = -96,
    Q_flowHea(displayUnit = "kW") = 1800000,
    Q_flowCoo(displayUnit = "kW") = -1800000,
    TSetHea = 294.65,
    TSetCoo = 297.15,
    VHCOut = 50000,
    VHCInn = 25000,
    VHCBas = 1000000,
    envelopeU = 1.6,
    innerU = 1.2,
    baseU = 2.4,
    windowU = 5.4,
    airchange = 0.8,
    ratio = 0.6);
  ParameterMap parameterMap35(
    nFloors = 22,
    heightBui = 71,
    VBui = 5800,
    ABuiGro = 700,
    AWal1 = 920,
    AWal2 = 3600,
    AWal3 = 920,
    AWal4 = 3600,
    angleDegAziWin1 = -5,
    angleDegAziWin2 = 79,
    angleDegAziWin3 = 175,
    angleDegAziWin4 = -95,
    Q_flowHea(displayUnit = "kW") = 690000,
    Q_flowCoo(displayUnit = "kW") = -690000,
    TSetHea = 296.15,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 2.5,
    innerU = 1.2,
    baseU = 2.5,
    windowU = 5.4,
    airchange = 0.27,
    ratio = 0.6);
  ParameterMap parameterMap39(
    nFloors = 1,
    heightBui = 5,
    VBui = 33000,
    ABuiGro = 6980,
    AWal1 = 1700,
    AWal2 = 470,
    AWal3 = 1700,
    AWal4 = 550,
    angleDegAziWin1 = 17,
    angleDegAziWin2 = 107,
    angleDegAziWin3 = -163,
    angleDegAziWin4 = -72,
    Q_flowHea(displayUnit = "kW") = 780000,
    Q_flowCoo(displayUnit = "kW") = -780000,
    TSetHea = 293.15,
    TSetCoo = 297.15,
    VHCOut = 2400000,
    VHCInn = 260000,
    VHCBas = 1000000,
    envelopeU = 1.4,
    innerU = 1.2,
    baseU = 0.6,
    windowU = 5.3,
    airchange = 0.5,
    ratio = 0.5);
  ParameterMap parameterMap40(
    nFloors = 2,
    heightBui = 10,
    VBui = 36000,
    ABuiGro = 3600,
    AWal1 = 1200,
    AWal2 = 890,
    AWal3 = 1100,
    AWal4 = 880,
    angleDegAziWin1 = -6,
    angleDegAziWin2 = 85,
    angleDegAziWin3 = 175,
    angleDegAziWin4 = -96,
    Q_flowHea(displayUnit = "kW") = 440000,
    Q_flowCoo(displayUnit = "kW") = -440000,
    TSetHea = 291.15,
    TSetCoo = 397.15,
    VHCOut = 50000,
    VHCInn = 2000000,
    VHCBas = 1000000,
    envelopeU = 1.2,
    innerU = 1.2,
    baseU = 1.2,
    windowU = 3.0,
    airchange = 0.3,
    ratio = 0.2);
  ParameterMap parameterMap42(
    nFloors = 2,
    heightBui = 5,
    VBui = 10000,
    ABuiGro = 1900,
    AWal1 = 350,
    AWal2 = 340,
    AWal3 = 310,
    AWal4 = 340,
    angleDegAziWin1 = 16,
    angleDegAziWin2 = 107,
    angleDegAziWin3 = -163,
    angleDegAziWin4 = -72,
    Q_flowHea(displayUnit = "kW") = 580000,
    Q_flowCoo(displayUnit = "kW") = -580000,
    TSetHea = 291.525,
    TSetCoo = 297.15,
    VHCOut = 2400000,
    VHCInn = 2200000,
    VHCBas = 1000000,
    envelopeU = 2.3,
    innerU = 1.2,
    baseU = 0.5,
    windowU = 5.8,
    airchange = 1.2,
    ratio = 0.6);
  ParameterMap parameterMap43(
    nFloors = 5,
    heightBui = 18,
    VBui = 98000,
    ABuiGro = 5600,
    AWal1 = 1700,
    AWal2 = 3500,
    AWal3 = 1700,
    AWal4 = 3500,
    angleDegAziWin1 = 28,
    angleDegAziWin2 = 118,
    angleDegAziWin3 = -152,
    angleDegAziWin4 = -62,
    Q_flowHea(displayUnit = "kW") = 750000,
    Q_flowCoo(displayUnit = "kW") = -750000,
    TSetHea = 292.65,
    TSetCoo = 297.15,
    VHCOut = 2400000,
    VHCInn = 630000,
    VHCBas = 1000000,
    envelopeU = 1.0,
    innerU = 1.2,
    baseU = 1,
    windowU = 4,
    airchange = 0.2,
    ratio = 0.3);
  ParameterMap parameterMap44(
    nFloors = 4,
    heightBui = 13,
    VBui = 75000,
    ABuiGro = 5700,
    AWal1 = 680,
    AWal2 = 2300,
    AWal3 = 650,
    AWal4 = 2300,
    angleDegAziWin1 = 28,
    angleDegAziWin2 = 117,
    angleDegAziWin3 = -153,
    angleDegAziWin4 = -63,
    Q_flowHea(displayUnit = "kW") = 1100000,
    Q_flowCoo(displayUnit = "kW") = -1100000,
    TSetHea = 292.65,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 13000,
    VHCBas = 1000000,
    envelopeU = 0.7,
    innerU = 1.2,
    baseU = 1.1,
    windowU = 4.0,
    airchange = 0.5,
    ratio = 0.3);
  ParameterMap parameterMap45(
    nFloors = 3,
    heightBui = 14,
    VBui = 140000,
    ABuiGro = 10000,
    AWal1 = 4200,
    AWal2 = 3200,
    AWal3 = 5300,
    AWal4 = 3100,
    angleDegAziWin1 = 28,
    angleDegAziWin2 = 118,
    angleDegAziWin3 = -153,
    angleDegAziWin4 = -63,
    Q_flowHea(displayUnit = "kW") = 1700000,
    Q_flowCoo(displayUnit = "kW") = -1700000,
    TSetHea = 291.65,
    TSetCoo = 397.15,
    VHCOut = 2100000.0,
    VHCInn = 860000.0,
    VHCBas = 1000000,
    envelopeU = 1,
    innerU = 1.2,
    baseU = 0.5,
    windowU = 3.4,
    airchange = 0.4,
    ratio = 0.4);
  ParameterMap parameterMap46(
    nFloors = 4,
    heightBui = 16,
    VBui = 9700,
    ABuiGro = 660,
    AWal1 = 510,
    AWal2 = 670,
    AWal3 = 520,
    AWal4 = 790,
    angleDegAziWin1 = -40,
    angleDegAziWin2 = 50,
    angleDegAziWin3 = 140,
    angleDegAziWin4 = -130,
    Q_flowHea(displayUnit = "kW") = 58000,
    Q_flowCoo(displayUnit = "kW") = -58000,
    TSetHea = 291.525,
    TSetCoo = 297.15,
    VHCOut = 110000,
    VHCInn = 1700000,
    VHCBas = 1000000,
    envelopeU = 0.6,
    innerU = 1.2,
    baseU = 0.5,
    windowU = 3.6,
    airchange = 0.2,
    ratio = 0.1);
  ParameterMap parameterMap47(
    nFloors = 6,
    heightBui = 21,
    VBui = 32000,
    ABuiGro = 1600,
    AWal1 = 1700,
    AWal2 = 970,
    AWal3 = 1200,
    AWal4 = 1600,
    angleDegAziWin1 = -6,
    angleDegAziWin2 = 100,
    angleDegAziWin3 = -149,
    angleDegAziWin4 = -69,
    Q_flowHea(displayUnit = "kW") = 360000,
    Q_flowCoo(displayUnit = "kW") = -360000,
    TSetHea = 292.55627,
    TSetCoo = 297.15,
    VHCOut = 710000,
    VHCInn = 2100000,
    VHCBas = 1000000,
    envelopeU = 1,
    innerU = 1.2,
    baseU = 1,
    windowU = 4,
    airchange = 0.2,
    ratio = 0.5);
  ParameterMap parameterMap48(
    nFloors = 5,
    heightBui = 20,
    VBui = 100000,
    ABuiGro = 5100,
    AWal1 = 850,
    AWal2 = 2300,
    AWal3 = 850,
    AWal4 = 2300,
    angleDegAziWin1 = 25,
    angleDegAziWin2 = 64,
    angleDegAziWin3 = -155,
    angleDegAziWin4 = -64,
    Q_flowHea(displayUnit = "kW") = 760000,
    Q_flowCoo(displayUnit = "kW") = -760000,
    TSetHea = 296.15,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 0.6,
    innerU = 1.2,
    baseU = 2.5,
    windowU = 3.5,
    airchange = 0.4,
    ratio = 0.1);
  ParameterMap parameterMap50(
    nFloors = 4,
    heightBui = 15,
    VBui = 70000,
    ABuiGro = 4600,
    AWal1 = 1400,
    AWal2 = 1400,
    AWal3 = 2300,
    AWal4 = 1400,
    angleDegAziWin1 = 28,
    angleDegAziWin2 = 118,
    angleDegAziWin3 = -152,
    angleDegAziWin4 = -63,
    Q_flowHea(displayUnit = "kW") = 1200000,
    Q_flowCoo(displayUnit = "kW") = -1200000,
    TSetHea = 293.65,
    TSetCoo = 297.15,
    VHCOut = 2400000,
    VHCInn = 2400000,
    VHCBas = 1000000,
    envelopeU = 1.2,
    innerU = 1.2,
    baseU = 1.4,
    windowU = 6.0,
    airchange = 0.6,
    ratio = 0.3);
  ParameterMap parameterMap51(
    nFloors = 2,
    heightBui = 8,
    VBui = 34000,
    ABuiGro = 4300,
    AWal1 = 1300,
    AWal2 = 1900,
    AWal3 = 1400,
    AWal4 = 1900,
    angleDegAziWin1 = 20,
    angleDegAziWin2 = 110,
    angleDegAziWin3 = -159,
    angleDegAziWin4 = -70,
    Q_flowHea(displayUnit = "kW") = 720000,
    Q_flowCoo(displayUnit = "kW") = -720000,
    TSetHea = 296.15,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 1700000,
    VHCBas = 1000000,
    envelopeU = 0.5,
    innerU = 1.2,
    baseU = 2.5,
    windowU = 2.5,
    airchange = 0.51,
    ratio = 0.14);
  ParameterMap parameterMap52(
    nFloors = 3,
    heightBui = 9,
    VBui = 44000,
    ABuiGro = 5400,
    AWal1 = 940,
    AWal2 = 2500,
    AWal3 = 900,
    AWal4 = 2500,
    angleDegAziWin1 = 22,
    angleDegAziWin2 = 113,
    angleDegAziWin3 = -158,
    angleDegAziWin4 = -68,
    Q_flowHea(displayUnit = "kW") = 580000,
    Q_flowCoo(displayUnit = "kW") = -580000,
    TSetHea = 292.65,
    TSetCoo = 297.15,
    VHCOut = 38000,
    VHCInn = 50000,
    VHCBas = 1000000,
    envelopeU = 0.8,
    innerU = 1.2,
    baseU = 1.2,
    windowU = 3.9,
    airchange = 0.4,
    ratio = 0.2);
  ParameterMap parameterMap53(
    nFloors = 4,
    heightBui = 12,
    VBui = 47000,
    ABuiGro = 4100,
    AWal1 = 1900,
    AWal2 = 840,
    AWal3 = 2000,
    AWal4 = 980.0,
    angleDegAziWin1 = 28,
    angleDegAziWin2 = 117,
    angleDegAziWin3 = -152,
    angleDegAziWin4 = -63,
    Q_flowHea(displayUnit = "kW") = 790000,
    Q_flowCoo(displayUnit = "kW") = -790000,
    TSetHea = 293.65,
    TSetCoo = 297.15,
    VHCOut = 13000,
    VHCInn = 6300,
    VHCBas = 1000000,
    envelopeU = 1.6,
    innerU = 1.2,
    baseU = 1.6,
    windowU = 5.5,
    airchange = 0.6,
    ratio = 0.4);
  ParameterMap parameterMap54(
    nFloors = 2,
    heightBui = 8,
    VBui = 12000,
    ABuiGro = 1500,
    AWal1 = 440,
    AWal2 = 860,
    AWal3 = 420,
    AWal4 = 870,
    angleDegAziWin1 = 24,
    angleDegAziWin2 = 113,
    angleDegAziWin3 = -156,
    angleDegAziWin4 = -65,
    Q_flowHea(displayUnit = "kW") = 250000,
    Q_flowCoo(displayUnit = "kW") = -250000,
    TSetHea = 291.65,
    TSetCoo = 397.15,
    VHCOut = 2400000,
    VHCInn = 2400000,
    VHCBas = 1000000,
    envelopeU = 0.8,
    innerU = 1.2,
    baseU = 0.73,
    windowU = 5.94,
    airchange = 0.71,
    ratio = 0.3);
  ParameterMap parameterMap55(
    nFloors = 9,
    heightBui = 30,
    VBui = 56000,
    ABuiGro = 1900,
    AWal1 = 2500,
    AWal2 = 1000,
    AWal3 = 2500,
    AWal4 = 1000,
    angleDegAziWin1 = -6,
    angleDegAziWin2 = 85,
    angleDegAziWin3 = 175,
    angleDegAziWin4 = -95,
    Q_flowHea(displayUnit = "kW") = 290000,
    Q_flowCoo(displayUnit = "kW") = -290000,
    TSetHea = 290.15,
    TSetCoo = 297.15,
    VHCOut = 6300,
    VHCInn = 490000,
    VHCBas = 1000000,
    envelopeU = 0.5,
    innerU = 1.2,
    baseU = 0.85,
    windowU = 2.5,
    airchange = 0.2,
    ratio = 0.05);

  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=190,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataTRYGermany.Germany_Potsdam_TRYnormal_NetCDF)
    annotation (Placement(transformation(extent={{162,194},{262,294}})));
  Building building1(nZones=1, parameterMap = parameterMap1)
    annotation (Placement(transformation(extent={{-182,30},{-162,50}})));
  Building building2(nZones=1, parameterMap = parameterMap2)
    annotation (Placement(transformation(extent={{-156,-162},{-136,-142}})));
  Building building3(nZones=1, parameterMap = parameterMap3)
    annotation (Placement(transformation(extent={{-142,-142},{-122,-122}})));
  Building building5(nZones=1, parameterMap = parameterMap5)
    annotation (Placement(transformation(extent={{-102,88},{-82,108}})));
  Building building6(nZones=1, parameterMap = parameterMap6)
    annotation (Placement(transformation(extent={{-204,-122},{-184,-102}})));
  Building building7(nZones=1, parameterMap = parameterMap7)
    annotation (Placement(transformation(extent={{104,-86},{124,-66}})));
  Building building8(nZones=1, parameterMap = parameterMap8)
    annotation (Placement(transformation(extent={{-60,116},{-40,136}})));
  Building building9(nZones=1, parameterMap = parameterMap9)
    annotation (Placement(transformation(extent={{-138,-96},{-118,-76}})));
  Building building10(nZones=1, parameterMap = parameterMap10)
    annotation (Placement(transformation(extent={{-16,58},{4,78}})));
  Building building11(nZones=1, parameterMap = parameterMap11)
    annotation (Placement(transformation(extent={{-24,128},{-4,148}})));
  Building building12(nZones=1, parameterMap = parameterMap12)
    annotation (Placement(transformation(extent={{-182,122},{-162,142}})));
  Building building13(nZones=1, parameterMap = parameterMap13)
    annotation (Placement(transformation(extent={{-14,-104},{6,-84}})));
  Building building14(nZones=1, parameterMap = parameterMap14)
    annotation (Placement(transformation(extent={{-72,74},{-52,94}})));
  Building building16(nZones=1, parameterMap = parameterMap16)
    annotation (Placement(transformation(extent={{-64,178},{-44,198}})));
  Building building17(nZones=1, parameterMap = parameterMap17)
    annotation (Placement(transformation(extent={{-166,78},{-146,98}})));
  Building building21(nZones=1, parameterMap = parameterMap21)
    annotation (Placement(transformation(extent={{-142,188},{-122,208}})));
  Building building23(nZones=1, parameterMap = parameterMap23)
    annotation (Placement(transformation(extent={{280,-152},{300,-132}})));
  Building building25(nZones=1, parameterMap = parameterMap25)
    annotation (Placement(transformation(extent={{-62,34},{-42,54}})));
  Building building27(nZones=1, parameterMap = parameterMap27)
    annotation (Placement(transformation(extent={{46,58},{66,78}})));
  Building building29(nZones=1, parameterMap = parameterMap29)
    annotation (Placement(transformation(extent={{98,-134},{118,-114}})));
  Building building30(nZones=1, parameterMap = parameterMap30)
    annotation (Placement(transformation(extent={{-120,-216},{-100,-196}})));
  Building building33(nZones=1, parameterMap = parameterMap33)
    annotation (Placement(transformation(extent={{-86,208},{-66,228}})));
  Building building34(nZones=1, parameterMap = parameterMap34)
    annotation (Placement(transformation(extent={{18,20},{38,40}})));
  Building building35(nZones=1, parameterMap = parameterMap35)
    annotation (Placement(transformation(extent={{-346,-36},{-326,-16}})));
  Building building39(nZones=1, parameterMap = parameterMap39)
    annotation (Placement(transformation(extent={{288,-80},{308,-60}})));
  Building building40(nZones=1, parameterMap = parameterMap40)
    annotation (Placement(transformation(extent={{-130,16},{-110,36}})));
  Building building43(nZones=1, parameterMap = parameterMap43)
    annotation (Placement(transformation(extent={{-240,292},{-220,312}})));
  Building building44(nZones=1, parameterMap = parameterMap44)
    annotation (Placement(transformation(extent={{54,-314},{74,-294}})));
  Building building45(nZones=1, parameterMap = parameterMap45)
    annotation (Placement(transformation(extent={{-12,-310},{8,-290}})));
  Building building46(nZones=1, parameterMap = parameterMap46)
    annotation (Placement(transformation(extent={{-186,-164},{-166,-144}})));
  Building building47(nZones=1, parameterMap = parameterMap47)
    annotation (Placement(transformation(extent={{78,28},{98,48}})));
  Building building48(nZones=1, parameterMap = parameterMap48)
    annotation (Placement(transformation(extent={{158,-230},{178,-210}})));
  Building building50(nZones=1, parameterMap = parameterMap50)
    annotation (Placement(transformation(extent={{-116,-170},{-96,-150}})));
  Building building51(nZones=1, parameterMap = parameterMap51)
    annotation (Placement(transformation(extent={{236,-140},{256,-120}})));
  Building building52(nZones=1, parameterMap = parameterMap52)
    annotation (Placement(transformation(extent={{128,-160},{148,-140}})));
  Building building53(nZones=1, parameterMap = parameterMap53)
    annotation (Placement(transformation(extent={{58,-210},{78,-190}})));
  Building building54(nZones=1, parameterMap = parameterMap54)
    annotation (Placement(transformation(extent={{82,-174},{102,-154}})));
  Building building55(nZones=1, parameterMap = parameterMap55)
    annotation (Placement(transformation(extent={{-286,84},{-266,104}})));
  Modelica.Blocks.Sources.Constant set_airchange(
    k=building43.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-200,292},{-208,300}})));
  Modelica.Blocks.Sources.Constant t_set_cooling(
    k=building43.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-200,304},{-208,312}})));
  Modelica.Blocks.Sources.Constant t_set_heating(
    k=building43.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-200,316},{-208,324}})));
  Modelica.Blocks.Sources.Constant set_airchange1(
    k=building33.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-46,208},{-54,216}})));
  Modelica.Blocks.Sources.Constant t_set_cooling1(
    k=building33.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-46,220},{-54,228}})));
  Modelica.Blocks.Sources.Constant t_set_heating1(
    k=building33.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-46,232},{-54,240}})));
  Modelica.Blocks.Sources.Constant t_set_cooling2(
    k=building21.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-102,200},{-110,208}})));
  Modelica.Blocks.Sources.Constant t_set_heating2(
    k=building21.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-102,212},{-110,220}})));
  Modelica.Blocks.Sources.Constant set_airchange2(
    k=building21.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-102,188},{-110,196}})));
  Modelica.Blocks.Sources.Constant t_set_cooling3(
    k=building16.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-24,190},{-32,198}})));
  Modelica.Blocks.Sources.Constant t_set_heating3(
    k=building16.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-24,202},{-32,210}})));
  Modelica.Blocks.Sources.Constant set_airchange3
    (k=building16.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-24,178},{-32,186}})));
  Modelica.Blocks.Sources.Constant t_set_cooling4(
    k=building11.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{16,140},{8,148}})));
  Modelica.Blocks.Sources.Constant t_set_heating4(
    k=building11.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{16,152},{8,160}})));
  Modelica.Blocks.Sources.Constant set_airchange4(
    k=building11.parameterMap.airchange)
    annotation (Placement(transformation(extent={{16,128},{8,136}})));
  Modelica.Blocks.Sources.Constant t_set_cooling5(
    k=building12.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-144,134},{-152,142}})));
  Modelica.Blocks.Sources.Constant t_set_heating5(
    k=building12.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-144,146},{-152,154}})));
  Modelica.Blocks.Sources.Constant set_airchange5(
    k=building12.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-144,122},{-152,130}})));
  Modelica.Blocks.Sources.Constant t_set_cooling6(
    k=building55.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-246,96},{-254,104}})));
  Modelica.Blocks.Sources.Constant t_set_heating6(
    k=building55.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-246,108},{-254,116}})));
  Modelica.Blocks.Sources.Constant set_airchange6(
    k=building55.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-246,84},{-254,92}})));
  Modelica.Blocks.Sources.Constant t_set_cooling7(
    k=building35.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-306,-24},{-314,-16}})));
  Modelica.Blocks.Sources.Constant t_set_heating7(
    k=building35.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-306,-12},{-314,-4}})));
  Modelica.Blocks.Sources.Constant set_airchange7(
    k=building35.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-306,-36},{-314,-28}})));
  Modelica.Blocks.Sources.Constant t_set_cooling8(
    k=building27.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{86,70},{78,78}})));
  Modelica.Blocks.Sources.Constant t_set_heating8(
    k=building27.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{86,82},{78,90}})));
  Modelica.Blocks.Sources.Constant set_airchange8(
    k=building27.parameterMap.airchange)
    annotation (Placement(transformation(extent={{86,58},{78,66}})));
  Modelica.Blocks.Sources.Constant t_set_cooling9(
    k=building47.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{118,40},{110,48}})));
  Modelica.Blocks.Sources.Constant t_set_heating9(
    k=building47.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{118,52},{110,60}})));
  Modelica.Blocks.Sources.Constant set_airchange9(
    k=building47.parameterMap.airchange)
    annotation (Placement(transformation(extent={{118,28},{110,36}})));
  Modelica.Blocks.Sources.Constant t_set_cooling10(
    k=building34.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{58,32},{50,40}})));
  Modelica.Blocks.Sources.Constant t_set_heating10(
    k=building34.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{58,44},{50,52}})));
  Modelica.Blocks.Sources.Constant set_airchange10(
    k=building34.parameterMap.airchange)
    annotation (Placement(transformation(extent={{58,20},{50,28}})));
  Modelica.Blocks.Sources.Constant t_set_cooling11(
    k=building10.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{24,70},{16,78}})));
  Modelica.Blocks.Sources.Constant t_set_heating11(
    k=building10.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{24,82},{16,90}})));
  Modelica.Blocks.Sources.Constant set_airchange11(
    k=building10.parameterMap.airchange)
    annotation (Placement(transformation(extent={{24,58},{16,66}})));
  Modelica.Blocks.Sources.Constant t_set_cooling12(
    k=building14.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-32,86},{-40,94}})));
  Modelica.Blocks.Sources.Constant t_set_heating12(
    k=building14.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-32,98},{-40,106}})));
  Modelica.Blocks.Sources.Constant set_airchange12(
    k=building14.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-32,74},{-40,82}})));
  Modelica.Blocks.Sources.Constant t_set_cooling13(
    k=building17.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-126,90},{-134,98}})));
  Modelica.Blocks.Sources.Constant t_set_heating13(
    k=building17.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-126,102},{-134,110}})));
  Modelica.Blocks.Sources.Constant set_airchange13(
    k=building17.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-126,78},{-134,86}})));
  Modelica.Blocks.Sources.Constant t_set_cooling14(
    k=building39.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{328,-68},{320,-60}})));
  Modelica.Blocks.Sources.Constant t_set_heating14(
    k=building39.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{328,-56},{320,-48}})));
  Modelica.Blocks.Sources.Constant set_airchange14(
    k=building39.parameterMap.airchange)
    annotation (Placement(transformation(extent={{328,-80},{320,-72}})));
  Modelica.Blocks.Sources.Constant t_set_cooling15(
    k=building51.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{276,-128},{268,-120}})));
  Modelica.Blocks.Sources.Constant t_set_heating15(
    k=building51.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{276,-116},{268,-108}})));
  Modelica.Blocks.Sources.Constant set_airchange15(
    k=building51.parameterMap.airchange)
    annotation (Placement(transformation(extent={{276,-140},{268,-132}})));
  Modelica.Blocks.Sources.Constant t_set_cooling16(
    k=building23.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{320,-140},{312,-132}})));
  Modelica.Blocks.Sources.Constant t_set_heating16(
    k=building23.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{320,-128},{312,-120}})));
  Modelica.Blocks.Sources.Constant set_airchange16(
    k=building23.parameterMap.airchange)
    annotation (Placement(transformation(extent={{320,-152},{312,-144}})));
  Modelica.Blocks.Sources.Constant t_set_cooling17(
    k=building8.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-26,132},{-34,140}})));
  Modelica.Blocks.Sources.Constant t_set_heating17(
    k=building8.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-26,144},{-34,152}})));
  Modelica.Blocks.Sources.Constant set_airchange17(
    k=building8.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-26,120},{-34,128}})));
  Modelica.Blocks.Sources.Constant t_set_cooling18(
    k=building5.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-70,106},{-78,114}})));
  Modelica.Blocks.Sources.Constant t_set_heating18(
    k=building5.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-70,118},{-78,126}})));
  Modelica.Blocks.Sources.Constant set_airchange18(
    k=building5.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-70,94},{-78,102}})));
  Modelica.Blocks.Sources.Constant t_set_cooling19(
    k=building25.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-22,46},{-30,54}})));
  Modelica.Blocks.Sources.Constant t_set_heating19(
    k=building25.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-22,58},{-30,66}})));
  Modelica.Blocks.Sources.Constant set_airchange19(
    k=building25.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-22,34},{-30,42}})));
  Modelica.Blocks.Sources.Constant t_set_cooling20(
    k=building40.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-90,28},{-98,36}})));
  Modelica.Blocks.Sources.Constant t_set_heating20(
    k=building40.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-90,40},{-98,48}})));
  Modelica.Blocks.Sources.Constant set_airchange20(
    k=building40.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-90,16},{-98,24}})));
  Modelica.Blocks.Sources.Constant t_set_cooling21(
    k=building1.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-142,42},{-150,50}})));
  Modelica.Blocks.Sources.Constant t_set_heating21(
    k=building1.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-142,54},{-150,62}})));
  Modelica.Blocks.Sources.Constant set_airchange21(
    k=building1.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-142,30},{-150,38}})));
  Modelica.Blocks.Sources.Constant t_set_cooling22(
    k=building9.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-98,-84},{-106,-76}})));
  Modelica.Blocks.Sources.Constant t_set_heating22(
    k=building9.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-98,-72},{-106,-64}})));
  Modelica.Blocks.Sources.Constant set_airchange22(
    k=building9.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-98,-96},{-106,-88}})));
  Modelica.Blocks.Sources.Constant t_set_cooling23(
    k=building13.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{26,-92},{18,-84}})));
  Modelica.Blocks.Sources.Constant t_set_heating23(
    k=building13.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{26,-80},{18,-72}})));
  Modelica.Blocks.Sources.Constant set_airchange23(
    k=building13.parameterMap.airchange)
    annotation (Placement(transformation(extent={{26,-104},{18,-96}})));
  Modelica.Blocks.Sources.Constant t_set_cooling24(
    k=building6.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-160,-110},{-168,-102}})));
  Modelica.Blocks.Sources.Constant t_set_heating24(
    k=building6.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-160,-98},{-168,-90}})));
  Modelica.Blocks.Sources.Constant set_airchange24(
    k=building6.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-160,-122},{-168,-114}})));
  Modelica.Blocks.Sources.Constant t_set_cooling25(
    k=building46.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-156,-148},{-164,-140}})));
  Modelica.Blocks.Sources.Constant t_set_heating25(
    k=building46.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-156,-136},{-164,-128}})));
  Modelica.Blocks.Sources.Constant set_airchange25(
    k=building46.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-156,-160},{-164,-152}})));
  Modelica.Blocks.Sources.Constant t_set_cooling26(
    k=building3.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-102,-130},{-110,-122}})));
  Modelica.Blocks.Sources.Constant t_set_heating26(
    k=building3.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-102,-118},{-110,-110}})));
  Modelica.Blocks.Sources.Constant set_airchange26(
    k=building3.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-102,-142},{-110,-134}})));
  Modelica.Blocks.Sources.Constant t_set_cooling27(
    k=building50.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-76,-160},{-84,-152}})));
  Modelica.Blocks.Sources.Constant t_set_heating27(
    k=building50.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-76,-148},{-84,-140}})));
  Modelica.Blocks.Sources.Constant set_airchange27(
    k=building50.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-76,-172},{-84,-164}})));
  Modelica.Blocks.Sources.Constant t_set_cooling28(
    k=building2.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-118,-168},{-126,-160}})));
  Modelica.Blocks.Sources.Constant t_set_heating28(
    k=building2.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-118,-156},{-126,-148}})));
  Modelica.Blocks.Sources.Constant set_airchange28(
    k=building2.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-118,-180},{-126,-172}})));
  Modelica.Blocks.Sources.Constant t_set_cooling29(
    k=building30.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{-80,-204},{-88,-196}})));
  Modelica.Blocks.Sources.Constant t_set_heating29(
    k=building30.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{-80,-192},{-88,-184}})));
  Modelica.Blocks.Sources.Constant set_airchange29(
    k=building30.parameterMap.airchange)
    annotation (Placement(transformation(extent={{-80,-216},{-88,-208}})));
  Modelica.Blocks.Sources.Constant t_set_cooling30(
    k=building7.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{144,-74},{136,-66}})));
  Modelica.Blocks.Sources.Constant t_set_heating30(
    k=building7.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{144,-62},{136,-54}})));
  Modelica.Blocks.Sources.Constant set_airchange30(
    k=building7.parameterMap.airchange)
    annotation (Placement(transformation(extent={{144,-86},{136,-78}})));
  Modelica.Blocks.Sources.Constant t_set_cooling31(
    k=building29.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{138,-122},{130,-114}})));
  Modelica.Blocks.Sources.Constant t_set_heating31(
    k=building29.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{138,-110},{130,-102}})));
  Modelica.Blocks.Sources.Constant set_airchange31(
    k=building29.parameterMap.airchange)
    annotation (Placement(transformation(extent={{138,-134},{130,-126}})));
  Modelica.Blocks.Sources.Constant t_set_cooling32(
    k=building52.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{168,-148},{160,-140}})));
  Modelica.Blocks.Sources.Constant t_set_heating32(
    k=building52.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{168,-136},{160,-128}})));
  Modelica.Blocks.Sources.Constant set_airchange32(
    k=building52.parameterMap.airchange)
    annotation (Placement(transformation(extent={{168,-160},{160,-152}})));
  Modelica.Blocks.Sources.Constant t_set_cooling33(
    k=building54.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{122,-162},{114,-154}})));
  Modelica.Blocks.Sources.Constant t_set_heating33(
    k=building54.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{122,-150},{114,-142}})));
  Modelica.Blocks.Sources.Constant set_airchange33(
    k=building54.parameterMap.airchange)
    annotation (Placement(transformation(extent={{122,-174},{114,-166}})));
  Modelica.Blocks.Sources.Constant t_set_cooling34(
    k=building53.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{98,-198},{90,-190}})));
  Modelica.Blocks.Sources.Constant t_set_heating34(
    k=building53.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{98,-186},{90,-178}})));
  Modelica.Blocks.Sources.Constant set_airchange34(
    k=building53.parameterMap.airchange)
    annotation (Placement(transformation(extent={{98,-210},{90,-202}})));
  Modelica.Blocks.Sources.Constant t_set_cooling35(
    k=building48.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{198,-218},{190,-210}})));
  Modelica.Blocks.Sources.Constant t_set_heating35(
    k=building48.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{198,-206},{190,-198}})));
  Modelica.Blocks.Sources.Constant set_airchange35(
    k=building48.parameterMap.airchange)
    annotation (Placement(transformation(extent={{198,-230},{190,-222}})));
  Modelica.Blocks.Sources.Constant t_set_cooling36(
    k=building45.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{28,-298},{20,-290}})));
  Modelica.Blocks.Sources.Constant t_set_heating36(
    k=building45.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{28,-286},{20,-278}})));
  Modelica.Blocks.Sources.Constant set_airchange36(
    k=building45.parameterMap.airchange)
    annotation (Placement(transformation(extent={{28,-310},{20,-302}})));
  Modelica.Blocks.Sources.Constant t_set_cooling37(
    k=building44.parameterMap.TSetCoo)
    annotation (Placement(transformation(extent={{94,-302},{86,-294}})));
  Modelica.Blocks.Sources.Constant t_set_heating37(
    k=building44.parameterMap.TSetHea)
    annotation (Placement(transformation(extent={{94,-290},{86,-282}})));
  Modelica.Blocks.Sources.Constant set_airchange37(
    k=building44.parameterMap.airchange)
    annotation (Placement(transformation(extent={{94,-314},{86,-306}})));
  Modelica.SIunits.HeatFlowRate Q_flowHea;
  Modelica.SIunits.HeatFlowRate Q_flowCoo;
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding45(T=283.15)
    annotation (Placement(transformation(extent={{-10,-320},{-2,-312}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding44(T=283.15)
    annotation (Placement(transformation(extent={{56,-324},{64,-316}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding23(T=283.15)
    annotation (Placement(transformation(extent={{282,-162},{290,-154}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding51(T=283.15)
    annotation (Placement(transformation(extent={{238,-150},{246,-142}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding39(T=283.15)
    annotation (Placement(transformation(extent={{290,-90},{298,-82}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding13(T=283.15)
    annotation (Placement(transformation(extent={{-12,-114},{-4,-106}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding7(T=283.15)
    annotation (Placement(transformation(extent={{106,-96},{114,-88}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding29(T=283.15)
    annotation (Placement(transformation(extent={{100,-144},{108,-136}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding52(T=283.15)
    annotation (Placement(transformation(extent={{130,-170},{138,-162}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding54(T=283.15)
    annotation (Placement(transformation(extent={{68,-184},{76,-176}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding53(T=283.15)
    annotation (Placement(transformation(extent={{60,-220},{68,-212}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding9(T=283.15)
    annotation (Placement(transformation(extent={{-136,-106},{-128,-98}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding6(T=283.15)
    annotation (Placement(transformation(extent={{-202,-132},{-194,-124}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding2(T=283.15)
    annotation (Placement(transformation(extent={{-154,-172},{-146,-164}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding46(T=283.15)
    annotation (Placement(transformation(extent={{-184,-174},{-176,-166}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding50(T=283.15)
    annotation (Placement(transformation(extent={{-114,-180},{-106,-172}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding30(T=283.15)
    annotation (Placement(transformation(extent={{-118,-226},{-110,-218}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding3(T=283.15)
    annotation (Placement(transformation(extent={{-142,-174},{-134,-166}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding35(T=283.15)
    annotation (Placement(transformation(extent={{-344,-46},{-336,-38}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding55(T=283.15)
    annotation (Placement(transformation(extent={{-284,74},{-276,82}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding43(T=283.15)
    annotation (Placement(transformation(extent={{-238,282},{-230,290}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding21(T=283.15)
    annotation (Placement(transformation(extent={{-140,178},{-132,186}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding33(T=283.15)
    annotation (Placement(transformation(extent={{-84,198},{-76,206}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding16(T=283.15)
    annotation (Placement(transformation(extent={{-62,168},{-54,176}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding12(T=283.15)
    annotation (Placement(transformation(extent={{-180,112},{-172,120}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding8(T=283.15)
    annotation (Placement(transformation(extent={{-58,106},{-50,114}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding11(T=283.15)
    annotation (Placement(transformation(extent={{-22,118},{-14,126}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding17(T=283.15)
    annotation (Placement(transformation(extent={{-164,68},{-156,76}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding5(T=283.15)
    annotation (Placement(transformation(extent={{-100,78},{-92,86}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding14(T=283.15)
    annotation (Placement(transformation(extent={{-70,64},{-62,72}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding1(T=283.15)
    annotation (Placement(transformation(extent={{-180,20},{-172,28}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding40(T=283.15)
    annotation (Placement(transformation(extent={{-128,6},{-120,14}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding25(T=283.15)
    annotation (Placement(transformation(extent={{-60,24},{-52,32}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding10(T=283.15)
    annotation (Placement(transformation(extent={{-14,48},{-6,56}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding34(T=283.15)
    annotation (Placement(transformation(extent={{20,10},{28,18}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding27(T=283.15)
    annotation (Placement(transformation(extent={{34,48},{42,56}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature groundBuilding47(T=283.15)
    annotation (Placement(transformation(extent={{80,18},{88,26}})));
equation

  der(Q_district) = Q_flowHea;

  Q_flowHea = building1.Q_flow_heating[1] + building2.Q_flow_heating[1] + building3.Q_flow_heating[1] + building5.Q_flow_heating[1] + building6.Q_flow_heating[1] + building7.Q_flow_heating[1] + building8.Q_flow_heating[1] + building9.Q_flow_heating[1] + building10.Q_flow_heating[1] + building11.Q_flow_heating[1] + building12.Q_flow_heating[1] + building13.Q_flow_heating[1] +
              building14.Q_flow_heating[1] + building16.Q_flow_heating[1] + building17.Q_flow_heating[1] + building21.Q_flow_heating[1] + building23.Q_flow_heating[1] + building25.Q_flow_heating[1] + building27.Q_flow_heating[1] + building29.Q_flow_heating[1] + building30.Q_flow_heating[1] + building33.Q_flow_heating[1] + building34.Q_flow_heating[1] + building35.Q_flow_heating[1] + building39.Q_flow_heating[1] +
              building40.Q_flow_heating[1] + building43.Q_flow_heating[1] + building44.Q_flow_heating[1] + building45.Q_flow_heating[1] + building46.Q_flow_heating[1] + building47.Q_flow_heating[1] + building48.Q_flow_heating[1] + building50.Q_flow_heating[1] + building51.Q_flow_heating[1] + building52.Q_flow_heating[1] +
              building53.Q_flow_heating[1] + building54.Q_flow_heating[1] + building55.Q_flow_heating[1];
  Q_flowCoo = building1.Q_flow_cooling[1] + building2.Q_flow_cooling[1] + building3.Q_flow_cooling[1] + building5.Q_flow_cooling[1] + building6.Q_flow_cooling[1] + building7.Q_flow_cooling[1] + building8.Q_flow_cooling[1] + building9.Q_flow_cooling[1] + building10.Q_flow_cooling[1] + building11.Q_flow_cooling[1] + building12.Q_flow_cooling[1] + building13.Q_flow_cooling[1] +
              building14.Q_flow_cooling[1] + building16.Q_flow_cooling[1] + building17.Q_flow_cooling[1] + building21.Q_flow_cooling[1] + building23.Q_flow_cooling[1] + building25.Q_flow_cooling[1] + building27.Q_flow_cooling[1] + building29.Q_flow_cooling[1] + building30.Q_flow_cooling[1] + building33.Q_flow_cooling[1] + building34.Q_flow_cooling[1] + building35.Q_flow_cooling[1] + building39.Q_flow_cooling[1] +
              building40.Q_flow_cooling[1] + building43.Q_flow_cooling[1] + building44.Q_flow_cooling[1] + building45.Q_flow_cooling[1] + building46.Q_flow_cooling[1] + building47.Q_flow_cooling[1] + building48.Q_flow_cooling[1] + building50.Q_flow_cooling[1] + building51.Q_flow_cooling[1] + building52.Q_flow_cooling[1] +
              building53.Q_flow_cooling[1] + building54.Q_flow_cooling[1] + building55.Q_flow_cooling[1];

  connect(ambient.toSurfacePorts[1:5], building1.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[6:10], building2.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[11:15], building3.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[16:20], building5.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[186:190], building6.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[21:25], building7.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[26:30], building8.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[31:35], building9.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[36:40], building10.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[41:45], building11.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[46:50], building12.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[51:55], building13.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[56:60], building14.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[61:65], building16.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[66:70], building17.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[71:75], building21.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[76:80], building23.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[81:85], building25.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[86:90], building27.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[91:95], building29.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[96:100], building30.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[101:105], building33.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[106:110], building34.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[111:115], building35.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[116:120], building39.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[121:125], building40.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[126:130], building43.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[131:135], building44.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[136:140], building45.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[141:145], building46.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[146:150], building47.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[151:155], building48.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[156:160], building50.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[161:165], building51.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[166:170], building52.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[171:175], building53.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[176:180], building54.toAmbientSurfacesPorts);
  connect(ambient.toSurfacePorts[181:185], building55.toAmbientSurfacesPorts);

  connect(ambient.toAirPorts[1:5], building1.toAmbientAirPorts);
  connect(ambient.toAirPorts[6:10], building2.toAmbientAirPorts);
  connect(ambient.toAirPorts[11:15], building3.toAmbientAirPorts);
  connect(ambient.toAirPorts[16:20], building5.toAmbientAirPorts);
  connect(ambient.toAirPorts[186:190], building6.toAmbientAirPorts);
  connect(ambient.toAirPorts[21:25], building7.toAmbientAirPorts);
  connect(ambient.toAirPorts[26:30], building8.toAmbientAirPorts);
  connect(ambient.toAirPorts[31:35], building9.toAmbientAirPorts);
  connect(ambient.toAirPorts[36:40], building10.toAmbientAirPorts);
  connect(ambient.toAirPorts[41:45], building11.toAmbientAirPorts);
  connect(ambient.toAirPorts[46:50], building12.toAmbientAirPorts);
  connect(ambient.toAirPorts[51:55], building13.toAmbientAirPorts);
  connect(ambient.toAirPorts[56:60], building14.toAmbientAirPorts);
  connect(ambient.toAirPorts[61:65], building16.toAmbientAirPorts);
  connect(ambient.toAirPorts[66:70], building17.toAmbientAirPorts);
  connect(ambient.toAirPorts[71:75], building21.toAmbientAirPorts);
  connect(ambient.toAirPorts[76:80], building23.toAmbientAirPorts);
  connect(ambient.toAirPorts[81:85], building25.toAmbientAirPorts);
  connect(ambient.toAirPorts[86:90], building27.toAmbientAirPorts);
  connect(ambient.toAirPorts[91:95], building29.toAmbientAirPorts);
  connect(ambient.toAirPorts[96:100], building30.toAmbientAirPorts);
  connect(ambient.toAirPorts[101:105], building33.toAmbientAirPorts);
  connect(ambient.toAirPorts[106:110], building34.toAmbientAirPorts);
  connect(ambient.toAirPorts[111:115], building35.toAmbientAirPorts);
  connect(ambient.toAirPorts[116:120], building39.toAmbientAirPorts);
  connect(ambient.toAirPorts[121:125], building40.toAmbientAirPorts);
  connect(ambient.toAirPorts[126:130], building43.toAmbientAirPorts);
  connect(ambient.toAirPorts[131:135], building44.toAmbientAirPorts);
  connect(ambient.toAirPorts[136:140], building45.toAmbientAirPorts);
  connect(ambient.toAirPorts[141:145], building46.toAmbientAirPorts);
  connect(ambient.toAirPorts[146:150], building47.toAmbientAirPorts);
  connect(ambient.toAirPorts[151:155], building48.toAmbientAirPorts);
  connect(ambient.toAirPorts[156:160], building50.toAmbientAirPorts);
  connect(ambient.toAirPorts[161:165], building51.toAmbientAirPorts);
  connect(ambient.toAirPorts[166:170], building52.toAmbientAirPorts);
  connect(ambient.toAirPorts[171:175], building53.toAmbientAirPorts);
  connect(ambient.toAirPorts[176:180], building54.toAmbientAirPorts);
  connect(ambient.toAirPorts[181:185], building55.toAmbientAirPorts);

  connect(ambient.TAirRef, building1.TAirAmb);
  connect(ambient.TAirRef, building2.TAirAmb);
  connect(ambient.TAirRef, building3.TAirAmb);
  connect(ambient.TAirRef, building5.TAirAmb);
  connect(ambient.TAirRef, building6.TAirAmb);
  connect(ambient.TAirRef, building7.TAirAmb);
  connect(ambient.TAirRef, building8.TAirAmb);
  connect(ambient.TAirRef, building9.TAirAmb);
  connect(ambient.TAirRef, building10.TAirAmb);
  connect(ambient.TAirRef, building11.TAirAmb);
  connect(ambient.TAirRef, building12.TAirAmb);
  connect(ambient.TAirRef, building13.TAirAmb);
  connect(ambient.TAirRef, building14.TAirAmb);
  connect(ambient.TAirRef, building16.TAirAmb);
  connect(ambient.TAirRef, building17.TAirAmb);
  connect(ambient.TAirRef, building21.TAirAmb);
  connect(ambient.TAirRef, building23.TAirAmb);
  connect(ambient.TAirRef, building25.TAirAmb);
  connect(ambient.TAirRef, building27.TAirAmb);
  connect(ambient.TAirRef, building29.TAirAmb);
  connect(ambient.TAirRef, building30.TAirAmb);
  connect(ambient.TAirRef, building33.TAirAmb);
  connect(ambient.TAirRef, building34.TAirAmb);
  connect(ambient.TAirRef, building35.TAirAmb);
  connect(ambient.TAirRef, building39.TAirAmb);
  connect(ambient.TAirRef, building40.TAirAmb);
  connect(ambient.TAirRef, building43.TAirAmb);
  connect(ambient.TAirRef, building44.TAirAmb);
  connect(ambient.TAirRef, building45.TAirAmb);
  connect(ambient.TAirRef, building46.TAirAmb);
  connect(ambient.TAirRef, building47.TAirAmb);
  connect(ambient.TAirRef, building48.TAirAmb);
  connect(ambient.TAirRef, building50.TAirAmb);
  connect(ambient.TAirRef, building51.TAirAmb);
  connect(ambient.TAirRef, building52.TAirAmb);
  connect(ambient.TAirRef, building53.TAirAmb);
  connect(ambient.TAirRef, building54.TAirAmb);
  connect(ambient.TAirRef, building55.TAirAmb);

  connect(ambient.xAir, building1.xAirAmb);
  connect(ambient.xAir, building2.xAirAmb);
  connect(ambient.xAir, building3.xAirAmb);
  connect(ambient.xAir, building5.xAirAmb);
  connect(ambient.xAir, building6.xAirAmb);
  connect(ambient.xAir, building7.xAirAmb);
  connect(ambient.xAir, building8.xAirAmb);
  connect(ambient.xAir, building9.xAirAmb);
  connect(ambient.xAir, building10.xAirAmb);
  connect(ambient.xAir, building11.xAirAmb);
  connect(ambient.xAir, building12.xAirAmb);
  connect(ambient.xAir, building13.xAirAmb);
  connect(ambient.xAir, building14.xAirAmb);
  connect(ambient.xAir, building16.xAirAmb);
  connect(ambient.xAir, building17.xAirAmb);
  connect(ambient.xAir, building21.xAirAmb);
  connect(ambient.xAir, building23.xAirAmb);
  connect(ambient.xAir, building25.xAirAmb);
  connect(ambient.xAir, building27.xAirAmb);
  connect(ambient.xAir, building29.xAirAmb);
  connect(ambient.xAir, building30.xAirAmb);
  connect(ambient.xAir, building33.xAirAmb);
  connect(ambient.xAir, building34.xAirAmb);
  connect(ambient.xAir, building35.xAirAmb);
  connect(ambient.xAir, building39.xAirAmb);
  connect(ambient.xAir, building40.xAirAmb);
  connect(ambient.xAir, building43.xAirAmb);
  connect(ambient.xAir, building44.xAirAmb);
  connect(ambient.xAir, building45.xAirAmb);
  connect(ambient.xAir, building46.xAirAmb);
  connect(ambient.xAir, building47.xAirAmb);
  connect(ambient.xAir, building48.xAirAmb);
  connect(ambient.xAir, building50.xAirAmb);
  connect(ambient.xAir, building51.xAirAmb);
  connect(ambient.xAir, building52.xAirAmb);
  connect(ambient.xAir, building53.xAirAmb);
  connect(ambient.xAir, building54.xAirAmb);
  connect(ambient.xAir, building55.xAirAmb);

  connect(t_set_heating.y, building43.T_setHeating[1]) annotation (Line(points={{-208.4,
          320},{-214,320},{-214,310},{-220.2,310}}, color={0,0,127}));
  connect(t_set_cooling.y, building43.T_setCooling[1])
    annotation (Line(points={{-208.4,308},{-220.2,308}}, color={0,0,127}));
  connect(set_airchange.y, building43.airchange[1]) annotation (Line(points={{-208.4,
          296},{-214,296},{-214,306},{-220.2,306}}, color={0,0,127}));
  connect(t_set_heating6.y, building55.T_setHeating[1]) annotation (Line(points={{-254.4,
          112},{-260,112},{-260,102},{-266.2,102}}, color={0,0,127}));
  connect(t_set_cooling6.y, building55.T_setCooling[1])
    annotation (Line(points={{-254.4,100},{-266.2,100}}, color={0,0,127}));
  connect(set_airchange6.y, building55.airchange[1]) annotation (Line(points={{-254.4,
          88},{-260,88},{-260,98},{-266.2,98}}, color={0,0,127}));
  connect(t_set_heating7.y, building35.T_setHeating[1]) annotation (Line(points={{
          -314.4,-8},{-320,-8},{-320,-18},{-326.2,-18}}, color={0,0,127}));
  connect(t_set_cooling7.y, building35.T_setCooling[1])
    annotation (Line(points={{-314.4,-20},{-326.2,-20}}, color={0,0,127}));
  connect(set_airchange7.y, building35.airchange[1]) annotation (Line(points={{-314.4,
          -32},{-320,-32},{-320,-22},{-326.2,-22}}, color={0,0,127}));
  connect(t_set_heating2.y, building21.T_setHeating[1]) annotation (Line(points={{-110.4,
          216},{-116,216},{-116,206},{-122.2,206}}, color={0,0,127}));
  connect(t_set_cooling2.y, building21.T_setCooling[1])
    annotation (Line(points={{-110.4,204},{-122.2,204}}, color={0,0,127}));
  connect(set_airchange2.y, building21.airchange[1]) annotation (Line(points={{-110.4,
          192},{-116,192},{-116,202},{-122.2,202}}, color={0,0,127}));
  connect(t_set_heating1.y, building33.T_setHeating[1]) annotation (Line(points={{
          -54.4,236},{-60,236},{-60,226},{-66.2,226}}, color={0,0,127}));
  connect(t_set_cooling1.y, building33.T_setCooling[1])
    annotation (Line(points={{-54.4,224},{-66.2,224}}, color={0,0,127}));
  connect(set_airchange1.y, building33.airchange[1]) annotation (Line(points={{-54.4,
          212},{-60,212},{-60,222},{-66.2,222}}, color={0,0,127}));
  connect(t_set_heating3.y, building16.T_setHeating[1]) annotation (Line(
        points={{-32.4,206},{-38,206},{-38,196},{-44.2,196}}, color={0,0,127}));
  connect(t_set_cooling3.y, building16.T_setCooling[1])
    annotation (Line(points={{-32.4,194},{-44.2,194}}, color={0,0,127}));
  connect(set_airchange3.y, building16.airchange[1]) annotation (Line(points={{
          -32.4,182},{-38,182},{-38,192},{-44.2,192}}, color={0,0,127}));
  connect(t_set_heating5.y, building12.T_setHeating[1]) annotation (Line(points={{-152.4,
          150},{-158,150},{-158,140},{-162.2,140}}, color={0,0,127}));
  connect(t_set_cooling5.y, building12.T_setCooling[1])
    annotation (Line(points={{-152.4,138},{-162.2,138}}, color={0,0,127}));
  connect(set_airchange5.y, building12.airchange[1]) annotation (Line(points={{-152.4,
          126},{-158,126},{-158,136},{-162.2,136}}, color={0,0,127}));
  connect(t_set_heating13.y, building17.T_setHeating[1]) annotation (Line(points={{
          -134.4,106},{-140,106},{-140,96},{-146.2,96}}, color={0,0,127}));
  connect(t_set_cooling13.y, building17.T_setCooling[1])
    annotation (Line(points={{-134.4,94},{-146.2,94}}, color={0,0,127}));
  connect(set_airchange13.y, building17.airchange[1]) annotation (Line(points={{-134.4,
          82},{-140,82},{-140,92},{-146.2,92}}, color={0,0,127}));
  connect(t_set_heating18.y, building5.T_setHeating[1]) annotation (Line(points={
          {-78.4,122},{-80,122},{-80,106},{-82.2,106}}, color={0,0,127}));
  connect(t_set_cooling18.y, building5.T_setCooling[1]) annotation (Line(points={
          {-78.4,110},{-80,110},{-80,104},{-82.2,104}}, color={0,0,127}));
  connect(set_airchange18.y, building5.airchange[1]) annotation (Line(points={{-78.4,
          98},{-80,98},{-80,102},{-82.2,102}}, color={0,0,127}));
  connect(t_set_heating17.y, building8.T_setHeating[1]) annotation (Line(points={{-34.4,
          148},{-38,148},{-38,134},{-40.2,134}}, color={0,0,127}));
  connect(t_set_cooling17.y, building8.T_setCooling[1]) annotation (Line(points={{-34.4,
          136},{-38,136},{-38,132},{-40.2,132}}, color={0,0,127}));
  connect(set_airchange17.y, building8.airchange[1]) annotation (Line(points={{-34.4,
          124},{-38,124},{-38,130},{-40.2,130}}, color={0,0,127}));
  connect(t_set_heating12.y, building14.T_setHeating[1]) annotation (Line(points={{
          -40.4,102},{-46,102},{-46,92},{-52.2,92}}, color={0,0,127}));
  connect(t_set_cooling12.y, building14.T_setCooling[1])
    annotation (Line(points={{-40.4,90},{-52.2,90}}, color={0,0,127}));
  connect(set_airchange12.y, building14.airchange[1]) annotation (Line(points={{-40.4,
          78},{-46,78},{-46,88},{-52.2,88}}, color={0,0,127}));
  connect(t_set_heating4.y, building11.T_setHeating[1]) annotation (Line(points={{
          7.6,156},{2,156},{2,146},{-4.2,146}}, color={0,0,127}));
  connect(t_set_cooling4.y, building11.T_setCooling[1])
    annotation (Line(points={{7.6,144},{-4.2,144}}, color={0,0,127}));
  connect(set_airchange4.y, building11.airchange[1]) annotation (Line(points={{7.6,
          132},{2,132},{2,142},{-4.2,142}}, color={0,0,127}));
  connect(t_set_heating11.y, building10.T_setHeating[1]) annotation (Line(points={
          {15.6,86},{10,86},{10,76},{3.8,76}}, color={0,0,127}));
  connect(t_set_cooling11.y, building10.T_setCooling[1])
    annotation (Line(points={{15.6,74},{3.8,74}}, color={0,0,127}));
  connect(set_airchange11.y, building10.airchange[1]) annotation (Line(points={{15.6,
          62},{10,62},{10,72},{3.8,72}}, color={0,0,127}));
  connect(t_set_heating8.y, building27.T_setHeating[1]) annotation (Line(points={{77.6,
          86},{72,86},{72,76},{65.8,76}}, color={0,0,127}));
  connect(t_set_cooling8.y, building27.T_setCooling[1])
    annotation (Line(points={{77.6,74},{65.8,74}}, color={0,0,127}));
  connect(set_airchange8.y, building27.airchange[1]) annotation (Line(points={{77.6,
          62},{72,62},{72,72},{65.8,72}}, color={0,0,127}));
  connect(t_set_heating9.y, building47.T_setHeating[1]) annotation (Line(points={{
          109.6,56},{104,56},{104,46},{97.8,46}}, color={0,0,127}));
  connect(t_set_cooling9.y, building47.T_setCooling[1])
    annotation (Line(points={{109.6,44},{97.8,44}}, color={0,0,127}));
  connect(set_airchange9.y, building47.airchange[1]) annotation (Line(points={{109.6,
          32},{104,32},{104,42},{97.8,42}}, color={0,0,127}));
  connect(t_set_heating10.y, building34.T_setHeating[1]) annotation (Line(points={{
          49.6,48},{44,48},{44,38},{37.8,38}}, color={0,0,127}));
  connect(t_set_cooling10.y, building34.T_setCooling[1])
    annotation (Line(points={{49.6,36},{37.8,36}}, color={0,0,127}));
  connect(set_airchange10.y, building34.airchange[1]) annotation (Line(points={{49.6,
          24},{44,24},{44,34},{37.8,34}}, color={0,0,127}));
  connect(t_set_heating19.y, building25.T_setHeating[1]) annotation (Line(points={{
          -30.4,62},{-36,62},{-36,52},{-42.2,52}}, color={0,0,127}));
  connect(t_set_cooling19.y, building25.T_setCooling[1])
    annotation (Line(points={{-30.4,50},{-42.2,50}}, color={0,0,127}));
  connect(set_airchange19.y, building25.airchange[1]) annotation (Line(points={{-30.4,
          38},{-36,38},{-36,48},{-42.2,48}}, color={0,0,127}));
  connect(t_set_heating20.y, building40.T_setHeating[1]) annotation (Line(points={{-98.4,
          44},{-104,44},{-104,34},{-110.2,34}}, color={0,0,127}));
  connect(t_set_cooling20.y, building40.T_setCooling[1])
    annotation (Line(points={{-98.4,32},{-110.2,32}}, color={0,0,127}));
  connect(set_airchange20.y, building40.airchange[1]) annotation (Line(points={{-98.4,
          20},{-104,20},{-104,30},{-110.2,30}}, color={0,0,127}));
  connect(t_set_heating21.y, building1.T_setHeating[1]) annotation (Line(points={{-150.4,
          58},{-156,58},{-156,48},{-162.2,48}}, color={0,0,127}));
  connect(t_set_cooling21.y, building1.T_setCooling[1])
    annotation (Line(points={{-150.4,46},{-162.2,46}}, color={0,0,127}));
  connect(set_airchange21.y, building1.airchange[1]) annotation (Line(points={{-150.4,
          34},{-156,34},{-156,44},{-162.2,44}}, color={0,0,127}));
  connect(t_set_heating14.y, building39.T_setHeating[1]) annotation (Line(points={
          {319.6,-52},{314,-52},{314,-62},{307.8,-62}}, color={0,0,127}));
  connect(t_set_cooling14.y, building39.T_setCooling[1])
    annotation (Line(points={{319.6,-64},{307.8,-64}}, color={0,0,127}));
  connect(set_airchange14.y, building39.airchange[1]) annotation (Line(points={{319.6,
          -76},{314,-76},{314,-66},{307.8,-66}}, color={0,0,127}));
  connect(t_set_heating16.y, building23.T_setHeating[1]) annotation (Line(points={{311.6,
          -124},{306,-124},{306,-134},{299.8,-134}}, color={0,0,127}));
  connect(t_set_cooling16.y, building23.T_setCooling[1])
    annotation (Line(points={{311.6,-136},{299.8,-136}}, color={0,0,127}));
  connect(set_airchange16.y, building23.airchange[1]) annotation (Line(points={{311.6,
          -148},{306,-148},{306,-138},{299.8,-138}}, color={0,0,127}));
  connect(t_set_heating15.y, building51.T_setHeating[1]) annotation (
      Line(points={{267.6,-112},{262,-112},{262,-122},{255.8,-122}}, color={0,0,
          127}));
  connect(t_set_cooling15.y, building51.T_setCooling[1])
    annotation (Line(points={{267.6,-124},{255.8,-124}}, color={0,0,127}));
  connect(set_airchange15.y, building51.airchange[1]) annotation (Line(
        points={{267.6,-136},{262,-136},{262,-126},{255.8,-126}}, color={0,0,127}));
  connect(t_set_heating30.y, building7.T_setHeating[1]) annotation (Line(points={{135.6,
          -58},{128,-58},{128,-68},{123.8,-68}}, color={0,0,127}));
  connect(t_set_cooling30.y, building7.T_setCooling[1])
    annotation (Line(points={{135.6,-70},{123.8,-70}}, color={0,0,127}));
  connect(set_airchange30.y, building7.airchange[1]) annotation (Line(points={{135.6,
          -82},{128,-82},{128,-72},{123.8,-72}}, color={0,0,127}));
  connect(t_set_heating31.y, building29.T_setHeating[1]) annotation (Line(points={{
          129.6,-106},{124,-106},{124,-116},{117.8,-116}}, color={0,0,127}));
  connect(t_set_cooling31.y, building29.T_setCooling[1])
    annotation (Line(points={{129.6,-118},{117.8,-118}}, color={0,0,127}));
  connect(set_airchange31.y, building29.airchange[1]) annotation (Line(points={{129.6,
          -130},{124,-130},{124,-120},{117.8,-120}}, color={0,0,127}));
  connect(t_set_heating32.y, building52.T_setHeating[1]) annotation (Line(
        points={{159.6,-132},{154,-132},{154,-142},{147.8,-142}}, color={0,0,127}));
  connect(t_set_cooling32.y, building52.T_setCooling[1])
    annotation (Line(points={{159.6,-144},{147.8,-144}}, color={0,0,127}));
  connect(set_airchange32.y, building52.airchange[1]) annotation (Line(
        points={{159.6,-156},{154,-156},{154,-146},{147.8,-146}}, color={0,0,127}));
  connect(t_set_heating33.y, building54.T_setHeating[1]) annotation (Line(
        points={{113.6,-146},{108,-146},{108,-156},{101.8,-156}}, color={0,0,127}));
  connect(t_set_cooling33.y, building54.T_setCooling[1])
    annotation (Line(points={{113.6,-158},{101.8,-158}}, color={0,0,127}));
  connect(set_airchange33.y, building54.airchange[1]) annotation (Line(points=
         {{113.6,-170},{108,-170},{108,-160},{101.8,-160}}, color={0,0,127}));
  connect(t_set_heating34.y, building53.T_setHeating[1]) annotation (Line(
        points={{89.6,-182},{84,-182},{84,-192},{77.8,-192}}, color={0,0,127}));
  connect(t_set_cooling34.y, building53.T_setCooling[1])
    annotation (Line(points={{89.6,-194},{77.8,-194}}, color={0,0,127}));
  connect(set_airchange34.y, building53.airchange[1]) annotation (Line(points={{
          89.6,-206},{84,-206},{84,-196},{77.8,-196}}, color={0,0,127}));
  connect(t_set_heating35.y, building48.T_setHeating[1]) annotation (Line(points={
          {189.6,-202},{184,-202},{184,-212},{177.8,-212}}, color={0,0,127}));
  connect(t_set_cooling35.y, building48.T_setCooling[1])
    annotation (Line(points={{189.6,-214},{177.8,-214}}, color={0,0,127}));
  connect(set_airchange35.y, building48.airchange[1]) annotation (Line(points={{189.6,
          -226},{184,-226},{184,-216},{177.8,-216}}, color={0,0,127}));
  connect(t_set_heating37.y, building44.T_setHeating[1]) annotation (Line(points={{
          85.6,-286},{80,-286},{80,-296},{73.8,-296}}, color={0,0,127}));
  connect(t_set_cooling37.y, building44.T_setCooling[1])
    annotation (Line(points={{85.6,-298},{73.8,-298}}, color={0,0,127}));
  connect(set_airchange37.y, building44.airchange[1]) annotation (Line(points={{85.6,
          -310},{80,-310},{80,-300},{73.8,-300}}, color={0,0,127}));
  connect(t_set_heating36.y, building45.T_setHeating[1]) annotation (Line(points={{
          19.6,-282},{14,-282},{14,-292},{7.8,-292}}, color={0,0,127}));
  connect(t_set_cooling36.y, building45.T_setCooling[1])
    annotation (Line(points={{19.6,-294},{7.8,-294}}, color={0,0,127}));
  connect(set_airchange36.y, building45.airchange[1]) annotation (Line(points={{19.6,
          -306},{14,-306},{14,-296},{7.8,-296}}, color={0,0,127}));
  connect(t_set_heating23.y, building13.T_setHeating[1]) annotation (Line(points={{17.6,
          -76},{12,-76},{12,-86},{5.8,-86}}, color={0,0,127}));
  connect(t_set_cooling23.y, building13.T_setCooling[1])
    annotation (Line(points={{17.6,-88},{5.8,-88}}, color={0,0,127}));
  connect(set_airchange23.y, building13.airchange[1]) annotation (Line(points={{17.6,
          -100},{12,-100},{12,-90},{5.8,-90}}, color={0,0,127}));
  connect(t_set_heating22.y, building9.T_setHeating[1]) annotation (Line(points={{
          -106.4,-68},{-112,-68},{-112,-78},{-118.2,-78}}, color={0,0,127}));
  connect(t_set_cooling22.y, building9.T_setCooling[1])
    annotation (Line(points={{-106.4,-80},{-118.2,-80}}, color={0,0,127}));
  connect(set_airchange22.y, building9.airchange[1]) annotation (Line(points={{-106.4,
          -92},{-112,-92},{-112,-82},{-118.2,-82}}, color={0,0,127}));
  connect(t_set_heating24.y, building6.T_setHeating[1]) annotation (Line(points={{-168.4,
          -94},{-174,-94},{-174,-104},{-184.2,-104}},        color={0,0,127}));
  connect(t_set_cooling24.y, building6.T_setCooling[1])
    annotation (Line(points={{-168.4,-106},{-184.2,-106}}, color={0,0,127}));
  connect(set_airchange24.y, building6.airchange[1]) annotation (Line(points={{-168.4,
          -118},{-174,-118},{-174,-108},{-184.2,-108}}, color={0,0,127}));
  connect(t_set_heating26.y, building3.T_setHeating[1]) annotation (Line(points={{-110.4,
          -114},{-116,-114},{-116,-124},{-122.2,-124}}, color={0,0,127}));
  connect(t_set_cooling26.y, building3.T_setCooling[1])
    annotation (Line(points={{-110.4,-126},{-122.2,-126}}, color={0,0,127}));
  connect(set_airchange26.y, building3.airchange[1]) annotation (Line(points={{-110.4,
          -138},{-116,-138},{-116,-128},{-122.2,-128}}, color={0,0,127}));
  connect(t_set_heating27.y, building50.T_setHeating[1]) annotation (Line(
        points={{-84.4,-144},{-90,-144},{-90,-152},{-96.2,-152}}, color={0,0,127}));
  connect(t_set_cooling27.y, building50.T_setCooling[1]) annotation (Line(
        points={{-84.4,-156},{-90,-156},{-90,-154},{-96.2,-154}}, color={0,0,127}));
  connect(set_airchange27.y, building50.airchange[1]) annotation (Line(
        points={{-84.4,-168},{-90,-168},{-90,-156},{-96.2,-156}}, color={0,0,127}));
  connect(t_set_heating28.y, building2.T_setHeating[1]) annotation (Line(points={{
          -126.4,-152},{-132,-152},{-132,-144},{-136.2,-144}}, color={0,0,127}));
  connect(t_set_cooling28.y, building2.T_setCooling[1]) annotation (Line(points={{
          -126.4,-164},{-132,-164},{-132,-146},{-136.2,-146}}, color={0,0,127}));
  connect(set_airchange28.y, building2.airchange[1]) annotation (Line(points={{-126.4,
          -176},{-132,-176},{-132,-148},{-136.2,-148}}, color={0,0,127}));
  connect(t_set_heating25.y, building46.T_setHeating[1]) annotation (Line(
        points={{-164.4,-132},{-166.2,-132},{-166.2,-146}}, color={0,0,127}));
  connect(t_set_cooling25.y, building46.T_setCooling[1]) annotation (Line(
        points={{-164.4,-144},{-166.2,-144},{-166.2,-148}}, color={0,0,127}));
  connect(set_airchange25.y, building46.airchange[1]) annotation (Line(points={{
          -164.4,-156},{-166.2,-156},{-166.2,-150}}, color={0,0,127}));
  connect(t_set_heating29.y, building30.T_setHeating[1]) annotation (Line(points={
          {-88.4,-188},{-94,-188},{-94,-198},{-100.2,-198}}, color={0,0,127}));
  connect(t_set_cooling29.y, building30.T_setCooling[1])
    annotation (Line(points={{-88.4,-200},{-100.2,-200}}, color={0,0,127}));
  connect(set_airchange29.y, building30.airchange[1]) annotation (Line(points={{-88.4,
          -212},{-94,-212},{-94,-202},{-100.2,-202}}, color={0,0,127}));
  connect(groundBuilding45.port, building45.toSolidHeatPorts[1])
    annotation (Line(points={{-2,-316},{-2,-312},{-6,-312},{-6,-309}},
                                                     color={191,0,0}));
  connect(groundBuilding44.port, building44.toSolidHeatPorts[1])
    annotation (Line(points={{64,-320},{64,-316},{60,-316},{60,-313}},
                                                     color={191,0,0}));
  connect(groundBuilding39.port, building39.toSolidHeatPorts[1]) annotation (
      Line(points={{298,-86},{298,-79},{294,-79}},   color={191,0,0}));
  connect(groundBuilding23.port, building23.toSolidHeatPorts[1])
    annotation (Line(points={{290,-158},{290,-154},{286,-154},{286,-151}},
                                                       color={191,0,0}));
  connect(groundBuilding51.port, building51.toSolidHeatPorts[1])
    annotation (Line(points={{246,-146},{246,-142},{242,-142},{242,-139}},
                                                       color={191,0,0}));
  connect(groundBuilding53.port, building53.toSolidHeatPorts[1])
    annotation (Line(points={{68,-216},{68,-212},{64,-212},{64,-209}},
                                                     color={191,0,0}));
  connect(groundBuilding54.port, building54.toSolidHeatPorts[1]) annotation (
     Line(points={{76,-180},{80,-180},{80,-173},{88,-173}},     color={191,0,0}));
  connect(groundBuilding52.port, building52.toSolidHeatPorts[1])
    annotation (Line(points={{138,-166},{138,-162},{134,-162},{134,-159}},
                                                       color={191,0,0}));
  connect(groundBuilding29.port, building29.toSolidHeatPorts[1])
    annotation (Line(points={{108,-140},{108,-136},{104,-136},{104,-133}},
                                                       color={191,0,0}));
  connect(groundBuilding7.port, building7.toSolidHeatPorts[1])
    annotation (Line(points={{114,-92},{114,-88},{110,-88},{110,-85}},
                                                     color={191,0,0}));
  connect(groundBuilding13.port, building13.toSolidHeatPorts[1])
    annotation (Line(points={{-4,-110},{-4,-106},{-8,-106},{-8,-103}},
                                                     color={191,0,0}));
  connect(groundBuilding9.port, building9.toSolidHeatPorts[1])
    annotation (Line(points={{-128,-102},{-128,-98},{-132,-98},{-132,-95}},
                                                       color={191,0,0}));
  connect(groundBuilding6.port, building6.toSolidHeatPorts[1])
    annotation (Line(points={{-194,-128},{-194,-124},{-198,-124},{-198,-121}},
                                                         color={191,0,0}));
  connect(groundBuilding46.port, building46.toSolidHeatPorts[1])
    annotation (Line(points={{-176,-170},{-176,-166},{-180,-166},{-180,-163}},
                                                         color={191,0,0}));
  connect(groundBuilding2.port, building2.toSolidHeatPorts[1])
    annotation (Line(points={{-146,-168},{-146,-164},{-150,-164},{-150,-161}},
                                                         color={191,0,0}));
  connect(groundBuilding3.port, building3.toSolidHeatPorts[1]) annotation (Line(
        points={{-134,-170},{-136,-170},{-136,-141}},     color={191,0,0}));
  connect(groundBuilding50.port, building50.toSolidHeatPorts[1])
    annotation (Line(points={{-106,-176},{-106,-172},{-110,-172},{-110,-169}},
                                                         color={191,0,0}));
  connect(groundBuilding30.port, building30.toSolidHeatPorts[1])
    annotation (Line(points={{-110,-222},{-110,-218},{-114,-218},{-114,-215}},
                                                         color={191,0,0}));
  connect(groundBuilding35.port, building35.toSolidHeatPorts[1])
    annotation (Line(points={{-336,-42},{-336,-38},{-340,-38},{-340,-35}},
                                                       color={191,0,0}));
  connect(groundBuilding55.port, building55.toSolidHeatPorts[1])
    annotation (Line(points={{-276,78},{-276,82},{-280,82},{-280,85}},
                                                     color={191,0,0}));
  connect(groundBuilding43.port, building43.toSolidHeatPorts[1])
    annotation (Line(points={{-230,286},{-230,290},{-234,290},{-234,293}},
                                                       color={191,0,0}));
  connect(groundBuilding47.port, building47.toSolidHeatPorts[1])
    annotation (Line(points={{88,22},{88,26},{84,26},{84,29}},
                                                 color={191,0,0}));
  connect(groundBuilding34.port, building34.toSolidHeatPorts[1])
    annotation (Line(points={{28,14},{28,18},{24,18},{24,21}},
                                                 color={191,0,0}));
  connect(groundBuilding27.port, building27.toSolidHeatPorts[1]) annotation (
      Line(points={{42,52},{46,52},{46,59},{52,59}},     color={191,0,0}));
  connect(groundBuilding10.port, building10.toSolidHeatPorts[1])
    annotation (Line(points={{-6,52},{-6,56},{-10,56},{-10,59}},
                                                   color={191,0,0}));
  connect(groundBuilding25.port, building25.toSolidHeatPorts[1])
    annotation (Line(points={{-52,28},{-52,32},{-56,32},{-56,35}},
                                                   color={191,0,0}));
  connect(groundBuilding14.port, building14.toSolidHeatPorts[1])
    annotation (Line(points={{-62,68},{-62,72},{-66,72},{-66,75}},
                                                   color={191,0,0}));
  connect(groundBuilding5.port, building5.toSolidHeatPorts[1])
    annotation (Line(points={{-92,82},{-92,86},{-96,86},{-96,89}},
                                                   color={191,0,0}));
  connect(groundBuilding40.port, building40.toSolidHeatPorts[1])
    annotation (Line(points={{-120,10},{-120,14},{-124,14},{-124,17}},
                                                     color={191,0,0}));
  connect(groundBuilding1.port, building1.toSolidHeatPorts[1])
    annotation (Line(points={{-172,24},{-172,28},{-176,28},{-176,31}},
                                                     color={191,0,0}));
  connect(groundBuilding17.port, building17.toSolidHeatPorts[1])
    annotation (Line(points={{-156,72},{-156,76},{-160,76},{-160,79}},
                                                     color={191,0,0}));
  connect(groundBuilding12.port, building12.toSolidHeatPorts[1])
    annotation (Line(points={{-172,116},{-172,120},{-176,120},{-176,123}},
                                                       color={191,0,0}));
  connect(building8.toSolidHeatPorts[1], groundBuilding8.port)
    annotation (Line(points={{-54,117},{-54,114},{-54,110},{-50,110}},
                                                     color={191,0,0}));
  connect(groundBuilding11.port, building11.toSolidHeatPorts[1])
    annotation (Line(points={{-14,122},{-14,126},{-18,126},{-18,129}},
                                                     color={191,0,0}));
  connect(groundBuilding16.port, building16.toSolidHeatPorts[1])
    annotation (Line(points={{-54,172},{-54,176},{-58,176},{-58,179}},
                                                     color={191,0,0}));
  connect(groundBuilding33.port, building33.toSolidHeatPorts[1])
    annotation (Line(points={{-76,202},{-76,206},{-80,206},{-80,209}},
                                                     color={191,0,0}));
  connect(groundBuilding21.port, building21.toSolidHeatPorts[1])
    annotation (Line(points={{-132,182},{-132,186},{-136,186},{-136,189}},
                                                       color={191,0,0}));

  annotation (__Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/DistrictSimulation/HCBC.mos" "Simulate and plot"),
    Diagram(coordinateSystem(extent={{-400,-400},{400,400}},preserveAspectRatio=false),
    graphics={Bitmap(extent={{-398,-402},{396,400}},
    fileName="modelica://BuildingSystems/Resources/Images/Applications/DistrictSimulation/HCBCBackground.png")}),
    experiment(StopTime=864000),
    __Dymola_experimentSetupOutput(events=false),
Documentation(info="<html>
<p>
Example that simulates heating and cooling demand of the university campus in Berlin-Charlottenburg (Germany).
</p>
</html>",
revisions="<html>
<ul>
<li>
April 27, 2017, by Alexander Inderfurth:<br/>
First implementation.
</li>
</ul>
</html>"));
end HCBC;
