within BuildingSystems.HAM.Data.MaterialProperties.Thermal.Masea;
record PolyamidFoil =
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    (
    id=9,
    name="Polyamid foil (PA-Folie)",
    lambda=2.9,
    c=2300,
    rho=65) "Polyamid foil (PA-Folie)" annotation(Documentation(info="<html>source: Frauenhofer Institut fuer Bauphysik (IBP) - Holzkirchen, Deutschland</html>"));
