within BuildingSystems.HAM.Data.MaterialProperties.Thermal;
record Ceramic =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=7,
    name="Ceramic (Al2O3) from https://www.matweb.com",
    lambda=26.0,
    c=880.0,
    rho=3900.0);
