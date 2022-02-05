within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
partial model ElectricalModelTwoDiodesGeneral
  "Basic electrical two diodes model of a PV module"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelGeneral;
  parameter Real c1(unit = "m2/V")
    "1st coefficient IPho";
  parameter Real c2(unit = "m2/(kV.K)")
    "2nd coefficient IPho";
  parameter Real cs1(unit = "A/K3")
    "1st coefficient ISat1";
  parameter Real cs2(unit = "A/K5")
    "2nd coefficient ISat2";
  parameter Real RPar(unit = "V/A")
    "Parallel resistance";
  parameter Real RSer(unit = "V/A")
    "Serial resistance";
  Modelica.Units.SI.ElectricCurrent IPho "Photo current";
  Modelica.Units.SI.ElectricCurrent ISat1 "Saturation current diode 1";
  Modelica.Units.SI.ElectricCurrent ISat2 "Saturation current diode 2";

equation
  IPho = (c1 + c2 * 0.001 * T) * ITot;

  ISat1 = cs1 * T * T * T * Modelica.Math.exp(-(Eg * e)/(k * T));

  ISat2 = cs2 * sqrt(T * T * T * T * T) * Modelica.Math.exp(-(Eg * e)/(2.0 * k * T));

  annotation (
Documentation(info="<html>
<p>
This is a basic electrical two diodes model of a PV module.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ElectricalModelTwoDiodesGeneral;
