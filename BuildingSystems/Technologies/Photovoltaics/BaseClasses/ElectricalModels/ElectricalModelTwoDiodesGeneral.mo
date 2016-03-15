within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
partial model ElectricalModelTwoDiodesGeneral
  "Detailed electrical model of a solar cell with two diodes and a parallel and serial resistance"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelGeneral;
  parameter Real c1
    "1st coefficient IPho in m2/V";
  parameter Real c2
    "2nd coefficient IPho in m2/kV.K";
  parameter Real cs1
    "1st coefficient ISat1";
  parameter Real cs2
    "2nd coefficient ISat2";
  parameter Real RPar
    "Parallel resistance V/A";
  parameter Real RSer
    "Serial resistance V/A";
  Modelica.SIunits.ElectricCurrent IPho
    "Photo current";
  Modelica.SIunits.ElectricCurrent ISat1
    "Saturation current diode 1";
  Modelica.SIunits.ElectricCurrent ISat2
    "Saturation current diode 2";

equation
  IPho = (c1 + c2 * 0.001 * T) * ITot;

  ISat1 = cs1 * T * T * T * Modelica.Math.exp(-(Eg * e)/(k * T));

  ISat2 = cs2 * sqrt(T * T * T * T * T) * Modelica.Math.exp(-(Eg * e)/(2.0 * k * T));
end ElectricalModelTwoDiodesGeneral;
