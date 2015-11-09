within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
model ElectricalModelTwoDiodes
  "Detailed electrical model of a solar cell with two diodes and a parallel and serial resistance"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelTwoDiodesGeneral;
  Modelica.Blocks.Interfaces.RealInput U(unit="V")
    "Module voltage"
    annotation (Placement(transformation(extent={{-98,-28},{-60,10}}),iconTransformation(extent={{-10,-10},{10,10}},rotation=0,origin={-70,0})));
equation
  0 = IPho - ISat1 * (Modelica.Math.exp((U / nCelSer + (I / nCelPar) * RSer)/(1.0 * Ut)) - 1.0)
    - ISat2 * (Modelica.Math.exp((U / nCelSer + (I / nCelPar) * RSer)/(2.0 * Ut)) - 1.0)
    - (U / nCelSer + (I / nCelPar) * RSer) / RPar - I / nCelPar;

  P = I * U;
end ElectricalModelTwoDiodes;
