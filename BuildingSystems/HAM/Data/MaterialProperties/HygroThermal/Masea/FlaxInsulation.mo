within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record FlaxInsulation =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=4,
    name="Flax insulation (Flachsdaemmplatte)",
    rho=39,
    c=850,
    sorTabX={0.0,0.5,0.8,0.93,1.0},
    sorTabY={0.0,2.2,5.0,8.2,348.0},
    myTabX={0.0,1.0},
    myTabY={1.5,1.5},
    lambdaTabX={0.0,950.0},
    lambdaTabY={0.0376,0.496},
    dwwTabX={0.0,5.0,348.0},
    dwwTabY={0.0,5.0e-9,1.0e-8},
    dwsTabX={0.0,5.0,348.0},
    dwsTabY={0.0,8.9e-12,8.0e-9},
    lambdaDry=0.0376,
    w80=-999,
    w95=-999,
    wF=348.0,
    porosity=0.95,
    A=0.017,
    myDry=1.5,
    myMoistF=-999,
    moistSup=-999)
    "Flax insulation (Flachsdaemmplatte)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
