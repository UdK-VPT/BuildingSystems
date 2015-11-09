within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record ExpandedPolystyrene =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=3,
    name="Expanded polystyrene (EPS_040.30)",
    lambda=0.04,
    c=1500,
    rho=30) "Expanded polystyrene (EPS_040.30)" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
