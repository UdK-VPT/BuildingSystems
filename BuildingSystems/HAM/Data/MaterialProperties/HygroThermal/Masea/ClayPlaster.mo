within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record ClayPlaster =
   BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
   id=5,
   name="Clay plaster (Lehmputz)",
   rho=1514,
   c=1000,
   sorTabX={0.0,0.65,0.8,0.93,1.0},
   sorTabY={0.0,13,18.8,25.4,294.0},
   myTabX={0.0,1.0},
   myTabY={11.0,11.0},
   lambdaTabX={0.0,420.0},
   lambdaTabY={0.59,1.89938},
   dwwTabX={0.0,10.0,294.0},
   dwwTabY={0.0,5.0e-10,0.0005},
   dwsTabX={0.0,19.0,294.0},
   dwsTabY={0.0,1.5e-10,9.59e-8},
   lambdaDry=0.59,
   w80=18.8,
   w95=82.8,
   wF=294.0,
   porosity=0.424,
   A=0.04666,
   myDry=11.0,
   myMoistF=-999,
   moistSup=-999)
   "Clay plaster (Lehmputz)"
   annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
