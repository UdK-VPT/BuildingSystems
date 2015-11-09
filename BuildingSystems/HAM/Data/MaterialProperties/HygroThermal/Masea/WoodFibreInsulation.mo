within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record WoodFibreInsulation =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=14,
    name="Wood fibre insulation (Holzfaserdaemmplatte 1)",
    rho=168,
    c=1700,
    sorTabX={0.0,0.65,0.8,0.93,1.0},
    sorTabY={0.0,12.6,17.3,28.5,526.0},
    myTabX={0.0,1.0},
    myTabY={3.3,3.3},
    lambdaTabX={0.0,880.0},
    lambdaTabY={0.0381,0.138},
    dwwTabX={0.0,17.0,526.0},
    dwwTabY={0.0,2.0e-10,3.0e-9},
    dwsTabX={0.0,17.0,526.0},
    dwsTabY={0.0,1.9e-13,1.5e-10},
    lambdaDry=0.0381,
    w80=-999,
    w95=-999,
    wF=526.0,
    porosity=0.88,
    A=0.0033,
    myDry=3.3,
    myMoistF=-999,
    moistSup=-999)
    "Wood fibre insulation (Holzfaserdaemmplatte 1)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
