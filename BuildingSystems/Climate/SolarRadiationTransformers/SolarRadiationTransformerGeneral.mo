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
  parameter Real rhoAmb = 0.2
    "Reflection factor of the ambience";
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegL = 0
    "Grad correction winter-/summer time";
  parameter Boolean OneAxisTracking = false
    "True: tilt angle is tracked to the sun position; false: no axis tracking";
  input BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput IrrDirHor
    "Solar beam radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-102,34},{-62,74}}),iconTransformation(extent={{-90,46},{-62,74}})));
  input BuildingSystems.Interfaces.RadiantEnergyFluenceRateInput IrrDifHor
    "Solar diffuse radiation of horizontal surface"
    annotation (Placement(transformation(extent={{-102,-6},{-62,34}}),iconTransformation(extent={{-90,6},{-62,34}})));
  BuildingSystems.Interfaces.RadiationPort radiationPort
    "Radiation port to the tilted surface"
    annotation (Placement(transformation(extent={{70,-10},{90,10}}),iconTransformation(extent={{70,-10},{90,10}})));
  Modelica.SIunits.RadiantEnergyFluenceRate IrrTotHor
    "Solar total radiation of horizontal surface";
  Modelica.SIunits.RadiantEnergyFluenceRate IrrTotTil
    "Solar total radiation of tilted surface";
  input BuildingSystems.Interfaces.Angle_degInput angleDegAzi
    "Azimuth angle of the surface"
    annotation (Placement(transformation(extent={{-102,-80},{-62,-40}}),
      iconTransformation(extent={{-90,-74},{-62,-46}})));
  input BuildingSystems.Interfaces.Angle_degInput angleDegTil if not OneAxisTracking
    "Tilt angle of the surface"
    annotation (Placement(transformation(extent={{-102,-46},{-62,-6}}),
      iconTransformation(extent={{-90,-34},{-62,-6}})));
  output BuildingSystems.Interfaces.Angle_degOutput angleDegTilTracked =
    180.0 / Modelica.Constants.pi * atan(-sin((radiationPort.angleDegAziSun + angleDegAzi - 90.0)*Modelica.Constants.pi/180.0) * tan(angleZen)) if OneAxisTracking
    "Tilt angle of the surface"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}},rotation=180,origin={-82,-26}),
      iconTransformation(extent={{-14,-14},{14,14}}, rotation=180,origin={-76,-20})));
protected
  BuildingSystems.Interfaces.Angle_degOutput angleDegTil_internal
    "Tilt angle of the surface";
  Modelica.SIunits.Angle angleZen
    "Zenith angle";
  Real cosAngleAzi
    "Cosinus of the azimuth angle";
  Real cosAngleInc
    "Cosinus of the incidence angle";
  Real cosAngleTil
    "Cosinus of the tilt angle";
  Real cosAngleZen
    "Cosinus of the zenith angle";
  Modelica.SIunits.Angle angleDec
    "Declination angle of the sun";
  Modelica.SIunits.Angle angleHr
    "Hour angle of the sun";
  Modelica.SIunits.RadiantEnergyFluenceRate IrrDirNor
    "Direct normal solar irradiance";
  Real sinAngleAzi
    "Sinus of the azimuth angle";
  Real sinAngleTil
    "Sinus of the tilt angle";
  BuildingSystems.Types.Time_hr timeSun
    "Solar time";
  Real dayOfYear
    "Day of year";
  Real x
    "Helping variable";
  Real Z
    "Shift factor";
  Real sinAngleLat = sin(latitudeDeg*degRad)
    "Sinus of the latitude";
  Real cosAngleLat = cos(latitudeDeg*degRad)
    "Cosinus of the latitude";
  Real arg
    "cos(solAzi) after data validity check";
  Real tmp
    "cos(solAzi) before data validity check";
  Real solAziTem
    "Temporary variable for solar azimuth";
  constant Real degRad = Modelica.Constants.pi/180.0
    "Transformation factor deg to rad";
  constant Real radDeg = 180.0/Modelica.Constants.pi
    "Transformation factor rad to deg";
  constant Modelica.SIunits.Angle polarCircle = 1.1617
    "Latitude of polar circle (66 degree 33 min 44 sec)";
  Boolean outsidePolarCircle = latitudeDeg*degRad < polarCircle and latitudeDeg*degRad > -polarCircle
    "Flag, true if latitude is outside polar region";
equation
  tmp = (sinAngleLat * cosAngleZen - Modelica.Math.sin(angleDec))/
        (cosAngleLat * Modelica.Math.sin(angleZen));
  arg = min(1.0, max(-1.0, tmp));
  solAziTem = radDeg * Modelica.Math.acos(arg); // Solar azimuth as a positive number
  if outsidePolarCircle then
    // Outside the polar circle, the only non-differentiability is at night when the sun is set.
    // Hence, we use noEvent.
    if noEvent(timeSun < 12.0) then
      radiationPort.angleDegAziSun = -solAziTem;
    else
      radiationPort.angleDegAziSun = solAziTem;
    end if;
  else
    // Inside the polar circle, there is a jump at (solar-)midnight when the sun can
    // be above the horizon. Hence, we do not use noEvent(...)
    if timeSun < 12.0 then
      radiationPort.angleDegAziSun = -solAziTem;
    else
      radiationPort.angleDegAziSun = solAziTem;
    end if;
  end if;

  dayOfYear = time / (3600.0 * 24.0) + 0.5;

  x = 0.9856 * dayOfYear - 2.72;

  Z = - 7.66 * sin(x * degRad) - 9.87 * sin((2.0 * x  + 24.99 + 3.83 * sin(x * degRad)) * degRad);

  angleDec = 23.45 * degRad * sin((360.0 * (284.0 + dayOfYear) / 365.0) * (degRad));

  timeSun = mod(time / 3600.0 + Z / 60.0 + 4.0 / 60.0 * (longitudeDeg0 - longitudeDeg + angleDegL),24);

  angleHr = 15.0 * (timeSun - 12.0) * degRad;

  // One axis tracking
  if OneAxisTracking then
    angleDegTil_internal =
      radDeg * atan(-sin((radiationPort.angleDegAziSun + angleDegAzi - 90.0) * degRad) * tan(angleZen));
  else
    connect(angleDegTil_internal,angleDegTil);
  end if;

  cosAngleZen = cosAngleLat * cos(angleDec) * cos(angleHr) + sinAngleLat * sin(angleDec);

  angleZen = acos(cosAngleZen);

  cosAngleInc = BuildingSystems.Utilities.Math.Functions.smoothLimit(sin(angleDec) * sinAngleLat * cosAngleTil
    - sin(angleDec) * cosAngleLat * sinAngleTil * cosAngleAzi
    + cos(angleDec) * cosAngleLat * cosAngleTil * cos(angleHr)
    + cos(angleDec) * sinAngleLat * sinAngleTil * cosAngleAzi * cos(angleHr)
    + cos(angleDec) * sinAngleTil * sinAngleAzi * sin(angleHr),0.0,1.0,0.0001);

  radiationPort.angleDegInc = acos(cosAngleInc) * radDeg;

  radiationPort.angleDegHeightSun = 90.0 - angleZen * 180.0 / Modelica.Constants.pi;

  sinAngleAzi = sin(angleDegAzi * degRad);

  cosAngleAzi = cos(angleDegAzi * degRad);

  sinAngleTil = sin(angleDegTil_internal * degRad);

  cosAngleTil = cos(angleDegTil_internal * degRad);

  IrrTotHor = IrrDirHor + IrrDifHor;

  IrrTotTil = radiationPort.IrrDif + radiationPort.IrrDir;

  // limitation to the the solar constant = 1367  W/m^2. Value recommended by the world Radiometric Center
  IrrDirNor = BuildingSystems.Utilities.SmoothFunctions.softswitch(IrrDirHor,0.1,0.0,
    BuildingSystems.Utilities.Math.Functions.smoothLimit(IrrDirHor/cosAngleZen,0.0,1367,0.0001),0.0001);

  radiationPort.IrrDir = cosAngleInc * IrrDirNor;

  annotation (Icon(graphics={
    Rectangle(extent={{-80,80},{80,-80}}, lineColor={170,213,255},fillPattern = FillPattern.Solid,fillColor={170,213,255}),
    Ellipse(extent={{-60,62},{20,-18}},lineColor={255,128,0},fillColor={255,128,0},fillPattern = FillPattern.Solid),
    Line(points={{72,-8},{8,-72}},color={0,0,0},smooth=Smooth.None,thickness=2),
    Line(points={{12,-12},{32,-32}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{22,-2},{42,-22}}, color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{32,8},{52,-12}}, color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{-8,-32},{12,-52}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Line(points={{2,-22},{22,-42}},color={255,128,0},thickness=1,smooth=Smooth.None),
    Text(extent={{20,-78},{136,-142}}, lineColor={0,0,255},textString="%name")}),
Documentation(info="<html>
<p>
This model calculates the direct solar radiation on a tilted surface (general model).
</p>
<p>
The direct solar radiation forms an angle with the vector normal to the earth <code>Zen</code>.
The same direct solar radiation forms an angle with the normal vector of a tilted surface <code>Inc</code>.
</p>
<p>
Based on trigonometric relations, the model calculates the direct normal irradiation.
<code>IrrDirNor = IrrDirHor/cosAngleZen</code>, Which maximum value is limited for numerical reasons to the solar constant <code>1367</code> W/m2.
</p>
<p>
the amount of direct solar radiation incident on a tilted surface is equal to
<code>
IrrTotTil = IrrDirNor * cosAngleInc
</code>
</p>
</html>", revisions="<html>
<ul>
<li>
Sep 4, 2019 by Christoph Nytsch-Geusen:<br/>
Height angle and azimuth angle of the sun to the radiation port added.
</li>
<li>
Sep 9, 2017 by Christoph Nytsch-Geusen:<br/>
Radiation calculation for one axis tracking added.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SolarRadiationTransformerGeneral;
