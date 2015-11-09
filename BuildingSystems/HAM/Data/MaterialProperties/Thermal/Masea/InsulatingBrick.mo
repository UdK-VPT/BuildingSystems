within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record InsulatingBrick =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=6,
    name="Insulating brick (Hochdaemmender Ziegel 600)",
    lambda=0.12,
    c=850,
    rho=600) "Insulating brick (Hochdaemmender Ziegel 600)" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
