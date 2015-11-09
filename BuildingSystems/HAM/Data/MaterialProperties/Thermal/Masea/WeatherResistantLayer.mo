within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record WeatherResistantLayer =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=13,
    name="Weather resistant layer (Witterungsschutzbahn (sd=0,1m))",
    lambda=2.3,
    c=2300,
    rho=130) "Weather resistant layer (Witterungsschutzbahn (sd=0,1m))"
                                                           annotation(Documentation(info="<html>source: Frauenhofer Institut fuer Bauphysik (IBP) - Holzkirchen, Deutschland</html>"));
