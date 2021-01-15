within BuildingSystems.Applications.HeatingSystems;
model HeatPumpHeatingSystem
  "Water heating system"
  extends Modelica.Icons.Example;
  package Medium1 = BuildingSystems.Media.Water;
  package Medium2 = BuildingSystems.Media.Air;
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
    BCWall1=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambience,
    BCWall2=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambience,
    BCWall3=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambience,
    BCWall4=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambience,
    BCCeiling=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Ambience)
    "Building model"
    annotation (Placement(transformation(extent={{4,42},{24,62}})));
  Modelica.Blocks.Sources.Constant airchange(
    k=0.5)
    "Mean air change rate of the building"
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={38,56})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium1,
    V_start=0.01)
    "Expansion vessel model"
    annotation (Placement(transformation(extent={{24,-54},{36,-42}})));
  BuildingSystems.Fluid.FixedResistances.Pipe  pip1(
    redeclare package Medium = Medium1,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    length=1,
    diameter=0.02)
    "Pipe model"
    annotation (Placement(transformation(extent={{12,-2},{32,-22}})));
  Fluid.HeatPumps.Carnot_TCon heaPum(
    redeclare package Medium1 = Medium1,
    redeclare package Medium2 = Medium2,
    QCon_flow_nominal=5000,
    use_eta_Carnot_nominal=false,
    COP_nominal=3.0,
    dp1_nominal=1000,
    dp2_nominal=1000,
    TCon_nominal=308.15,
    TEva_nominal=275.15,
    QCon_flow_max=5000)
    "Heat pump model"
    annotation (Placement(transformation(extent={{12,-76},{-8,-56}})));
  BuildingSystems.Fluid.HeatExchangers.Radiators.RadiatorEN442_2 rad(
    redeclare package Medium = Medium1,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=1000.0,
    Q_flow_nominal=12000.0,
    VWat=0.005,
    mDry=0.0001,
    nEle=5,
    fraRad=0.5,
    TAir_nominal=273.15 + 20.0,
    n=1.3,
    T_a_nominal=273.15 + 60.0,
    T_b_nominal=273.15 + 40.0)
    "Radiator model"
    annotation (Placement(transformation(extent={{-12,-22},{8,-2}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pip2(
    redeclare package Medium = Medium1,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    length=1)
    "Pipe model"
    annotation (Placement(transformation(extent={{-16,-70},{-36,-50}})));
  Modelica.Blocks.Sources.Constant TSet(k=273.15 + 35.0)
    annotation (Placement(transformation(extent={{22,-56},{18,-52}})));
  Fluid.FixedResistances.Pipe pip3(
    redeclare package Medium = Medium1,
    m_flow_nominal=m_flow_nominal,
    nNodes=2,
    thicknessIns=0.02,
    lambdaIns=0.04,
    diameter=0.02,
    length=1)
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
  BuildingSystems.Fluid.Movers.FlowControlled_dp pump(
    redeclare package Medium = Medium1,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-84,-22},{-64,-2}})));
  Modelica.Blocks.Sources.Constant dpSet(
    k=150000.0)
    "Set pressure for the pump model"
    annotation (Placement(transformation(extent={{-68,6},{-72,10}})));
  Modelica.Blocks.Sources.Constant TAirSet(
    k=273.15 + 20.0)
    "Heating set temperature"
    annotation (Placement(transformation(extent={{-20,24},{-24,28}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TAmb(
    each T=293.15)
    annotation (Placement(transformation(extent={{-72,-46},{-60,-34}})));
  Fluid.Sources.MassFlowSource_T m_flow_eva(
    redeclare package Medium = Medium2,
    nPorts=1,
    m_flow=0.5,
    use_T_in=true)
    annotation (Placement(transformation(extent={{24,-76},{16,-68}})));
  Fluid.Sources.Boundary_pT bou_pT(
    redeclare package Medium = Medium2,
    nPorts=1,
    p=99999,
    T=293.15)
    annotation (Placement(transformation(extent={{4,-4},{-4,4}},rotation=180,origin={-16,-72})));
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
      points={{-25,59},{-26,59},{-26,64},{20.2,64},{20.2,61.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambience.xAir, building.xAirAmb) annotation (Line(
      points={{-25,57},{-28,57},{-28,66},{22.4,66},{22.4,61.8}},
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
  connect(heaPum.TSet, TSet.y) annotation (Line(
      points={{14,-57},{14,-56},{18,-56},{18,-54},{17.8,-54}},
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
  connect(exp.port_a,pip1. port_b) annotation (Line(
      points={{30,-54},{30,-60},{38,-60},{38,-12},{32,-12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(rad.heatPortCon, building.conHeatSourcesPorts[1]) annotation (Line(
      points={{-4,-4.8},{-4,68},{14,68},{14,62}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(building.TAir[1], thermostat.u_m) annotation (Line(
      points={{33,45},{40,45},{40,18},{-21.2,18}},
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

  connect(pip2.port_a, heaPum.port_b1) annotation (Line(points={{-16,-60},{-12,-60},
          {-8,-60}}, color={0,127,255}));
  connect(heaPum.port_a1, pip1.port_b) annotation (Line(points={{12,-60},{38,-60},
          {38,-12},{32,-12}}, color={0,127,255}));
  connect(heaPum.port_b2, m_flow_eva.ports[1])
    annotation (Line(points={{12,-72},{14,-72},{16,-72}}, color={0,127,255}));
  connect(bou_pT.ports[1], heaPum.port_a2) annotation (Line(points={{-12,-72},{-10,
          -72},{-8,-72}}, color={0,127,255}));
  connect(ambience.TAirRef, m_flow_eva.T_in) annotation (Line(points={{-25,59},{-32,
          59},{-32,70},{56,70},{56,-70.4},{24.8,-70.4}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/HeatingSystems/HeatPumpHeatingSystem.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={Text(extent={{-56,-54},{48,-122}}, lineColor={0,0,255},
      textString="Warm water heating system with an air/water heat pump")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a warm water heating system for a building. The system
works with a constant supply temperature from an air/water heat pump of 35 degree Celsius,
the mass flow of the heating loop is controlled by a valve related
to the necessary heating demand of the building
for a set temperature of 20 degree Celsius.
</p>
</html>",
revisions="<html>
<ul>
<li>
January 15, 2021, by Christoph Nytsch-Geusen:<br/>
Valve model adapted.
</li>
<li>
April 25, 2017, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end HeatPumpHeatingSystem;
