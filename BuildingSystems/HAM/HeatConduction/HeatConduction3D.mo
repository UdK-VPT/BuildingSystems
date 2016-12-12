within BuildingSystems.HAM.HeatConduction;
model HeatConduction3D "Model for 3D heat conduction"
  extends BuildingSystems.HAM.HeatConduction.BaseClasses.HeatConductionGeneral;

  BuildingSystems.Interfaces.HeatPort heatPort_x1
    "Heat port in direction x1"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_x2
    "Heat port in direction x2"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_y1
    "Heat port in direction y1"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={0,-80}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={0,-80})));
  BuildingSystems.Interfaces.HeatPort heatPort_y2
    "Heat port in direction y2"
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={0,80}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={0,82})));
  BuildingSystems.Interfaces.HeatPort heatPort_z1
    "Heat port in direction z1"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,-80}),iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,-80})));
  BuildingSystems.Interfaces.HeatPort heatPort_z2
    "Heat port in direction z2"
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
  parameter Real geoFacX(unit = "1", min = 0.0, max = 1.0) = 1.0
    "Geometry factor for heat conduction caused by inner hollow spaces in x dimension"
    annotation(Dialog(tab = "Advanced", group = "Inner hollow spaces"));
  parameter Real geoFacY(unit = "1", min = 0.0, max = 1.0) = 1.0
    "Geometry factor for heat conduction caused by inner hollow spaces in y dimension"
    annotation(Dialog(tab = "Advanced", group = "Inner hollow spaces"));
  parameter Real geoFacZ(unit = "1", min = 0.0, max = 1.0) = 1.0
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
    Text(extent={{-14,71},{54,5}},lineColor={255,0,0},lineThickness=0.5,
    fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={255,128,0},lineThickness=0.5,
    fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="3")}),
Documentation(info="<html>
<p>
This is a model which describes the three-dimensional heat conduction in x-, y- and z-direction within a
cuboid shaped body width the edge length <code>dx</code>, <code>dy</code> and <code>dz</code>
</p>
<p align=\"center\" style=\"font-style:italic;\">
c &rho; dx dy dz dT &frasl; dt = Q&#775;<sub>x1</sub> + Q&#775;<sub>x2</sub> + Q&#775;<sub>y1</sub> + Q&#775;<sub>y2</sub> + Q&#775;<sub>z1</sub> + Q&#775;<sub>z2</sub> + Q&#775;<sub>heatsource</sub>,
</p><p>
with the heat flow rates to the borders <code>x1/y2</code>, <code>y1/y2</code> and <code>z1/z2</code>
</p>
<p align=\"center\" style=\"font-style:italic;\">
Q&#775;<sub>x1/x2</sub>; = k<sub>x</sub> (T<sub>x1/x2</sub> - T).
</p>
<p align=\"center\" style=\"font-style:italic;\">
Q&#775;<sub>y1/y2</sub>; = k<sub>y</sub> (T<sub>y1/y2</sub> - T).
</p>
<p align=\"center\" style=\"font-style:italic;\">
Q&#775;<sub>z1/z2</sub>; = k<sub>z</sub> (T<sub>z1/z2</sub> - T).
</p>
<p>
Here k<sub>x</sub>, k<sub>Y</sub> and k<sub>z</sub> are the thermal conductances in the x-, y- and z-dimension
</p>
<p align=\"center\" style=\"font-style:italic;\">
k<sub>x</sub> = 2 &lambda; &frasl; dx dy dz.
</p>
<p align=\"center\" style=\"font-style:italic;\">
k<sub>y</sub> = 2 &lambda; &frasl; dy dx dz.
</p>
<p align=\"center\" style=\"font-style:italic;\">
k<sub>z</sub> = 2 &lambda; &frasl; dz dy dx.
</p>
<p>
c is the specific heat capacity, &rho; the density, &lambda; the heat conductivity,
Q&#775;<sub>heatsource</sub> an optional heat source within the body.
T<sub>x1/x2</sub>, T<sub>y1/y2</sub> and T<sub>z1/z2</sub> are the temperatures on
the borders <code>x1/x2</code>, <code>y1/y2</code> and <code>z1/z2</code>
with the areas <code>dy dz</code>, <code>dx dz</code> and <code>dy dx</code>.
</p>
<h4>Notes</h4>
<p>
For problems with 1 dimensional heat conduction,
the simplified model <a href=\"modelica://BuildingSystems.HAM.HeatConduction.HeatConduction1D\">
BuildingSystems.HAM.HeatConduction.HeatConduction1D</a>
can be used and combined with other models from the
<code>BuildingSystems</code> library.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2016 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end HeatConduction3D;
