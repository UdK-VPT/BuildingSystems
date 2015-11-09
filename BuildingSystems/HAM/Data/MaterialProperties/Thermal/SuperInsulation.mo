within BuildingSystems.HAM.Data.MaterialProperties.Thermal;
record SuperInsulation =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=3,
    name="Super Insulation (VIP)",
    lambda=0.006,
    c=1000.0,
    rho=33.0);
