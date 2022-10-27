within BuildingSystems.HAM.HeatRadiation.BaseClasses;
partial function HeatRadiationTwoSurfaces
  "General heat radiation exchange between two surfaces."
  input Modelica.Units.SI.Temperature T1 "Temperature of surface 1";
  input Modelica.Units.SI.Temperature T2 "Temperature of surface 2";
  output Modelica.Units.SI.HeatFlux q_flow
    "Specific net long-wave radiation flow between surface 1 and 2";
end HeatRadiationTwoSurfaces;
