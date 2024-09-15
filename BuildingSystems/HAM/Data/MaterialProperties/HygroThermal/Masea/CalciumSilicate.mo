within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record CalciumSilicate =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
    id=15,
    name="Calcium Silicate (Calcium Silikat)",
    rho=270.1367,
    c=1161.9646,
    sorTabX={0.0,0.432,0.754,0.847,0.96,0.974,0.9897,1.0},
    sorTabY={0.0,17.37,18.91,20.72,26.62,27.46,173.0,792.7294},
    myTabX={0.0,1.0},
    myTabY={3.8479,73.8479},
    lambdaTabX={0.0,900.0},
    lambdaTabY={0.0623,0.406196},
    dwwTabX={0.0,20.0,793.0},
    dwwTabY={0.0,8e-9,7.6e-7},
    dwsTabX={0.0,20.0,793.0},
    dwsTabY={0.0,9.02e-9,7.58e-6},
    lambdaDry=0.069,
    w80=19.8121,
    w95=26.5,
    wF=792.7294,
    porosity=0.8981,
    A=1.11,
    myDry=3.8479,
    myMoistF=-999,
    moistSup=-999)
    "MASEA Dämmstoffe->Calzium Silikate"
    annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
