within BuildingSystems.Applications.HeatingSystems;
model SolarHeatingSystem
  "Solar heating system"
  extends Modelica.Icons.Example;
  package Medium = BuildingSystems.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal= 0.1;
  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient,
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile)
    "Ambient model"
    annotation (Placement(transformation(extent={{-26,42},{-6,62}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D building(
    AAmb=2*(2*10+2*6.0)*2.8+10.0*6.0,
    AInn=10*10,
    AGro=10*10,
    nWindows=1,
    AWin={2*3},
    VAir=2*10.0*6.0*2.8,
    CAmb=100000,
    CInn=100000,
    CGro=100000,
    UValAmb=0.2,
    UValInn=1.0,
    UValGro=0.2,
    calcIdealLoads=false,
    heatSources=true,
    nHeatSources=1,
    show_TAir=true)
    "Building model"
    annotation (Placement(transformation(extent={{4,42},{24,62}})));
  Modelica.Blocks.Sources.Constant airchange(
    k=0.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={38,56})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp1(
    redeclare package Medium = Medium, V_start=0.1)
    "Expansion vessel model"
    annotation (Placement(transformation(extent={{20,-54},{32,-42}})));
  BuildingSystems.Fluid.FixedResistances.Pipe  pip1(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    length=1,
    diameter=0.02)
    "Pipe model"
    annotation (Placement(transformation(extent={{12,-2},{32,-22}})));
  BuildingSystems.Fluid.HeatExchangers.HeaterCooler_T hea(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=10.0)
    "Boiler model"
    annotation (Placement(transformation(extent={{8,-70},{-12,-50}})));
  BuildingSystems.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 rad(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    Q_flow_nominal=4000.0,
    VWat=0.005,
    mDry=0.0001,
    nEle=5,
    fraRad=0.5,
    T_a_nominal=273.15 + 90.0,
    T_b_nominal=273.15 + 70,
    TAir_nominal=273.15 + 20.0,
    n=1.3,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial)
    "radiator model"
    annotation (Placement(transformation(extent={{-12,-22},{8,-2}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip2(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    length=1)
    "Pipe model"
    annotation (Placement(transformation(extent={{-16,-70},{-36,-50}})));
  Modelica.Blocks.Sources.Constant TSet(k=273.15 + 60.0)
    annotation (Placement(transformation(extent={{18,-56},{14,-52}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip3(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=1)
    "Pipe model"
    annotation (Placement(transformation(extent={{-60,-2},{-40,-22}})));
  BuildingSystems.Fluid.Actuators.Valves.Data.Generic datVal(
    y={0,0.1667,0.3333,0.5,0.6667,1},
    phi={0, 0.19, 0.35, 0.45, 0.5, 0.65}/0.65)
    "Valve characteristics"
    annotation (Placement(transformation(extent={{-80,22},{-60,42}})));
  BuildingSystems.Fluid.Actuators.Valves.TwoWayTable val(
    redeclare package Medium = Medium,
    filteredOpening=false,
    from_dp=true,
    flowCharacteristics=datVal,
    CvData=BuildingSystems.Fluid.Types.CvTypes.Kv,
    Kv=0.65,
    m_flow_nominal=m_flow_nominal)
    "Valve model with opening characteristics based on a table"
    annotation (Placement(transformation(extent={{-36,-22},{-16,-2}})));
  Modelica.Blocks.Continuous.LimPID thermostat(
    k=0.5,
    controllerType=Modelica.Blocks.Types.SimpleController.P,
    yMax=1.0,
    yMin=0.0,
    wp=1.0)
    "Thermostat, modelled by a limeted p-controller"
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=90,origin={-26,18})));
  BuildingSystems.Fluid.Movers.FlowControlled_dp pump1(
    redeclare package Medium =Medium, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-84,-22},{-64,-2}})));
  Modelica.Blocks.Sources.Constant dpSet(
    k=12000.0)
    "Set presure for the pump model"
    annotation (Placement(transformation(extent={{-68,6},{-72,10}})));
  Modelica.Blocks.Sources.Constant TAirSet(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-20,24},{-24,28}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TAmb(
    each T=293.15)
    annotation (Placement(transformation(extent={{-72,-46},{-60,-34}})));
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    HX_2=false,
    AdditionalFluidPorts=true,
    nEle=10,
    HX_1=true,
    V=1.0,
    height = 2.0,
    redeclare BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1 HeatBuoyancy,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{38,-40},{58,-20}})));
  BuildingSystems.Technologies.SolarThermal.ThermalCollector collector(
    redeclare package Medium = Medium,
    angleDegAzi=0,
    angleDegTil=30,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=10,
    redeclare BuildingSystems.Technologies.SolarThermal.Data.Collectors.ComercialsCollectors.FlatPlate.AgenaAZUR8plus_AC28H collectorData)
    annotation (Placement(transformation(extent={{92,-24},{112,-4}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pump2(redeclare package Medium = Medium,
    m_flow_nominal=0.1)
    annotation (Placement(transformation(extent={{84,-70},{64,-50}})));
  BuildingSystems.Fluid.FixedResistances.Pipe  pip4(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    length=1,
    diameter=0.02)
    "Pipe model"
    annotation (Placement(transformation(extent={{62,-4},{82,-24}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip5(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    length=1,
    diameter=0.02)
    "Pipe model"
    annotation (Placement(transformation(extent={{94,-50},{114,-70}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky
    radiation(
    rhoAmb=0.2,
    latitudeDeg=13,
    longitudeDeg=53,
    longitudeDeg0=53)
    annotation (Placement(transformation(extent={{70,8},{90,28}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature
    prescribedTemperature
    annotation (Placement(transformation(extent={{90,30},{98,38}})));
  Modelica.Blocks.Sources.Constant const(
    k=0.02)
    annotation (Placement(transformation(extent={{92,-36},{88,-32}})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp2(
    redeclare package Medium = Medium,
    V_start=0.1)
    "Expansion vessel model"
    annotation (Placement(transformation(extent={{48,-58},{60,-46}})));
  Modelica.Blocks.Logical.Hysteresis control(
    uLow=1,
    uHigh=4)
    annotation (Placement(transformation(extent={{102,-44},{94,-36}})));
  Modelica.Blocks.Logical.Switch switch1
    annotation (Placement(transformation(extent={{84,-44},{76,-36}})));
  Modelica.Blocks.Sources.Constant const1(
    k=0.0)
    annotation (Placement(transformation(extent={{92,-48},{88,-44}})));
  Modelica.Blocks.Math.Add add(
    k1=1,
    k2=-1)
    annotation (Placement(transformation(extent={{114,-44},{106,-36}})));
equation
   connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts) annotation (Line(
    points={{-8,56},{5,56}},
    color={0,255,0},
    smooth=Smooth.None));
  connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
    points={{-8,48},{5,48}},
    color={85,170,255},
    smooth=Smooth.None));
  connect(ambient.TAirRef, building.TAirAmb) annotation (Line(
      points={{-24.2,59},{-26,59},{-26,64},{20.2,64},{20.2,61.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient.xAir, building.xAirAmb) annotation (Line(
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
  connect(ambient.IrrDirHor, radiation.IrrDirHor) annotation (
     Line(points={{-24.2,
          55},{-32,55},{-32,72},{58,72},{58,24},{72.4,24}}, color={0,0,127}));
  connect(ambient.IrrDifHor, radiation.IrrDifHor) annotation (Line(points={{-24.2,
          53},{-36,53},{-36,76},{54,76},{54,20},{72.4,20}}, color={0,0,127}));
  connect(collector.angleDegAzi, radiation.angleDegAzi) annotation (
      Line(points={{95,-23},{95,-24},{86,-24},{86,6},{70,6},{70,12},{72.4,12}},
        color={0,0,127}));
  connect(collector.angleDegTil, radiation.angleDegTil) annotation (
      Line(points={{97,-23},{97,-24},{86,-24},{86,6},{70,6},{70,16},{72.4,16}},
        color={0,0,127}));
  connect(prescribedTemperature.port, collector.heatPortCon)
    annotation (Line(points={{98,34},{107,34},{107,-5}}, color={191,0,0}));
  connect(ambient.TAirRef, prescribedTemperature.T) annotation (Line(points={{-24.2,
          59},{-40,59},{-40,80},{62,80},{62,34},{89.2,34}}, color={0,0,127}));
  connect(pip5.heatPort, TAmb.port) annotation (Line(points={{104,-65},{104,-78},
          {-50,-78},{-50,-40},{-60,-40}}, color={191,0,0}));
  connect(pip4.heatPort, TAmb.port) annotation (Line(points={{72,-19},{72,-20},{
          72,-42},{48,-42},{48,-78},{-50,-78},{-50,-40},{-60,-40}}, color={191,0,
          0}));
  connect(exp2.port_a, pump2.port_b) annotation (Line(points={{54,-58},{54,-60},{64,-60}}, color={0,127,255}));
  connect(switch1.y, pump2.m_flow_in) annotation (Line(points={{75.6,-40},{74.2,
          -40},{74.2,-48}}, color={0,0,127}));
  connect(const.y, switch1.u1) annotation (Line(points={{87.8,-34},{84.8,-34},{84.8,
          -36.8}}, color={0,0,127}));
  connect(const1.y, switch1.u3) annotation (Line(points={{87.8,-46},{84.8,-46},{
          84.8,-43.2}}, color={0,0,127}));
  connect(switch1.u2, control.y)
    annotation (Line(points={{84.8,-40},{93.6,-40}}, color={255,0,255}));
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

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/HeatingSystems/SolarHeatingSystem.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{140,100}}),                                                                  graphics={
    Text(extent={{-56,-54},{48,-122}}, lineColor={0,0,255}, textString="Solar heating system with simplified thermal building model")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a solar thermal system which supplies a building with heating energy.
A boiler add the backup energy which cannot delivered by the solar collector.
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
end SolarHeatingSystem;
