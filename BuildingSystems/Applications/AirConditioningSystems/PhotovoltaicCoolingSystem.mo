within BuildingSystems.Applications.AirConditioningSystems;
model PhotovoltaicCoolingSystem
  "Photovoltaic cooling system"
  extends Modelica.Icons.Example;
  package Medium = BuildingSystems.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.5
    "Nominal mass flow rate";
  parameter Modelica.SIunits.MassFlowRate m_flow = 0.5
    "Mass flow rate in the cold water production and consumption loop";
  BuildingSystems.Technologies.Photovoltaics.PVModules.PVModuleSimpleMPP pvField(
    redeclare BuildingSystems.Technologies.Photovoltaics.Data.PhotovoltaicModules.TSM230PC05 pvModuleData,
    angleDegTil=30.0,
    angleDegAzi=0.0,
    nModPar=8,
    nModSer=1)
    annotation (Placement(transformation(extent={{-54,-18},{-34,2}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    latitudeDeg = ambient.weatherData.latitudeDeg,
    longitudeDeg = ambient.weatherData.longitudeDeg,
    longitudeDeg0 = ambient.weatherData.longitudeDeg0,
    rhoAmb=0.2,
    angleDegL=0.0)
    annotation (Placement(transformation(extent={{-72,12},{-52,32}})));
  BuildingSystems.Technologies.ElectricalStorages.BatterySimple battery(
    E_nominal(displayUnit="kWh")=25200000,
    PLoadMax=5000)
    annotation (Placement(transformation(extent={{-38,-10},{-18,10}})));
  BuildingSystems.Technologies.Chillers.CompressionChiller chiller(
    redeclare package Medium1 = Medium,
    redeclare package Medium2 = Medium,
    m1_flow_nominal = m_flow_nominal,
    m2_flow_nominal = m_flow_nominal,
    dp1_nominal = 1000.0,
    dp2_nominal = 1000.0,
    redeclare BuildingSystems.Technologies.Chillers.Data.CompressionChillers.StandardChiller2000W chillerData)
    annotation (Placement(transformation(extent={{24,-10},{4,10}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemEvaOut(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{32,-10},{40,-2}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemEvaIn(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-8,-10},{0,-2}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T m_flow_con(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=m_flow,
    use_T_in=true)
    annotation (Placement(transformation(extent={{52,2},{44,10}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort  senTemConIn(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{40,2},{32,10}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemConOut(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-8,2},{0,10}})));
  BuildingSystems.Fluid.Sources.Boundary_pT bou_pT(
    redeclare package Medium = Medium,
    nPorts=1,
    p=99999,
    T=293.15) annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=180,origin={-14,6})));
  Modelica.Blocks.Sources.Constant partLoad(
    k=0.4)
    annotation (Placement(transformation(extent={{-2,14},{6,22}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump1(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nominalValuesDefineDefaultPressureCurve=true)
    annotation (Placement(transformation(extent={{22,-48},{6,-32}})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp1(
    redeclare package Medium = Medium,
    V_start=0.01)
    annotation (Placement(transformation(extent={{-18,-40},{-10,-32}})));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    HX_2=false,
    HX_1=false,
    redeclare package Medium = Medium,
    redeclare BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1 HeatBuoyancy,
    V=1,
    nEle=5,
    height=2)
    "Cold water storage"
    annotation (Placement(transformation(extent={{62,-40},{82,-20}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip1(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    thicknessIns=0.04,
    lambdaIns=0.04,
    length=1.0)
    annotation (Placement(transformation(extent={{44,-10},{54,-2}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip2(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    thicknessIns=0.04,
    lambdaIns=0.04,
    length=1.0)
    annotation (Placement(transformation(extent={{30,-44},{40,-36}})));
  BuildingSystems.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 coolingSurface(
    redeclare package Medium = Medium,
    VWat=0.05,
    mDry=0.0001,
    nEle=5,
    fraRad=0.5,
    n=1.3,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_nominal=m_flow_nominal,
    Q_flow_nominal=6000.0,
    T_a_nominal=273.15 + 35.0,
    T_b_nominal=273.15 + 28.0,
    TAir_nominal=273.15 + 20.0)
    "cooling surface"
    annotation (Placement(transformation(extent={{124,-6},{112,6}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow  pump2(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nominalValuesDefineDefaultPressureCurve=true)
    annotation (Placement(transformation(extent={{86,-46},{102,-30}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip3(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    thicknessIns=0.04,
    lambdaIns=0.04,
    length=1.0)
    annotation (Placement(transformation(extent={{96,-4},{86,4}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip4(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    thicknessIns=0.04,
    lambdaIns=0.04,
    length=1.0)
    annotation (Placement(transformation(extent={{110,-42},{120,-34}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemColSurOut(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{108,-4},{100,4}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTemColSurIn(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{136,-4},{128,4}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DDistrict building(
    calcIdealLoads=false,
    heatSources=true,
    nHeatSources=1,
    angleDegAziBuilding=0.0,
    width=10,
    length=6,
    heightSto=2.8,
    nSto=2,
    ARoom=4.0*4.0,
    widthWindow1=4.0,
    heightWindow1=2*1.2,
    widthWindow2=4.0,
    heightWindow2=2*1.2,
    widthWindow3=4.0,
    heightWindow3=2*1.2,
    widthWindow4=4.0,
    heightWindow4=2*1.2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall4,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.BasePlateMultistorey1958to1968 constructionBottom,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.IntermediateWallMultistorey1958to1968 constructionWallsInterior,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.IntermediateCeilingMultistorey1958to1968 constructionCeilingsInterior,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow4,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.RoofRowhouse1918 constructionCeiling,
    BCWall1=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient,
    BCWall2=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient,
    BCWall3=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient,
    BCWall4=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient,
    BCCeiling=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambient)
    "Building model"
    annotation (Placement(transformation(extent={{88,30},{108,50}})));
  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient,
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Egypt_ElGouna weatherDataFile)
    "Ambient model"
    annotation (Placement(transformation(extent={{64,30},{84,50}})));
  Modelica.Blocks.Sources.Constant airchange(
    k=0.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={116,44})));
  Modelica.Blocks.Logical.Hysteresis control(
    pre_y_start=false,
    uLow=273.15 + 10.0,
    uHigh=273.15 + 14.0)
    annotation (Placement(transformation(extent={{40,24},{32,32}})));
  Modelica.Blocks.Logical.Hysteresis control_temp_buildin(
    pre_y_start=false,
    uLow=273.15 + 24.0,
    uHigh=273.15 + 26.0)
    annotation (Placement(transformation(extent={{104,12},{96,20}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(
    realTrue=m_flow)
    annotation (Placement(transformation(extent={{88,12},{80,20}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal1(
    realTrue=m_flow)
    annotation (Placement(transformation(extent={{24,-22},{16,-14}})));
  Modelica.SIunits.Energy EGrid(
    start=0.0)
    "Integrates the electricity taken from the grid";
  Modelica.SIunits.Energy EPVField(
    start=0.0)
    "Integrates the electricity generated by the PV field";
equation
  der(EGrid) = battery.PGrid;
  der(EPVField) = pvField.PField;
  connect(radiation.radiationPort,pvField. radiationPort)
    annotation (Line(
      points={{-54,21.8},{-46,21.8},{-46,0}},
      color={255,255,0},
      smooth=Smooth.None));
  connect(pvField.PField, battery.PCharge) annotation (Line(
      points={{-38,0},{-33,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(chiller.P, battery.PLoad) annotation (Line(
      points={{5.8,0},{-23,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(chiller.port_b2, senTemEvaOut.port_a) annotation (Line(
      points={{24,-6},{32,-6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(chiller.port_a2, senTemEvaIn.port_b) annotation (Line(
      points={{4,-6},{0,-6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemConIn.port_b, chiller.port_a1) annotation (Line(
      points={{32,6},{24,6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemConIn.port_a, m_flow_con.ports[1]) annotation (Line(
      points={{40,6},{44,6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(partLoad.y, chiller.load) annotation (Line(
      points={{6.4,18},{14,18},{14,7.6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(senTemConOut.port_b, chiller.port_b1) annotation (Line(
      points={{0,6},{4,6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou_pT.ports[1], senTemConOut.port_a) annotation (Line(
      points={{-10,6},{-8,6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump1.port_b, senTemEvaIn.port_a) annotation (Line(
      points={{6,-40},{-8,-40},{-8,-6}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(exp1.port_a, pump1.port_b) annotation (Line(
      points={{-14,-40},{6,-40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(senTemEvaOut.port_b, pip1.port_a)
    annotation (Line(points={{40,-6},{44,-6}}, color={0,127,255}));
  connect(pip1.port_b, storage.port_a1) annotation (Line(points={{54,-6},{58,-6},
          {58,-39},{65,-39}}, color={0,127,255}));
  connect(storage.port_b1, pip2.port_b) annotation (Line(points={{65,-21},{48,-21},
          {48,-40},{40,-40}}, color={0,127,255}));
  connect(pip2.port_a, pump1.port_a)
    annotation (Line(points={{30,-40},{26,-40},{22,-40}}, color={0,127,255}));
  connect(pump2.port_b, pip4.port_a) annotation (Line(points={{102,-38},{106,-38},
          {110,-38}}, color={0,127,255}));
  connect(pip3.port_a, senTemColSurOut.port_b)
    annotation (Line(points={{96,0},{98,0},{100,0}}, color={0,127,255}));
  connect(pip4.port_b, senTemColSurIn.port_a) annotation (Line(points={{120,-38},
          {140,-38},{140,0},{136,0}}, color={0,127,255}));
  connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts)
    annotation (Line(points={{82,44},{89,44}}, color={0,255,0}));
  connect(ambient.toAirPorts, building.toAmbientAirPorts)
    annotation (Line(points={{82,36},{89,36}}, color={85,170,255}));
  connect(building.airchange[1], airchange.y)
    annotation (Line(points={{107.8,44},{113.8,44}}, color={0,0,127}));
  connect(ambient.TAirRef, building.TAirAmb) annotation (Line(points={{65.8,47},
          {62,47},{62,56},{104.2,56},{104.2,49.8}}, color={0,0,127}));
  connect(ambient.xAir, building.xAirAmb) annotation (Line(points={{65.8,45},{60,
          45},{60,60},{106.4,60},{106.4,49.8}}, color={0,0,127}));
  connect(ambient.IrrDirHor, radiation.IrrDirHor) annotation (Line(points={{65.8,
          43},{-74,43},{-74,28},{-69.6,28}}, color={0,0,127}));
  connect(radiation.IrrDifHor, ambient.IrrDifHor) annotation (Line(points={{-69.6,
          24},{-76,24},{-76,42},{65.8,42},{65.8,41}}, color={0,0,127}));
  connect(ambient.TAirRef, pvField.TAmb)
    annotation (Line(points={{65.8,47},{-42,47},{-42,0}}, color={0,0,127}));
  connect(ambient.TAirRef, m_flow_con.T_in) annotation (Line(points={{65.8,47},{
          58,47},{58,7.6},{52.8,7.6}}, color={0,0,127}));
  connect(building.TAir[1], control_temp_buildin.u) annotation (Line(points={{117,33},
          {142,33},{142,16},{104.8,16}},     color={0,0,127}));
  connect(control.y, chiller.on) annotation (Line(points={{31.6,28},{24,28},{18,
          28},{18,7.6}}, color={255,0,255}));
  connect(control_temp_buildin.y, booleanToReal.u)
    annotation (Line(points={{95.6,16},{88.8,16}}, color={255,0,255}));
  connect(booleanToReal.y, pump2.m_flow_in) annotation (Line(points={{79.6,16},{
          74,16},{74,-12},{93.84,-12},{93.84,-28.4}}, color={0,0,127}));
  connect(booleanToReal1.y, pump1.m_flow_in) annotation (Line(points={{15.6,-18},
          {14.16,-18},{14.16,-30.4}}, color={0,0,127}));
  connect(control.y, booleanToReal1.u) annotation (Line(points={{31.6,28},{28,28},
          {28,-18},{24.8,-18}}, color={255,0,255}));
  connect(storage.T[3], control.u) annotation (Line(points={{64.6,-24},{62,-24},
          {62,28},{40.8,28}},color={0,0,127}));
  connect(pvField.angleDegTil, radiation.angleDegTil) annotation (Line(points={{
          -50,0},{-76,0},{-76,20},{-69.6,20}}, color={0,0,127}));
  connect(pvField.angleDegAzi, radiation.angleDegAzi) annotation (Line(points={{
          -50,-2},{-50,-2},{-76,-2},{-76,16},{-69.6,16}}, color={0,0,127}));
  connect(storage.port_b2, pump2.port_a) annotation (Line(
      points={{79,-39},{82.5,-39},{82.5,-38},{86,-38}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_a2, pip3.port_b) annotation (Line(
      points={{79,-21},{79,0},{86,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(coolingSurface.heatPortCon, building.conHeatSourcesPorts[1])
    annotation (Line(points={{119.2,4.32},{119.2,8},{146,8},{146,64},{98,64},{98,
          50}}, color={191,0,0}));
  connect(building.radHeatSourcesPorts[1], coolingSurface.heatPortRad)
    annotation (Line(points={{101,50},{102,50},{102,62},{144,62},{144,10},{116.8,
          10},{116.8,4.32}}, color={127,0,0}));
  connect(senTemColSurOut.port_a, coolingSurface.port_b)
    annotation (Line(points={{108,0},{110,0},{112,0}}, color={0,127,255}));
  connect(coolingSurface.port_a, senTemColSurIn.port_b)

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/AirConditioningSystems/PhotovoltaicCoolingSystem.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{160,100}}),
    graphics={Text(extent={{-56,-54},{48,-122}}, lineColor={0,0,255},
    textString="Photovoltaic driven air-conditioning system"),
    Text(extent={{-76,-98},{114,-130}},lineColor={0,0,255},textString="Example of a simple solar thermal system")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a photovoltaic driven air-conditioning system:
The PV generator loads an electric battery. The compression chiller takes
the electricity from the battery, produces cold water and charges it
into a cold water storage. The cold water is used for the air-conditioning of a building.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end PhotovoltaicCoolingSystem;
