within BuildingSystems.Utilities.MoistAirFunctions;
function T_dp "Dew point temperature dependent on air pressure"
  /* Taupunkttemperatur in Abhaengigkeit vom Dampfdruck 12.4 bis 31160 Pa
     Gueltigkeitsbereich von - 40 bis 70 C, Taupunkttemperatur in K,
     Dampfdruck in Pa,
     - aus Reinmuth Lufttechnische Prozesse
     - Logarithmisch gefittet in Abschnitten: -40 - -20C; -20 - 0C; 0 - 20C; 20 - 40 C und 40 - 70C */
  input Real p;
  output Real value;
protected
  Real p_min = 12.4;
  Real p_max[5] = {102.9, 610.7, 2337.0, 7375.0, 31160.0};
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
