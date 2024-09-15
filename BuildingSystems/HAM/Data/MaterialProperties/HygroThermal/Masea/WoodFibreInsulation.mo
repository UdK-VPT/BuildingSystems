within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record WoodFibreInsulation =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=14,
    name="Wood fibre insulation (Holzfaserdaemmplatte 1)",
    rho=168,
    c=1700,
    sorTabX={0.0,0.65,0.8,0.93,1.0},
    sorTabY={0.0,12.6,17.3,28.5,525.9},
    myTabX={0.0,1.0},
    myTabY={3.3,3.3},
    lambdaTabX={0.0,880.0},
    lambdaTabY={0.0381,0.137886},
    dwwTabX={0.0,17.3,526.0},
    dwwTabY={0.0,1.0E-9,3.0E-9},
    dwsTabX={0.0,17.3,526.0},
    dwsTabY={0.0,1.0E-12,8.9E-11},
    lambdaDry=0.0381,
    w80=17.3,
    w95=100.74,
    wF=525.9,
    porosity=0.88,
    A=0.0033,
    myDry=3.3,
    myMoistF=-999,
    moistSup=-999)
    "Wood fibre insulation (Holzfaserdaemmplatte 1)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
