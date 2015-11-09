within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record Beton =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=7,
    name="Beton",
    rho=2300.0,
    c=850.0,
    sorTabX={0.0,0.5,0.6,0.8,0.9,0.95,1.0},
    sorTabY={0.0,48.0,58.0,85.0,100.0,118.0,150.0},
    myTabX={0.0,1.0},
    myTabY={180.0,180.0},
    lambdaTabX={0.0,180.0},
    lambdaTabY={1.6,1.6},
    dwwTabX={0.0,72.0,85.0,100.0,118.0},
    dwwTabY={1.0e-16,7.4e-12,2.5e-11,1.0e-10,1.2e-10},
    dwsTabX={0.0,72.0,85.0,100.0,118.0},
    dwsTabY={1.0e-16,7.4e-11,2.5e-10,1.0e-9,1.2e-9},
    lambdaDry=1.6,
    w80=85.0,
    w95=118.0,
    wF=150.0,
    porosity=0.18,
    A=0.003,
    myDry=180.0,
    myMoistF=180.0,
    moistSup=8.0);
