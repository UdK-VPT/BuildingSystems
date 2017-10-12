within BuildingSystems.Technologies.Photovoltaics.PVModules;
model PVModuleSimple
  "One diode photovoltaic module model"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.PVModuleGeneral(
    angleDegTil_constant = 30.0,
    angleDegAzi_constant = 0.0);
  parameter Real factor = 0.851
    "Scaling factor adaptation to the complex PV cell model"
    annotation(Dialog(tab="Advanced"));
  BuildingSystems.Technologies.Photovoltaics.BaseClasses.OpticalModels.OpticalModelSimple opticalModel
    "Optical model of the photovoltaic generator"
    annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
  BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelOneDiode electricalModel(
    nCelPar = pvModuleData.nCelPar,
    nCelSer = pvModuleData.nCelSer,
    tIk0 = pvModuleData.tIk0,
    tUl0 = pvModuleData.tUl0,
    Eg = pvModuleData.Eg,
    Ik0 = pvModuleData.Ik0,
    Ul0 = pvModuleData.Ul0,
    factor = factor)
    "Electrical model of the photovoltaic generator"
    annotation (Placement(transformation(extent={{42,-6},{62,14}})));
  BuildingSystems.Technologies.Photovoltaics.BaseClasses.ThermalModels.ThermalModelSimple thermalModel(
    f = 0.043)
    "Thermal model of the photovoltaic generator"
    annotation (Placement(transformation(extent={{20,10},{40,30}})));
  Modelica.Blocks.Math.Gain gainP(k=nModSer * nModPar)
    annotation (Placement(transformation(extent={{60,6},{64,10}})));
  Modelica.Blocks.Math.Gain gainI(k=nModPar)
    annotation (Placement(transformation(extent={{72,-2},{76,2}})));
  input Modelica.Blocks.Interfaces.RealInput UField(unit="V")
    "Module voltage"
    annotation (Placement(transformation(extent={{-10,10},{10,-10}},rotation=180,origin={60,60}), iconTransformation(extent={{-10,10},{10,-10}},rotation=180,origin={60,60})));
  Modelica.Blocks.Math.Gain gainU(k=1/nModSer)
    annotation (Placement(transformation(extent={{36,2},{40,6}})));
equation
  if use_GSC_in then
     connect(opticalModel.GSC,GSC_in);
   else
     connect(opticalModel.GSC,GSC_constant);
  end if;
  connect(opticalModel.ITotRed, electricalModel.ITot)
    annotation (Line(points={{-1,0},{45,0}}, color={0,0,127}));
  connect(thermalModel.TCel, electricalModel.T)
    annotation (Line(points={{37,20},{40,20},{40,8},{45,8}}, color={0,0,127}));
  connect(opticalModel.ITotRed, thermalModel.ITot)
    annotation (Line(points={{-1,0},{20,0},{20,18},{23,18}},color={0,0,127}));
  connect(TAmb, thermalModel.TAmb)
    annotation (Line(points={{20,84},{20,22.4},{23,22.4}}, color={0,0,127}));
  connect(radiationPort, opticalModel.radiationPort) annotation (Line(points={{-18,80},{-18,80},{-18,0},{-14,0}}, color={0,0,0}));
  connect(electricalModel.P, gainP.u)
    annotation (Line(points={{57,8},{57,8},{59.6,8}}, color={0,0,127}));
  connect(electricalModel.I, gainI.u)
    annotation (Line(points={{57,0},{71.6,0}}, color={0,0,127}));
  connect(gainP.y, PField)
    annotation (Line(points={{64.2,8},{66,8},{66,30},{32,30},{32,80},{60,80}}, color={0,0,127}));
  connect(gainI.y, IField)
    annotation (Line(points={{76.2,0},{80,0},{80,34},{40,34},{40,40},{60,40}}, color={0,0,127}));
  connect(gainU.y, electricalModel.U)
    annotation (Line(points={{40.2,4},{45,4},{45,4}}, color={0,0,127}));
  connect(UField, gainU.u)
    annotation (Line(points={{60,60},{14,60},{14,4},{35.6,4}}, color={0,0,127}));

  annotation (defaultComponentName="pvmodule", Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
    Text(extent={{-48,60},{-16,30}},lineColor={255,255,255},fillColor={0,0,255}, fillPattern = FillPattern.Solid,textString="S")}),
Documentation(info="<html>
<p>
This is a one diode model of a PV module.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end PVModuleSimple;
