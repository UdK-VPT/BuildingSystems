within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record Softwood =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=12,
    name="Softwood (Weichholz)",
    lambda=0.09,
    c=1500,
    rho=400) "Softwood (Weichholz)"                        annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
