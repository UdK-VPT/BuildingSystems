within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record InsulatingBrick =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=6,
    name="Insulating brick (Hochdaemmender Ziegel 600)",
    rho=600,
    c=850,
    sorTabX={0.0,0.1,0.2,0.3,0.4,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.91,0.92,0.93,0.94,0.95,0.96,0.97,0.98,0.99,1},
    sorTabY={0.0,0.32,0.73,1.24,1.93,2.88,3.5,4.28,5.27,6.58,8.37,11.0,15.21,23.06,25.52,28.5,32.17,36.8,42.85,51.06,62.86,81.26,113.93,188.0},
    myTabX={0.0,1.0},
    myTabY={16.0,16.0},
    lambdaTabX={0.0,770.0},
    lambdaTabY={0.105,1.183},
    dwwTabX={0.0,11.0,188.0},
    dwwTabY={0.0,3.0e-10,1.22e-6},
    dwsTabX={0.0,11.0,188.0},
    dwsTabY={0.0,1.5e-9,1e-6},
    lambdaDry=0.105,
    w80=-999,
    w95=-999,
    wF=188.0,
    porosity=0.77,
    A=0.098,
    myDry=16.0,
    myMoistF=-999,
    moistSup=-999)
    "Insulating brick (Hochdaemmender Ziegel 600)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
