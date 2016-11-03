within BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.BaseClasses;
model ExternalIdealHeater
  extends BuildingSystems.Fluid.Interfaces.PartialTwoPortInterface;
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a Q_flowHea
    annotation (Placement(transformation(extent={{-10,90},{10,110}})));
  Modelica.Blocks.Interfaces.RealInput Q_in
    annotation (Placement(transformation(extent={{-128,30},{-88,70}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow(
    T_ref=343.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={30,70})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1(
    T_ref=273.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={30,28})));
  Modelica.Blocks.Math.Gain gain(
    k=-1)
    annotation (Placement(transformation(extent={{10,40},{20,50}})));
  Modelica.Blocks.Math.Feedback feedback
    annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
  BuildingSystems.Interfaces.Temp_KInput TDHNMin
    annotation (Placement(transformation(extent={{-130,-90},{-90,-50}})));
  Modelica.Blocks.Math.Product product
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Blocks.Math.Gain Q_flowMax(k=4182)
    annotation (Placement(transformation(extent={{60,-54},{80,-34}})));
  BuildingSystems.Fluid.MixingVolumes.MixingVolume vol(
    m_flow_nominal=1,
    nPorts=2,
    redeclare package Medium = Medium,
    V=1)
    annotation (Placement(transformation(extent={{60,0},{80,20}})));
  BuildingSystems.Fluid.Sensors.TemperatureTwoPort senTem(
    m_flow_nominal=1,
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  BuildingSystems.Fluid.Sensors.MassFlowRate senMasFlo(
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Nonlinear.VariableLimiter variableLimiter
    annotation (Placement(transformation(extent={{-30,40},{-10,60}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-50,30},{-40,40}})));
  Modelica.Blocks.Math.Max max
    annotation (Placement(transformation(extent={{20,-54},{40,-34}})));
equation
  connect(gain.y, prescribedHeatFlow1.Q_flow)
    annotation (Line(points={{20.5,45},{30,45},{30,38}},color={0,0,127}));
  connect(feedback.y, product.u2) annotation (Line(points={{-41,-50},{-32,-50},
          {-32,-56},{-22,-56}}, color={0,0,127}));
  connect(TDHNMin, feedback.u2) annotation (Line(points={{-110,-70},{-82,-70},{
          -50,-70},{-50,-58}}, color={0,0,127}));
  connect(prescribedHeatFlow1.port, vol.heatPort)
    annotation (Line(points={{30,18},{30,10},{60,10}}, color={191,0,0}));
  connect(port_a, senTem.port_a)
    annotation (Line(points={{-100,0},{-60,0}}, color={0,127,255}));
  connect(senTem.port_b, senMasFlo.port_a)
    annotation (Line(points={{-40,0},{-10,0}}, color={0,127,255}));
  connect(senTem.T, feedback.u1) annotation (Line(points={{-50,11},{-50,20},{
          -70,20},{-70,-50},{-58,-50}}, color={0,0,127}));
  connect(senMasFlo.port_b, vol.ports[1])
    annotation (Line(points={{10,0},{34,0},{68,0}}, color={0,127,255}));
  connect(vol.ports[2], port_b)
    annotation (Line(points={{72,0},{72,0},{100,0}}, color={0,127,255}));
  connect(Q_flowHea, prescribedHeatFlow.port) annotation (Line(points={{0,100},
          {0,90},{30,90},{30,80}}, color={191,0,0}));
  connect(variableLimiter.y, gain.u)
    annotation (Line(points={{-9,50},{0,50},{0,45},{9,45}}, color={0,0,127}));
  connect(variableLimiter.y, prescribedHeatFlow.Q_flow) annotation (Line(points=
         {{-9,50},{-2,50},{0,50},{0,54},{30,54},{30,60}}, color={0,0,127}));
  connect(Q_flowMax.y, variableLimiter.limit1) annotation (Line(points={{81,-44},
          {88,-44},{88,84},{-40,84},{-40,58},{-32,58}}, color={0,0,127}));
  connect(variableLimiter.limit2, const.y) annotation (Line(points={{-32,42},{
          -36,42},{-36,35},{-39.5,35}}, color={0,0,127}));
  connect(senMasFlo.m_flow, product.u1) annotation (Line(points={{0,11},{0,22},
          {-28,22},{-28,-44},{-22,-44}}, color={0,0,127}));
  connect(Q_in, variableLimiter.u) annotation (Line(
      points={{-108,50},{-32,50}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(max.u2, product.y)
    annotation (Line(points={{18,-50},{10,-50},{1,-50}}, color={0,0,127}));
  connect(const.y, max.u1)
    annotation (Line(points={{-39.5,35},{18,35},{18,-38}}, color={0,0,127}));
  connect(max.y, Q_flowMax.u)
    annotation (Line(points={{41,-44},{48,-44},{58,-44}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
    -100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
    100}}), graphics={Rectangle(extent={{-100,100},{100,-100}},
    lineColor={0,0,255})}),
    Documentation(info="<html>
    <p>
    The model recieves an input signal <code>Q_in</code> which is the heat flow rate that has to be extracted from the fluid. Before the heat flow rate is extracted, the input signal passes through  a limiter block with an upper and lower limit.
    </p>
    <p>
    The upper limit ensures that the return temperature does not drops down to a value under a minimum temperature <code>TDHNMin</code> defined from outside.
    </p>
    <p>
    The lower limit is in general set to 0 in order to avoid the block to cool the fluid.
    </p>
    </html>"));
end ExternalIdealHeater;
