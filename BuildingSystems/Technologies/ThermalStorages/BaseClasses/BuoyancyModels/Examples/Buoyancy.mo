within BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Examples;
model Buoyancy
  extends Modelica.Icons.Example;
  replaceable package Medium = BuildingSystems.Media.Water;
  replaceable BaseClasses.BuoyancyModels.Buoyancy1 buoyancyModel(nEle=2)
    constrainedby BaseClasses.BuoyancyModels.PartialBuoyancy
    annotation (Placement(transformation(extent={{0,-4},{20,16}})));
  Fluid.MixingVolumes.MixingVolume vol_TOP(
    redeclare package Medium = Medium,
    each m_flow_nominal=1,
    each nPorts=2,
    each V=0.01,
    each T_start=313.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={10,58})));
  Fluid.MixingVolumes.MixingVolume vol_BOTTOM(
    redeclare package Medium = Medium,
    each m_flow_nominal=1,
    each nPorts=2,
    each V=0.01,
    each T_start=293.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={10,-50})));
  Fluid.Sources.FixedBoundary bou(
    redeclare package Medium = Medium,
    nPorts=1)
    annotation (Placement(transformation(extent={{-40,-44},{-20,-24}})));
  Fluid.Sources.MassFlowSource_T boundary(
    redeclare package Medium = Medium,
    nPorts=1,
    use_m_flow_in = false,
    m_flow=1,
    use_T_in=true,
    T=303.15)
    annotation (Placement(transformation(extent={{-40,-94},{-20,-74}})));
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
    annotation (Placement(transformation(extent={{-80,-94},{-60,-74}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector(m=
        buoyancyModel.nEle - 1)
    annotation (Placement(transformation(extent={{20,-32},{0,-10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector1(m
      =buoyancyModel.nEle - 1)
    annotation (Placement(transformation(extent={{20,44},{0,22}})));
equation
  connect(boundary.ports[1], vol_BOTTOM.ports[1]) annotation (Line(
      points={{-20,-84},{-6,-84},{-6,-52},{1.77636e-015,-52},{1.77636e-015,-48}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_BOTTOM.ports[2], bou.ports[1]) annotation (Line(
      points={{1.77636e-015,-52},{-6,-52},{-6,-34},{-20,-34}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(boundary1.ports[1], vol_TOP.ports[1]) annotation (Line(
      points={{20,78},{28,78},{28,56},{20,56}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_TOP.ports[2], bou1.ports[1]) annotation (Line(
      points={{20,60},{20,50},{60,50}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(m_flow.y, boundary.T_in) annotation (Line(
      points={{-59,-84},{-54,-84},{-54,-80},{-42,-80}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(thermalCollector.port_b, vol_BOTTOM.heatPort) annotation (Line(
      points={{10,-32},{10,-40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector.port_a, buoyancyModel.port_a) annotation (Line(
      points={{10,-10},{10,-3}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(vol_TOP.heatPort, thermalCollector1.port_b) annotation (Line(
      points={{10,48},{10,44}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(buoyancyModel.port_b, thermalCollector1.port_a) annotation (Line(
      points={{10,15},{10,22}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/ThermalStorages/BaseClasses/BuoyancyModels/Examples/Buoyancy.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>Example that show how the buoyancy models works. </p>
<p>The simulation starts with a constant temperature at both sides of the buoyancy model block. Where temperature at the upper position (40 deg) is higher than the one at the bottom (20 deg). There is no buoyancy effect during this initial period. </p>
<p>At time = 150 sec the temperature at the bottom (<code>buoyancy.port_a</code>) start to rise till 60 deg. </p>
</html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{
            100,100}}), graphics));
end Buoyancy;
