within BuildingSystems.HAM.Data.MaterialProperties.Thermal.DIN_EN_ISO_10456;
record OSBPlatten =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=2,
    name="OSBPlatten",
    lambda=0.13,
    c=1700.0,
    rho=650.0) "DIN EN ISO 10456 Holzwerkstoffe OSB-Platten";
