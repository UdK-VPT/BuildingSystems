within BuildingSystems.Utilities.MoistAirFunctions;
function p
  "Partial pressure of vapor dependent on absolute moisture and air pressure"
  /* Dampfdruck
     Gueltigkeitsbereich phi < 1.0, Dampfdruck in Pa,
     absoluteFeuchte x in kg/kg, Luftdruck p in Pa */
  input Real x;
  input Real p_air;
  output Real value;
algorithm
  value := p_air / (0.622 / x + 1.0);
end p;
