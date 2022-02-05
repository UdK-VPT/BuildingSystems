within BuildingSystems.Buildings.Functions;
function TSky
  "Calculates the sky temperature"
  input Modelica.Units.SI.Temperature TAirRef
    "Air temperature on reference height";
  input Real timeS
    "Time in seconds";
  input Real bSky
    "Clearness index of the sky: 0 (clear) to 1 (100 percent covered)";
  input Modelica.Units.SI.MassFraction xAir "Absolute air moisture";
  input Modelica.Units.SI.Pressure pRef "Air pressure on reference height";
  input Modelica.Units.SI.Pressure pGround "Air pressure on ground level";
  output Modelica.Units.SI.Temperature value "Sky temperature";
protected
  Modelica.Units.SI.MassFraction xAirSat
    "Absolute moisture of the saturated air";
  Real epsLwSky
    "Long-wave radiation coefficient of the clear sky";
  Modelica.Units.NonSI.Temperature_degC thetaDp "Dew point temperature";
algorithm
  xAirSat := BuildingSystems.Utilities.MoistAirFunctions.x_sat(pRef,BuildingSystems.Utilities.MoistAirFunctions.p_sat(TAirRef));
  thetaDp := BuildingSystems.Utilities.MoistAirFunctions.T_sat(BuildingSystems.Utilities.MoistAirFunctions.enthalpy(TAirRef,xAir,xAirSat)) - 273.15;
  // after M. Martin, P. Berdahl "Characteristics of Infrared Sky radiation in the United States"
  // Lawrence Berkeley Laboratory, University of California. Solar Energy Vol.33 No.3/4, pp.321-336. 1984
  epsLwSky := 0.711 + 0.0056 * thetaDp + 7.3e-5 * thetaDp^2
    + 0.013 * Modelica.Math.cos(Modelica.Constants.pi * timeS / (3600.0 * 12.0)) + 0.0012 * (pRef - pGround) / 1000.0;
  value := TAirRef * (epsLwSky + (1.0 - epsLwSky) * bSky)^0.25;

  annotation (Documentation(info="<html>
<p>
This function outputs the sky temperature dependent on
clearness index of the sky, the air moisture and
the air pressure.
</p>
</html>", revisions="<html>
<ul>
<li>
January 1, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end TSky;
