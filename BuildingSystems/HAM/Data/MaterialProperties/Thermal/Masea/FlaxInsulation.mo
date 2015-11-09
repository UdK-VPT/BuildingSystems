within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record FlaxInsulation =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=4,
    name="Flax insulation (Flachsdaemmplatte)",
    lambda=0.04,
    c=850,
    rho=39) "Flax insulation (Flachsdaemmplatte)" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
