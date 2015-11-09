within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record Plasterboard =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=8,
    name="Plasterboard (Gipskartonplatte (Dichte 732 kg/m^3))",
    lambda=0.21,
    c=1384,
    rho=732) "Plasterboard (Gipskartonplatte (Dichte 732 kg/m^3))" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
