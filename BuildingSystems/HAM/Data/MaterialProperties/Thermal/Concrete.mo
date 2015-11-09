within BuildingSystems.HAM.Data.MaterialProperties.Thermal;
record Concrete =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=1,
    name="Concrete",
    lambda=2.0,
    c=1000.0,
    rho=2000.0);
