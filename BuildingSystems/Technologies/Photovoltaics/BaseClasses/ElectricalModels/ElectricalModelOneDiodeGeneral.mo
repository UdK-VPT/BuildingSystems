within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
partial model ElectricalModelOneDiodeGeneral
  "Simplified electrical model of a solar cell with one diode"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelGeneral;
  parameter Modelica.SIunits.ElectricCurrent Ik0
    "Short circuit current under standard conditions";
  parameter Modelica.SIunits.Voltage Ul0
    "Open circuit voltage under standard conditions";
  parameter Real tIk0(final unit = "mA/K")
    "Temperature coefficient for the short circuit current";
  parameter Real tUl0(final unit = "V/K")
    "Temperature coefficient for the open circuit voltage";
  parameter Real factor
    "Scaling factor adaptation to the complex PV cell model";
  parameter Modelica.SIunits.LinearTemperatureCoefficient alphaIk = 0.001 * tIk0 / Ik0
    "Specific temperature coefficient for the short circuit current 1/C";
  parameter Modelica.SIunits.LinearTemperatureCoefficient alphaUl = tUl0 / Ul0
    "Specific temperature coefficient for the open circuit voltage 1/C";
  parameter Real c0 = (Ik0 / nCelPar) / 1000.0
    "Coefficient for the photo current m2/V";
  parameter Real m1 = 1.0
    "Diode factor";
  Modelica.SIunits.ElectricCurrent IPho
    "Photo current";
  Real ISat1
    "Saturation current nA";
  Modelica.SIunits.Voltage Ul
    "Open circuit voltage";
  constant Real NANO = 1.0e-9;
equation
  IPho = ITot * c0 * (1.0 + alphaIk * (T - 298.15));

  Ul = Ul0 * (1.0 + alphaUl * (T - 298.15));

  ISat1 = (Ik0/ nCelPar * (1.0 + alphaIk * (T - 298.15))) / (Modelica.Math.exp(Ul / (nCelSer * Ut)) - 1.0)/NANO;
end ElectricalModelOneDiodeGeneral;
