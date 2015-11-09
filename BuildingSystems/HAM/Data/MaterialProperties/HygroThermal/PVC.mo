within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record PVC =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=10,
    name="PVC",
    rho=1000.0,
    c=1500.0,
    sorTabX={0.0,1.0},
    sorTabY={0.0,2e-20},
    myTabX={0.0,1.0},
    myTabY={15000.0,15000.0},
    lambdaTabX={0.0,650.0},
    lambdaTabY={0.16,0.16},
    dwwTabX={0.0,2.0},
    dwwTabY={1.0e-16,2e-20},
    dwsTabX={0.0,2.0},
    dwsTabY={1.0e-16,2e-20},
    lambdaDry=0.16,
    w80=-1.0,
    w95=-1.0,
    wF=-1.0,
    porosity=0.0002,
    A=0.3,
    myDry=15000.0,
    myMoistF=8.0,
    moistSup=8.0);
