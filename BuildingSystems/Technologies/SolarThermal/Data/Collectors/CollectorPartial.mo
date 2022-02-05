within BuildingSystems.Technologies.SolarThermal.Data.Collectors;
record CollectorPartial
  extends Modelica.Icons.Record;
  parameter Real C_0
    "Collector constant in [-]";
  parameter Real C_1
    "Collector constant in W/(m2.K)";
  parameter Real C_2
    "Collector constant in W/(m2*K.2)";
  parameter Real V_A(unit="m3/m2")
    "(fluid Volume)/(absorber area) rate"
    annotation(Dialog(group="Geometry"));
  parameter Modelica.Units.SI.Area A "Absorber area of the collector"
    annotation (Dialog(group="Geometry"));
  parameter Real IAMC
    "Incidence Angle Modifier Coefficient = IncidenceAngleModifier at 50 degree";
  parameter Real C_A(unit="J/(m2.K)") = 500*10
    "Active heat capacity of the solid part of the collector per square meter of absorber surface in J/m2K";
  annotation (Documentation(info="<html>
  <p>Record model with important data about solar thermal collectors. </p>
  <h4>Assumption and limitations</h4>
  <p>
  The exact contribution of the structure/solid part of the solar collector to its effective thermal capacity is set to 5 kJ/K pro square meter of absorber area.
  </p>
  <h4>References</h4>
  <p>
  Information about solar collectors can be consulted in <a href=\"http://www.spf.ch/Kollektoren.111.0.html\">SPF</a>
  </p>
</html>"));
end CollectorPartial;
