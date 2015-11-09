within BuildingSystems.Utilities.MoistAirFunctions;
function T_sat "Saturation temperature dependent on enthalpy"
  /* Saettigungstemperatur in Abhaengigkeit von der Enthalpie von -30 bis 360 kJ/kg
     Saettigungstemperatur in [K], Enthalpie in [kJ/kg]
     - aus h-x-Diagramm und Fkt., ueber Polynom 5. Ordnung gefittet */
  input Real h;
  output Real value;
protected
  constant Real h_min = -30.0;
  constant Real h_max = 360.0;
  Real hInt;
  Real c[6] = {4.07048E-11, -4.48926E-8, 1.95342E-5, -4.44190E-3, 6.48352E-1, -5.79441};
algorithm
  hInt := BuildingSystems.Utilities.SmoothFunctions.softcut(
    h,
    h_min,
    h_max,
    0.01);
  value := c[6] + hInt * (c[5] + hInt * (c[4] + hInt * (c[3] + hInt * (c[2] + hInt * c[1])))) + 273.15;
end T_sat;
