within BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Masea;
record PolyamidFoil =
   BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral
    (
   id=9,
   name="Polyamid foil (PA-Folie)",
   rho=65,
   c=2300,
   sorTabX={0.0,0.5,1.0},
   sorTabY={0.0,0.176,0.618},
   myTabX={0.0,0.265,0.415,0.625,0.715,0.9,1.0},
   myTabY={4380.0,4350.0,3700.0,1000.5,440.0,90.0,80.0},
   lambdaTabX={0.0},
   lambdaTabY={2.9},
   dwwTabX={0.0},
   dwwTabY={0.0},
   dwsTabX={0.0},
   dwsTabY={0.0},
   lambdaDry=2.9,
   w80=-999,
   w95=-999,
   wF=0.618,
   porosity=0.001,
   A=0.3, // guess value, not from MASEA data
   myDry=4380.0,
   myMoistF=-999,
   moistSup=-999)
   "Polyamid foil (PA-Folie)"
   annotation(Documentation(info="<html>source: Frauenhofer Institut fuer Bauphysik (IBP) - Holzkirchen, Deutschland</html>"));
