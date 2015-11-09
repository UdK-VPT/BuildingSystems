within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record Mineralwolle =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=4,
    name="Mineralwolle",
    rho=60.0,
    c=850.0,
    sorTabX={0.0,1.0},
    sorTabY={0.0,8e-20},
    myTabX={0.0,1.0},
    myTabY={1.3,1.3},
    lambdaTabX={0.0,10.0,100.0,300.0,950.0},
    lambdaTabY={0.04,0.04,0.04,0.1,0.1},
    dwwTabX={0.0,950.0},
    dwwTabY={1.0e-16,8.0e-20},
    dwsTabX={0.0,950.0},
    dwsTabY={1.0e-16,8.0e-20},
    lambdaDry=0.04,
    w80=-1,
    w95=-1,
    wF=-1,
    porosity=0.95,
    A=0.4,
    myDry=1.3,
    myMoistF=1.3,
    moistSup=1.0);
