within BuildingSystems.Technologies.ThermalStorages.Examples;
model FluidStorageStratified
  extends Modelica.Icons.Example;
  replaceable package Medium = BuildingSystems.Media.Water;
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    redeclare package Medium = Medium,
    height=2.0,
    redeclare
      BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1
      HeatBuoyancy,
    HX_2=false,
    Ele_HX_1=2,
    HX_1=false,
    AdditionalFluidPorts=true,
    nEle=nEle,
    T_start(displayUnit="degC") = 333.15)
    annotation (Placement(transformation(extent={{10,-30},{50,10}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T sou2(
    redeclare package Medium = Medium,
    m_flow = 0,
    use_m_flow_in = true,
    nPorts=1,
    T=293.15) "Flow source"
    annotation (Placement(transformation(extent={{78,-48},{58,-28}})));
  BuildingSystems.Fluid.Sources.Boundary_pT sin2(
    redeclare package Medium = Medium,
    use_T_in=false,
    p(displayUnit = "Pa"),
    T = 293.15,
    nPorts=1) "Sink"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},origin={68,2})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(
    T = 298.15)
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Modelica.Blocks.Sources.Constant
                                m_flow2(k=1) "Mass flow rate"
    annotation (Placement(transformation(extent={{106,-40},{86,-20}})));
  BaseClasses.StratificationModel.PartialInletStratification
    partialInletStratification(nEle=nEle, redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-66,-20},{-46,0}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T sou1(
    redeclare package Medium = Medium,
    nPorts=1,
    use_m_flow_in=false,
    m_flow=1,
    T=323.15) "Flow source"
    annotation (Placement(transformation(extent={{-100,-18},{-80,2}})));
  parameter Integer nEle=6;
equation
  connect(sou2.m_flow_in, m_flow2.y) annotation (Line(
      points={{78,-30},{85,-30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(fixedTemperature.port, storage.heatPort) annotation (Line(
      points={{-20,60},{30,60},{30,10.8}},
      color={191,0,0},
      smooth=Smooth.None));

  connect(sou1.ports[1], partialInletStratification.port_a) annotation (Line(
      points={{-80,-8},{-72,-8},{-72,-19},{-61,-19}},
      color={0,127,255},
      smooth=Smooth.None));

  connect(storage.port_a2, sin2.ports[1]) annotation (Line(
      points={{44,8},{52,8},{52,2},{58,2}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(storage.port_b2, sou2.ports[1]) annotation (Line(
      points={{44,-28},{50,-28},{50,-38},{58,-38}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(partialInletStratification.port_b_bot, storage.port_a1) annotation (
      Line(
      points={{-47,-19},{-8,-19},{-8,-28},{16,-28}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(partialInletStratification.port_b_top, storage.port_b1) annotation (
      Line(
      points={{-47,-1},{-2,-1},{-2,8},{16,8}},
      color={0,127,255},
      smooth=Smooth.None));
  for i in 1:nEle-2 loop
    connect(partialInletStratification.ports_b[i], storage.port_a[i]) annotation (Line(points={{-47,-10},{16,-10}},color={0,127,255},smooth=Smooth.None));
  end for;
  connect(partialInletStratification.T, storage.T) annotation (Line(
      points={{-56,0},{-56,16},{-18,16},{-18,-4},{2,-4},{2,2},{15.2,2}},
      color={0,0,127},
      smooth=Smooth.None));
  annotation (    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/ThermalStorages/Examples/FluidStorageStratified.mos"
        "Simulate and plot"));
end FluidStorageStratified;
