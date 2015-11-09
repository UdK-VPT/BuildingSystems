within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
model ElectricalModelOneDiodeMPP
  "Simplified electrical model of a solar cell with one diode and MPP tracking"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelOneDiodeGeneral;
  Modelica.Blocks.Interfaces.RealOutput U(unit="V", start = 0.0)
    "Module voltage"
    annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
equation
  I = BuildingSystems.Utilities.SmoothFunctions.softcut_lower(nCelPar * (IPho - ISat1 * NANO * (Modelica.Math.exp(U / (nCelSer * m1 * Ut)) - 1.0)),0.0001,1e-3);
/* Calculation of I_MPP and U_MPP with the calculation method extremes under constraints with Lagrange multiplier */
  I / (nCelPar) - (U / nCelSer  / Ut) * ISat1 * NANO * Modelica.Math.exp(U / (nCelSer * Ut)) = 0.0;
  P = I * U * factor;
end ElectricalModelOneDiodeMPP;
