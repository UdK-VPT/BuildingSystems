within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record OakWood =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=7,
    name="Oak wood (Eichenholz alt)",
    lambda=0.18,
    c=1600,
    rho=740) "Oak wood (Eichenholz alt)" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
