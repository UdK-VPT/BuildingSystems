within BuildingSystems.HAM.HeatConduction;
model HeatConduction1D "Model for 1D heat conduction"
  extends BuildingSystems.HAM.HeatConduction.BaseClasses.HeatConductionGeneral;

  BuildingSystems.Interfaces.HeatPort heatPort_x1
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_x2
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_source
    "Optional heat source at the thermal node"
    annotation(Placement(transformation(extent={{-10,-12},{10,8}}), iconTransformation(extent={{-10,-12},{10,8}})));
  parameter Real redFacX(min = 0.0, max = 1.0) = 1.0
    "Reduction factior for inner spaces of the body in the x dimension";
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start temperature of the thermal node"
    annotation (Dialog(tab="Initialization"));
  Modelica.SIunits.Temp_K T(start = T_start) "Temperature of the thermal node";
protected
  parameter Modelica.SIunits.HeatCapacity C = material.c * material.rho * lengthX * redFacX * lengthY * lengthZ
    "Heat capacity of the thermal node";
  parameter Modelica.SIunits.ThermalConductance kX = 2.0 * material.lambda / (lengthX * redFacX) * lengthY * lengthZ
    "Thermal conductance in the x dimension";

equation
  heatPort_x1.Q_flow = kX * (heatPort_x1.T - T);
  heatPort_x2.Q_flow = kX * (heatPort_x2.T - T);
  heatPort_source.T = T;
  C * der(T) = heatPort_x1.Q_flow + heatPort_x2.Q_flow + heatPort_source.Q_flow;

  annotation(defaultComponentName = "heatConduction1D",Icon(graphics={
    Text(extent={{-14,71},{54,5}},lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={255,128,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="1")}));
end HeatConduction1D;
