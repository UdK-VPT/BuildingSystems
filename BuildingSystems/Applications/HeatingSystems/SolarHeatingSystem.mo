within BuildingSystems.Applications.HeatingSystems;
model SolarHeatingSystem
  "Solar heating system"
  extends Modelica.Icons.Example;
  package Medium2 = BuildingSystems.Media.Water(
    T_max = 273.15+150.0);
  package Medium1 = BuildingSystems.Media.Antifreeze.PropyleneGlycolWater(
    X_a=0.40,
    property_T=293.15,
    T_max = 273.15+200.0);

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal= 0.1;
  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces=building.nSurfacesAmbience,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.Germany_Berlin_Meteonorm_ASCII)
    "Ambience model"
    annotation (Placement(transformation(extent={{-26,42},{-6,62}})));
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
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014 constructionWall1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014 constructionWall2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014 constructionWall3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014 constructionWall4,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.RoofSingle2014 constructionCeiling,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.BasePlateSingle2014 constructionBottom,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.IntermediateWallSingle2014 constructionWallsInterior,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.IntermediateCeilingSingle2014 constructionCeilingsInterior,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal14 constructionWindow1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal14 constructionWindow2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal14 constructionWindow3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal14 constructionWindow4,
    BCWall1=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambience,
    BCWall2=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambience,
    BCWall3=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambience,
    BCWall4=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambience,
    BCCeiling=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambience)
    "Building model"
    annotation (Placement(transformation(extent={{4,42},{24,62}})));
  Modelica.Blocks.Sources.Constant airchange(
    k=0.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={38,56})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp1(
    redeclare package Medium = Medium2,
    V_start=0.01)
    "Expansion vessel model"
    annotation (Placement(transformation(extent={{20,-54},{32,-42}})));
  BuildingSystems.Fluid.FixedResistances.Pipe  pip1(
    redeclare package Medium = Medium2,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    length=1,
    diameter=0.02)
    "Pipe model"
    annotation (Placement(transformation(extent={{12,-2},{32,-22}})));
  BuildingSystems.Fluid.HeatExchangers.Heater_T hea(
    redeclare package Medium = Medium2,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=1000.0)
    "Boiler model"
    annotation (Placement(transformation(extent={{8,-70},{-12,-50}})));
  BuildingSystems.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 rad(
    redeclare package Medium = Medium2,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=1000.0,
    Q_flow_nominal=12000.0,
    VWat=0.005,
    mDry=0.0001,
    nEle=5,
    fraRad=0.5,
    T_a_nominal=273.15 + 90.0,
    T_b_nominal=273.15 + 70,
    TAir_nominal=273.15 + 20.0,
    n=1.3)
    "Radiator model"
    annotation (Placement(transformation(extent={{-12,-22},{8,-2}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip2(
    redeclare package Medium = Medium2,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    length=1.0)
    "Pipe model"
    annotation (Placement(transformation(extent={{-16,-70},{-36,-50}})));
  Modelica.Blocks.Sources.Constant TSet(
    k=273.15 + 60.0)
    annotation (Placement(transformation(extent={{18,-56},{14,-52}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip3(
    redeclare package Medium = Medium2,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=1.0)
    "Pipe model"
    annotation (Placement(transformation(extent={{-60,-2},{-40,-22}})));
  BuildingSystems.Fluid.Actuators.Valves.TwoWayEqualPercentage val(
    redeclare package Medium = Medium1,
    from_dp=true,
    m_flow_nominal=m_flow_nominal,
    dpValve_nominal=2000,
    l=0.01,
    R=50)
    "Valve model"
    annotation (Placement(transformation(extent={{-36,-22},{-16,-2}})));
  Modelica.Blocks.Continuous.LimPID thermostat(
    k=0.8,
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    yMax=1.0,
    yMin=0.0,
    wp=1.0)
    "Thermostat, modelled by a limeted p-controller"
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-26,18})));
  BuildingSystems.Fluid.Movers.FlowControlled_dp pump1(
    redeclare package Medium = Medium2,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-84,-22},{-64,-2}})));
  Modelica.Blocks.Sources.Constant dpSet(
    k=150000.0)
    "Set pressure for the pump model"
    annotation (Placement(transformation(extent={{-68,6},{-72,10}})));
  Modelica.Blocks.Sources.Constant TAirSet(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-20,24},{-24,28}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TAmb(
    each T=293.15)
    "Ambience temperature"
    annotation (Placement(transformation(extent={{-72,-46},{-60,-34}})));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    HX_2=false,
    AdditionalFluidPorts=true,
    nEle=10,
    HX_1=true,
    V=5.0,
    height = 2.0,
    redeclare BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1 HeatBuoyancy,
    redeclare package Medium = Medium2,
    redeclare package Medium_HX_1 = Medium1,
    redeclare package Medium_HX_2 = Medium2)
    "Solar storage"
    annotation (Placement(transformation(extent={{38,-40},{58,-20}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector(
    redeclare package Medium = Medium1,
    angleDegAzi=0,
    angleDegTil=30,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=10,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.ComercialsCollectors.FlatPlate.AgenaAZUR8plus_AC28H collectorData,
    width=10,
    height=2,
    AColData=false)
    "Solar thermal collector"
    annotation (Placement(transformation(extent={{92,-24},{112,-4}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump2(
    redeclare package Medium = Medium1,
    m_flow_nominal=0.1)
    annotation (Placement(transformation(extent={{84,-70},{64,-50}})));
  BuildingSystems.Fluid.FixedResistances.Pipe  pip4(
    redeclare package Medium = Medium1,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    length=1,
    diameter=0.02)
    "Pipe model"
    annotation (Placement(transformation(extent={{62,-4},{82,-24}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip5(
    redeclare package Medium = Medium1,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    length=1,
    diameter=0.02)
    "Pipe model"
    annotation (Placement(transformation(extent={{94,-50},{114,-70}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    rhoAmb=0.2)
    "Solar radiation transformer"
    annotation (Placement(transformation(extent={{70,8},{90,28}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature
    annotation (Placement(transformation(extent={{90,30},{98,38}})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp2(
    redeclare package Medium = Medium1,
    V_start=0.01)
    "Expansion vessel model"
    annotation (Placement(transformation(extent={{48,-58},{60,-46}})));
  Modelica.Blocks.Logical.Hysteresis control(
    uLow=1,
    uHigh=4)
    annotation (Placement(transformation(extent={{102,-44},{94,-36}})));
  Modelica.Blocks.Math.Add add(
    k1=1,
    k2=-1)
    annotation (Placement(transformation(extent={{114,-44},{106,-36}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal(
    realTrue=40.0/3600.0*collector.width*collector.height)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=180,origin={84,-40})));
equation
   connect(ambience.toSurfacePorts, building.toAmbienceSurfacesPorts) annotation (Line(
    points={{-8,56},{5,56}},
    color={0,255,0},
    smooth=Smooth.None));
  connect(ambience.toAirPorts, building.toAmbienceAirPorts) annotation (Line(
    points={{-8,48},{5,48}},
    color={85,170,255},
    smooth=Smooth.None));
  connect(ambience.TAirRef, building.TAirAmb) annotation (Line(
      points={{-24.2,59},{-26,59},{-26,64},{20.2,64},{20.2,61.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambience.xAir, building.xAirAmb) annotation (Line(
      points={{-24.2,57},{-28,57},{-28,66},{22.4,66},{22.4,61.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.airchange[1], airchange.y) annotation (Line(
      points={{23.8,56},{35.8,56}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rad.port_b,pip1.port_a) annotation (Line(
      points={{8,-12},{12,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pip2.port_a,hea.port_b) annotation (Line(
      points={{-16,-60},{-12,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hea.TSet,TSet.y) annotation (Line(
      points={{10,-54},{13.8,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pip3.port_b,val.port_a) annotation (Line(
      points={{-40,-12},{-36,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(val.port_b,rad.port_a) annotation (Line(
      points={{-16,-12},{-12,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump1.port_b, pip3.port_a) annotation (Line(
      points={{-64,-12},{-60,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pip2.port_b, pump1.port_a) annotation (Line(
      points={{-36,-60},{-90,-60},{-90,-12},{-84,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dpSet.y, pump1.dp_in) annotation (Line(
      points={{-72.2,8},{-74.2,8},{-74.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(thermostat.y,val.y) annotation (Line(
      points={{-26,13.6},{-26,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TAirSet.y,thermostat.u_s) annotation (Line(
      points={{-24.2,26},{-26,26},{-26,22.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(rad.heatPortCon, building.conHeatSourcesPorts[1]) annotation (Line(
      points={{-4,-4.8},{-4,68},{16.2,68},{16.2,62}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(building.TAir[1], thermostat.u_m) annotation (Line(
      points={{25,45},{40,45},{40,18},{-21.2,18}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TAmb.port, pip3.heatPort)
    annotation (Line(points={{-60,-40},{-50,-40},{-50,-17}}, color={191,0,0}));
  connect(TAmb.port, pip1.heatPort) annotation (Line(points={{-60,-40},{-60,-40},
          {22,-40},{22,-17}}, color={191,0,0}));
  connect(TAmb.port, pip2.heatPort) annotation (Line(points={{-60,-40},{-60,-40},
          {-26,-40},{-26,-55}}, color={191,0,0}));
  connect(pip1.port_b, storage.port_a[5]) annotation (Line(points={{32,-12},
          {38,-12},{38,-30},{41,-30}}, color={0,127,255}));
  connect(storage.port_b1, hea.port_a) annotation (Line(points={{41,-21},{36,
          -21},{36,-60},{8,-60}}, color={0,127,255}));
  connect(exp1.port_a, hea.port_a)
    annotation (Line(points={{26,-54},{26,-60},{8,-60}}, color={0,127,255}));
  connect(pip4.port_b, collector.port_a)
    annotation (Line(points={{82,-14},{92,-14}}, color={0,127,255}));
  connect(pump2.port_a, pip5.port_a)
    annotation (Line(points={{84,-60},{94,-60}}, color={0,127,255}));
  connect(pip5.port_b, collector.port_b) annotation (Line(points={{114,-60},
          {120,-60},{120,-14},{112,-14}}, color={0,127,255}));
  connect(radiation.radiationPort, collector.radiationPort) annotation (
      Line(
      points={{88,17.8},{86,17.8},{86,18},{101,18},{101,-5}},
      color={0,0,0},
      pattern=LinePattern.Solid));
  connect(ambience.IrrDirHor, radiation.IrrDirHor) annotation (
     Line(points={{-24.2,
          55},{-32,55},{-32,72},{58,72},{58,24},{72.4,24}}, color={0,0,127}));
  connect(ambience.IrrDifHor, radiation.IrrDifHor) annotation (Line(points={{-24.2,
          53},{-36,53},{-36,76},{54,76},{54,20},{72.4,20}}, color={0,0,127}));
  connect(collector.angleDegAzi, radiation.angleDegAzi) annotation (
      Line(points={{95,-23},{95,-24},{86,-24},{86,6},{70,6},{70,12},{72.4,12}},
        color={0,0,127}));
  connect(collector.angleDegTil, radiation.angleDegTil) annotation (
      Line(points={{97,-23},{97,-24},{86,-24},{86,6},{70,6},{70,16},{72.4,16}},
        color={0,0,127}));
  connect(prescribedTemperature.port, collector.heatPortCon)
    annotation (Line(points={{98,34},{107,34},{107,-5}}, color={191,0,0}));
  connect(ambience.TAirRef, prescribedTemperature.T) annotation (Line(points={{-24.2,
          59},{-40,59},{-40,80},{62,80},{62,34},{89.2,34}}, color={0,0,127}));
  connect(pip5.heatPort, TAmb.port) annotation (Line(points={{104,-65},{104,-78},
          {-50,-78},{-50,-40},{-60,-40}}, color={191,0,0}));
  connect(pip4.heatPort, TAmb.port) annotation (Line(points={{72,-19},{72,-20},{
          72,-42},{48,-42},{48,-78},{-50,-78},{-50,-40},{-60,-40}}, color={191,0,
          0}));
  connect(exp2.port_a, pump2.port_b) annotation (Line(points={{54,-58},{54,-60},{64,-60}}, color={0,127,255}));
  connect(control.u, add.y)
    annotation (Line(points={{102.8,-40},{105.6,-40}}, color={0,0,127}));
  connect(add.u2, storage.T[1]) annotation (Line(points={{114.8,-42.4},{122,
          -42.4},{122,-80},{38,-80},{38,-24.9},{40.6,-24.9}}, color={0,0,127}));
  connect(collector.TSeg[10], add.u1) annotation (Line(points={{105.2,-23.9},{122,
          -23.9},{122,-37.6},{114.8,-37.6}},      color={0,0,127}));
  connect(storage.port_HX_1_b, pump2.port_b) annotation (Line(
      points={{55,-36},{60,-36},{60,-60},{64,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_HX_1_a, pip4.port_a) annotation (Line(
      points={{55,-34},{60,-34},{60,-14},{62,-14}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(rad.heatPortRad, building.radHeatSourcesPorts[1]) annotation (Line(
      points={{0,-4.8},{0,-4.8},{0,68},{17,68},{17,62}}, color={191,0,0}));
  connect(ambience.latitudeDeg, radiation.latitudeDeg) annotation (Line(points={{
          -23,61},{-23,84},{76.2,84},{76.2,25.6}}, color={0,0,127}));
  connect(ambience.longitudeDeg, radiation.longitudeDeg) annotation (Line(points
        ={{-21,61},{-21,84},{80,84},{80,25.6}}, color={0,0,127}));
  connect(ambience.longitudeDeg0, radiation.longitudeDeg0) annotation (Line(
        points={{-19,61},{-19,84},{84,84},{84,25.6}}, color={0,0,127}));
  connect(booleanToReal.u, control.y)
      annotation (Line(points={{88.8,-40},{93.6,-40}}, color={255,0,255}));
  connect(booleanToReal.y, pump2.m_flow_in)
      annotation (Line(points={{79.6,-40},{74,-40},{74,-48}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/HeatingSystems/SolarHeatingSystem.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{140,100}}),                                                                  graphics={
    Text(extent={{-56,-54},{48,-122}}, lineColor={0,0,255}, textString="Solar heating system with a boiler as a back up energy source")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a solar thermal system which supplies a building (EnEV2014 standard)
with heating energy. A boiler add the backup energy which cannot delivered by a
solar thermal system with a collector area of 20 m2 and a solar storage with 5 m3.
</p>
</html>",
revisions="<html>
<ul>
<li>
January 15, 2021, by Christoph Nytsch-Geusen:<br/>
Valve model adapted.
</li>
<li>
August 18, 2018, by Christoph Nytsch-Geusen:<br/>
Adapted to medium BuildingSystems.Media.Anntifreeze.PropyleneGlycolWater in the solar thermal collector loop.
</li>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SolarHeatingSystem;
