within BuildingSystems.Technologies.Photovoltaics.PVModules;
model PVModuleSimpleMPP
  "Simplified one diode photovoltaic module model MPP controlled"
  extends BuildingSystems.Technologies.Photovoltaics.BaseClasses.PVModuleGeneral(angleDegTil = 30,angleDegAzi=0.0);
  parameter Real factor = 0.851
    "Scaling factor adaptation to the complex PV cell model"
    annotation(Dialog(tab="Advanced"));
  BuildingSystems.Technologies.Photovoltaics.BaseClasses.OpticalModels.OpticalModelSimple opticalModel
    "Optical model of the photovoltaic generator"
    annotation (Placement(transformation(extent={{-18,-10},{2,10}})));
  BuildingSystems.Technologies.Photovoltaics.BaseClasses.ElectricalModels.ElectricalModelOneDiodeMPP electricalModel(
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
  Modelica.Blocks.Math.Gain gainU(k=nModSer)
    annotation (Placement(transformation(extent={{66,2},{70,6}})));
  output Modelica.Blocks.Interfaces.RealOutput UField(unit="V")
    "Voltage of the PV field"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={60,60}),iconTransformation(extent={{-10,-10},{10,10}}, origin={60,60})));
  equation
    if use_GSC_in then
       connect(opticalModel.GSC,GSC_in);
     else
       connect(opticalModel.GSC,GSC_constant);
    end if;
    connect(TAmb, thermalModel.TAmb)
      annotation (Line(points={{20,84},{20,84},{20,22.4},{23,22.4}}, color={0,0,127}));
    connect(thermalModel.TCel, electricalModel.T)
      annotation (Line(points={{37,20},{38,20},{40,20},{40,8},{43,8}}, color={0,0,127}));
    connect(opticalModel.ITotRed, electricalModel.ITot)
      annotation (Line(points={{-1,0},{43,0}}, color={0,0,127}));
    connect(radiationPort, opticalModel.radiationPort)
      annotation (Line(points={{-18,80},{-18,80},{-18,0},{-14,0}}, color={0,0,0}));
    connect(electricalModel.P, gainP.u)
      annotation (Line(points={{57,8},{57,8},{59.6,8}}, color={0,0,127}));
    connect(electricalModel.U, gainU.u)
      annotation (Line(points={{57,4},{57,4},{65.6,4}}, color={0,0,127}));
    connect(electricalModel.I, gainI.u)
      annotation (Line(points={{57,0},{71.6,0}}, color={0,0,127}));
    connect(gainP.y, PField)
      annotation (Line(points={{64.2,8},{66,8},{66,30},{32,30},{32,80},{60,80}}, color={0,0,127}));
    connect(gainU.y, UField)
      annotation (Line(points={{70.2,4},{72,4},{72,32},{36,32},{36,60},{60,60}}, color={0,0,127}));
    connect(gainI.y, IField)
      annotation (Line(points={{76.2,0},{80,0},{80,34},{40,34},{40,40},{60,40}}, color={0,0,127}));
    connect(opticalModel.ITotRed, thermalModel.ITot)
      annotation (Line(points={{-1,0},{20,0},{20,18},{23,18}}, color={0,0,127}));

    annotation (defaultComponentName="pvmodule", Icon(graphics={Text(extent={{-12,58},{14,34}},lineColor={255,255,255},fillColor={0,0,255},fillPattern=FillPattern.Solid,textString="MPP")}));
end PVModuleSimpleMPP;
