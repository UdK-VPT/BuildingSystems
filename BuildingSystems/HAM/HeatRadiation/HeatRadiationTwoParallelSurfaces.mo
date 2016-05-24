within BuildingSystems.HAM.HeatRadiation;
function HeatRadiationTwoParallelSurfaces
  "Calculates the heat radiation exchange between he parallel surface 1 and surface 2."
  extends BuildingSystems.HAM.HeatRadiation.BaseClasses.HeatRadiationTwoSurfaces;
  input Modelica.SIunits.Emissivity epsilon1
    "Long-wave emission coefficient of surface 1";
  input Modelica.SIunits.Emissivity epsilon2
    "Long-wave emission coefficient of surface 2";
algorithm
 qdot := Modelica.Constants.sigma * (T1*T1*T1*T1 - T2*T2*T2*T2) / (1.0 / epsilon1 + 1.0 / epsilon2 - 1.0);
end HeatRadiationTwoParallelSurfaces;
