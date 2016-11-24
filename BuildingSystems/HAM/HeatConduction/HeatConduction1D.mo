within BuildingSystems.HAM.HeatConduction;
model HeatConduction1D
  "Model for 1D heat conduction"
  extends BuildingSystems.HAM.HeatConduction.BaseClasses.HeatConductionGeneral;

  BuildingSystems.Interfaces.HeatPort heatPort_x1
    "Heat port in direction x1"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_x2
    "Heat port in direction x2"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0})));
  BuildingSystems.Interfaces.HeatPort heatPort_source
    "Optional heat source at the thermal node"
    annotation(Placement(transformation(extent={{-10,-12},{10,8}}), iconTransformation(extent={{-10,-12},{10,8}})));
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start temperature of the thermal node"
    annotation (Dialog(tab="Initialization"));
  Modelica.SIunits.Temp_K T(start = T_start)
    "Temperature of the thermal node";
protected
  parameter Modelica.SIunits.HeatCapacity C = material.c * material.rho * lengthX * lengthY * lengthZ
    "Heat capacity of the thermal node";
  parameter Modelica.SIunits.ThermalConductance kX = 2.0 * material.lambda / lengthX * lengthY * lengthZ
    "Thermal conductance in the x dimension";
equation
  heatPort_x1.Q_flow = kX * (heatPort_x1.T - T);
  heatPort_x2.Q_flow = kX * (heatPort_x2.T - T);
  heatPort_source.T = T;
  C * der(T) = heatPort_x1.Q_flow + heatPort_x2.Q_flow + heatPort_source.Q_flow;

  annotation(defaultComponentName = "heatConduction1D",Icon(graphics={
    Text(extent={{-14,71},{54,5}},lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},
    fillPattern=FillPattern.Solid,textString="D"),
    Text(extent={{-52,71},{16,5}},lineColor={255,128,0},lineThickness=0.5,
    fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="1")}),
Documentation(info="<html>
<p>
This is a model which describes the one-dimensional heat conduction in x-direction within a
cuboid shaped body width the edge length <code>dx</code>, <code>dy</code> and <code>dz</code>
</p>
<p align=\"center\" style=\"font-style:italic;\">
c &rho; dx dy dz dT &frasl; dt = Q&#775;<sub>x1</sub> + Q&#775;<sub>x2</sub> + Q&#775;<sub>heatsource</sub>,
</p><p>
with the heat flow rates to the borders <code>x1</code> and <code>x2</code>
</p>
<p align=\"center\" style=\"font-style:italic;\">
Q&#775;<sub>x1/x2</sub>; = k<sub>x</sub> (T<sub>x1/x2</sub> - T).
</p>
<p>
Here k<sub>x</sub> is the thermal conductance in the x dimension
</p>
<p align=\"center\" style=\"font-style:italic;\">
k<sub>x</sub> = 2 &lambda; &frasl; dx dy dz.
</p>
<p>
c the specific heat capacity, &rho; the density, &lambda; the heat conductivity,
Q&#775;<sub>heatsource</sub> an optional heat source within the body.
T<sub>x1/x2</sub> are the temperatures on the borders <code>x1/x2</code>
with the area <code>dy dz</code>.
</p>
<h4>Notes</h4>
<p>
For problems with 3 dimensional heat conduction,
the extended model <a href=\"modelica://BuildingSystems.HAM.HeatConduction.HeatConduction3D\">
BuildingSystems.HAM.HeatConduction.HeatConduction3D</a>
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
end HeatConduction1D;
