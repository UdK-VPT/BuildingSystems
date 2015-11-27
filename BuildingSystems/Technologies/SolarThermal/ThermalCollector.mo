within BuildingSystems.Technologies.SolarThermal;
model ThermalCollector
  "Model of a solar thermal collector"
  extends BuildingSystems.Fluid.Interfaces.PartialTwoPortInterface(
    showDesignFlowDirection = false,
    show_T=true);
  BuildingSystems.Fluid.MixingVolumes.MixingVolume[nEle] vol(
    redeclare each package Medium = Medium,
    each V = V / nEle,
    each final m_flow_nominal = m_flow_nominal,
    each final energyDynamics = energyDynamics,
    each final massDynamics = energyDynamics,
    each final p_start = p_start,
    each final T_start = T_start,
    each final X_start = X_start,
    each final C_start = C_start,
    each final nPorts=2) "Volume for fluid stream"
    annotation (Placement(transformation(extent={{-10,0},{10,-20}})));
  extends BuildingSystems.Fluid.Interfaces.LumpedVolumeDeclarations(
     final X_start = Medium.X_default,
     final C_start = fill(0, Medium.nC),
     final C_nominal = fill(1E-2, Medium.nC));
  Modelica.Thermal.HeatTransfer.Components.HeatCapacitor cp_solid[nEle](
    each C=C/nEle)
    "Heat capacity of the solid part of the solar collector to be lumped into the fluid volume"
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  parameter Integer nEle(min=1) = 10
    "Number of elements used in the discretization";
  parameter Modelica.SIunits.Length width = 1.0 "Width of the collector"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length height = 1.0 "Height of the collector"
    annotation(Dialog(tab = "General", group = "Geometry"));
  BuildingSystems.Interfaces.Angle_degOutput angleDegTil
    "Tilt angle of the solar collector"
    annotation (Dialog(group="Geometry"), Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-50,-90}),iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-50,-90})));
  BuildingSystems.Interfaces.Angle_degOutput angleDegAzi
    "Azimuth angle of the solar collector: South=0 deg West=90 deg East=-90 deg"
    annotation (Dialog(group="Geometry"), Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-70,-90}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-70,-90})));
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal
    "Nominal mass flow rate at nominal conditions"
    annotation(Dialog(group = "Nominal condition"));
  parameter Modelica.SIunits.Pressure dp_nominal(displayUnit="Pa")
    "Pressure drop at nominal mass flow rate"
    annotation(Dialog(group = "Nominal condition"));
  BuildingSystems.Interfaces.RadiationPort radiationPort
    annotation (Placement(transformation(extent={{-20,80},{0,100}}), iconTransformation(extent={{-20,80},{0,100}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPortCon
    "Heat port for convective heat transfer"
    annotation (Placement(transformation(extent={{40,80},{60,100}}),iconTransformation(extent={{40,80},{60,100}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollectorCon(
    m=nEle) "Sum of the convective heat flows"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={30,-50})));
  Modelica.Blocks.Routing.Replicator replicatorQrad(
    nout=nEle) "replicate Qrad value"
    annotation (Placement(transformation(extent={{-70,-80},{-50,-60}})));
  replaceable BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial collectorData
    "Data about the thermal solar collector"
    annotation(HideResult=true, Dialog(tab = "General"), Evaluate=true, choicesAllMatching=true);
  BuildingSystems.Fluid.FixedResistances.FixedResistanceDpM res(
    m_flow_nominal=m_flow_nominal,
    redeclare package Medium = Medium,
    dp_nominal=dp_nominal,
    from_dp=from_dp,
    homotopyInitialization=homotopyInitialization,
    linearized=linearized)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  parameter Boolean homotopyInitialization = true
    "= true, use homotopy method";
  parameter Boolean from_dp = false
    "= true, use m_flow = f(dp) else dp = f(m_flow)";
  parameter Boolean linearized = false
    "= true, use linear relation between m_flow and dp for any flow rate";
  parameter Boolean AColData = true
    "= true, use A from collector data; false A = height * width";
  final parameter Modelica.SIunits.Volume V = collectorData.V_A * A
    "Volume of the fluid";
  final parameter Modelica.SIunits.HeatCapacity C = collectorData.C_A*A;
  parameter Boolean use_GSC_in = false
    "= true, use input for geometric shading coefficient GSC"
    annotation(Dialog(tab="Advanced"));
  parameter Real GSC_constant = 0.0
    "Constant shading coefficient (if use_GSC_in = true)";
  final parameter Modelica.SIunits.Area A = if AColData then collectorData.A else width * height
    "Absorber area of the collector";
  Real IAM "IncidenceAngleModifier";
  Modelica.SIunits.RadiantEnergyFluenceRate IrrTot
    "Total solar radiation on collector's absorber surfcace";
  Modelica.Blocks.Sources.RealExpression QCon[nEle](y=-A/nEle .* (C_1 .* (vol.T .-
    preSumCon.port.T) .+ C_2 .* (vol.T .- preSumCon.port.T) .* (vol.T .-
    preSumCon.port.T)))
    "Convective heat flow rate"
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow preSumCon[nEle]
    "Heat input into volum element due to convective heat transfer"
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
   Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow[nEle] preConRad
    "Heat input into volume element from convective and radiative heat"
    annotation (Placement(transformation(extent={{-36,-20},{-16,0}})));
  Modelica.Blocks.Sources.RealExpression QRad(y=A*(C_0*IrrTot)/nEle)
    "Radiative heat flow rate"
    annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
  Modelica.Blocks.Math.Sum sumConRad[nEle](each nin = 2)
    "Sum of convective and radiative heat flow rate"
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
  Modelica.Blocks.Interfaces.RealInput GSC_in if use_GSC_in
    annotation (Placement(transformation(extent={{-100,40},{-60,80}}), iconTransformation(extent={{-100,40},{-60,80}})));
  BuildingSystems.Interfaces.Temp_KOutput TSeg[nEle] = vol.T
    "Temperature of each collector element"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={32,-90}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={32,-90})));
protected
  Modelica.Blocks.Interfaces.RealInput GSC_internal
    "Shading coefficient";
  parameter Real IAMC = collectorData.IAMC
    "Incidence Angle Modifier Coefficient: Value of IAM at 50 degree";
  parameter Real C_0 = collectorData.C_0
    "Collector constant in [-] using absorber area as a reference";
  parameter Real C_1 = collectorData.C_1
    "Collector constant in W/(m2.K) using absorber area as a reference";
  parameter Real C_2 = collectorData.C_2
    "Collector constant in W/(m2*K.2) using absorber area as a reference";
equation
  connect(GSC_internal, GSC_in);
  if not use_GSC_in then
    GSC_internal = GSC_constant;
  end if;
  IAM = BuildingSystems.Utilities.SmoothFunctions.softcut_lower(1.0 + (IAMC - 1.0)/0.5557 * (1.0 / Modelica.Math.cos((radiationPort.angleDegInc-0.01) * Modelica.Constants.pi / 180.0) - 1.0),0.0,0.01);
  IrrTot = radiationPort.IrrDir * (1.0 - GSC_internal) * IAM + radiationPort.IrrDif;
  connect(QCon.y, sumConRad.u[1]) annotation (Line(
      points={{-79,-30},{-70,-30},{-70,-21},{-62,-21}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(sumConRad.y, preConRad.Q_flow) annotation (Line(
      points={{-39,-20},{-38,-20},{-38,-10},{-36,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(preConRad.port, vol.heatPort) annotation (Line(
      points={{-16,-10},{-10,-10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a, vol[1].ports[1]) annotation (Line(
      points={{-100,0},{-2,0}},
      color={0,127,255},
      smooth=Smooth.None));
  for i in 1:nEle-1 loop
    connect(vol[i].ports[2], vol[i+1].ports[1]);
  end for;
  connect(QCon.y, preSumCon.Q_flow) annotation (Line(
      points={{-79,-30},{-70,-30},{-70,-50},{-20,-50}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(preSumCon.port, thermalCollectorCon.port_a) annotation (Line(
      points={{0,-50},{20,-50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollectorCon.port_b, heatPortCon) annotation (Line(
      points={{40,-50},{60,-50},{60,66},{50,66},{50,90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(QRad.y, replicatorQrad.u) annotation (Line(
      points={{-79,-70},{-72,-70}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(replicatorQrad.y, sumConRad.u[2]) annotation (Line(
      points={{-49,-70},{-40,-70},{-40,-50},{-70,-50},{-70,-20},{-62,-20},{-62,-19}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(heatPortCon, heatPortCon) annotation (Line(
      points={{50,90},{50,90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(res.port_b, port_b) annotation (Line(
      points={{40,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol[nEle].ports[2], res.port_a) annotation (Line(
      points={{2,0},{20,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(cp_solid.port, vol.heatPort) annotation (Line(
      points={{-30,20},{-10,20},{-10,-10}},
      color={191,0,0},
      smooth=Smooth.None));

  annotation ( Icon(coordinateSystem(
    preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Polygon(
      points={{-54,80},{96,80},{56,-80},{-94,-80},{-54,80}},
      lineColor={215,215,215},
      smooth=Smooth.None,
      lineThickness=1),
    Polygon(
      points={{-54,80},{-24,80},{-64,-80},{-94,-80},{-54,80}},
      lineColor={215,215,215},
      smooth=Smooth.None,
      lineThickness=1),
    Polygon(
      points={{-24,80},{6,80},{-34,-80},{-64,-80},{-24,80}},
      lineColor={215,215,215},
      smooth=Smooth.None,
      lineThickness=1),
    Polygon(
      points={{36,80},{66,80},{26,-80},{-4,-80},{36,80}},
      lineColor={215,215,215},
      smooth=Smooth.None,
      lineThickness=1),
    Polygon(
      points={{66,80},{96,80},{56,-80},{26,-80},{66,80}},
      lineColor={215,215,215},
      smooth=Smooth.None,
      lineThickness=1),
    Text(
      extent={{-24,26},{26,-10}},
      lineColor={0,0,255},
      lineThickness=0.5,
      fillColor={0,0,255},
      fillPattern=FillPattern.Solid,
      textString="n=%nEle"),
    Text(
      extent={{-120,100},{-60,80}},
      lineColor={0,0,255},
      textString="GSC_in",
      visible=use_GSC_in)}),
    Documentation(info="<html>
      <p>This model is a general solar thermal collector. </p>
      <h4>Main equations</h4>
      <p>Calculation of the total incident solar radiation, I<sub>tot</sub>, is defined as follows.<b> </b></p>
      <p align=\"center\"><i>
      I<sub>tot</sub> = I<sub>dir</sub> *(1-GSC)*IAM+I<sub>dif</sub> </i></p>
    <p>
    where I<sub>dir</sub> and I<sub>dif</sub> are the total direct and diffuse irradiation on the absorption surface in W/m2 respectively.
    GSC is the geometrical shading coefficient for the direct irradiation and IAM the incidence angle modifier.
    </p>
      <p> Calculation of incidence angle modifier, <b> </b></p>
      <p align=\"center\"><i>
      IAM = 1 + (IAMC-1)/0.5557*(1/cos(&theta;)-1) </i></p>
      <p> where &theta; is the angle between the normal to the collector surface and the incident irradiation.
      IAMC is the incidence angle modifier evaluated at <code>&theta;=50 deg</code>. <b> </b></p>

    <h4>Typical use and important parameters</h4>
    <p>
    <code>nEle</code>. The use of the preset value of 10 nodes pro solar thermal collector is recommended.
    </p>
    <p>
    <code>angleDegAzi</code> and <code>angleDegTil</code>. The parameters are used by external models such as
    <a href=\"BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky\">radiation</a>.
    </p>
    <p>
    <code>C_0</code>, <code>C_1</code> and <code>C_2</code> are referenced to the absoerber area. In case
    of flat plate collectors this is the total exposed are of the solar absorber and for evacuated tube collectors, the
    diameter of the round absorber, or flat area of the absorber for evacuated tubes with absorber fins inside.
    </p>

    <h4>Options</h4>
    <p>
    The heat capacity of the solid part of the collector can be lumped into the volume heat capacity via defining a heat capacity per square meter of absorber area.
    </p>
    <p>
    It is possible to take into account the shadings on the solar panels via the use of the geometrical shading coefficient <code>GSC</code>.
    For that purpose it is necessary to set to true the parameter <code>use_GSC_in</code> found in the advanced tab. The <code>GSC</code>
    stands for the ratio between shaded and total receiver plane area, its value should be thus between 0 and 1. Notice that the GSC factor is applied
    just to the direct irradiation but not to the diffuse portion.
    </p>

    <h4>Assumption and limitations</h4>
    <p>
    A single incidence angle modifier, IAM, for direct radiation is calculated. Furthermore the model does not distinguish
    between transverse and logitudional IAM. This assumption is valid for flat solar thermal collectors but innapropiaite for
    evacuated tub collectors, ETC, and concentrating solar panels,CPC. For those type of collectors the incidence angle modifier should
    be evaluated for more than one direction (longitudinal and transversal) and at different angles (20 deg, 40 deg, ...).
    </p>
    <p>
    The efficiency of the collector does not take into account explicitly the wind speed.
    </p>
    </html>"));
end ThermalCollector;
