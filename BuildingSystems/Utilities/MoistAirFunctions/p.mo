within BuildingSystems.Utilities.MoistAirFunctions;
function p
  "Partial pressure of vapour dependent on absolute moisture and air pressure"
  /* steam pressure
     Validity range phi < 1.0, steam pressure in Pa,
     Absolute moisture x in kg/kg, air pressure p in Pa */
  input Modelica.Units.SI.MassFraction x;
  input Modelica.Units.SI.Pressure p_air;
  output Modelica.Units.SI.Pressure value;
algorithm
  value := p_air / (0.622 / x + 1.0);
end p;
