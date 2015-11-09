within BuildingSystems.Buildings.Functions;
function TSky "Calculates the sky temperature"
  input Modelica.SIunits.Temp_K TAirRef "Air temperature on reference height";
  input Real timeS "Time in seconds";
  input Real bSky
    "Clearness index of the sky: 0 (clear) to 1 (100 percent covered)";
  input Modelica.SIunits.MassFraction xAir "Absolute air moisture";
  input Modelica.SIunits.Pressure pRef "Air pressure on reference height";
  input Modelica.SIunits.Pressure pGround "Air pressure on ground level";
  output Modelica.SIunits.Temp_K value "Sky temperature";
protected
  Modelica.SIunits.MassFraction xAirSat
    "Absolute moisture of the saturated air";
  Real epsLwSky "Long-wave radiation coefficient of the clear sky";
  Modelica.SIunits.Temp_C thetaDp "Dew point temperature";
algorithm
  xAirSat := BuildingSystems.Utilities.MoistAirFunctions.x_sat(pRef,BuildingSystems.Utilities.MoistAirFunctions.p_sat(TAirRef));
  thetaDp := BuildingSystems.Utilities.MoistAirFunctions.T_sat(BuildingSystems.Utilities.MoistAirFunctions.enthalpy(TAirRef,xAir,xAirSat)) - 273.15;
  // after M. Martin, P. Berdahl "Characteristics of Infrared Sky radiation in the United States"
  // Lawrence Berkeley Laboratory, University of California. Solar Energy Vol.33 No.3/4, pp.321-336. 1984
  epsLwSky := 0.711 + 0.0056 * thetaDp + 7.3e-5 * thetaDp^2
    + 0.013 * Modelica.Math.cos(Modelica.Constants.pi * timeS / (3600.0 * 12.0)) + 0.0012 * (pRef - pGround) / 1000.0;
  value := TAirRef * (epsLwSky + (1.0 - epsLwSky) * bSky)^0.25;
end TSky;
