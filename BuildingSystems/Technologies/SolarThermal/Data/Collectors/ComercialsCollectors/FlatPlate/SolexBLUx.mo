within BuildingSystems.Technologies.SolarThermal.Data.Collectors.ComercialsCollectors.FlatPlate;
record SolexBLUx =
    BuildingSystems.Technologies.SolarThermal.Data.Collectors.CollectorPartial
    (
    final IAMC=0.87,
    final C_A = 6600/2.305,
    final A = 2.305,
    final V_A = 2/2.305/980,
    final C_0 = 0.728,
    final C_1 = 3.94,
    final C_2 = 0.007) "Solar flat-plate collector Solex BLUx";
