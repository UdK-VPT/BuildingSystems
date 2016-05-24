within BuildingSystems.HAM.HeatConduction;
model HeatConduction1DNodes
  "Model for 1D heat conduction and an optional additional discretisation"
  extends BuildingSystems.HAM.HeatConduction.BaseClasses.HeatConductionGeneral;
  BuildingSystems.Interfaces.HeatPort heatPort_x1
    "Heat port in direction x1"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_x2
    "Heat port in direction x2"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_source[nNodesX]
    "Optional heat source at the numerical node"
    annotation(Placement(transformation(extent={{-10,-12},{10,8}}), iconTransformation(extent={{-10,-12},{10,8}})));
  parameter Integer nNodesX = 1
    "Number of numerical nodes in the x dimension";
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start temperature of the thermal nodes"
    annotation (Dialog(tab="Initialization"));
  Modelica.SIunits.Temp_K T[nNodesX](each start = T_start)
    "Temperature of the numerical node";
protected
  parameter Modelica.SIunits.Length dx[nNodesX](each fixed = false);
  parameter Modelica.SIunits.ThermalConductance CTh[nNodesX+1](each fixed=false)
    "Thermal conductance of the numerical node";
  parameter Modelica.SIunits.HeatCapacity C[nNodesX](each fixed = false)
    "Heat capacity of the numerical node";

initial algorithm
  for i in 1:nNodesX loop
    dx[i]:= lengthX / nNodesX;
    C[i]:= material.c * material.rho * dx[i] * lengthY * lengthZ;
  end for;
  for i in 1:nNodesX+1 loop
    if i == 1 then
      CTh[1] := 2.0 * material.lambda / dx[1] * lengthY * lengthZ;
    elseif i > 1 and i < nNodesX+1 then
      CTh[i] := material.lambda / dx[i]  * lengthY * lengthZ;
    else
      CTh[i] := 2.0 * material.lambda / dx[i-1]  * lengthY * lengthZ;
    end if;
  end for;

equation
  heatPort_source[1].T = T[1];
  // Heat flux side 1
  heatPort_x1.Q_flow = CTh[1] * (heatPort_x1.T - T[1]);
  // Heat flux side 2
  heatPort_x2.Q_flow = CTh[nNodesX+1] * (heatPort_x2.T - T[nNodesX]);
  if nNodesX > 1 then
    // First node side 1
    C[1] * der(T[1]) = heatPort_x1.Q_flow + CTh[2] * (T[2] - T[1]) + heatPort_source[1].Q_flow;
    // Mean nodes
    for i in 2:nNodesX-1 loop
      heatPort_source[i].T = T[i];
      C[i] * der(T[i]) = CTh[i] * T[i-1] - (CTh[i] + CTh[i+1]) * T[i] + CTh[i+1] * T[i+1] + heatPort_source[i].Q_flow;
    end for;
    // last node side 2
    heatPort_source[nNodesX].T = T[nNodesX];
    C[nNodesX] * der(T[nNodesX]) = CTh[nNodesX] * (T[nNodesX-1] - T[nNodesX]) + heatPort_x2.Q_flow + heatPort_source[nNodesX].Q_flow;
  else
    // body with only one node
    C[1] * der(T[1]) = heatPort_x1.Q_flow + heatPort_x2.Q_flow + heatPort_source[1].Q_flow;
  end if;

  annotation(defaultComponentName = "heatConduction1DNodes",Icon(graphics={
    Text(extent={{-14,71},{54,5}},lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={255,128,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="1"),
    Line(points={{-40,80},{-40,-80}},color={135,135,135},smooth=Smooth.None,thickness=1),
    Line(points={{40,80},{40,-80}},color={135,135,135},smooth=Smooth.None,thickness=1),
    Line(points={{0,80},{0,-80}},color={135,135,135},smooth=Smooth.None,thickness=1),
    Line(points={{-80,80},{-80,-80}},color={135,135,135},smooth=Smooth.None,thickness=1),
    Line(points={{80,80},{80,-80}},color={135,135,135},smooth=Smooth.None,thickness=1)}));
end HeatConduction1DNodes;
