within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record Concrete =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=2,
    name="Concrete (Beton)",
    lambda=1.94,
    c=776,
    rho=2104) "Concrete (Beton)" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
