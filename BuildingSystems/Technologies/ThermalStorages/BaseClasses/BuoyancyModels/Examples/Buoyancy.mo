within BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Examples;
model Buoyancy
  extends Modelica.Icons.Example;
  replaceable package Medium = BuildingSystems.Media.Water;
  replaceable BaseClasses.BuoyancyModels.Buoyancy1 buoyancyModel(nEle=2)
    constrainedby BaseClasses.BuoyancyModels.PartialBuoyancy
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  Fluid.MixingVolumes.MixingVolume vol_TOP(
    redeclare package Medium = Medium,
    each m_flow_nominal=1,
    each nPorts=2,
    each V=0.01,
    each T_start=313.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={10,50})));
  Fluid.MixingVolumes.MixingVolume vol_BOTTOM(
    redeclare package Medium = Medium,
    each m_flow_nominal=1,
    each nPorts=2,
    each V=0.01,
    each T_start=293.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={10,-36})));
  Fluid.Sources.FixedBoundary bou(
    redeclare package Medium = Medium,
    nPorts=1)
    annotation (Placement(transformation(extent={{-40,-30},{-20,-10}})));
  Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Medium,
    nPorts=1,
    use_m_flow_in = false,
    m_flow=1,
    use_T_in=true,
    T=303.15)
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Fluid.Sources.FixedBoundary bou1(
    redeclare package Medium = Medium,
    nPorts=1)
    annotation (Placement(transformation(extent={{80,40},{60,60}})));
  Fluid.Sources.MassFlowSource_T boundary1(
    redeclare package Medium = Medium,
    nPorts=1,
    use_m_flow_in = false,
    m_flow=1,
    T=313.15)
    annotation (Placement(transformation(extent={{0,68},{20,88}})));
  Modelica.Blocks.Sources.Ramp m_flow(
    height=40,
    duration=150,
    offset=273.15 + 20,
    startTime=150) "Mass flow rate"
    annotation (Placement(transformation(extent={{-80,-80},{-60,-60}})));
equation
  connect(buoyancyModel.port_a[1], vol_BOTTOM.heatPort) annotation (Line(
      points={{10,1},{10,-26}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(buoyancyModel.port_b[1], vol_TOP.heatPort) annotation (Line(
      points={{10,19},{10,40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(boundary.ports[1], vol_BOTTOM.ports[1]) annotation (Line(
      points={{-20,-70},{-6,-70},{-6,-38},{1.77636e-015,-38},{1.77636e-015,-34}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_BOTTOM.ports[2], bou.ports[1]) annotation (Line(
      points={{1.77636e-015,-38},{-6,-38},{-6,-20},{-20,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(boundary1.ports[1], vol_TOP.ports[1]) annotation (Line(
      points={{20,78},{40,78},{40,48},{20,48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_TOP.ports[2], bou1.ports[1]) annotation (Line(
      points={{20,52},{20,50},{60,50}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(m_flow.y, boundary.T_in) annotation (Line(
      points={{-59,-70},{-54,-70},{-54,-66},{-42,-66}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation (    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/ThermalStorages/BaseClasses/BuoyancyModels/Examples/Buoyancy.mos" "Simulate and plot"));
end Buoyancy;
