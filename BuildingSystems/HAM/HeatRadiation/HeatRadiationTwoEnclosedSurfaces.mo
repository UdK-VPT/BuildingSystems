within BuildingSystems.HAM.HeatRadiation;
function HeatRadiationTwoEnclosedSurfaces
  "Calculates the heat radiation exchange between surface 1 enclosed by surface 2."
  extends
    BuildingSystems.HAM.HeatRadiation.BaseClasses.HeatRadiationTwoSurfaces;
  input Modelica.SIunits.Emissivity epsilon1
    "Long-wave emission coefficient of surface 1";
algorithm
  q_flow := Modelica.Constants.sigma * epsilon1 * (T1*T1*T1*T1 - T2*T2*T2*T2);
end HeatRadiationTwoEnclosedSurfaces;
