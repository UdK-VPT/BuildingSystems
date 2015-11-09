within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record PumiceConcrete =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=10,
    name="Pumice concrete (Bimsbeton)",
    lambda=0.14,
    c=850,
    rho=672) "Pumice concrete (Bimsbeton)" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
