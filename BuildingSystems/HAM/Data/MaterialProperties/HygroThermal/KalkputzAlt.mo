within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal;
record KalkputzAlt =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=9,
    name="Kalkputz-alt",
    rho=850.0,
    c=850.0,
    sorTabX={0.0,0.5,0.65,0.8,0.9,0.93,0.95,0.99,0.995,0.999,0.9995,1.0},
    sorTabY={0.0,3.6,5.2,6.3,11.0,17.0,19.0,113.0,124.0,328.0,378.0,400.0},
    myTabX={0.0,1.0},
    myTabY={9.0,9.0},
    lambdaTabX={0.0,650.0},
    lambdaTabY={0.2,0.2},
    dwwTabX={0.0,60.0,100.0,160.0,240.0,320.0,360.0,380.0,400.0},
    dwwTabY={1.0e-16,3.0e-9,8.0e-9,8.0e-9,1.3e-8,1.0e-7,3.0e-7,7.0e-7,1.0e-6},
    dwsTabX={0.0,60.0,100.0,160.0,240.0,320.0,360.0,380.0,400.0},
    dwsTabY={1.0e-16,3.0e-9,1.0e-7,1.0e-7,1.2e-7,2.2e-7,6.0e-7,9.0e-7,4.5e-6},
    lambdaDry=0.2,
    w80=6.3,
    w95=19.0,
    wF=400.0,
    porosity=0.65,
    A=0.287,
    myDry=9.0,
    myMoistF=8.0,
    moistSup=8.0);
