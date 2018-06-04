within BuildingSystems.Buildings.Constructions.Windows;
model Window
  "Simplified model of a window"
  extends BuildingSystems.Buildings.BaseClasses.WindowGeneral(
  toSurfacePort_2(A=ASur),
  toSurfacePort_1(A=ASur),
  radTra1to2(final areaRatioUnglazed = 0.0),
  radTra2to1(final areaRatioUnglazed = 0.0));
  final package Medium = BuildingSystems.Media.Air;
  final parameter Modelica.SIunits.Area ASur = height * width
    "Surface area"
    annotation(Dialog(enable = false, tab = "General", group = "Geometry"));
  parameter Boolean calcAirchange = false
    "True: calculation of air exchange through the window, false: no air exchange"
    annotation(Dialog(tab = "General", group = "Air change calculation"));
  parameter BuildingSystems.Types.CoefficientOfAirChange aF = 1.0
    "Joint coefficient"
    annotation(Dialog(tab = "General", group = "Air change calculation"));
  BuildingSystems.Buildings.Airpaths.AirpathVariable airpathDown if calcAirchange
    annotation (Placement(transformation(extent={{-10,-30},{10,-10}})));
  BuildingSystems.Buildings.Airpaths.AirpathVariable airpathUp if calcAirchange
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  Modelica.Fluid.Interfaces.FluidPort_a airpathPortUp_1(
    redeclare final package Medium=Medium) if calcAirchange
    annotation (Placement(transformation(extent={{-28,10},{-8,30}}), iconTransformation(extent={{-8,-8},{8,8}},rotation=90,origin={-18,40})));
  Modelica.Fluid.Interfaces.FluidPort_b airpathPortUp_2(
    redeclare final package Medium=Medium) if calcAirchange
    annotation (Placement(transformation(extent={{8,10},{28,30}}), iconTransformation(extent={{-8,-8},{8,8}},rotation=90,origin={18,40})));
  Modelica.Fluid.Interfaces.FluidPort_a airpathPortDown_1(
    redeclare final package Medium=Medium) if calcAirchange
    annotation (Placement(transformation(extent={{-28,-30},{-8,-10}}), iconTransformation(extent={{-26,-48},{-10,-32}})));
  Modelica.Fluid.Interfaces.FluidPort_b airpathPortDown_2(
    redeclare final package Medium=Medium) if calcAirchange
    annotation (Placement(transformation(extent={{8,-30},{28,-10}}), iconTransformation(extent={{10,-48},{26,-32}})));
  BuildingSystems.Interfaces.Angle_degInput angleDegPanes if calcAirchange
    annotation (Placement(transformation(extent={{-12,-12},{12,12}},rotation=270,origin={0,62}), iconTransformation(extent={{-8,-8},{8,8}},rotation=270,origin={0,78})));
  BuildingSystems.Buildings.Data.AirpathCharacteristics.AirpathCharacteristicWindow airpathChar(
    width = width,
    height = 0.5 * height,
    aF = aF/3600.0) if calcAirchange
    "Characteristic of the window airpaths";
equation
  // Airpath calculation
  connect(airpathChar.angleDegPanes,angleDegPanes);
  connect(airpathUp.kVar,airpathChar.k);
  connect(airpathUp.mVar,airpathChar.m);
  connect(airpathDown.kVar,airpathChar.k);
  connect(airpathDown.mVar,airpathChar.m);
  connect(airpathUp.airpathPort_1, airpathPortUp_1) annotation (Line(
      points={{-4,20},{-18,20}},
      color={0,0,255},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(airpathUp.airpathPort_2, airpathPortUp_2) annotation (Line(
      points={{4,20},{18,20}},
      color={0,0,255},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(airpathDown.airpathPort_1, airpathPortDown_1) annotation (Line(
      points={{-4,-20},{-18,-20}},
      color={0,0,255},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(airpathDown.airpathPort_2, airpathPortDown_2) annotation (Line(
      points={{4,-20},{18,-20}},
      color={0,0,255},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));

  annotation (defaultComponentName="window", Icon(coordinateSystem(preserveAspectRatio=false,
    extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-10,80},{10,-80}},lineColor={230,230,230},fillColor={230,230,230},
      fillPattern = FillPattern.Solid),
    Rectangle(extent={{6,80},{10,-80}},lineColor={170,255,255},fillColor={170,255,255},
      fillPattern = FillPattern.Solid),
    Rectangle(extent={{-10,80},{-6,-80}}, lineColor={170,255,255},fillColor={170,255,255},
      fillPattern = FillPattern.Solid),
    Rectangle(extent={{-20,80},{20,60}},lineColor={175,175,175},fillColor={175,175,175},
      fillPattern = FillPattern.Solid),
    Rectangle(extent={{-20,-60},{20,-80}},lineColor={175,175,175},fillColor={175,175,175},
      fillPattern = FillPattern.Solid),
    Line(points={{-10,60},{-10,-60}},color={0,0,255},smooth=Smooth.None,thickness=0.5),
    Text(extent={{-66,146},{66,106}},lineColor={0,0,255},fillColor={230,230,230},
      fillPattern = FillPattern.Solid,textString = "%name")}),
Documentation(info="<html>
<p>
This is a simplified model of a window.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
<li>
July 27, 2017 by Christoph Nytsch-Geusen:<br/>
Introduction of an external shadowing coefficient (GSC).
</li>
<li>
January 14, 2018 by Christoph Nytsch-Geusen:<br/>
Now model is inherited by WindowGeneral.
</li>
</ul>
</html>"));
end Window;
