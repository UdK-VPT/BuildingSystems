within BuildingSystems.Buildings.BaseClasses;
partial model AirvolumeGeneral
  "Generic air volume model"
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium in the air volume"
    annotation (choicesAllMatching = true);
  parameter BuildingSystems.Buildings.Types.GeometryType geometryType = BuildingSystems.Buildings.Types.GeometryType.Fixed
    "Fixed (default) or flexible geometry"
    annotation (Evaluate=true, Dialog(tab = "General", group = "Air volume geometry"));
  parameter Modelica.SIunits.Volume V = 1.0
    "Air volume (if geometryType == Fixed)"
    annotation(Dialog(tab="General",group="Air volume geometry"));
  output BuildingSystems.Interfaces.VolumeOutput V_internal
    "Air volume";
  input BuildingSystems.Interfaces.VolumeInput V_in(
    min=0) if geometryType == BuildingSystems.Buildings.Types.GeometryType.Flexible
    "Air volume from input"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-80,0}),
      iconTransformation(extent={{10,-10},{-10,10}},rotation=180,origin={-80,0})));
  parameter Integer nSurfaces(min=1) = 1
    "Number of surfaces, which enclose the air volume"
    annotation(Dialog(tab="General"));
  parameter Integer nAirElements(min=1) = 1
    "Number of air elements, which are included in the air volume"
    annotation(Dialog(tab="General"));
  parameter Modelica.SIunits.Temp_K T_start[nAirElements] = fill(293.15,nAirElements)
    "Air temperature (start value)"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.MassFraction x_start[nAirElements] = fill(0.005,nAirElements)
   "Absolute air moisture (start value)"
    annotation (Dialog(tab="Initialization"));
  parameter Integer nAirpaths = 0
    "Number of air paths"
    annotation(Evaluate=true, Dialog(connectorSizing=true));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts[nAirpaths](
    redeclare each final package Medium=Medium)
    "Flow ports of the air paths"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},origin={0,-80},rotation=180),
      iconTransformation(extent={{-40,-90},{40,-70}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPorts toSurfacePorts[nSurfaces]
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=90,origin={0,80})));
  output BuildingSystems.Interfaces.Temp_KOutput T[nAirElements]
    "Air temperature"
    annotation (Placement(transformation(extent={{70,10},{90,30}}), iconTransformation(extent={{70,10},{90,30}})));
  output BuildingSystems.Interfaces.Moisture_absOutput x[nAirElements]
    "Absolute air moisture"
    annotation (Placement(transformation(extent={{70,-30},{90,-10}}), iconTransformation(extent={{70,-30},{90,-10}})));
  output BuildingSystems.Interfaces.PressureOutput p[nAirElements]
    "Air pressure"
    annotation (Placement(transformation(extent={{70,50},{90,70}}), iconTransformation(extent={{70,50},{90,70}})));
equation
  if geometryType == BuildingSystems.Buildings.Types.GeometryType.Fixed then
    V_internal = V;
  else
    connect(V_internal, V_in);
  end if;

  annotation (Icon(graphics={Rectangle(extent={{-80,80},{80,-80}},lineColor={85,170,255},fillColor={170,213,255},fillPattern=FillPattern.Sphere),
    Text(extent={{26,-76},{118,-104}},lineColor={0,0,255},fillColor={85,170,255},fillPattern=FillPattern.Solid,textString="%name")}),
Documentation(info="<html>
<p>
This is partial model description of an air volume.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end AirvolumeGeneral;
