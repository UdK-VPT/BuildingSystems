within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
model ElectricalModelOneDiodeMPP
  "MPP controlled electrical one diode model of a PV module"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelOneDiodeGeneral;
  output Modelica.Blocks.Interfaces.RealOutput U(
    unit="V",
    start = 0.0)
    "Module voltage"
    annotation (Placement(transformation(extent={{60,-10},{80,10}}), iconTransformation(extent={{60,-10},{80,10}})));
equation
  I = BuildingSystems.Utilities.SmoothFunctions.softcut_lower(nCelPar * (IPho - ISat1 * NANO * (Modelica.Math.exp(U / (nCelSer * m1 * Ut)) - 1.0)),0.0001,1e-3);
  // Calculation of I_MPP and U_MPP with the calculation method extremes under constraints with Lagrange multiplier
  I / (nCelPar) - (U / nCelSer  / Ut) * ISat1 * NANO * Modelica.Math.exp(U / (nCelSer * Ut)) = 0.0;

  P = I * U * factor;

  annotation(
Documentation(info="<html>
<p>
This is a MPP controlled electrical one diode model of a PV module.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ElectricalModelOneDiodeMPP;
