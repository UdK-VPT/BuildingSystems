within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record Brick =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=1,
    name="Brick (Vollziegel ZC)",
    lambda=0.92,
    c=836,
    rho=1895) "Brick (Vollziegel ZC)" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
