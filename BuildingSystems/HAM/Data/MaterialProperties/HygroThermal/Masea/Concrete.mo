within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record Concrete =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=2,
    name="Concrete (Beton)",
    rho=2104,
    c=776,
    sorTabX={0.0,0.065,0.113,0.329,0.582,0.754,1.0},
    sorTabY={0.0,25.5,29.6,46.1,80.1,101.0,144.0},
    myTabX={0.0,1.0},
    myTabY={76.0,76.0},
    lambdaTabX={0.0,220.0},
    lambdaTabY={1.373,2.522},
    dwwTabX={0.0,101.0,144.0},
    dwwTabY={0.0,5.0e-18,5.0e-16},
    dwsTabX={0.0,101.0,144.0},
    dwsTabY={0.0,3.6e-9,2.9e-8},
    lambdaDry=1.373,
    w80=-999,
    w95=-999,
    wF=144.0,
    porosity=0.22,
    A=1.27,
    myDry=76.0,
    myMoistF=-999,
    moistSup=-999)
    "Concrete (Beton)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
