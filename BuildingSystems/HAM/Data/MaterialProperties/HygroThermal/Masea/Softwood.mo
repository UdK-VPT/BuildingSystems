within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record Softwood =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    ( id=12,
      name="Softwood (Weichholz)",
      rho=400,
      c=1500,
      sorTabX={0.0,0.5,0.8,0.9,0.97,1.0},
      sorTabY={0.0,32.0,60.0,88.0,116.0,575.0},
      myTabX={0.0,0.25,0.5,0.6,0.7,0.9,1.0},
      myTabY={200.0,180.0,65.0,45.0,30.0,20.0,10.0},
      lambdaTabX={0.0},
      lambdaTabY={0.09},
      dwwTabX={-999},
      dwwTabY={-999},
      dwsTabX={-999},
      dwsTabY={-999},
      lambdaDry=0.09,
      w80=-999,
      w95=-999,
      wF=575.0,
      porosity=-999,
      A=0.0017, // value of BuildingSystems.HAM.Data.HygroThermal.Masea.OakWood
      myDry=200.0,
      myMoistF=-999,
      moistSup=-999)
      "Softwood (Weichholz)"
      annotation(Documentation(info="<html>source: www.masea-ensan.de</html>"));
