within BuildingSystems.Buildings.BaseClasses;
partial model AirvolumeGeneral
  "Generic air volume model"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium in the air volume"
    annotation (choicesAllMatching = true);
  parameter Modelica.SIunits.Volume V = 1.0
    "Air volume"
    annotation(Dialog(tab="General",group="Air volume geometry"));
  parameter Integer nSurfaces(min=1) = 1
    "Number of surfaces, which enclose the air volume"
    annotation(Dialog(tab="General"));
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start air temperature"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.MassFraction x_start = 0.005
   "Start air moisture"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Mass mH2OLiq_start = 0.0
   "Start liquid water mass"
    annotation (Dialog(tab="Initialization"));
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toSurfacePorts[nSurfaces]
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=90,origin={0,80})));
  output BuildingSystems.Interfaces.Temp_KOutput T
    "Air temperature"
    annotation (Placement(transformation(extent={{70,10},{90,30}}), iconTransformation(extent={{70,10},{90,30}})));
  output BuildingSystems.Interfaces.Moisture_absOutput x
    "Absolute air moisture"
    annotation (Placement(transformation(extent={{70,-30},{90,-10}}), iconTransformation(extent={{70,-30},{90,-10}})));

  annotation (Icon(graphics={Rectangle(extent={{-80,80},{80,-80}},lineColor={85,170,255},fillColor={170,213,255},fillPattern=FillPattern.Sphere),
    Text(extent={{26,-76},{118,-104}},lineColor={0,0,255},fillColor={85,170,255},fillPattern=FillPattern.Solid,textString="%name")}));
end AirvolumeGeneral;
