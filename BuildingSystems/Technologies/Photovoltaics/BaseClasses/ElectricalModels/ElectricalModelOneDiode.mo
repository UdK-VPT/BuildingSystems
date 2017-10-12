within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
model ElectricalModelOneDiode
  "Electrical one diode model of a PV module"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelOneDiodeGeneral;
  input Modelica.Blocks.Interfaces.RealInput U(unit="V")
    "Module voltage"
    annotation (Placement(transformation(extent={{-98,-28},{-60,10}}),iconTransformation(extent={{-10,-10},{10,10}},origin={-70,0})));
equation
  I = BuildingSystems.Utilities.SmoothFunctions.softcut_lower(nCelPar * (IPho - ISat1 * NANO * (Modelica.Math.exp(U / (nCelSer * m1 * Ut)) - 1.0)),0.0001,1e-3);
  P = I * U * factor;

  annotation (
Documentation(info="<html>
<p>
This is an electrical one diode model of a PV module.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end ElectricalModelOneDiode;
