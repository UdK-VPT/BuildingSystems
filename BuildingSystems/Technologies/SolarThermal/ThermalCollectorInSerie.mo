within BuildingSystems.Technologies.SolarThermal;
model ThermalCollectorInSerie
  extends BuildingSystems.Fluid.Interfaces.PartialTwoPortInterface(
    showDesignFlowDirection = false);
    extends BuildingSystems.Fluid.Interfaces.LumpedVolumeDeclarations(
     final X_start = Medium.X_default,
     final C_start = fill(0, Medium.nC),
     final C_nominal = fill(1E-2, Medium.nC));
  ThermalCollector thermalCollector[nCol](
    redeclare package Medium = Medium,
    each allowFlowReversal=allowFlowReversal,
    each m_flow_small=m_flow_small,
    each show_T=false,
    each energyDynamics=energyDynamics,
    each massDynamics=massDynamics,
    each p_start=p_start,
    each T_start=T_start,
    each mSenFac=mSenFac,
    each nEle=nEle,
    each angleDegAzi=angleDegAzi,
    each angleDegTil=angleDegTil,
    each collectorData(
      C_0=collectorData.C_0,
      C_1=collectorData.C_1,
      C_2=collectorData.C_2,
      V_A=collectorData.V_A,
      A=collectorData.A,
      IAMC=collectorData.IAMC,
      C_A=collectorData.C_A),
    each m_flow_nominal=m_flow_nominal,
    each dp_nominal=dp_nominal/nCol)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  parameter Integer nCol(min=1) = 1
    "Number of solar thermal collectors in serie";
  parameter Modelica.SIunits.Pressure dp_nominal
    "Pressure drop at nominal conditions total installation"
    annotation(Dialog(group = "Nominal condition"));
  BuildingSystems.Interfaces.Angle_degOutput angleDegAzi
    annotation (Dialog(group="Geometry"),Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-10,-56}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-10,-56})));
  BuildingSystems.Interfaces.Angle_degOutput angleDegTil
    annotation (Dialog(group="Geometry"),Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={12,-56}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={10,-56})));
  parameter Boolean linearized=false
    "= true, use linear relation between m_flow and dp for any flow rate";
  parameter Boolean from_dp=false
    "= true, use m_flow = f(dp) else dp = f(m_flow)";
  parameter Boolean homotopyInitialization=true "= true, use homotopy method";
  parameter Integer nEle=10 "Number of elements used in the discretization";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortCon
    "Heat port for convective heat transfer"
    annotation (Placement(transformation(extent={{20,70},{40,90}}), iconTransformation(extent={{20,70},{40,90}})));
  BuildingSystems.Interfaces.RadiationPort radiationPort
    annotation (Placement(transformation(extent={{-40,70},{-20,90}}),iconTransformation(extent={{-40,70},{-20,90}})));
  replaceable
    BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial           collectorData
    "Data about the thermal solar collector"
    annotation (HideResult=true, Dialog(tab = "General"), Evaluate=true, choicesAllMatching=true,Placement(transformation(extent={{60,40},{80,60}})));
equation
  for i in 1:nCol-1 loop
  connect(thermalCollector[i].port_b,thermalCollector[i+1].port_a);
  end for;
  for i in 1:nCol loop
    connect(radiationPort, thermalCollector[i].radiationPort) annotation (Line(
        points={{-30,80},{-30,20},{-3,20},{-3,9}},
        color={0,0,0},
        pattern=LinePattern.None,
        smooth=Smooth.None));
    connect(thermalCollector[i].heatPortCon, heatPortCon) annotation (Line(
        points={{3,9},{3,20},{30,20},{30,80}},
        color={191,0,0},
        smooth=Smooth.None));
  end for;

  connect(port_a, thermalCollector[1].port_a) annotation (Line(
      points={{-100,0},{-12,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(thermalCollector[end].port_b, port_b) annotation (Line(
      points={{8,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Text(
      extent={{50,64},{90,44}},
      lineColor={0,0,0},
      textString="%nCol"),
    Text(
      extent={{-58,62},{-38,42}},
      lineColor={0,0,0},
      textString="1..."),
    Line(
      points={{-90,0},{-82,0}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None),
    Line(
      points={{82,0},{90,0}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{-98,-46},{-66,44},{-14,44},{-46,-46},{-98,-46}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{-42,-46},{-10,44},{42,44},{10,-46},{-42,-46}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{14,-46},{46,44},{98,44},{66,-46},{14,-46}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None)}));
end ThermalCollectorInSerie;
