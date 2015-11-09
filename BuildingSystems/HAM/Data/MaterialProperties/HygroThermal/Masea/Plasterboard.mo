within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record Plasterboard =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=8,
    name="Plasterboard (Gipskartonplatte (Dichte 732 kg/m^3))",
    rho=732,
    c=1384,
    sorTabX={0.0,0.328,0.53,0.795,0.843,0.936,0.9941,0.9965,0.9979,0.9996,1.0},
    sorTabY={0.0,1.66,2.69,7.17,9.43,22.3,59.6,159.0,231.0,347.0,353.0},
    myTabX={0.0,1.0},
    myTabY={6.8,6.8},
    lambdaTabX={0.0,720.0},
    lambdaTabY={0.1925,1.707},
    dwwTabX={0.0,8.3,353.0},
    dwwTabY={0.0,1.0e-9,5.2e-9},
    dwsTabX={0.0,8.3,353.0},
    dwsTabY={0.0,6.1e-10,5.2e-7},
    lambdaDry=0.1925,
    w80=-999,
    w95=-999,
    wF=353.0,
    porosity=0.72,
    A=0.13,
    myDry=6.8,
    myMoistF=-999,
    moistSup=-999)
    "Plasterboard (Gipskartonplatte (Dichte 732 kg/m^3))"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
