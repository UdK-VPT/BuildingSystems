within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record Kalkputz =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=8,
    name="Kalkputz",
    rho=1900.0,
    c=850.0,
    sorTabX={0.0,0.5,0.8,0.9,0.99,0.999,0.9995,0.9999,1.0},
    sorTabY={0.0,30.0,45.0,65.0,95.0,110.0,140.0,200.0,210.0},
    myTabX={0.0,1.0},
    myTabY={25.0,25.0},
    lambdaTabX={0.0,240.0},
    lambdaTabY={0.8,0.8},
    dwwTabX={0.0,20.0,210.0},
    dwwTabY={1.0e-16,1.0e-10,7.0e-9},
    dwsTabX={0.0,210.0},
    dwsTabY={1.0e-16,2.0e-10},
    lambdaDry=0.8,
    w80=45.0,
    w95=80.0,
    wF=210.0,
    porosity=0.24,
    A=0.00167,
    myDry=25.0,
    myMoistF=25.0,
    moistSup=8.0);
