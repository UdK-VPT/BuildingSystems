within BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels;
model ElectricalModelOneDiode
  "Simplified electrical model of a solar cell with one diode"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelOneDiodeGeneral;
  Modelica.Blocks.Interfaces.RealInput U(unit="V")
    "Module voltage"
    annotation (Placement(transformation(extent={{-98,-28},{-60,10}}),iconTransformation(extent={{-10,-10},{10,10}},rotation=0,origin={-70,0})));
equation
  I = BuildingSystems.Utilities.SmoothFunctions.softcut_lower(nCelPar * (IPho - ISat1 * NANO * (Modelica.Math.exp(U / (nCelSer * m1 * Ut)) - 1.0)),0.0001,1e-3);
  P = I * U * factor;
end ElectricalModelOneDiode;
