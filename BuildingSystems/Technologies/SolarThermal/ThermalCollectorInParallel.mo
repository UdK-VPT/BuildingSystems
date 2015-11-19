within BuildingSystems.Technologies.SolarThermal;
model ThermalCollectorInParallel
  extends BuildingSystems.Fluid.Interfaces.PartialTwoPortInterface(
    showDesignFlowDirection = false);
    extends BuildingSystems.Fluid.Interfaces.LumpedVolumeDeclarations(
     final X_start = Medium.X_default,
     final C_start = fill(0, Medium.nC),
     final C_nominal = fill(1E-2, Medium.nC));
  parameter Integer nCol(min = 1) = 1
    "Number of solar thermal collectors in serie";
  parameter Integer nArr(min = 1) = 1
    "Number of parallel blocks of solar thermal collectors";
  parameter Modelica.SIunits.Pressure dp_nominal
    "Pressure drop at nominal conditions total installation"
    annotation(Dialog(group = "Nominal condition"));
  BuildingSystems.Interfaces.Angle_degOutput angleDegAzi
    annotation (Dialog(group="Geometry"),Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-10,-90}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-10,-90})));
  BuildingSystems.Interfaces.Angle_degOutput angleDegTil
    annotation (Dialog(group="Geometry"), Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={12,-90}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={10,-90})));
  parameter Boolean linearized=false
    "= true, use linear relation between m_flow and dp for any flow rate";
  parameter Boolean from_dp=false
    "= true, use m_flow = f(dp) else dp = f(m_flow)";
  parameter Boolean homotopyInitialization=true "= true, use homotopy method";
  parameter Integer nEle=10 "Number of elements used in the discretization";
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortCon
    "Heat port for convective heat transfer"
    annotation (Placement(transformation(extent={{20,80},{40,100}}),iconTransformation(extent={{20,80},{40,100}})));
  BuildingSystems.Interfaces.RadiationPort radiationPort
    annotation (Placement(transformation(extent={{-40,80},{-20,100}}),iconTransformation(extent={{-40,80},{-20,100}})));
  replaceable
    BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial           collectorData
    "Data about the thermal solar collector"
    annotation (HideResult=true, Dialog(tab = "General"), Evaluate=true, choicesAllMatching=true,Placement(transformation(extent={{60,40},{80,60}})));
  ThermalCollectorInSerie thermalCollectorInSerie[nArr](
    redeclare package Medium = Medium,
    each m_flow_nominal=m_flow_nominal,
    each nCol=nCol,
    each angleDegAzi=angleDegAzi,
    each angleDegTil=angleDegTil,
    each nEle=nEle,
    each collectorData(
      C_0=collectorData.C_0,
      C_1=collectorData.C_1,
      C_2=collectorData.C_2,
      V_A=collectorData.V_A,
      A=collectorData.A,
      IAMC=collectorData.IAMC,
      C_A=collectorData.C_A),
    each dp_nominal=dp_nominal)
    annotation (Placement(transformation(extent={{-14,-10},{6,10}})));
  equation
  for i in 1:nArr loop
    connect(thermalCollectorInSerie[i].radiationPort, radiationPort) annotation (
      Line(
      points={{-7,8},{-7,90},{-30,90}},
      color={0,0,0},
      pattern=LinePattern.None,
      smooth=Smooth.None));
    connect(thermalCollectorInSerie[i].heatPortCon, heatPortCon) annotation (Line(
      points={{-1,8},{0,8},{0,90},{30,90}},
      color={191,0,0},
      smooth=Smooth.None));
    connect(thermalCollectorInSerie[i].port_b, port_b) annotation (Line(
      points={{6,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
    connect(thermalCollectorInSerie[i].port_a, port_a) annotation (Line(
      points={{-14,0},{-100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  end for;

  annotation (    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Text(
      extent={{46,76},{86,56}},
      lineColor={0,0,0},
      textString="%nCol"),
    Text(
      extent={{-64,74},{-44,54}},
      lineColor={0,0,0},
      textString="1..."),
    Polygon(
      points={{-72,12},{-56,52},{-30,52},{-46,12},{-72,12}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{-42,12},{-26,52},{0,52},{-16,12},{-42,12}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{-72,-40},{-56,0},{-30,0},{-46,-40},{-72,-40}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{-42,-40},{-26,0},{0,0},{-16,-40},{-42,-40}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{-72,-92},{-56,-52},{-30,-52},{-46,-92},{-72,-92}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{-42,-92},{-26,-52},{0,-52},{-16,-92},{-42,-92}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{10,-40},{26,0},{52,0},{36,-40},{10,-40}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{40,-40},{56,0},{82,0},{66,-40},{40,-40}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{8,-92},{24,-52},{50,-52},{34,-92},{8,-92}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{38,-92},{54,-52},{80,-52},{64,-92},{38,-92}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{16,12},{32,52},{58,52},{42,12},{16,12}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Polygon(
      points={{46,12},{62,52},{88,52},{72,12},{46,12}},
      lineColor={0,0,0},
      lineThickness=0.5,
      smooth=Smooth.None),
    Line(
      points={{-94,6},{-94,48},{-58,48}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None),
    Text(
      extent={{-102,-62},{-62,-82}},
      lineColor={0,0,0},
      textString="%nArr"),
    Line(
      points={{-94,8},{-92,-6},{-58,-6}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None),
    Line(
      points={{-94,-4},{-94,-60},{-60,-60}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None),
    Line(
      points={{86,46},{92,46},{92,4}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None),
    Line(
      points={{78,-60},{92,-60},{92,0}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None),
    Line(
      points={{80,-6},{94,-6}},
      color={0,0,255},
      thickness=0.5,
      smooth=Smooth.None)}));
end ThermalCollectorInParallel;
