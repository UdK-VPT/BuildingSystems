within BuildingSystems.Technologies.Photovoltaics.BaseClasses;
partial model PVModuleGeneral
  "Basic photovoltaic module model"
  replaceable parameter BuildingSystems.Technologies.Photovoltaics.Data.PhotovoltaicModules.DataSetPhotovoltaicModule pvModuleData
    "Characteristic data of the PV module"
    annotation(Dialog(tab = "General", group = "Module characteristic"),Evaluate=true, choicesAllMatching=true);
  parameter Integer nModPar = 1
    "Number of parallel connected modules within one common orientation"
    annotation(Dialog(tab = "General"));
  parameter Integer nModSer = 1
    "Number of serial connected modules within one common orientation"
    annotation(Dialog(tab = "General"));
  parameter Boolean use_AngleDegTil_in = false
    "= true, use input for controlling the tilt angle of the PV module"
    annotation(Dialog(tab = "General", group = "Orientation"));
  BuildingSystems.Interfaces.Angle_degOutput angleDegTil_constant
    "Tilt angle of the PV module"
    annotation (Dialog(tab = "General", group = "Orientation"));
  BuildingSystems.Interfaces.Angle_degOutput angleDegTil
    "Tilt angle of the PV module"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-60,80}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={-60,80})));
  parameter Boolean use_AngleDegAzi_in = false
    "= true, use input for controlling the azimuth angle of the PV module"
    annotation(Dialog(tab = "General", group = "Orientation"));
  BuildingSystems.Interfaces.Angle_degOutput angleDegAzi_constant
    "Azimuth angle of the PV module: South=0 deg West=90 deg East=-90 deg"
    annotation (Dialog(tab = "General", group = "Orientation"));
  BuildingSystems.Interfaces.Angle_degOutput angleDegAzi
    "Azimuth angle of the PV module: South=0 deg West=90 deg East=-90 deg"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-60,60}),  iconTransformation(extent={{-10,-10},{10,10}},rotation=180,origin={-60,60})));
  parameter Boolean use_GSC_in = false
    "= true, use input for geometric shading coefficient GSC"
    annotation(Dialog(tab = "General", group = "Shadowing"));
  Modelica.Blocks.Interfaces.RealOutput GSC_constant(min = 0.0, max = 1.0) = 0.0
    "Constant shading coefficient (if use_GSC_in = true)"
    annotation(Dialog(tab = "General", group = "Shadowing"));
  BuildingSystems.Interfaces.RadiationPort radiationPort "Radiation port"
    annotation (Placement(transformation(extent={{-10,70},{10,90}}), iconTransformation(extent={{-10,70},{10,90}})));
  input BuildingSystems.Interfaces.Temp_KInput TAmb
    "Environment air temperature"
    annotation(Placement(transformation(extent={{-10,10},{10,-10}},rotation=-90, origin={12,84}),
      iconTransformation(extent={{-10,10},{10,-10}},rotation=270,origin={20,80})));
  input Modelica.Blocks.Interfaces.RealInput GSC_in if use_GSC_in
    "Shading coefficient"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={30,84}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={40,80})));
  Real etaMod
    "Efficiency of the PV Module";
  output BuildingSystems.Interfaces.PowerOutput PField
    "Power of the PV field"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={60,80}),iconTransformation(extent={{-10,-10},{10,10}},origin={60,80})));
  output Modelica.Blocks.Interfaces.RealOutput IField(unit="A")
    "Current of the PV field"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}, origin={60,40}), iconTransformation(extent={{-10,-10},{10,10}}, origin={60,40})));
  final Modelica.SIunits.Area AField = pvModuleData.height * pvModuleData.width * nModSer * nModPar
    "Area of the PV field";
  input Interfaces.Angle_degInput angleDegTil_in if use_AngleDegTil_in
    "Controlled tilt angle of the PV module"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={-12,84}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=-90,origin={-20,80})));
  input Interfaces.Angle_degInput angleDegAzi_in if use_AngleDegAzi_in
    "Controlled azimuth angle of the PV module"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={-30,84}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=-90,origin={-40,80})));
  protected
    Modelica.Blocks.Interfaces.RealInput GSC_internal
      "Shading coefficient";
    Modelica.Blocks.Interfaces.RealInput angleDegAzi_internal
      "Azimuth angle of the PV module: South=0 deg West=90 deg East=-90 deg";
    Modelica.Blocks.Interfaces.RealInput angleDegTil_internal
      "Tilt angle of the PV module";
equation
  if use_GSC_in then
    connect(GSC_internal,GSC_in);
  else
    connect(GSC_internal,GSC_constant);
  end if;

  if use_AngleDegTil_in then
    connect(angleDegTil_internal,angleDegTil_in);
  else
    connect(angleDegTil_internal,angleDegTil_constant);
  end if;

  connect(angleDegTil_internal,angleDegTil);

  if use_AngleDegAzi_in then
    connect(angleDegAzi_internal,angleDegAzi_in);
  else
    connect(angleDegAzi_internal,angleDegAzi_constant);
  end if;

  connect(angleDegAzi_internal,angleDegAzi);

  etaMod = PField / ((radiationPort.IrrDif + radiationPort.IrrDir) * AField + 1.0e-6);

  annotation (Icon(graphics={Text(extent={{-38,-64},{46,-98}},lineColor={0,0,255},textString= "%name"),
    Rectangle(extent={{-50,90},{50,-68}},lineColor={215,215,215},fillColor={215,215,215},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-46,28},{-18,0}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-14,28},{14,0}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{18,28},{46,0}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-46,-4},{-18,-32}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-14,-4},{14,-32}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{18,-4},{46,-32}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-46,-36},{-18,-64}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-14,60},{14,32}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{18,60},{46,32}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-46,60},{-18,32}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{-14,-36},{14,-64}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid),
    Rectangle(extent={{18,-36},{46,-64}},lineColor={0,0,255},fillColor={0,0,255},fillPattern = FillPattern.Solid)}),
Documentation(info="<html>
<p>
Basic photovoltaic module model which defines the common variables and equations.
</p>
</html>", revisions="<html>
<ul>
<li>
March 1, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end PVModuleGeneral;
