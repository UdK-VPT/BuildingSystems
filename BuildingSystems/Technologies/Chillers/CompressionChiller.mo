within BuildingSystems.Technologies.Chillers;
model CompressionChiller
  "Simplified model of a compression chiller"
  extends BuildingSystems.Fluid.Interfaces.PartialFourPortInterface;
  extends BuildingSystems.Fluid.Interfaces.FourPortFlowResistanceParameters(
    final computeFlowResistance1=(dp1_nominal > Modelica.Constants.eps),
    final computeFlowResistance2=(dp2_nominal > Modelica.Constants.eps));
  replaceable parameter BuildingSystems.Technologies.Chillers.Data.CompressionChillers.CompressionChillerGeneral chillerData
    "Characteristic data of the chiller"
    annotation(Dialog(tab = "General"),Evaluate=true, choicesAllMatching=true);
  Modelica.SIunits.HeatFlowRate Q_flow_eva
    "Heat flow rate of the evaporator";
  Modelica.SIunits.HeatFlowRate Q_flow_con
    "Heat flow rate of the condensor";
  Real COP
    "Coefficient of performance of the chiller";
  Modelica.Blocks.Interfaces.BooleanInput on(start = false)
    annotation(Placement(transformation(extent={{-114,18},{-86,42}}),iconTransformation(extent={{-10,-10},{10,10}}, rotation=-90,origin={-40,76})));
  BuildingSystems.Fluid.MixingVolumes.MixingVolume volCon(
    nPorts=2,
    redeclare final package Medium = Medium1,
    final V=0.01,
    final m_flow_nominal=m1_flow_nominal,
    prescribedHeatFlowRate=true,
    p_start=100000,
    T_start=293.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,60})));
  BuildingSystems.Fluid.MixingVolumes.MixingVolume volEva(
    nPorts=2,
    redeclare final package Medium = Medium2,
    final V=0.01,
    final m_flow_nominal=m2_flow_nominal,
    prescribedHeatFlowRate=true,
    p_start=100000,
    T_start=293.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-60})));
  BuildingSystems.Fluid.FixedResistances.PressureDrop resCon(
    redeclare final package Medium = Medium1,
    final m_flow_nominal=m1_flow_nominal,
    final show_T=false,
    final dp_nominal=dp1_nominal)
    "Flow resistance codenser"
    annotation (Placement(transformation(extent={{-70,50},{-50,70}})));
  BuildingSystems.Fluid.FixedResistances.PressureDrop resEva(
    redeclare final package Medium = Medium2,
    final m_flow_nominal=m1_flow_nominal,
    final show_T=false,
    final dp_nominal=dp2_nominal)
    "Flow resistance evaporator"
    annotation (Placement(transformation(extent={{70,-70},{50,-50}})));
  Modelica.Blocks.Interfaces.RealInput load(min = 0.0, max = 1.0)
    annotation (Placement(transformation(extent={{-120,-20},{-80,20}}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,76})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,34})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-34})));
  BuildingSystems.Interfaces.PowerOutput P
    "Electrical power demand of the chiller"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={80,4}),  iconTransformation(extent={{-10,-10},{10,10}},origin={82,0})));
  final parameter Real eta_nominal = chillerData.TCon_nominal / (chillerData.TCon_nominal - chillerData.TEva_nominal)
    "Ideal COP under nominal conditions";
  Modelica.Blocks.Tables.CombiTable1Ds COP_nominal(
    columns={2},
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    table = chillerData.COP_nominal)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
equation
  if on == true then
    Q_flow_eva = COP * P;
    P = load * chillerData.P_nominal;
  else
    Q_flow_eva = 0.0;
    P = 0.0;
  end if;
  COP = COP_nominal.y[1] * BuildingSystems.Utilities.SmoothFunctions.softcut_upper(volEva.T / BuildingSystems.Utilities.SmoothFunctions.softcut_lower(volCon.T - volEva.T, 0.01, 0.1),30.0,0.1) / eta_nominal;
  Q_flow_con + Q_flow_eva + P = 0.0;

  prescribedHeatFlow1.Q_flow = - Q_flow_con;
  prescribedHeatFlow2.Q_flow = - Q_flow_eva;

  connect(port_a1, resCon.port_a) annotation (Line(
     points={{-100,60},{-70,60}},
    color={0,127,255}));
  connect(port_b2, volEva.ports[1]) annotation (Line(
     points={{-100,-60},{-10,-60}, {-10,-58}},
    color={0,127,255}));
  connect(port_b1, volCon.ports[1]) annotation (Line(
     points={{100,60},{10,60},{10,58}},
    color={0,127,255}));
  connect(resCon.port_b, volCon.ports[2]) annotation (Line(
     points={{-50,60},{-20,60},{-20,78},{20,78},{20,62},{10,62}},
    color={0,127,255}));
  connect(port_a2, resEva.port_a) annotation (
    Line(points={{100,-60},{86,-60},{70,-60}},
    color={0,127,255}));
  connect(resEva.port_b, volEva.ports[2]) annotation (
    Line(points={{50,-60},{20,-60},{20,-80},{-20,-80},{-20,-62},{-10,-62}},
    color={0,127,255}));
  connect(load, COP_nominal.u);
  connect(prescribedHeatFlow1.port, volCon.heatPort) annotation (Line(
    points={{0,44},{0,50}},
    color={191,0,0},
    smooth=Smooth.None));
  connect(prescribedHeatFlow2.port, volEva.heatPort) annotation (Line(
    points={{0,-44},{1.77636e-015,-44},{1.77636e-015,-50}},
    color={191,0,0},
    smooth=Smooth.None));

   annotation (defaultComponentName="chiller",
    Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}), graphics={
    Rectangle(
      extent={{-80,80},{80,-80}},
      fillColor={215,215,215},
      fillPattern=FillPattern.Solid,
      pattern=LinePattern.None),
    Rectangle(
      extent={{-91,64},{-30,54}},
      lineColor={255,255,85},
      pattern=LinePattern.None,
      fillColor={255,255,85},
      fillPattern=FillPattern.Solid),
    Rectangle(
      extent={{30,54},{98,64}},
      lineColor={0,0,255},
      pattern=LinePattern.None,
      fillColor={255,0,0},
      fillPattern=FillPattern.Solid),
    Rectangle(
      extent={{30,-56},{92,-66}},
      lineColor={0,0,255},
      pattern=LinePattern.None,
      fillColor={170,170,255},
      fillPattern=FillPattern.Solid),
    Rectangle(
      extent={{-92,-66},{-30,-56}},
      lineColor={0,0,127},
      pattern=LinePattern.None,
      fillColor={0,0,127},
      fillPattern=FillPattern.Solid),
    Polygon(
      points={{-50,0},{-64,-14},{-36,-14},{-50,0}},
      lineColor={0,0,0},
      smooth=Smooth.None,
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid),
    Polygon(
      points={{-50,0},{-64,16},{-36,16},{-50,0}},
      lineColor={0,0,0},
      smooth=Smooth.None,
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid),
    Ellipse(
      extent={{34,16},{66,-14}},
      lineColor={0,0,0},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid),
    Polygon(
      points={{50,16},{38,-8},{62,-8},{50,16}},
      lineColor={0,0,0},
      smooth=Smooth.None,
      fillColor={0,0,0},
      fillPattern=FillPattern.Solid),
    Rectangle(
      extent={{-30,-66},{30,-56}},
      lineColor={0,0,127},
      pattern=LinePattern.None,
      fillColor={0,0,255},
      fillPattern=FillPattern.Solid),
    Rectangle(
      extent={{-30,64},{30,54}},
      lineColor={0,0,255},
      pattern=LinePattern.None,
      fillColor={255,128,0},
      fillPattern=FillPattern.Solid),
    Line(
      points={{50,16},{50,54}},
      color={255,0,0},
      smooth=Smooth.None,
      thickness=1),
    Line(
      points={{-50,16},{-50,54}},
      color={255,0,0},
      smooth=Smooth.None,
      thickness=1),
    Line(
      points={{-50,-56},{-50,-14}},
      color={0,0,255},
      smooth=Smooth.None,
      thickness=1),
    Line(
      points={{50,-56},{50,-14}},
      color={85,85,255},
      smooth=Smooth.None,
      thickness=1)}));
end CompressionChiller;
