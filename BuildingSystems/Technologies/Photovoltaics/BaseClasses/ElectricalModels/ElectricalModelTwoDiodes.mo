within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
model ElectricalModelTwoDiodes
  "Electrical two diodes model of a PV module"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelTwoDiodesGeneral;
  input Modelica.Blocks.Interfaces.RealInput U(unit="V")
    "Module voltage"
    annotation (Placement(transformation(extent={{-98,-28},{-60,10}}),iconTransformation(extent={{-10,-10},{10,10}},origin={-70,0})));
equation
  0 = IPho - ISat1 * (Modelica.Math.exp((U / nCelSer + (I / nCelPar) * RSer)/(1.0 * Ut)) - 1.0)
    - ISat2 * (Modelica.Math.exp((U / nCelSer + (I / nCelPar) * RSer)/(2.0 * Ut)) - 1.0)
    - (U / nCelSer + (I / nCelPar) * RSer) / RPar - I / nCelPar;
  P = I * U;

  annotation (
Documentation(info="<html>
<p>
This is an electrical two diodes model of a PV module.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ElectricalModelTwoDiodes;
