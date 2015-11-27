within BuildingSystems.Technologies.SolarThermal.Data.Collectors;
record VacuumSolarCollector =
    BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial
    (
    IAMC=1,
    V_A=1/1.3/980,
    C_0=0.675,
    C_1=2.05,
    C_2=0.01) "Typical data of vacuum collector";
