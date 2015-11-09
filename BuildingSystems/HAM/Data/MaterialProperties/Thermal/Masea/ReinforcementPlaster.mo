within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record ReinforcementPlaster =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=11,
    name="Reinforcement plaster (Mineralischer Armierungsputz)",
    lambda=0.641,
    c=850,
    rho=1475) "Reinforcement plaster (Mineralischer Armierungsputz)" annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
