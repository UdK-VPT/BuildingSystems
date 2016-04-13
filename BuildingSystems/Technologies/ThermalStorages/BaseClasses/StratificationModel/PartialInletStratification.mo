within BuildingSystems.Technologies.ThermalStorages.BaseClasses.StratificationModel;
model PartialInletStratification
  Integer position;
  parameter Integer nEle(min=2);
  Modelica.Fluid.Interfaces.FluidPort_a port_a(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-60,-100},{-40,-80}}),iconTransformation(extent={{-60,-100},{-40,-80}})));
  Modelica.Fluid.Interfaces.FluidPorts_b ports_b[nEle - 2](
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{80,-40},{100,40}}), iconTransformation(extent={{80,-40},{100,40}})));
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium constrainedby
    Modelica.Media.Interfaces.PartialMedium;
  BuildingSystems.Fluid.Sensors.Temperature senTem(redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{40,44},{20,64}})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T sou[nEle](
    redeclare package Medium = Medium,
    each nPorts=1,
    each m_flow=0,
    each use_m_flow_in=true,
    each use_T_in=true)
    "Flow source"
    annotation (Placement(transformation(extent={{-78,-10},{-58,10}})));
  BuildingSystems.Fluid.Sources.FixedBoundary bou(nPorts=1, redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{-20,-80},{0,-60}})));
  Modelica.Blocks.Sources.RealExpression m_flow[nEle](y=m_flow_eq)
    annotation (Placement(transformation(extent={{-20,20},{-40,40}})));
  Modelica.Blocks.Routing.Replicator replicator(nout=nEle)
    annotation (Placement(transformation(extent={{-24,44},{-44,64}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_bot(
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{80,-100},{100,-80}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b_top(
    redeclare package Medium = Medium)
    annotation (Placement(transformation(extent={{80,80},{100,100}})));
  Modelica.Blocks.Interfaces.RealInput T[nEle](
    final unit = "K",
    displayUnit = "degC")
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=-90,origin={0,100})));
protected
  Modelica.SIunits.MassFlowRate m_flow_eq[nEle];
  Modelica.SIunits.TemperatureDifference dT1(start=0);
  Modelica.SIunits.TemperatureDifference dT2(start=0);
  Modelica.SIunits.TemperatureDifference dTn(start=1);
  Real factor[nEle];
algorithm
  position := 1;
  for i in 1:nEle loop
    factor[i] := 0;
    if T[i] < senTem.T then
    else
      position:=i;
      break;
    end if;
  end for;
  if position > 1 then
    dT1 := abs(T[position-1] - senTem.T);
    dT2 := abs(T[position] - senTem.T);
    dTn := abs(T[position]-T[position-1]);
  //normallize
    factor[position-1] := 1-dT1/dTn;
    factor[position] := 1-dT2/dTn;
  else
    factor[position] := 1;
  end if;
equation
  for i in 1:nEle loop
      connect(sou[i].T_in, replicator.y[i]) annotation (Line(
        points={{-80,4},{-92,4},{-92,54},{-45,54}},
        color={0,0,127},
        smooth=Smooth.None));
      m_flow_eq[i] = factor[i]*port_a.m_flow;
  end for;
  for i in 1:nEle-2 loop
    connect(ports_b[i], sou[i+1].ports[1]) annotation (Line(
        points={{90,0},{16,0},{16,0},{-58,0}},
        color={0,127,255},
        smooth=Smooth.None));
  end for;
  connect(sou[nEle].ports[1], port_b_top) annotation (Line(
      points={{-58,-2.22045e-016},{60,-2.22045e-016},{60,90},{90,90}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sou[1].ports[1], port_b_bot) annotation (Line(
      points={{-58,0},{60,0},{60,-90},{90,-90}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(bou.ports[1], port_a) annotation (Line(
      points={{0,-70},{30,-70},{30,-90},{-50,-90}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(replicator.u, senTem.T) annotation (Line(
      points={{-22,54},{23,54}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(senTem.port, port_a) annotation (Line(
      points={{30,44},{30,-90},{-50,-90}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(sou.m_flow_in, m_flow.y) annotation (Line(
      points={{-78,8},{-88,8},{-88,30},{-41,30}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation (    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Line(
      points={{80,4}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{-50,-76},{-50,40}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{50,20},{42,16}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{50,0},{42,-4}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{-50,40},{50,40},{42,44}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{50,40},{42,36}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{50,-40},{42,-44}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{50,-60},{42,-64}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{50,-20},{42,-24}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{-50,20},{50,20},{42,24}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{-50,0},{50,0},{42,4}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{-50,-20},{50,-20},{42,-16}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{-50,-40},{50,-40},{42,-36}},
      color={0,0,255},
      smooth=Smooth.None),
    Line(
      points={{-50,-60},{50,-60},{42,-56}},
      color={0,0,255},
      smooth=Smooth.None),
    Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}),
    Text(extent={{-80,80},{80,42}},lineColor={0,0,255},textString="Stratified inlet")}));
end PartialInletStratification;
