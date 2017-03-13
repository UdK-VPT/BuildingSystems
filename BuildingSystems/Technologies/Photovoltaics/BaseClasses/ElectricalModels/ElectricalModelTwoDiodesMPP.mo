within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
model ElectricalModelTwoDiodesMPP
  "Detailed electrical model of a solar cell with two diodes, a parallel and serial resistance and MPP tracking"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelTwoDiodesGeneral;
  output Modelica.Blocks.Interfaces.RealOutput U(
    unit="V",
    start = 0.0)
    "Module voltage"
    annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
  Real lambda(start = 0.0)
    "Lagrange multiplier";

equation
  // Calculation of I_MPP and U_MPP witt the calculation method extremes under constraints with Lagrange multiplier
  0 = IPho - ISat1 * (Modelica.Math.exp((U / nCelSer + (I / nCelPar) * RSer)/(1.0 * Ut)) - 1.0)
    - ISat2 * (Modelica.Math.exp((U / nCelSer + (I / nCelPar) * RSer)/(2.0 * Ut)) - 1.0)
    - (U / nCelSer + (I / nCelPar) * RSer) / RPar - I / nCelPar;

  0 = I / nCelPar - lambda * ((ISat1 / (1.0 * Ut)) * Modelica.Math.exp((U / nCelSer + (I / nCelPar) * RSer) / (1.0 * Ut))
    + (ISat2 / (2.0 * Ut))* Modelica.Math.exp((U / nCelSer + (I / nCelPar) * RSer) / (2.0 * Ut)) + 1.0 / RPar);

  0 = U / nCelSer - lambda * (( RSer * ISat1) / (1.0 * Ut) * Modelica.Math.exp((U / nCelSer + (I / nCelPar) * RSer) / (1.0 * Ut))
    + (RSer * ISat2) / (2.0 * Ut) * Modelica.Math.exp((U / nCelSer + (I / nCelPar) * RSer) / (2.0 * Ut)) + RSer / RPar + 1.0);

  P = I * U;
end ElectricalModelTwoDiodesMPP;
