within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
partial model ElectricalModelOneDiodeGeneral
  "Basic electrical one diode model of a PV module"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelGeneral;
  parameter Modelica.Units.SI.ElectricCurrent Ik0
    "Short circuit current under standard conditions";
  parameter Modelica.Units.SI.Voltage Ul0
    "Open circuit voltage under standard conditions";
  parameter Real tIk0(unit = "mA/K")
    "Temperature coefficient for the short circuit current";
  parameter Real tUl0(unit = "V/K")
    "Temperature coefficient for the open circuit voltage";
  parameter Real factor
    "Scaling factor adaptation to the complex PV cell model";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alphaIk=0.001*tIk0/
      Ik0 "Specific temperature coefficient for the short circuit";
  parameter Modelica.Units.SI.LinearTemperatureCoefficient alphaUl=tUl0/Ul0
    "Specific temperature coefficient for the open circuit";
  parameter Real c0(unit = "m2/V") = (Ik0 / nCelPar) / 1000.0
    "Coefficient for the photo current";
  parameter Real m1 = 1.0
    "Diode factor";
  Modelica.Units.SI.ElectricCurrent IPho "Photo current";
  Real ISat1
    "Saturation current nA";
  Modelica.Units.SI.Voltage Ul "Open circuit voltage";
  constant Real NANO = 1.0e-9;
equation
  IPho = ITot * c0 * (1.0 + alphaIk * (T - 298.15));

  Ul = Ul0 * (1.0 + alphaUl * (T - 298.15));

  ISat1 = (Ik0/ nCelPar * (1.0 + alphaIk * (T - 298.15))) / (Modelica.Math.exp(Ul / (nCelSer * Ut)) - 1.0)/NANO;

  annotation (
Documentation(info="<html>
<p>
This is a basic electrical one diode model of a PV module.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ElectricalModelOneDiodeGeneral;
