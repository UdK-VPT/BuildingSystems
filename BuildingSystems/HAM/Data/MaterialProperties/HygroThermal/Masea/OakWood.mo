within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record OakWood =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=7,
    name="Oak wood (Eichenholz alt)",
    rho=740,
    c=1600,
    sorTabX={0.0,0.65,0.8,0.93,1},
    sorTabY={0.0,84.0,104.0,148.0,349.0},
    myTabX={0.0,1.0},
    myTabY={223.0,223.0},
    lambdaTabX={0.0,350.0},
    lambdaTabY={0.1522,0.246},
    dwwTabX={0.0,104.0,349.0},
    dwwTabY={0.0,9.0e-13,8.0e-11},
    dwsTabX={0.0,104.0,349.0},
    dwsTabY={0.0,6.3e-13,8.0e-11},
    lambdaDry=0.1522,
    w80=-999,
    w95=-999,
    wF=349.0,
    porosity=0.35,
    A=0.0017,
    myDry=223.0,
    myMoistF=-999,
    moistSup=-999)
    "Oak wood (Eichenholz alt)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
