within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record Polystyrol =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=3,
    name="Polystyrol",
    rho=30.0,
    c=1500.0,
    sorTabX={0.0,1.0},
    sorTabY={2e-20,2e-20},
    myTabX={0.0,1.0},
    myTabY={50.0,50.0},
    lambdaTabX={0.0,10.0,100.0,200.0,300.0},
    lambdaTabY={0.04,0.04,0.049,0.071,0.1},
    dwwTabX={0.0,950.0},
    dwwTabY={1.0e-16,2.0e-10},
    dwsTabX={0.0,950.0},
    dwsTabY={1.0e-16,2.0e-10},
    lambdaDry=0.04,
    w80=-1,
    w95=-1,
    wF=-1,
    porosity=0.95,
    A=0.0,
    myDry=50.0,
    myMoistF=50.0,
    moistSup=8.0);
