within BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations;
model Station_dp
  extends BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyTransferStations.BaseClasses.PartialStation(
     hex(
      m1_flow_nominal=m_flow_nominalDHN,
      dp1_nominal=dp_nominalDHN,
      m2_flow_nominal=m_flow_nominalHeating,
      dp2_nominal=dp_nominalHeating,
      allowFlowReversal1=false,
      allowFlowReversal2=false,
      show_T=show_T));
  parameter Modelica.SIunits.Temperature TminDHN = 273.15 + 30
    "Minimum return temperature in building's installation";
  parameter Modelica.SIunits.TemperatureDifference Tdrop = 25
    "Desired Temperature drop in building's installation";

  BuildingSystems.Technologies.DistrictHeatingNetworks.Utilities.Tanh tanhAmbient(
    Max_value=Tsupply_max,
    Min_value=Tsupply_min,
    factor=factor_Tsupply)
    annotation (Placement(transformation(extent={{-58,64},{-78,84}})));
  Modelica.Blocks.Sources.Constant constAmbient(k=273.15)
    annotation (Placement(transformation(extent={{-34,62},{-48,76}})));
  BuildingSystems.Fluid.Actuators.Valves.TwoWayLinear pumpDHN(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominalDHN,
    allowFlowReversal=false,
    dpValve_nominal=dpValve_nominal,
    dpFixed_nominal=dpFixed_nominal,
    from_dp=true)
    annotation (Placement(transformation(extent={{-92,-10},{-72,10}})));
  BuildingSystems.Controls.Continuous.LimPID conPID(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    k=50,
    Ti=5,
    yMax=1,
    yMin=0)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=-90,origin={-84,34})));
  BuildingSystems.Technologies.DistrictHeatingNetworks.Utilities.Tanh tanhZone(factor=factor_m_flow)
    annotation (Placement(transformation(extent={{0,60},{20,80}})));
  BuildingSystems.Fluid.Sensors.Temperature senTemSupply(redeclare package
    Medium = Medium)
    annotation (Placement(transformation(extent={{-94,-54},{-74,-34}})));
  BuildingSystems.Fluid.Movers.FlowControlled_m_flow pumpHeating(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominalHeating,
    allowFlowReversal=false,
    addPowerToMedium=addPowerToMedium)
    annotation (Placement(transformation(extent={{0,-10},{20,10}})));
  BuildingSystems.Fluid.Storage.ExpansionVessel exp(
    redeclare package Medium = Medium,
    p_start=300000,
    V_start=1)
    annotation (Placement(transformation(extent={{-36,6},{-16,26}})));
  parameter Modelica.SIunits.HeatFlowRate Q_nominal
    "Nominal Heat power in the Heat Transfer Station"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.MassFlowRate m_flow_nominalDHN = 1.05*m_flow_nominalHeating
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.Pressure dp_nominalDHN = 40000
    "Nominal pressure drop at the Heat Exchanger DHN loop";
  parameter Modelica.SIunits.MassFlowRate m_flow_nominalHeating = Q_nominal/4182/Tdrop
    "Nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.Pressure dp_nominalHeating = 40000
    "Nominal pressure drop at the Heat Exchanger heating installation loop"
    annotation(Dialog(group = "Nominal condition"));
  Modelica.Blocks.Sources.RealExpression m_flow_signal(
    y=m_flow_nominalHeating*tanhZone.y)
    annotation (Placement(transformation(extent={{-60,20},{0,40}})));
  BaseClasses.ExternalIdealHeater externalIdealHeater(
    redeclare package Medium = Medium,
    m_flow_nominal=m_flow_nominalHeating,
    allowFlowReversal=false)
    annotation (Placement(transformation(extent={{60,-10},{80,10}})));
  Modelica.Blocks.Sources.RealExpression Q(
    y=pumpHeating.m_flow_actual*4182*Tdrop)
    annotation (Placement(transformation(extent={{-52,-34},{28,-14}})));
  Modelica.Blocks.Sources.RealExpression Tmin(
    y=TminDHN)
    annotation (Placement(transformation(extent={{-52,-50},{28,-30}})));
  parameter Modelica.SIunits.Temperature Tsupply_max
    "Maximum supply temperature in building";
  parameter Modelica.SIunits.Temperature Tsupply_min
    "Minimum supply temperature in building";
  parameter Real factor_Tsupply = 7
    "Un- or smooth changes of the supply set temperature. tanh((InSignal-SetValue)/factor) (notice, tanh(1)=0.7616 tanh(3)=0.9951)";
  parameter Real factor_m_flow = 0.7
    "Un- or smooth changes of mass flow rate of the heating system. tanh((InSignal-SetValue)/factor) (notice, tanh(1)=0.7616 tanh(3)=0.9951)";
  parameter Boolean addPowerToMedium=false
    "Set to false to avoid any power in the pump model (=heat and flow work) being added to medium (may give simpler equations)";
  parameter Modelica.SIunits.Pressure dpValve_nominal
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.Pressure dpFixed_nominal=0
    annotation(Dialog(group = "Nominal condition"));
  Buildings.BaseClasses.RelationRadiationConvection
    relationRadiationConvection(radiationportion=0.5)
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},
        rotation=90,
        origin={70,70})));
equation
  connect(tanhAmbient.u, ambientTAirRef) annotation (Line(
      points={{-58,77},{-50,77},{-50,100}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(tanhAmbient.SetValue, constAmbient.y) annotation (Line(
      points={{-58,69},{-48.7,69}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(port_a, pumpDHN.port_a) annotation (Line(
      points={{-100,0},{-92,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(pumpDHN.port_b, hex.port_a1) annotation (Line(
      points={{-72,0},{-72,-20},{-98,-20},{-98,-96},{-40,-96}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(conPID.u_s, tanhAmbient.y) annotation (Line(
      points={{-84,46},{-84,73.8},{-78,73.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(zoneTAir, tanhZone.u) annotation (Line(
      points={{-10,100},{-10,73},{0,73}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(senTemSupply.T, conPID.u_m) annotation (Line(
      points={{-77,-44},{-66,-44},{-66,34},{-72,34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpHeating.m_flow_in, m_flow_signal.y) annotation (Line(
      points={{9.8,12},{9.8,30},{3,30}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pumpHeating.port_b, externalIdealHeater.port_a) annotation (Line(
      points={{20,0},{60,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(externalIdealHeater.port_b, hex.port_a2) annotation (Line(
      points={{80,0},{92,0},{92,-84},{-20,-84}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(Q.y, externalIdealHeater.Q_in) annotation (Line(
      points={{32,-24},{40,-24},{40,6},{59.2,6},{59.2,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tmin.y, externalIdealHeater.TDHNMin) annotation (Line(
      points={{32,-40},{48,-40},{48,-7},{59,-7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(Tset, tanhZone.SetValue) annotation (Line(
      points={{30,100},{30,52},{-18,52},{-18,64},{-4,64},{-4,65},{0,65}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(hex.port_b2, senTemSupply.port) annotation (Line(
      points={{-40,-84},{-84,-84},{-84,-54}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hex.port_b2, pumpHeating.port_a) annotation (Line(
      points={{-40,-84},{-60,-84},{-60,0},{0,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(exp.port_a, pumpHeating.port_a) annotation (Line(
      points={{-26,6},{-16,6},{-16,0},{0,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(conPID.y, pumpDHN.y) annotation (Line(
      points={{-84,23},{-84,18},{-82,18},{-82,12}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(externalIdealHeater.Q_flowHea, relationRadiationConvection.heatPort)
    annotation (Line(points={{70,10},{70,67}}, color={191,0,0}));
  connect(relationRadiationConvection.heatPortCv, Conheat) annotation (Line(
        points={{72,74},{72,74},{72,90},{90,90}}, color={191,0,0}));
  connect(relationRadiationConvection.heatPortLw, Radheat)
    annotation (Line(points={{68,74},{68,90},{60,90}}, color={191,0,0}));
  annotation(Dialog(group = "Nominal condition"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
    -100},{100,100}})),           Icon(coordinateSystem(
    preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics),
    Documentation(info="<html>
    <p>
    The station model uses the ambient air temperature to determine the set point for the supply temperature in the building (secondary loop). The exact temperature depends on the parameters <code>Tsupply_max</code>, <code>Tsupply_min</code>,<code>factor_Tsupply</code> of the <code>tanhAmbient</code> block.
    </p>

    <p>
    This set temperature is used to determine the mass flow rate in the pump <code>pumpDHN</code>.
    </p>

    <p>
    The building/zone tempearture input signal is used to determine the percentage of nominal mass flow rate that should be pumped by <code>pumpHeating</code>. The block <code>externalIdealHeater</code> extracts energy so that the fluid undergoes a temperature drop equal to the paremeter <code>Tdrop</code>.
    </p>

    </html>"));
end Station_dp;
