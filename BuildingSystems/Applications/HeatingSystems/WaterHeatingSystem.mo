within BuildingSystems.Applications.HeatingSystems;
model WaterHeatingSystem
  "Water heating system"
  extends Modelica.Icons.Example;
  package Medium = BuildingSystems.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal= 0.05;
  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient,
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile)
    "Ambient model"
    annotation (Placement(transformation(extent={{-26,42},{-6,62}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D building(
    AAmb=4*10*2.5+10*10,
    AInn=10*10,
    AGro=10*10,
    nWindows=1,
    AWin={2*3},
    VAir=10*10*2.5,
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
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium,
    V_start=0.1)
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
    Q_flow_nominal=2000.0,
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
  Fluid.FixedResistances.Pipe pip3(
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
  BuildingSystems.Fluid.Movers.FlowControlled_dp pump(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-84,-22},{-64,-2}})));
  Modelica.Blocks.Sources.Constant dpSet(k=12000.0)
    "Set presure for the pump model"
    annotation (Placement(transformation(extent={{-68,6},{-72,10}})));
  Modelica.Blocks.Sources.Constant TAirSet(k=273.15 + 22.0)
    annotation (Placement(transformation(extent={{-20,24},{-24,28}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TAmb(each T=293.15)
    annotation (Placement(transformation(extent={{-72,-46},{-60,-34}})));
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
  connect(rad.port_b,pip1. port_a) annotation (Line(
      points={{8,-12},{12,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pip2.port_a,hea. port_b) annotation (Line(
      points={{-16,-60},{-12,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hea.TSet,TSet. y) annotation (Line(
      points={{10,-54},{13.8,-54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pip3.port_b,val. port_a) annotation (Line(
      points={{-40,-12},{-36,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(val.port_b,rad. port_a) annotation (Line(
      points={{-16,-12},{-12,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pump.port_b,pip3. port_a) annotation (Line(
      points={{-64,-12},{-60,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pip2.port_b,pump. port_a) annotation (Line(
      points={{-36,-60},{-90,-60},{-90,-12},{-84,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(dpSet.y,pump. dp_in) annotation (Line(
      points={{-72.2,8},{-74.2,8},{-74.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(thermostat.y,val. y) annotation (Line(
      points={{-26,13.6},{-26,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TAirSet.y,thermostat. u_s) annotation (Line(
      points={{-24.2,26},{-26,26},{-26,22.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hea.port_a,pip1. port_b) annotation (Line(
      points={{8,-60},{38,-60},{38,-12},{32,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(exp.port_a,pip1. port_b) annotation (Line(
      points={{26,-54},{26,-60},{38,-60},{38,-12},{32,-12}},
      color={0,127,255},
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
  connect(rad.heatPortRad, building.radHeatSourcesPorts[1]) annotation (Line(
     points={{0,-4.8},{0,-4.8},{0,68},{17,68},{17,62}}, color={191,0,0}));

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/HeatingSystems/WaterHeatingSystem.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(extent={{-56,-54},{48,-122}}, lineColor={0,0,255},
    textString="Warm water heating system with simplified thermal building model")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a warm water heating system for a building. The system
works with a constant supply temperature, the mass flow of the heating loop
is controlled by a valve related to the necessary heating demand of the building.
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
end WaterHeatingSystem;
