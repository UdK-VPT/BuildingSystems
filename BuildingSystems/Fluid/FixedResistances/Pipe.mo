within BuildingSystems.Fluid.FixedResistances;
model Pipe
  "Pipe with 1D discretisation along flow direction"
  extends BuildingSystems.Fluid.Interfaces.LumpedVolumeDeclarations;
  extends BuildingSystems.Fluid.Interfaces.PartialTwoPortInterface(
  final show_T=true);
  extends BuildingSystems.Fluid.Interfaces.TwoPortFlowResistanceParameters(
    final computeFlowResistance=(abs(dp_nominal) > Modelica.Constants.eps),
    dp_nominal=2*dpStraightPipe_nominal);
  parameter Integer nNodes(min=1) = 1
    "Number of volume segments";
  parameter Modelica.SIunits.Length thicknessIns
    "Thickness of insulation";
  parameter Modelica.SIunits.ThermalConductivity lambdaIns
    "Heat conductivity of insulation";
  parameter Modelica.SIunits.Length diameter = sqrt(4*m_flow_nominal/rho_default/v_nominal/Modelica.Constants.pi)
    "Pipe diameter (without insulation)";
  parameter Modelica.SIunits.Length length
    "Length of the pipe";
  parameter Modelica.SIunits.ReynoldsNumber ReC=4000
    "Reynolds number where transition to turbulent starts"
    annotation (Dialog(tab="Flow resistance"));
  parameter Boolean useMultipleHeatPorts=false
    "= true to use one heat port for each segment of the pipe, false to use a single heat port for the entire pipe";
  parameter Boolean useExternalHeatSource=false
    "= true to transfer the volume temperature to the outter interface (heatPort)"
    annotation (Dialog(tab="Advanced"));
  BuildingSystems.Fluid.FixedResistances.HydraulicDiameter res(
    redeclare final package Medium = Medium,
    final from_dp=from_dp,
    dh=diameter,
    dp(nominal=length*10),
    final length=length,
    final show_T=show_T,
    final m_flow_nominal=m_flow_nominal,
    final allowFlowReversal=allowFlowReversal,
    final linearized=linearizeFlowResistance,
    final ReC=ReC)
    "Flow resistance"
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  BuildingSystems.Fluid.MixingVolumes.MixingVolume vol[nNodes](
    redeclare each final package Medium = Medium,
    each energyDynamics=energyDynamics,
    each massDynamics=massDynamics,
    each final V=VPipe/nNodes,
    each nPorts=2,
    each final m_flow_nominal=m_flow_nominal,
    each prescribedHeatFlowRate=true,
    each p_start=p_start,
    each T_start=T_start,
    each X_start=X_start,
    each C_start=C_start,
    each C_nominal=C_nominal,
    each final m_flow_small=m_flow_small,
    each final allowFlowReversal=allowFlowReversal) "Volume for pipe fluid"
    annotation (Placement(transformation(extent={{71,-18},{91,-38}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor conPipWal[nNodes](
    each G=2*Modelica.Constants.pi*lambdaIns*length/nNodes/Modelica.Math.log((
    diameter/2.0 + thicknessIns)/(diameter/2.0))) if  not useExternalHeatSource
    "Thermal conductance through pipe wall"
    annotation (Placement(transformation(extent={{-28,-38},{-8,-18}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector colAllToOne(m=nNodes) if not useMultipleHeatPorts
    "Connector to assign multiple heat ports to one heat port"
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=180,origin={-50,10})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort if not useMultipleHeatPorts
    "Single heat port that connects to outside of pipe wall (default, enabled when useMultipleHeatPorts=false)"
    annotation (Placement(transformation(extent={{-10,40},{10,20}}), iconTransformation(extent={{-10,60},{10,40}})));
  Modelica.Fluid.Interfaces.HeatPorts_a heatPorts[nNodes] if useMultipleHeatPorts
    "Multiple heat ports that connect to outside of pipe wall (enabled if useMultipleHeatPorts=true)"
    annotation (Placement(transformation(extent={{-10,-70},{11,-50}}), iconTransformation(extent={{-30,-60},{30,-40}})));
protected
  parameter Modelica.SIunits.Volume VPipe=Modelica.Constants.pi*(diameter/2.0)^2*length
    "Pipe volume";
  parameter Medium.ThermodynamicState state_default = Medium.setState_pTX(
    T=Medium.T_default,
    p=Medium.p_default,
    X=Medium.X_default[1:Medium.nXi])
    "Default state";
  parameter Modelica.SIunits.Density rho_default = Medium.density(state_default);
  parameter Modelica.SIunits.DynamicViscosity mu_default = Medium.dynamicViscosity(state_default)
    "Dynamic viscosity at nominal condition";
  parameter Modelica.SIunits.Velocity v_nominal = 0.15
    "Velocity at m_flow_nominal (used to compute default diameter)";
  parameter Modelica.SIunits.Length roughness(min=0) = 2.5e-5
    "Absolute roughness of pipe, with a default for a smooth steel pipe (dummy if use_roughness = false)";
  final parameter Modelica.SIunits.Pressure dpStraightPipe_nominal=
    Modelica.Fluid.Pipes.BaseClasses.WallFriction.Detailed.pressureLoss_m_flow(
    m_flow=m_flow_nominal,
    rho_a=rho_default,
    rho_b=rho_default,
    mu_a=mu_default,
    mu_b=mu_default,
    length=length,
    diameter=diameter,
    roughness=roughness,
    m_flow_small=m_flow_small)
    "Pressure loss of a straight pipe at m_flow_nominal";
public
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector1[nNodes](
    each m=1) if useExternalHeatSource
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=-90,origin={50,-50})));
equation
  connect(port_a, res.port_a) annotation (Line(
      points={{-100,5.55112e-16},{-72,5.55112e-16},{-72,1.16573e-15},{-58,
          1.16573e-15},{-58,6.10623e-16},{-30,6.10623e-16}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(res.port_b, vol[1].ports[1]) annotation (Line(
      points={{-10,6.10623e-016},{79,6.10623e-016},{79,-18}},
      color={0,127,255},
      smooth=Smooth.None));
  for i in 1:(nNodes - 1) loop
    connect(vol[i].ports[2], vol[i + 1].ports[1]);
  end for;
  connect(vol[nNodes].ports[2], port_b) annotation (Line(
      points={{83,-18},{82,-18},{82,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(conPipWal.port_b, vol.heatPort) annotation (Line(
      points={{-8,-28},{71,-28}},
      color={191,0,0},
      smooth=Smooth.None));
  if useMultipleHeatPorts then
    connect(heatPorts, conPipWal.port_a) annotation (Line(
        points={{0.5,-60},{-50,-60},{-50,-28},{-28,-28}},
        color={191,0,0},
        smooth=Smooth.None));
  else
    connect(colAllToOne.port_a, conPipWal.port_a) annotation (Line(
        points={{-50,4},{-50,-28},{-28,-28}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(colAllToOne.port_b, heatPort) annotation (Line(
        points={{-50,16},{-50,30},{5.55112e-16,30}},
        color={191,0,0},
        smooth=Smooth.None));
  end if;
  connect(thermalCollector1.port_b, vol.heatPort) annotation (Line(
      points={{60,-50},{71,-50},{71,-28}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector1[1].port_a, heatPorts) annotation (Line(
      points={{40,-50},{0.5,-50},{0.5,-60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector1[1].port_a, colAllToOne.port_a) annotation (Line(
      points={{40,-50},{-50,-50},{-50,4}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation (defaultComponentName="pip",Icon(graphics={
    Rectangle(
      extent={{-100,60},{100,-60}},
      lineColor={0,0,0},
      fillPattern=FillPattern.HorizontalCylinder,
      fillColor={192,192,192}),
    Rectangle(
      extent={{-100,50},{100,-48}},
      lineColor={0,0,0},
      fillPattern=FillPattern.HorizontalCylinder,
      fillColor={217,236,256}),
    Text(
      extent={{-42,12},{40,-12}},
      lineColor={0,0,0},
      textString="%nNodes")}),
    Documentation(info="<html>
    <p>
    Model of a straight pipe with flow resistance and optional heat storage.
    This model can be used for modeling the heat exchange between the pipe and environment.
    The model consists of a flow resistance
    <a href=\"modelica://BuildingSystems.Fluid.FixedResistances.FixedResistanceDpM\">
    BuildingSystems.Fluid.FixedResistances.FixedResistanceDpM</a>
    and <code>nNodes</code> mixing volumes
    <a href=\"modelica://BuildingSystems.Fluid.MixingVolumes.MixingVolume\">
    BuildingSystems.Fluid.MixingVolumes.MixingVolume</a>.
    </p>
    </html>", revisions="<html>
    <ul>
    <li>
    June 1, 2015, by Christoph Nytsch-Geusen:<br/>
    Adaptation from the Builings to the BuildingSystms library.
    </li>
    <li>
    October 8, 2013, by Michael Wetter:<br/>
    Removed parameter <code>show_V_flow</code>.
    </li>
    <li>
    September 13, 2013 by Michael Wetter:<br/>
    Replaced <code>nominal</code> with <code>default</code> values
    as they are computed using the default Medium values.
    </li>
    <li>
    February 15, 2012 by Michael Wetter:<br/>
    Changed base class from which the model extends.
    Propagated parameters of volume to the top if this model.
    </li>
    <li>
    February 12, 2012 by Wangda Zuo:<br/>
    First implementation.
    </li>
    </ul>
    </html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));
end Pipe;
