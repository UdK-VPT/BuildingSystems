within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record Kalksandstein =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=5,
    name="Kalksandstein",
    rho=1900.0,
    c=850.0,
    sorTabX={0.0,0.5,0.65,0.8,0.9,0.93,0.95,0.99,0.995,0.999,1.0},
    sorTabY={0.0,17.0,18.0,25.0,40.0,52.3,128.0,213.0,218.0,225.0,250.0},
    myTabX={0.0,1.0},
    myTabY={28.0,28.0},
    lambdaTabX={0.0,290.0},
    lambdaTabY={0.6,0.6},
    dwwTabX={0.0,37.0,62.0,100.0,150.0,200.0,225.0,238.0,250.0},
    dwwTabY={2.0e-10,2.0e-10,3.0e-10,8.0e-10,1.5e-9,4.0e-9,8.0e-9,9.0e-9,1.0e-8},

    dwsTabX={0.0,37.0,62.0,100.0,150.0,200.0,225.0,238.0,250.0},
    dwsTabY={2.0e-10,2.0e-10,3.0e-9,7.0e-9,1.0e-8,3.0e-8,6.0e-8,8.0e-8,1.2e-7},

    lambdaDry=1.0,
    w80=25.0,
    w95=128.0,
    wF=250.0,
    porosity=0.29,
    A=0.045,
    myDry=28.0,
    myMoistF=28.0,
    moistSup=8.0);
