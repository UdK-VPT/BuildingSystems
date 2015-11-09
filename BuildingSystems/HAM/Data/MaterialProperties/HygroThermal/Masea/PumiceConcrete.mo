within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record PumiceConcrete =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=10,
    name="Pumice concrete (Bimsbeton)",
    rho=672,
    c=850,
    sorTabX={0.0,0.1,0.2,0.3,0.4,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.91,0.92,0.93,0.94,0.95,0.96,0.97,0.98,0.99,1.0},
    sorTabY={0.0,0.86,1.92,3.28,5.07,7.54,9.17,11.17,13.17,17.02,21.52,28.0,38.14,56.24,61.71,68.2,76.02,85.63,97.73,113.43,134.6,164.71,210.94,291.0},
    myTabX={0.0,1.0},
    myTabY={4.0,4.0},
    lambdaTabX={0.0,670.0},
    lambdaTabY={0.12,0.599},
    dwwTabX={0.0,28.0,291.0},
    dwwTabY={0.0,8.0e-10,1.4e-8},
    dwsTabX={0.0,28.0,291.0},
    dwsTabY={0.0,1.8e-10,9.5e-8},
    lambdaDry=0.12,
    w80=-999,
    w95=-999,
    wF=291.0,
    porosity=0.67,
    A=0.047,
    myDry=4.0,
    myMoistF=-999,
    moistSup=-999)
    "Pumice concrete (Bimsbeton)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
