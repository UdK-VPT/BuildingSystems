within BuildingSystems.Buildings.Comfort.Functions;
function PMV_DIN_EN_ISO_7730
  "Calculates the PMV index accordung to DIN EN ISO 7730"
  input Modelica.Units.SI.Temperature TAir "Air temperature";
  input Modelica.Units.SI.Temperature Tr "Mean radiatiant temperature";
  input Modelica.Units.SI.Temperature Tcl "Clothing surface temperature";
  input Modelica.Units.SI.MassFraction xAir "Absolute air moisture";
  input Real M(unit="W/m2")
    "Metabolism rate";
  input Real W(unit="W/m2")
    "Effective mechanical power";
  input Real fcl
    "Clothing surface area factor";
  input Modelica.Units.SI.CoefficientOfHeatTransfer hc
    "Convective heat transfer coefficient";
  output Real PMV
    "Predicted mean vote";
protected
  Real HL1, HL2, HL3, HL4, HL5, HL6, TS
    "Helping variables";
  Modelica.Units.SI.Pressure p "Water vapour partial pressure";
  constant Modelica.Units.SI.Pressure pAir=101300.0 "Air pressure";
algorithm
  p := BuildingSystems.Utilities.MoistAirFunctions.p(xAir,pAir);
  TS := 0.303 * exp(-0.036*M) + 0.028;
  HL1 := 3.05e-3 * (5733.0 - 6.99 * (M-W) - p);
  HL2 := 0.42 * ((M-W) - 58.15);
  HL3 := 1.7e-5 * M * (5867.0 - p);
  HL4 := 0.0014 * M * (34.0 - (TAir-273.15));
  HL5 := 3.96e-8 * fcl * (Tcl^4 - Tr^4);
  HL6 := fcl * hc * (Tcl - TAir);
  PMV := TS * ((M-W) - HL1 - HL2 - HL3 - HL4 - HL5 - HL6);
  PMV := max(min(PMV,3.0),-3.0);

  annotation (
Documentation(info="<html>
<p>Function that calculates the PMV index regarding DIN EN ISO 7730.</p>
</html>", revisions="<html>
<ul>
<li>
January 2, 2020, by Christoph Nytsch-Geusen<br/>
First implementation.
</li>
</ul>
</html>"));
end PMV_DIN_EN_ISO_7730;
