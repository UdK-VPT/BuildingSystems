within BuildingSystems.Technologies.ThermalStorages;
model FluidStorage
  "Model of a thermal fluid storage"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium of the storage model";
  BuildingSystems.Fluid.MixingVolumes.MixingVolume vol[nEle - 2](
    redeclare package Medium = Medium,
    each m_flow_nominal = 1.0,
    each V = V / nEle,
    each nPorts = 3,
    each T_start = T_start)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={32,-10})));
  parameter Modelica.SIunits.Length height = 1.0
    "Height of tank"
    annotation(Dialog(group="Geometry"));
  parameter Modelica.SIunits.Volume V = 1.0
    "Fluid volume in tank"
    annotation(Dialog(group="Geometry"));
  parameter Integer nEle(min=3) = 3
    "Number of layers";
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
  parameter Modelica.SIunits.Thickness thickness_wall = 1
    "Wall thickness"
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
    nEle=nEle) constrainedby BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.PartialBuoyancy(
    nEle=nEle)
    "Accounting for buoyancy effect"
    annotation (choicesAllMatching=true, Placement(transformation(extent={{-10,-10},{10,10}},origin={-22,-2})),Dialog(tab="Advanced",group="Buoyancy"));
  Modelica.Fluid.Interfaces.FluidPorts_a port_a[nEle - 2](
    redeclare package Medium = Medium) if AdditionalFluidPorts
    "Ports to the intermediate layers"
    annotation (Placement(transformation(extent={{-104,-36},{-86,36}}),iconTransformation(extent={{-80,-38},{-60,38}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a  heatPort if not PerfectlyIsolated
    "Boundary condition to surroundings"
    annotation (Placement(transformation(extent={{-10,94},{10,114}}),iconTransformation(extent={{-10,94},{10,114}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalCollector thermalCollector(
    m = 2 + nEle) if not PerfectlyIsolated
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=90,origin={-62,70})));
  parameter Boolean HX_top = true
    "Set to true to add heat exchanger at the top layer"
    annotation(Dialog(group="Storage configuration"));
  parameter Boolean HX_bot = true
    "Set to true to add heat exchanger at the bottom layer"
    annotation(Dialog(group="Storage configuration"));
  parameter Boolean PerfectlyIsolated = false
    "Set to true to avoid heat losses"
    annotation(Dialog(group="Storage configuration"));
  parameter Boolean AdditionalFluidPorts = false
    "Set to true to add aditional fluid ports connected to intermediate layers"
    annotation(Dialog(group="Storage configuration"));
  final parameter Modelica.SIunits.ThermalConductance UA_wall = (
    1.0 / Modelica.Constants.pi) * (1.0 / (alpha_out * diameter_ext) + log(diameter_ext / diameter_int) / (2 * lambda_ins) + 1/(alpha_in * diameter_int))
    "Thermal conductance walls";
  final parameter Modelica.SIunits.ThermalConductance UA_top =
    1.0 / (thickness_ins / (lambda_ins * ASec) + 1.0 / (alpha_in * ASec) + 1.0 / (alpha_out * ASec))
    "Thermal conductance top";
  final parameter Modelica.SIunits.ThermalConductance UA_bot = UA_top
    "Thermal conductance bottom";
  Modelica.Fluid.Interfaces.FluidPort_a port_HXBot_a(
    redeclare package Medium = Medium) if HX_bot
    "Port a to the HX at the bottom of the tank"
    annotation (Placement(transformation(extent={{60,-50},{80,-30}}), iconTransformation(extent={{60,-50},{80,-30}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_HXBot_b(
    redeclare package Medium = Medium) if HX_bot
    "Port b to the HX at the bottom of the tank"
    annotation (Placement(transformation(extent={{60,-70},{80,-50}}), iconTransformation(extent={{60,-70},{80,-50}})));
  BuildingSystems.Fluid.MixingVolumes.MixingVolume vol_HXbot(
    nPorts = 2,
    redeclare package Medium = Medium,
    m_flow_nominal = 1.0,
    V = 0.05,
    T_start=T_start) if HX_bot
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={50,-84})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor ThermalConductanceHXbot(
    each G = UA_HXbot) if HX_bot
    annotation (Placement(transformation(extent={{10,10},{-10,-10}},origin={34,-54})));
  Modelica.Fluid.Interfaces.FluidPort_a port_HXTop_a(
    redeclare package Medium = Medium) if  HX_top
    "Port a to the HX at the top of the tank"
    annotation (Placement(transformation(extent={{80,40},{60,60}}), iconTransformation(extent={{80,40},{60,60}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_HXTop_b(
    redeclare package Medium = Medium) if HX_top
    "Port b to the HX at the top of the tank"
    annotation (Placement(transformation(extent={{80,20},{60,40}}), iconTransformation(extent={{80,20},{60,40}})));
  BuildingSystems.Fluid.MixingVolumes.MixingVolume vol_HXtop(
    nPorts = 2,
    m_flow_nominal = 1.0,
    redeclare package Medium = Medium,
    V = 0.05,
    T_start = T_start) if HX_top
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=90,origin={38,44})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor ThermalConductanceHXtop(
    each G = UA_HXtop) if HX_top
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},origin={62,90})));
  parameter Modelica.SIunits.ThermalConductance UA_HXtop = 100.0
    "Constant thermal conductance of material"
    annotation(Dialog(enable=HX_top,group="HX definition"));
  parameter Integer Ele_HX_top = 2
    "Layer at which HX_top is connected"
    annotation(Dialog(enable = HX_top,group="HX definition"));
  parameter Modelica.SIunits.ThermalConductance UA_HXbot = 100.0
    "Constant thermal conductance of material"
    annotation(Dialog(enable = HX_bot,group="HX definition"));
  parameter Integer Ele_HX_bot = 1
    "Layer at which HX_bot is connected"
    annotation(Dialog(enable = HX_bot,group="HX definition"));
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
    annotation(Dialog(tab="Initialitzation"));
  Modelica.Blocks.Interfaces.RealOutput T[nEle](unit="K")
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
      points={{-90,90},{-86,90},{-86,-88},{-76,-88},{-76,-98},{-56,-98},{-56,-90},{-62.6667,-90}},
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
  connect(port_HXBot_a, vol_HXbot.ports[1]) annotation (Line(
      points={{70,-58},{72,-58},{72,-82},{60,-82}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_HXbot.ports[2], port_HXBot_b) annotation (Line(
      points={{60,-86},{60,-78},{70,-78},{70,-38}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_HXbot.heatPort, ThermalConductanceHXbot.port_a) annotation (Line(
      points={{50,-74},{50,-54},{44,-54}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(vol_HXtop.heatPort, ThermalConductanceHXtop.port_a) annotation (Line(
      points={{38,54},{38,90},{52,90}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_HXTop_b, vol_HXtop.ports[1]) annotation (Line(
      points={{70,50},{70,72},{48,72},{48,46}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(vol_HXtop.ports[2], port_HXTop_a) annotation (Line(
      points={{48,42},{48,30},{70,30}},
      color={0,127,255},
      smooth=Smooth.None));

  //Definition HX connection to volume:
      // HX_bot
  if Ele_HX_bot == 1 then
    connect(ThermalConductanceHXbot.port_b, vol_bot.heatPort);
  elseif Ele_HX_bot == nEle then
    connect(ThermalConductanceHXbot.port_b, vol_top.heatPort);
  else
    connect(ThermalConductanceHXbot.port_b, vol[Ele_HX_bot-1].heatPort);
  end if;
      // HX_top
  if Ele_HX_top == 1 then
    connect(ThermalConductanceHXtop.port_b, vol_bot.heatPort);
  elseif Ele_HX_bot == nEle then
    connect(ThermalConductanceHXtop.port_b, vol_top.heatPort);
  else
    connect(ThermalConductanceHXtop.port_b, vol[Ele_HX_top-1].heatPort);
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
      points={{-96,0},{-68,0}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
      Line(
        points={{60,90},{60,-90}},
        color={0,0,0},
        smooth=Smooth.None,
        thickness=0.5),
      Ellipse(extent={{-60,98},{60,80}}, lineColor={0,0,0},
        lineThickness=0.5),
      Ellipse(extent={{-60,-82},{60,-100}},
                                         lineColor={0,0,0},
        lineThickness=0.5),
      Line(
        points={{-60,90},{-60,-90}},
        color={0,0,0},
        smooth=Smooth.None,
        thickness=0.5),
      Line(
        points={{22,62}},
        color={0,0,255},
        smooth=Smooth.None),
      Line(
        points={{40,60}},
        color={0,0,255},
        smooth=Smooth.None),
      Line(
        points={{40,-26},{0,-26},{0,-30},{40,-30},{40,-34},{0,-34},{0,-38},{40,
            -38},{40,-42},{0,-42},{0,-46},{39.9609,-46},{40,-50},{0,-50},{0,-54},
            {40,-54}},
        color={0,0,255},
        smooth=Smooth.Bezier,
        visible=HX_bot),
      Line(
        points={{40,-26},{46,-26},{46,-32},{60,-32}},
        color={0,0,255},
        smooth=Smooth.Bezier,
        visible=HX_bot),
      Line(
        points={{40,60},{0,60},{0,56},{40,56},{40,52},{0,52},{0,48},{40,48},{40,
            44},{0,44},{0,40},{38.9844,40},{40,36},{0,36},{0,32},{40,32}},
        color={0,0,255},
        smooth=Smooth.Bezier,
        visible=HX_top),
      Line(
        points={{40,32},{46,32},{46,26},{60,26}},
        color={0,0,255},
        smooth=Smooth.Bezier,
        visible=HX_top),
      Line(
        points={{40,60},{46,60},{46,54},{60,54}},
        color={0,0,255},
        smooth=Smooth.Bezier,
        visible=HX_top),
      Line(
        points={{-64,60},{-62,60},{-60,60}},
        color={0,0,255},
        smooth=Smooth.None),
      Text(
        extent={{-94,80},{-74,60}},
        lineColor={0,0,255},
        fillColor={255,0,0},
        fillPattern=FillPattern.Solid,
        textString="T"),
      Line(
        points={{40,-54},{46,-54},{46,-60},{60,-60}},
        color={0,0,255},
        smooth=Smooth.Bezier,
        visible=HX_bot),
      Text(
          extent={{-147,-108},{153,-148}},
          lineColor={0,0,255},
          textString="%name")}),
  Documentation(info="<html>
    <p>
  This is a model for a  thermal fluid storage
  </p>
  <h4>Typical use and important parameters</h4>
  <p>
  <code>nEle</code> number of layers
  </p>
  <h4>Options</h4>
  <p>
  The thermal fluid storage model has several fluidports. 2 at bottom and 2 at the top. Furthermore it is possible to have different configurations:
  </p>
  <p>
  Switching off/on intern heat exchangers identified as \"bottom\" and \"top\". However it is possible to specify the layer at which the HX are connected.
  </p>
  <p>
  There is also the possibility to switch on fluidports connected each at the intermediate fluid layers.
  </p>
  <p>
  Furthemore, it is possible to switch off the heat losses to the environment, having a perfect isolated thermal fluid storage.
  Notice that if no boundary condition is connected to the heatPort, the heat flow rate at the heatPort/Heat loss of the thermal fluid storage will be 0.
  However, in case no boundary condition is used and the boolean <code>PerfectlyIsolated</code> is not set to true.
  An non physical internal heat flow transfer between volumes will take place.
  </p>
  <h4>Notes</h4>
  <p>
  The thermal fluid storage uses a model to increase heat exchange betweeen layers accounting for buoyancy effect,
  see <a href=\"modelica://BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels\">
  BuoyancyModels</a>
  </p>
  <h4>Assumption and limitations</h4>
  <p>
  Up to date the model does not take into account the mixing caused by in and outflows and there is no model for a stratified inlet.
  </p>
</html>"));
end FluidStorage;
