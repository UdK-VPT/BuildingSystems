within BuildingSystems.HAM.Data.MaterialProperties.Thermal;
record Insulation =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=2,
    name="Styrofoam XPS",
    lambda=0.034,
    c=1000.0,
    rho=33.0);
