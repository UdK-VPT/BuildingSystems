within BuildingSystems.Utilities.MoistAirFunctions;
function T_dp "Dew point temperature dependent on air pressure"
  /* Dew point temperature in dependence of steam pressure 12.4 to 31160 Pa
     Validity range from -40 to 70 C
	 Unit dew point temperature: K,
     Unit steam pressure: Pa,
     - based on "Reinmuth Lufttechnische Prozesse"
     - logarithmic fitted in segments: -40 - -20C; -20 - 0C; 0 - 20C; 20 - 40 C and 40 - 70C */
  input Modelica.SIunits.Pressure p;
  output Modelica.SIunits.Temp_K value;
protected
  Modelica.SIunits.Pressure p_min = 12.4;
  Modelica.SIunits.Pressure p_max[5] = {102.9, 610.7, 2337.0, 7375.0, 31160.0};
algorithm
  if p < p_max[1] then
    value :=  (9.531 * Modelica.Math.log(p) - 64.414) + 273.15;
  elseif p < p_max[2] then
    value := (11.239 * Modelica.Math.log(p) - 72.333) + 273.15;
  elseif p < p_max[3] then
    value := (14.9050 * Modelica.Math.log(p) - 95.8643) + 273.15;
  elseif p < p_max[4] then
    value := (17.4027 * Modelica.Math.log(p) - 115.2227) + 273.15;
  else
    value := (20.822 * Modelica.Math.log(p) - 145.94) + 273.15;
  end if;
end T_dp;
