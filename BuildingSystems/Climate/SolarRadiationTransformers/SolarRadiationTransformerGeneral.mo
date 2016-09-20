within BuildingSystems.Climate.SolarRadiationTransformers;
partial model SolarRadiationTransformerGeneral
  "Solar radiation calculation on a tilted surface (general model)"
  input BuildingSystems.Interfaces.Angle_degInput latitudeDeg
    "Latitude of the location"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=270,origin={-10,88}),iconTransformation(extent={{-14,-14},{14,14}},rotation=270,origin={-38,76})));
  input BuildingSystems.Interfaces.Angle_degInput longitudeDeg
    "Longitude of the location"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=270,origin={-50,88}),iconTransformation(extent={{-14,-14},{14,14}},rotation=270,origin={0,76})));
  input BuildingSystems.Interfaces.Angle_degInput longitudeDeg0
    "Longitude of the local time zone"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=270,origin={30,88}),iconTransformation(extent={{-14,-14},{14,14}},rotation=270,origin={40,76})));
  parameter Real rhoAmb
    "Reflection factor of the ambience";
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegL = 0
    "Grad correction winter-/summer time";
  input BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput IrrDirHor
    "Solar beam radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-102,34},{-62,74}}),iconTransformation(extent={{-90,46},{-62,74}})));
  input BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput IrrDifHor
    "Solar diffuse radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-102,-6},{-62,34}}),iconTransformation(extent={{-90,6},{-62,34}})));
  BuildingSystems.Interfaces.RadiationPort radiationPort
    "Radiation port to the tilted surface"
    annotation (Placement(transformation(extent={{70,-12},{90,8}}), iconTransformation(extent={{70,-12},{90,8}})));
  Modelica.SIunits.RadiantEnergyFluenceRate IrrTotHor
    "Solar total radiation of horizontal surface";
  Modelica.SIunits.RadiantEnergyFluenceRate IrrTotTil
    "Solar total radiation of tilted surface";
  input BuildingSystems.Interfaces.Angle_degInput angleDegAzi
    "Azimuth angle of the surface"
    annotation (Placement(transformation(extent={{-102,-80},{-62,-40}}),iconTransformation(extent={{-90,-74},{-62,-46}})));
  input BuildingSystems.Interfaces.Angle_degInput angleDegTil
    "Tilt angle of the surface"
    annotation (Placement(transformation(extent={{-102,-46},{-62,-6}}), iconTransformation(extent={{-90,-34},{-62,-6}})));
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleZen "Zenith angle";
  Real cosAngleDegAzi
    "Cosinus of the azimuth angle";
  Real cosAngleDegInc
    "Cosinus of the incidence angle";
  Real cosAngleDegTil
    "Cosinus of the tilt angle";
  Real cosAngleZen
    "Cosinus of the zenith angle";
  Modelica.SIunits.Angle angleDec
    "Declination angle of the sun";
  Modelica.SIunits.Angle angleHr
    "Hour angle of the sun";
  Real R
    "R-factor for solar beam radiation";
  Real sinangleDegAzi
    "Sinus of the azimuth angle";
  Real sinangleDegTil
    "Sinus of the tilt angle";
  BuildingSystems.Types.Time_hr timeSun
    "Solar time";
  Real dayOfYear
    "Day of year";
  Real x
    "Helping variable";
  Real Z
    "Shift factor";
  Real sinAngleLat = sin(latitudeDeg * Modelica.Constants.pi / 180.0)
    "Sinus of the latitude";
  Real cosAngleLat = cos(latitudeDeg * Modelica.Constants.pi / 180.0)
    "Cosinus of the latitude";
equation
  dayOfYear = time / (3600.0 * 24.0) + 0.5;

  x = 0.9856 * dayOfYear - 2.72;

  Z = - 7.66 * sin(x * Modelica.Constants.pi / 180.0) - 9.87 * sin((2.0 * x  + 24.99 + 3.83 * sin(x * Modelica.Constants.pi / 180.0)) * Modelica.Constants.pi / 180.0);

  angleDec = 23.45 * Modelica.Constants.pi / 180.0 * sin((360.0 * (284.0 + dayOfYear) / 365.0) * (Modelica.Constants.pi / 180.0));

  timeSun = time / 3600.0 + Z / 60.0 + 4.0 / 60.0 * (longitudeDeg0 - longitudeDeg + angleDegL);

  angleHr = 15.0 * (timeSun - 12.0) * Modelica.Constants.pi / 180.0;

  cosAngleZen = BuildingSystems.Utilities.SmoothFunctions.softcut(cosAngleLat * cos(angleDec) * cos(angleHr)
    + sinAngleLat * sin(angleDec),0.00001,1.0,0.0001);

  angleZen = acos(cosAngleZen) * 180.0 / Modelica.Constants.pi;

  cosAngleDegInc = BuildingSystems.Utilities.SmoothFunctions.softcut(sin(angleDec) * sinAngleLat * cosAngleDegTil
    - sin(angleDec) * cosAngleLat * sinangleDegTil * cosAngleDegAzi
    + cos(angleDec) * cosAngleLat * cosAngleDegTil * cos(angleHr)
    + cos(angleDec) * sinAngleLat * sinangleDegTil * cosAngleDegAzi * cos(angleHr)
    + cos(angleDec) * sinangleDegTil * sinangleDegAzi * sin(angleHr),0.0,1.0,0.0001);

  radiationPort.angleDegInc = acos(cosAngleDegInc) * 180.0 / Modelica.Constants.pi;

  sinangleDegAzi = sin(angleDegAzi * Modelica.Constants.pi / 180.0);

  cosAngleDegAzi = cos(angleDegAzi * Modelica.Constants.pi / 180.0);

  sinangleDegTil = sin(angleDegTil * Modelica.Constants.pi / 180.0);

  cosAngleDegTil = cos(angleDegTil * Modelica.Constants.pi / 180.0);

  IrrTotHor = IrrDirHor + IrrDifHor;

  IrrTotTil = radiationPort.IrrDif + radiationPort.IrrDir;
  annotation (Icon(graphics={
    Rectangle(extent={{-80,80},{80,-80}}, lineColor={170,213,255},fillPattern = FillPattern.Solid,fillColor={170,213,255}),
    Ellipse(extent={{-60,62},{20,-18}},lineColor={255,128,0},fillColor={255,128,0},fillPattern = FillPattern.Solid),
    Line(points={{72,-8},{8,-72}},color={0,0,0},smooth=Smooth.None,thickness=2),
    Line(points={{12,-12},{32,-32}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{22,-2},{42,-22}}, color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{32,8},{52,-12}}, color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{-8,-32},{12,-52}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{2,-22},{22,-42}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Text(extent={{-32,-78},{36,-104}}, lineColor={0,0,255},textString="%name")}));
end SolarRadiationTransformerGeneral;
