within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record Estrich =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=11,
    name="Estrich",
    rho=1890.0,
    c=850.0,
    sorTabX={0.0,0.5,0.65,0.8,0.93,1.0},
    sorTabY={0.0,21.9,29.9,37.8,51.7,168.0},
    myTabX={0.0,1.0},
    myTabY={58.0,58.0},
    lambdaTabX={0.0,200.0},
    lambdaTabY={1.6,1.6},
    dwwTabX={0.0,37.8,168.0},
    dwwTabY={1.0e-16,2.0e-11,4.0e-10},
    dwsTabX={0.0,37.8,168.0},
    dwsTabY={1.0e-16,2.0e-10,8.0e-8},
    lambdaDry=1.6,
    w80=37.8,
    w95=70.0,
    wF=168.0,
    porosity=0.2,
    A=0.016,
    myDry=58.0,
    myMoistF=25.0,
    moistSup=8.0);
