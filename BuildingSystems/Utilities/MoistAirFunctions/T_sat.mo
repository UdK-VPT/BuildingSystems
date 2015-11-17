within BuildingSystems.Utilities.MoistAirFunctions;
function T_sat "Saturation temperature dependent on enthalpy"
  /* Saturation temperature in dependence of enthalpy -30 bis 360 kJ/kg
     Saturation temperature in [K], enthalpy in [kJ/kg]
     - based on h-x-diagram and function, fitted by a polynom of 5th order */
  input Modelica.SIunits.SpecificEnthalpy h;
  output  Modelica.SIunits.Temp_K value;
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
