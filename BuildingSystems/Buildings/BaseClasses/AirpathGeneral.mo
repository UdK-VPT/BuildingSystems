within BuildingSystems.Buildings.BaseClasses;
partial model AirpathGeneral
  "Abstract model of an air path"
  final package Medium = BuildingSystems.Media.Air;
  Modelica.Fluid.Interfaces.FluidPort_a airpathPort_1(
    redeclare final package Medium=Medium)
    "Air path port side 1"
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}}), iconTransformation(extent={{-50,-10},{-30,10}})));
  Modelica.Fluid.Interfaces.FluidPort_b airpathPort_2(
    redeclare final package Medium=Medium)
    "Air path port side 2"
    annotation (Placement(transformation(extent={{30,-10},{50,10}}), iconTransformation(extent={{30,-10},{50,10}})));
  BuildingSystems.Types.FlowCoefficient k = 0.5
    "Flow coefficient";
  Real m(unit = "1") = 0.5
    "Flow exponent";
  constant Real factor = 20.0
    "Numerical factor for air exchange calculation";
  constant Modelica.SIunits.Density rho_nominal = 1.2
    "Air density under nominal conditions";
equation
  // Isenthalpic state transformation (no heat production by friction)
  airpathPort_1.h_outflow = inStream(airpathPort_2.h_outflow);
  airpathPort_2.h_outflow = inStream(airpathPort_1.h_outflow);

  // Mass balance (no storage)
  airpathPort_1.m_flow + airpathPort_2.m_flow = 0;

   // Transport of substances
  airpathPort_1.Xi_outflow = inStream(airpathPort_2.Xi_outflow);
  airpathPort_2.Xi_outflow = inStream(airpathPort_1.Xi_outflow);

  airpathPort_1.C_outflow = inStream(airpathPort_2.C_outflow);
  airpathPort_2.C_outflow = inStream(airpathPort_1.C_outflow);

  // Mass flow trough air path
  airpathPort_1.m_flow = Modelica.Math.tanh(factor * (airpathPort_1.p - airpathPort_2.p)) * rho_nominal * k
    * BuildingSystems.Utilities.SmoothFunctions.safepow(BuildingSystems.Utilities.SmoothFunctions.softfabs(airpathPort_1.p - airpathPort_2.p,0.05),m);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-10,40},{10,-40}},lineColor={230,230,230},fillColor={230,230,230},fillPattern=FillPattern.Solid,origin={0,1.77636e-015},rotation=90),
    Text(extent={{-44,-10},{48,-38}},lineColor={0,0,255},fillColor={230,230,230},fillPattern =FillPattern.Solid,textString="%name")}),
Documentation(info="<html>
<p>
This is partial model description of an air path.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end AirpathGeneral;
