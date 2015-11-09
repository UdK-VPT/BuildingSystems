within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record HighGradePlaster =
   BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
   id=5,
   name="High-grade plaster (Mineralischer Edelputz)",
   rho=1482,
   c=850,
   sorTabX={0.0,0.8,0.93,0.9999889,0.9999963,0.99999889,0.999999},
   sorTabY={0.0,8.9,20.0,127.0,176.0,193.0,270.0,321.0},
   myTabX={0.0,1.0},
   myTabY={17.0,17.0},
   lambdaTabX={0.0,440.0},
   lambdaTabY={0.954,3.22},
   dwwTabX={0.0,8.9,321.0},
   dwwTabY={0.0,2.0e-11,1.4e-10},
   dwsTabX={0.0,8.9,321.0},
   dwsTabY={0.0,1.8e-13,1.5e-10},
   lambdaDry=0.954,
   w80=-999,
   w95=-999,
   wF=321.0,
   porosity=0.44,
   A=0.002,
   myDry=17.0,
   myMoistF=-999,
   moistSup=-999)
   "High-grade plaster (Mineralischer Edelputz)"
   annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
