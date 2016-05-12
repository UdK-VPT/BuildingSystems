within BuildingSystems.Technologies.ThermalStorages;
model FluidStorage "Model of a thermal fluid storage"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium of the storage model" annotation (choicesAllMatching = true);
  BuildingSystems.Fluid.MixingVolumes.MixingVolume vol[nEle - 2](
    redeclare package Medium = Medium,
    each m_flow_nominal = 1.0,
    each V = V / nEle,
    each nPorts = 3,
    each T_start = T_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={32,-10})));
  parameter Modelica.SIunits.Length height = 1.0 "Height of tank"
    annotation(Dialog(group="Geometry"));
  parameter Modelica.SIunits.Volume V = 1.0 "Fluid volume in tank"
    annotation(Dialog(group="Geometry"));
  parameter Integer nEle(min=3) = 3 "Number of fluid layers";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer alpha_out = 800.0
    "Coefficient of heat transfer outside the tank"
    annotation(Dialog(group="Thermal properties"));
  parameter Modelica.SIunits.CoefficientOfHeatTransfer alpha_in = 3000.0
    "Coefficient of heat transfer inside the tank"
    annotation(Dialog(group="Thermal properties"));
  parameter Modelica.SIunits.ThermalConductivity lambda_ins = 0.05
    "Thermal heat conductivity of insulation material"
    annotation(Dialog(group="Thermal properties"));
  parameter Modelica.SIunits.Thickness thickness_ins = 0.005
    "Insulation thickness"
    annotation(Dialog(group="Geometry"));
  parameter Modelica.SIunits.Thickness thickness_wall = 1 "Wall thickness"
    annotation(Dialog(group="Geometry"));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor HeatThroughTop(
    G = UA_top)
    annotation (Placement(transformation(extent={{-42,74},{-22,94}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor HeatThroughWalls[nEle](
    each G = UA_wall/nEle)
    annotation (Placement(transformation(extent={{-16,60},{4,80}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor HeatThroughBottom(
    G = UA_bot)
    annotation (Placement(transformation(extent={{-34,40},{-54,60}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor HeatBetweenLayers[nEle - 1](
    each G = ASec * Medium.thermalConductivity(sta_default) / heightLayer)
    "Normal heat transfer due to conductivity"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},origin={-20,-60})));
  replaceable BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.PartialBuoyancy HeatBuoyancy(
    nEle=nEle) constrainedby BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.PartialBuoyancy(nEle=nEle)
    "Accounting for buoyancy effect"
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,-10},{10,10}},origin={-22,-2})),Dialog(tab="Advanced",group="Buoyancy"));
  Modelica.Fluid.Interfaces.FluidPorts_a port_a[nEle - 2](
    redeclare package Medium = Medium) if AdditionalFluidPorts
    "Ports to the intermediate layers"
    annotation (Placement(transformation(extent={{-104,-36},{-86,36}}),iconTransformation(extent={{-80,-38},{-60,38}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a  heatPort if not PerfectlyIsolated
    "thermal boundary condition to environment"
    annotation (Placement(transformation(extent={{-10,94},{10,114}}),iconTransformation(extent={{-10,94},{10,114}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector(
    m = 2 + nEle) if not PerfectlyIsolated
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=90,origin={-62,70})));
  parameter Boolean HX_2 = true
    "Set to true to add heat exchanger at the top layer"
    annotation(Dialog(group="Storage configuration"));
  parameter Boolean HX_1 = true
    "Set to true to add heat exchanger at the bottom layer"
    annotation(Dialog(group="Storage configuration"));
  parameter Boolean PerfectlyIsolated = false
    "Set to true to avoid heat losses"
    annotation(Dialog(group="Storage configuration"));
  parameter Boolean AdditionalFluidPorts = false
    "Set to true to add aditional fluid ports connected to intermediate layers"
    annotation(Dialog(group="Storage configuration"));
  parameter Modelica.SIunits.ThermalConductance UA_wall =
    (Modelica.Constants.pi * height) / (1.0 / (alpha_out * diameter_ext)
    + log(diameter_ext / diameter_int) / (2 * lambda_ins) + 1/(alpha_in * diameter_int))
    "Thermal conductance walls"
    annotation(Dialog(group="Thermal properties"));
  parameter Modelica.SIunits.ThermalConductance UA_top=
    1.0 / (thickness_ins / (lambda_ins * ASec) + 1.0 / (alpha_in * ASec) + 1.0 / (alpha_out * ASec))
    "Thermal conductance top"
    annotation(Dialog(group="Thermal properties"));
  parameter Modelica.SIunits.ThermalConductance UA_bot = UA_top
    "Thermal conductance bottom"
    annotation(Dialog(group="Thermal properties"));
protected
  parameter Modelica.SIunits.Diameter diameter_int = sqrt(ASec * 4 / Modelica.Constants.pi)
    "Inner diameter of tank"
    annotation(Dialog(group="Geometry"));
  parameter Modelica.SIunits.Diameter diameter_ext = diameter_int + 2 * (thickness_wall + thickness_ins)
    "Exterior diameter of tank"
    annotation(Dialog(group="Geometry"));
  parameter Modelica.SIunits.Area ASec = V / height
    "Tank's inner cross-section area";
  parameter Modelica.SIunits.Length heightLayer = height / nEle
    "Height of tank layer";
  parameter Medium.ThermodynamicState sta_default = Medium.setState_pTX(
    T=Medium.T_default,
    p=Medium.p_default,
    X=Medium.X_default[1:Medium.nXi])
    "Medium state at default properties";
public
  Modelica.Fluid.Interfaces.FluidPort_a port_HX_1_a(
    redeclare package Medium = Medium) if HX_1
    "Port a to the HX at the bottom of the tank"
    annotation (Placement(transformation(extent={{60,-50},{80,-30}}), iconTransformation(extent={{60,-50},{80,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_HX_1_b(
    redeclare package Medium = Medium) if HX_1
    "Port b to the HX at the bottom of the tank"
    annotation (Placement(transformation(extent={{60,-70},{80,-50}}), iconTransformation(extent={{60,-70},{80,-50}})));
  BuildingSystems.Fluid.MixingVolumes.MixingVolume vol_HX_1(
    nPorts = 2,
    redeclare package Medium = Medium,
    m_flow_nominal = 1.0,
    V = 0.05,
    T_start=T_start) if HX_1
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={50,-84})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor ThermalConductanceHX_1(
    each G = UA_HX_1) if HX_1
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},origin={34,-54})));
  Modelica.Fluid.Interfaces.FluidPort_a port_HX_2_a(
    redeclare package Medium = Medium) if  HX_2
    "Port a to the HX at the top of the tank"
    annotation (Placement(transformation(extent={{80,40},{60,60}}), iconTransformation(extent={{80,40},{60,60}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_HX_2_b(
    redeclare package Medium = Medium) if HX_2
    "Port b to the HX at the top of the tank"
    annotation (Placement(transformation(extent={{80,20},{60,40}}), iconTransformation(extent={{80,20},{60,40}})));
  BuildingSystems.Fluid.MixingVolumes.MixingVolume vol_HX_2(
    nPorts = 2,
    m_flow_nominal = 1.0,
    redeclare package Medium = Medium,
    V = 0.05,
    T_start = T_start) if HX_2
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={38,44})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor ThermalConductanceHX_2(
    each G = UA_HX_2) if HX_2
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},origin={62,90})));
  parameter Modelica.SIunits.ThermalConductance UA_HX_2 = 100.0
    "Constant thermal conductance of material"
    annotation(Dialog(enable=HX_2,group="HX definition"));
  parameter Integer Ele_HX_2 = 2 "Layer at which HX_2 is connected"
    annotation(Dialog(enable = HX_2,group="HX definition"));
  parameter Modelica.SIunits.ThermalConductance UA_HX_1 = 100.0
    "Constant thermal conductance of material"
    annotation(Dialog(enable = HX_1,group="HX definition"));
  parameter Integer Ele_HX_1 = 1
    "Layer at which HX_1 is connected"
    annotation(Dialog(enable = HX_1,group="HX definition"));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(
    redeclare package Medium = Medium)
    "Port to the top of the tank n=nEle"
    annotation (Placement(transformation(extent={{-100,-100},{-80,-80}}), iconTransformation(extent={{-80,80},{-60,100}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b2(
    redeclare package Medium = Medium)
    "Port to the bottom of the tank n=1"
    annotation (Placement(transformation(extent={{-100,80},{-80,100}}), iconTransformation(extent={{60,-100},{80,-80}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(
    redeclare package Medium = Medium)
    "Port to the bottom of the tank n=1"
    annotation (Placement(transformation(extent={{-100,-80},{-80,-60}}), iconTransformation(extent={{-80,-100},{-60,-80}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a2(
    redeclare package Medium = Medium)
    "Port to the top of the tank n=nEle"
    annotation (Placement(transformation(extent={{-100,60}, {-80,80}}), iconTransformation(extent={{60,80},{80,100}})));
  parameter Modelica.Media.Interfaces.Types.Temperature T_start=Medium.T_default
    "Initial storage temperature"
    annotation(Dialog(tab="Initialization"));
  Modelica.Blocks.Interfaces.RealOutput T[nEle](
    final quantity="ThermodynamicTemperature",
    final unit = "K",
    min=0,
    displayUnit = "degC")
    "Starting at bottom"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=180,origin={-114,40}),iconTransformation(extent={{-64,50},{-84,70}})));
  BuildingSystems.Fluid.MixingVolumes.MixingVolume vol_bot(
    redeclare package Medium = Medium,
    each m_flow_nominal = 1.0,
    each V = V / nEle,
    each T_start = T_start,
    nPorts = 3)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},origin={-60,-80})));
  Fluid.MixingVolumes.MixingVolume vol_top(
    redeclare package Medium = Medium,
    each m_flow_nominal = 1.0,
    each V = V / nEle,
    each T_start = T_start,
    nPorts = 3)
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},origin={-12,40})));
  Fluid.FixedResistances.LosslessPipe pip[nEle - 2](
    redeclare package Medium = Medium,
    each m_flow_nominal = 1.0)
    annotation (Placement(transformation(extent={{-48,-10},{-68,10}})));
equation
  // Heat loss through walls:
  connect(heatPort, thermalCollector.port_b) annotation (Line(
      points={{0,104},{-72,104},{-72,70}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector.port_a[nEle+1], HeatThroughTop.port_a) annotation (Line(
      points={{-52,70},{-48,70},{-48,84},{-42,84}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(thermalCollector.port_a[nEle+2], HeatThroughBottom.port_a) annotation (
      Line(
      points={{-52,70},{-28,70},{-28,50},{-34,50}},
      color={191,0,0},
      smooth=Smooth.None));
  for i in 1:nEle loop
    connect(thermalCollector.port_a[i], HeatThroughWalls[i].port_a) annotation (Line(
      points={{-52,70},{-16,70}},
      color={191,0,0},
      smooth=Smooth.None));
  end for;

  // Heat loss through walls: connection to volumes
  connect(HeatThroughTop.port_b, vol_top.heatPort) annotation (Line(
      points={{-22,84},{18,84},{18,40},{-2,40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(HeatThroughBottom.port_b, vol_bot.heatPort) annotation (Line(
      points={{-54,50},{-72,50},{-72,-60},{-48,-60},{-48,-80},{-50,-80}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(HeatThroughWalls[end].port_b, vol_top.heatPort) annotation (Line(
      points={{4,70},{18,70},{18,40},{-2,40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(HeatThroughWalls[1].port_b, vol_bot.heatPort) annotation (Line(
      points={{4,70},{18,70},{18,18},{50,18},{50,-34},{14,-34},{14,-80},{-50,-80}},
      color={191,0,0},
      smooth=Smooth.None));
  for i in 1:nEle-2 loop
    connect(HeatThroughWalls[i+1].port_b, vol[i].heatPort) annotation (Line(
      points={{4,70},{18,70},{18,-10},{22,-10}},
      color={191,0,0},
      smooth=Smooth.None));
  end for;

   // Connect vol.T to output signals
  for i in 1:nEle-2 loop
    T[i+1] = vol[i].T;
  end for;

  T[1] = vol_bot.T;
  T[end] = vol_top.T;

  // Connection fluid ports between layers:
  for i in 1:nEle-3 loop
   connect(vol[i].ports[2], vol[i+1].ports[1]);
  end for;
  //connect fluidports of vol_top and to vol
  connect(vol_bot.ports[1], vol[1].ports[1]) annotation (Line(
      points={{-57.3333,-90},{18,-90},{18,-28},{29.3333,-28},{29.3333,-20}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_top.ports[1], vol[end].ports[2]) annotation (Line(
      points={{-9.33333,30},{-9.33333,-20},{32,-20}},
      color={0,127,255},
      smooth=Smooth.None));

  //connect fluidports of vol_top and vol_bot to interface
  connect(port_a2, vol_top.ports[2]) annotation (Line(
      points={{-90,70},{-84,70},{-84,30},{-12,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_b1, vol_top.ports[3]) annotation (Line(
      points={{-90,-90},{-80,-90},{-80,24},{-14.6667,24},{-14.6667,30}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_a1, vol_bot.ports[2]) annotation (Line(
      points={{-90,-70},{-80,-70},{-80,-72},{-74,-72},{-74,-90},{-60,-90}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(port_b2, vol_bot.ports[3]) annotation (Line(
      points={{-90,90},{-86,90},{-86,-88},{-76,-88},{-76,-98},{-56,-98},{-56,
          -90},{-62.6667,-90}},
      color={0,127,255},
      smooth=Smooth.None));
  //connection vol to mid interfaces
  for i in 1:nEle-2 loop
   connect(vol[i].ports[3], pip[i].port_a) annotation (Line(
      points={{34.6667,-20},{-40,-20},{-40,0},{-48,0}},
      color={0,127,255},
      smooth=Smooth.None));
  end for;

  // basic HX connections
  connect(port_HX_1_a, vol_HX_1.ports[1]) annotation (Line(
      points={{70,-40},{72,-40},{72,-82},{60,-82}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_HX_1.ports[2], port_HX_1_b) annotation (Line(
      points={{60,-86},{60,-78},{70,-78},{70,-60}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_HX_1.heatPort, ThermalConductanceHX_1.port_a) annotation (Line(
      points={{50,-74},{50,-54},{44,-54}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(vol_HX_2.heatPort, ThermalConductanceHX_2.port_a) annotation (Line(
      points={{38,54},{38,90},{52,90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_HX_2_b, vol_HX_2.ports[1]) annotation (Line(
      points={{70,30},{70,72},{48,72},{48,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_HX_2.ports[2], port_HX_2_a) annotation (Line(
      points={{48,42},{48,50},{70,50}},
      color={0,127,255},
      smooth=Smooth.None));

  //Definition HX connection to volume:
  // HX_1
  if Ele_HX_1 == 1 then
    connect(ThermalConductanceHX_1.port_b, vol_bot.heatPort);
  elseif Ele_HX_1 == nEle then
    connect(ThermalConductanceHX_1.port_b, vol_top.heatPort);
  else
    connect(ThermalConductanceHX_1.port_b, vol[Ele_HX_1-1].heatPort);
  end if;
  // HX_2
  if Ele_HX_2 == 1 then
    connect(ThermalConductanceHX_2.port_b, vol_bot.heatPort);
  elseif Ele_HX_1 == nEle then
    connect(ThermalConductanceHX_2.port_b, vol_top.heatPort);
  else
    connect(ThermalConductanceHX_2.port_b, vol[Ele_HX_2-1].heatPort);
  end if;

   // Connection heatports between volumes; HeatBeweenLayers & Buoyancy.
  for i in 1:nEle-2 loop
    connect(HeatBetweenLayers[i].port_b, vol[i].heatPort) annotation (Line(
        points={{-10,-60},{8,-60},{8,-10},{22,-10}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(HeatBetweenLayers[i+1].port_a, vol[i].heatPort) annotation (Line(
        points={{-30,-60},{-48,-60},{-48,-48},{8,-48},{8,-10},{22,-10}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(HeatBuoyancy.port_b[i],   vol[i].heatPort) annotation (Line(
        points={{-22,7},{22,7},{22,-10}},
        color={191,0,0},
        smooth=Smooth.None));
    connect(HeatBuoyancy.port_a[i+1], vol[i].heatPort) annotation (Line(
        points={{-22,-11},{-22,-16},{22,-16},{22,-10}},
        color={191,0,0},
        smooth=Smooth.None));
  end for;
  connect(vol_bot.heatPort, HeatBetweenLayers[1].port_a) annotation (Line(
      points={{-50,-80},{-48,-80},{-48,-60},{-30,-60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(vol_top.heatPort, HeatBetweenLayers[end].port_b) annotation (Line(
      points={{-2,40},{-2,-60},{-10,-60}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(HeatBuoyancy.port_b[end], vol_top.heatPort) annotation (Line(
      points={{-22,7},{-22,16},{10,16},{10,40},{-2,40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(HeatBuoyancy.port_a[1], vol_bot.heatPort) annotation (Line(
      points={{-22,-11},{-22,-80},{-50,-80}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a, pip.port_b) annotation (Line(
      points={{-95,0},{-68,0}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (defaultComponentName="storage",Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Line(points={{60,90},{60,-90}},color={0,0,0},smooth=Smooth.None,thickness=0.5),
    Ellipse(extent={{-60,98},{60,80}}, lineColor={0,0,0},lineThickness=0.5),
    Ellipse(extent={{-60,-82},{60,-100}},lineColor={0,0,0},lineThickness=0.5),
    Line(points={{-60,90},{-60,-90}},color={0,0,0},smooth=Smooth.None,thickness=0.5),
    Line(points={{22,62}},color={0,0,255},smooth=Smooth.None),
    Line(points={{40,60}},color={0,0,255},smooth=Smooth.None),
    Line(points={{40,-26},{0,-26},{0,-30},{40,-30},{40,-34},{0,-34},{0,-38},{40,-38},{40,-42},{0,-42},{0,-46},{39.9609,-46},{40,-50},{0,-50},{0,-54},{40,-54}},color={0,0,255},smooth=Smooth.Bezier,visible=HX_1),
    Line(points={{40,-26},{46,-26},{46,-32},{60,-32}},color={0,0,255},smooth=Smooth.Bezier,visible=HX_1),
    Line(points={{40,60},{0,60},{0,56},{40,56},{40,52},{0,52},{0,48},{40,48},{40,44},{0,44},{0,40},{38.9844,40},{40,36},{0,36},{0,32},{40,32}},color={0,0,255},smooth=Smooth.Bezier,visible=HX_2),
    Line(points={{40,32},{46,32},{46,26},{60,26}},color={0,0,255},smooth=Smooth.Bezier,visible=HX_2),
    Line(points={{40,60},{46,60},{46,54},{60,54}},color={0,0,255},smooth=Smooth.Bezier,visible=HX_2),
    Line(points={{-64,60},{-62,60},{-60,60}},color={0,0,255},smooth=Smooth.None),
    Text(extent={{-94,80},{-74,60}},lineColor={0,0,255},fillColor={255,0,0},fillPattern=FillPattern.Solid,textString="T"),
    Line(points={{40,-54},{46,-54},{46,-60},{60,-60}},color={0,0,255},smooth=Smooth.Bezier,visible=HX_1),
    Text(extent={{-147,-108},{153,-148}},lineColor={0,0,255},textString="%name")}),
    Documentation(info="<html>
      <p>This is a model for a thermal fluid storage </p>
      <p><b>Typical use and important parameters</b> </p>
      <p><code>nEle</code> number of layers, enumeration starts at bottom (bottom layer is no. 1)</p>
      <p><b>Options</b> </p>
      <p>The thermal fluid storage model has several fluidports. 2 at the bottom and 2 at the top. It is possible to have different configurations: </p>
      <ul>
      <li>Switch on fluidports connected to each of the intermediate fluid layers.</li>
      <li>2 optional and freely placeable internal heat exchangers (identified as &quot;1&quot; and &quot;2&quot;). </li>
      <li>Specify the layer at which the HX are connected.</li>
      <li>Set <code>PerfectlyIsolated</code> to true to switch off the heat losses to the environment, i.e. the thermal fluid storage is perfectly isolated. <br/>
      Note that if <code>PerfectlyIsolated</code> is set to false and no boundary condition is connected to the heatPort, the external heat flow rate will also be 0.
      However, because all layers are connected to the external heat port, a non-physical internal heat flow transfer between volumes takes place.</li>
      </ul>
      <h4>Notes</h4>
      <p>The thermal fluid storage uses a model to increase heat exchange betweeen layers accounting for buoyancy effect, see <a href=\"modelica://BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels\">BuoyancyModels</a> </p>
      <p><b>Assumption and limitations</b> </p>
      <p>Up to date the model does not take into account the mixing caused by in and outflows and there is no model for a stratified inlet. </p>
      </html>"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end FluidStorage;
