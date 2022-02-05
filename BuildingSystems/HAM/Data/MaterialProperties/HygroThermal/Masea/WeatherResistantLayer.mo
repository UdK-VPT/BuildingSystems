within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record WeatherResistantLayer =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=13,
    name="Weather resistant layer (Witterungsschutzbahn (sd=0,1m))",
    rho=130,
    c=2300,
    sorTabX={0.0},
    sorTabY={0.0},
    myTabX={0.0,1.0},
    myTabY={100.0,100.0},
    lambdaTabX={0.0},
    lambdaTabY={2.3},
    dwwTabX={0.0},
    dwwTabY={0.0},
    dwsTabX={0.0},
    dwsTabY={0.0},
    lambdaDry=2.3,
    w80=0.0,
    w95=0.0,
    wF=0.0,
    porosity=0.001,
    A=1e-5,
    myDry=100.0,
    myMoistF=-999,
    moistSup=-999)
    "Weather resistant layer (Witterungsschutzbahn (sd=0,1m))"
    annotation(Documentation(info="<html>source: Frauenhofer Institut fuer Bauphysik (IBP) - Holzkirchen, Deutschland</html>"));
