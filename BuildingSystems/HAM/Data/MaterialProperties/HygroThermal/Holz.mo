within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record Holz =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=12,
    name="Holz",
    rho=600.0,
    c=1800.0,
    sorTabX={0.0,0.432,0.786,0.84,0.936,0.999,1.0},
    sorTabY={0.0,38.99,80.31,97.36,128.89,392.7,450.0},
    myTabX={0.0,0.3,0.5,0.7,0.9,1.0},
    myTabY={650.0,485.0,220.0,107.0,55.0,38.0},
    lambdaTabX={0.0,600.0},
    lambdaTabY={0.101,0.101},
    dwwTabX={0.0,140.0,166.0,231.0,300.0,370.0,405.0},
    dwwTabY={1.0e-16,1.1e-12,1.17e-12,1.57e-11,2.3e-11,4.63e-11,1.39e-10},
    dwsTabX={0.0,140.0,166.0,231.0,300.0,370.0,405.0},
    dwsTabY={1.0e-16,1.1e-12,1.17e-12,1.57e-11,2.3e-11,4.63e-11,1.39e-10},
    lambdaDry=0.101,
    w80=80.0,
    w95=140.0,
    wF=450.0,
    porosity=0.6,
    A=0.0,
    myDry=650.0,
    myMoistF=650.0,
    moistSup=8.0);
