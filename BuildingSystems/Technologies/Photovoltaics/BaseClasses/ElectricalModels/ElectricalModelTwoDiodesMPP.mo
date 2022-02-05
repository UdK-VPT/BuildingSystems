within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
model ElectricalModelTwoDiodesMPP
  "MPP controlled electrical two diodes model of a PV module"
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

  annotation (
Documentation(info="<html>
<p>
This is a MPP controlled electrical two diodes model of a PV module.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ElectricalModelTwoDiodesMPP;
