within BuildingSystems.HAM.Data.MaterialProperties.Thermal.DIN_V_4108;
record Kalkputz =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=1,
    name="Kalkputz",
    lambda=1.0,
    c=1000.0,
    rho=1800.0)
  "DIN V 1.1.1 4108 Putzmoertel aus Kalk, Kalkzement und  hydraulischem Kalk";
