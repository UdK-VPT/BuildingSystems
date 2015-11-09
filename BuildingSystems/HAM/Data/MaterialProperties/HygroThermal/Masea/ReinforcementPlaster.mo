within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record ReinforcementPlaster =
  BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=11,
    name="Reinforcement plaster (Mineralischer Armierungsputz)",
    rho=1475,
    c=850,
    sorTabX={0.0,0.8,0.93,0.99999889,0.99999963,0.99999989,0.9999999,1.0},
    sorTabY={0.0,12.0,22.9,22.0,232.0,261.0,275.0,282.0},
    myTabX={0.0,1.0},
    myTabY={17.0,17.0},
    lambdaTabX={0.0,430.0},
    lambdaTabY={0.641,2.136},
    dwwTabX={0.0,12.0,282.0},
    dwwTabY={0.0,6.5e-11,3.0e-10},
    dwsTabX={0.0,12.0,282.0},
    dwsTabY={0.0,1.4e-11,1.0e-8},
    lambdaDry=0.641,
    w80=-999,
    w95=-999,
    wF=282.0,
    porosity=0.43,
    A=0.015,
    myDry=17.0,
    myMoistF=-999,
    moistSup=-999)
    "Reinfrocement plaster (Mineralischer Armierungsputz)"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
