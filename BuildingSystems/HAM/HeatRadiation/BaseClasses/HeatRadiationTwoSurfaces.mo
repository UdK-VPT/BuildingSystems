within BuildingSystems.HAM.HeatRadiation.BaseClasses;
partial function HeatRadiationTwoSurfaces
  "General heat radiation exchange between two surfaces."
  input Modelica.SIunits.Temp_K T1
    "Temperature of surface 1";
  input Modelica.SIunits.Temp_K T2
    "Temperature of surface 2";
  output Modelica.SIunits.HeatFlux qdot
    "Specific net long-wave radiation flow between surface 1 and 2";
end HeatRadiationTwoSurfaces;
