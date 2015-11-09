within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record HighGradePlaster =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=5,
    name="High-grade plaster (Mineralischer Edelputz)",
    lambda=1.00,
    c=1000,
    rho=1482) "High-grade plaster (Mineralischer Edelputz)" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
