within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record Vollziegel =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=2,
    name="Vollziegel",
    rho=1650.0,
    c=850,
    sorTabX={0.0,0.5,0.65,0.8,0.93,0.99,0.997,0.999,1.0},
    sorTabY={0.0,4.4,5.7,9.2,18.5,74.0,240.0,280.0,370.0},
    myTabX={0.0,1.0},
    myTabY={9.5,9.5},
    lambdaTabX={0.0,410.0},
    lambdaTabY={0.6,0.6},
    dwwTabX={0.0,55.0,110.0,220.0,280.0,330.0,350.0,370.0},
    dwwTabY={1e-16,4e-10,6e-10,7e-10,5e-9,1e-8,3e-7,2e-5},
    dwsTabX={0.0,37.0,300.0,350.0,362.0,370.0},
    dwsTabY={1e-16,3e-8,1.5e-7,6e-7,1.5e-6,7e-5},
    lambdaDry=0.6,
    w80=9.2,
    w95=39,
    wF=370.0,
    porosity=0.41,
    A=0.4,
    myDry=9.5,
    myMoistF=9.0,
    moistSup=1.0);
