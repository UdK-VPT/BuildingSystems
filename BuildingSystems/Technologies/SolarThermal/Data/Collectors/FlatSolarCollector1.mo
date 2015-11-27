within BuildingSystems.Technologies.SolarThermal.Data.Collectors;
record FlatSolarCollector1 =
    BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial
    (
    IAMC=0.88,
    V_A=1.5/1.8/980,
    C_0=0.775,
    C_1=3.75,
    C_2=0.02) "Average data of flat collector with good efficiency";
