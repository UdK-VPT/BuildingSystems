within BuildingSystems.HAM.HeatConduction;
model HeatConduction3D "Model for 3D heat conduction"
  extends BuildingSystems.HAM.HeatConduction.BaseClasses.HeatConductionGeneral;

  BuildingSystems.Interfaces.HeatPort heatPort_x1
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_x2
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_y1
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={0,-80}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={0,-80})));
  BuildingSystems.Interfaces.HeatPort heatPort_y2
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={0,80}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={0,82})));
  BuildingSystems.Interfaces.HeatPort heatPort_z1
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,-80}),iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,-80})));
  BuildingSystems.Interfaces.HeatPort heatPort_z2
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,80}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,78})));
  BuildingSystems.Interfaces.HeatPort heatPort_source
    "Optional heat source at the thermal node"
    annotation(Placement(transformation(extent={{-10,-12},{10,8}}), iconTransformation(extent={{-10,-12},{10,8}})));
  parameter Modelica.SIunits.Area ARedXY = 0.0
    "Reduction area for heat conduction caused by inner hollow spaces in the xy plane"
    annotation(Dialog(tab = "Advanced", group = "Inner hollow spaces"));
  parameter Modelica.SIunits.Area ARedXZ = 0.0
    "Reduction area for heat conduction caused by inner hollow spaces in the xz plane"
    annotation(Dialog(tab = "Advanced", group = "Inner hollow spaces"));
  parameter Modelica.SIunits.Area ARedYZ = 0.0
    "Reduction area for heat conduction caused by  inner hollow spaces in the yz plane"
    annotation(Dialog(tab = "Advanced", group = "Inner hollow spaces"));
  parameter Modelica.SIunits.Volume VRed = 0.0
    "Reduction volume for the thermal heat capacity caused by inner hollow spaces"
    annotation(Dialog(tab = "Advanced", group = "Inner hollow spaces"));
  parameter Real geoFacX(min = 0.0, max = 1.0) = 1.0
    "Geometry factor for heat conduction caused by inner hollow spaces in x dimension"
    annotation(Dialog(tab = "Advanced", group = "Inner hollow spaces"));
  parameter Real geoFacY(min = 0.0, max = 1.0) = 1.0
    "Geometry factor for heat conduction caused by inner hollow spaces in y dimension"
    annotation(Dialog(tab = "Advanced", group = "Inner hollow spaces"));
  parameter Real geoFacZ(min = 0.0, max = 1.0) = 1.0
    "Geometry factor for heat conduction caused by inner spaces in z dimension"
   annotation(Dialog(tab = "Advanced", group = "Inner hollow spaces"));
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start temperature of the thermal node"
    annotation (Dialog(tab="Initialization"));
  Modelica.SIunits.Temp_K T(start = T_start) "Temperature of the thermal node";
protected
  parameter Modelica.SIunits.HeatCapacity C = material.c * material.rho * (lengthX * lengthY * lengthZ - VRed)
    "Heat capacity of the thermal node";
  parameter Modelica.SIunits.ThermalConductance CThX = 2.0 * material.lambda / (lengthX * geoFacX) * (lengthY * lengthZ - ARedYZ)
    "Thermal conductance in the x dimension";
  parameter Modelica.SIunits.ThermalConductance CThY = 2.0 * material.lambda / (lengthY* geoFacY) * (lengthX * lengthZ - ARedXZ)
    "Thermal conductance in the y dimension";
  parameter Modelica.SIunits.ThermalConductance CThZ = 2.0 * material.lambda / (lengthZ* geoFacZ) * (lengthY * lengthX - ARedXY)
    "Thermal conductance in the z dimension";

equation
  heatPort_x1.Q_flow = CThX * (heatPort_x1.T - T);
  heatPort_x2.Q_flow = CThX * (heatPort_x2.T - T);
  heatPort_y1.Q_flow = CThY * (heatPort_y1.T - T);
  heatPort_y2.Q_flow = CThY * (heatPort_y2.T - T);
  heatPort_z1.Q_flow = CThZ * (heatPort_z1.T - T);
  heatPort_z2.Q_flow = CThZ * (heatPort_z2.T - T);
  heatPort_source.T = T;
  C * der(T) = heatPort_x1.Q_flow + heatPort_x2.Q_flow + heatPort_y1.Q_flow + heatPort_y2.Q_flow + heatPort_z1.Q_flow + heatPort_z2.Q_flow + heatPort_source.Q_flow;

  annotation (defaultComponentName = "heatConduction3D",Icon(graphics={
    Text(extent={{-14,71},{54,5}},lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={255,128,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="3")}));
end HeatConduction3D;
