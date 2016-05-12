within BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes;
model ParallelPipes
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium in the component";
  extends BuildingSystems.Fluid.Interfaces.PartialFourPort(final allowFlowReversal1 = allowFlowReversal,final allowFlowReversal2 = allowFlowReversal,redeclare
    package Medium1 =Medium, redeclare package Medium2 =  Medium);
  BuildingSystems.Fluid.FixedResistances.Pipe pipSupply(
    redeclare package Medium = Medium,
    p_start=p_start,
    T_start=T_start,
    allowFlowReversal=allowFlowReversal,
    m_flow_nominal=m_flow_nominal,
    from_dp=from_dp,
    linearizeFlowResistance=linearizeFlowResistance,
    deltaM=deltaM,
    nNodes=nNodes,
    length=length,
    ReC=ReC,
    useMultipleHeatPorts=true,
    dp_nominal=dp_nominal,
    thicknessIns=Umodel.th_ins,
    lambdaIns=Umodel.lam_ins,
    diameter=Umodel.d_i,
    useExternalHeatSource=true)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  BuildingSystems.Fluid.FixedResistances.Pipe pipReturn(
    redeclare package Medium = Medium,
    p_start=p_start,
    T_start=T_start,
    allowFlowReversal=allowFlowReversal,
    m_flow_nominal=m_flow_nominal,
    from_dp=from_dp,
    dp_nominal=dp_nominal,
    linearizeFlowResistance=linearizeFlowResistance,
    deltaM=deltaM,
    nNodes=nNodes,
    length=length,
    ReC=ReC,
    useMultipleHeatPorts=true,
    thicknessIns=Umodel.th_ins,
    lambdaIns=Umodel.lam_ins,
    diameter=Umodel.d_i,
    useExternalHeatSource=true)
    annotation (Placement(transformation(extent={{10,-50},{-10,-70}})));
  parameter Integer nNodes=1
    "Number of volume segments";
  parameter Modelica.SIunits.Length length
    "Length of the pipe";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.Media.Interfaces.Types.AbsolutePressure p_start=Medium.p_default
    "Start value of pressure"
    annotation(Dialog(tab = "Initialitzation"));
  parameter Modelica.Media.Interfaces.Types.Temperature T_start=Medium.T_default
    "Start value of temperature"
    annotation(Dialog(tab = "Initialitzation"));
  parameter Boolean allowFlowReversal=true
    "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)"
    annotation (Dialog(tab="Assumptions"));
  parameter Boolean from_dp=false
    "= true, use m_flow = f(dp) else dp = f(m_flow)"
    annotation (Dialog(tab="Flow resistance"));
  parameter Boolean linearizeFlowResistance=false
    "= true, use linear relation between m_flow and dp for any flow rate"                                                                                                annotation (Dialog(tab="Flow resistance"));
  parameter Real deltaM=0.1
    "Fraction of nominal flow rate where flow transitions to laminar"
    annotation (Dialog(tab="Flow resistance"));
  parameter Modelica.SIunits.ReynoldsNumber ReC=4000
    "Reynolds number where transition to turbulent starts"                                                                                                     annotation (Dialog(tab="Flow resistance"));
  parameter Modelica.SIunits.Pressure dp_nominal
    "Nominal pressure drop" annotation(Dialog(group = "Nominal condition"));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a
    annotation (Placement(transformation(extent={{-10,88},{10,108}})));
  BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.Qmodel qmodel(
    len=length,
    nEle=nNodes,
    InteractionBetweenPipes=InteractionBetweenPipes)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  replaceable
    BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels.UPartialClass Umodel constrainedby
      BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses.DHN_Umodels.UPartialClass
    "Heat transfer coefficient model"
    annotation (choicesAllMatching=true, Placement(transformation(extent={{62,-10},{42,10}})));
  parameter Boolean InteractionBetweenPipes=true
    "= false to neglect interaction between pipes";
equation
  connect(port_b2, pipReturn.port_b) annotation (Line(
      points={{-100,-60},{-10,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pipReturn.port_a, port_a2) annotation (Line(
      points={{10,-60},{100,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pipSupply.port_b, port_b1) annotation (Line(
      points={{10,60},{100,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_a1, pipSupply.port_a) annotation (Line(
      points={{-100,60},{-10,60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(qmodel.U, Umodel.U) annotation (Line(
      points={{10,0},{43,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(qmodel.BC, port_a) annotation (Line(
      points={{-9.6,0},{-40,0},{-40,98},{0,98}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(pipReturn.heatPorts, qmodel.Q_return) annotation (Line(
      points={{0,-55},{0,-9}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(qmodel.Q_supply, pipSupply.heatPorts) annotation (Line(
      points={{0,9},{0,55}},
      color={127,0,0},
      smooth=Smooth.None));

  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
    -100},{100,100}}), graphics), Icon(coordinateSystem(
    preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-100,88},{100,28}}, lineColor={0,0,255}),
    Rectangle(extent={{-100,-28},{100,-88}}, lineColor={0,0,255})}),
    Documentation(info="<html>
    <p>
    Model of two pipes in parallel
    </p>
    </html>"));
end ParallelPipes;
