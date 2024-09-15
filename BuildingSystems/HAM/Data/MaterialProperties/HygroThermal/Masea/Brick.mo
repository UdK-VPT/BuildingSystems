within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record Brick =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=1,
    name="Brick (Vollziegel ZC)",
    rho=1895.0,
    c=836.4,
    sorTabX={0.0,0.432,0.582,0.754,0.847,0.96,0.974,0.9941,0.997,0.9978,0.9985,0.9989,0.9996,1.0},
    sorTabY={0.0,2.11,2.48,3.02,3.18,4.01,4.96,9.64,16.0,18.2,18.9,19.3,27.6,188.0},
    myTabX={0.0,1.0},
    myTabY={23.0,23.0},
    lambdaTabX={0.0,280.0},
    lambdaTabY={0.908,1.93264},
    dwwTabX={0.0,3.1,188.0},
    dwwTabY={0.0,2.4e-9,3.6e-7},
    dwsTabX={0.0,3.1,188.0},
    dwsTabY={0.0,4.0e-9,3.6e-6},
    lambdaDry=0.908,
    w80=3.097,
    w95=3.812,
    wF=188.0,
    porosity=0.28,
    A=0.183,
    myDry=23.0,
    myMoistF=-999,
    moistSup=-999)
    "Brick (Vollziegel ZC)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
