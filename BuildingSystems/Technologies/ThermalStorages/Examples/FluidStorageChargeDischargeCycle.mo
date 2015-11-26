within BuildingSystems.Technologies.ThermalStorages.Examples;
model FluidStorageChargeDischargeCycle
  "Model to show use of temperature sensor (output signal T)"
  extends Modelica.Icons.Example;
  replaceable package Medium = BuildingSystems.Media.Water;
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    redeclare package Medium = Medium,
    height=2.0,
    redeclare
      BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1
      HeatBuoyancy,
    HX_2=false,
    HX_1=true,
    Ele_HX_1=3,
    T_start(displayUnit="degC") = 353.15,
    UA_HX_1=500.0,
    AdditionalFluidPorts=false,
    nEle=6) annotation (Placement(transformation(extent={{-50,-46},{-10,-6}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T heatSource(
    redeclare package Medium = Medium,
    nPorts = 1,
    m_flow = 0,
    use_m_flow_in = true,
    T = 353.15) "Flow source"
    annotation (Placement(transformation(extent={{40,-60},{20,-40}})));
  BuildingSystems.Fluid.Sources.Boundary_pT sink_heating(
    redeclare package Medium = Medium,
    use_T_in=false,
    p(displayUnit="Pa"),
    nPorts=1,
    T=293.15) "Sink" annotation (Placement(transformation(extent={{10,-10},{-10,
            10}}, origin={10,-20})));
  Modelica.Blocks.Sources.TimeTable consumptionProfile(
    table=[0,0.0; 25200,0.0;25200,0.5; 27000,0.3; 27000,0; 72000,0; 72000,0.5; 73800,0.5; 73800,0; 86400,0.0])
    "Mass flow rate"
    annotation (Placement(transformation(extent={{40,-90},{20,-70}})));
  BuildingSystems.Fluid.Sources.Boundary_pT sink_consumption(
    redeclare package Medium = Medium,
    use_T_in=false,
    p(displayUnit="Pa"),
    nPorts=1,
    T=293.15) "Sink" annotation (Placement(transformation(extent={{-10,-10},{10,
            10}}, origin={-70,6})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T source_consumption(
    redeclare package Medium = Medium,
    nPorts=1,
    m_flow=0.0,
    use_m_flow_in=true,
    T=298.15) "Flow source"
    annotation (Placement(transformation(extent={{-16,-98},{-36,-78}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature boundaryCondition_FixedT(
    T=298.15)
    annotation (Placement(transformation(extent={{20,0},{0,20}})));
  Modelica.Blocks.Logical.Switch m_flowSignal
    annotation (Placement(transformation(extent={{0,58},{20,78}})));
  Modelica.Blocks.Logical.OnOffController logicControl(
    bandwidth=5)
    annotation (Placement(transformation(extent={{-52,58},{-32,78}})));
  Modelica.Blocks.Sources.RealExpression setTemperature(
    y=273.15 + 65)
    annotation (Placement(transformation(extent={{-96,70},{-76,90}})));
  Modelica.Blocks.Sources.RealExpression m_flowOn(
    y=0.1)
    annotation (Placement(transformation(extent={{-40,80},{-20,100}})));
  Modelica.Blocks.Sources.RealExpression m_flowOff(
    y=0)
    annotation (Placement(transformation(extent={{-40,34},{-20,54}})));
equation
  connect(source_consumption.ports[1], storage.port_a1) annotation (Line(
      points={{-36,-88},{-44,-88},{-44,-44}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_HX_1_a, heatSource.ports[1]) annotation (Line(
      points={{-16,-34},{0,-34},{0,-50},{20,-50}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sink_heating.ports[1], storage.port_HX_1_b) annotation (Line(
      points={{0,-20},{-16,-20},{-16,-38}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sink_consumption.ports[1], storage.port_b1) annotation (Line(
      points={{-60,6},{-60,-8},{-44,-8}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(boundaryCondition_FixedT.port, storage.heatPort) annotation (Line(
      points={{0,10},{-30,10},{-30,-5.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(logicControl.y, m_flowSignal.u2) annotation (Line(
      points={{-31,68},{-2,68}},
      color={255,0,255},
      smooth=Smooth.None));
  connect(m_flowOn.y, m_flowSignal.u1) annotation (Line(
      points={{-19,90},{-12,90},{-12,76},{-2,76}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(m_flowOff.y, m_flowSignal.u3) annotation (Line(
      points={{-19,44},{-10,44},{-10,60},{-2,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(m_flowSignal.y, heatSource.m_flow_in) annotation (Line(
      points={{21,68},{60,68},{60,-42},{40,-42}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(setTemperature.y, logicControl.reference) annotation (Line(
      points={{-75,80},{-66,80},{-66,74},{-54,74}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(storage.T[3], logicControl.u) annotation (Line(
      points={{-44.8,-14.3333},{-88,-14.3333},{-88,62},{-54,62}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(source_consumption.m_flow_in, consumptionProfile.y) annotation (Line(
      points={{-16,-80},{19,-80}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation (    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/ThermalStorages/Examples/FluidStorageChargeDischargeCycle.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>Discharges warm storage <span style=\"font-family: MS Shell Dlg 2;\">twice </span>into sink, while refilling cold water at the bottom.</p>
<p>Temperature drop at middle layer triggers reheating by bottom heat exchanger, repeatedly due to heat loss via surface.</p>
</html>"),
    experiment(StopTime=200000));
end FluidStorageChargeDischargeCycle;
