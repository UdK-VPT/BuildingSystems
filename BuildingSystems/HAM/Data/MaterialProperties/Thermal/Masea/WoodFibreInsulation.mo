within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record WoodFibreInsulation =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=14,
    name="Wood fibre insulation (Holzfaserdaemmplatte 1)",
    lambda=0.04,
    c=1700,
    rho=168) "Wood fibre insulation (Holzfaserdaemmplatte 1)" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
