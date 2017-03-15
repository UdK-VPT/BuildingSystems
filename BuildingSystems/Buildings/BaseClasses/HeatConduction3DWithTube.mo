within BuildingSystems.Buildings.BaseClasses;
model HeatConduction3DWithTube
  "Model for 3D heat conduction of a body with a integrated tube model in x dimension"
  extends BuildingSystems.Fluid.Interfaces.PartialTwoPortInterface;
  parameter BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral material
    "Material around the tube";
  parameter Modelica.SIunits.Length lengthX
    "Length in x dimension"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length lengthY
    "Length in y dimension"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length lengthZ
    "Length in z dimension"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length diameterTube
    "Inside tube diameter"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length thicknessTube
    "Thickness of tube wall"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.ThermalConductivity lambdaTube
    "Heat conductivity of tube wall";
  parameter Integer nNodesTube(min=1) = 1
    "Number of volume nodes of the integrated tube";
  BuildingSystems.HAM.HeatConduction.HeatConduction3D heaCon(
    material = material,
    lengthX = lengthX,
    lengthY = lengthY,
    lengthZ = lengthZ,
    geoFacZ = 1.0-edgeTube*edgeTube/(lengthY+lengthZ),
    geoFacY = 1.0-edgeTube*edgeTube/(lengthZ+lengthY),
    ARedYZ = Modelica.Constants.pi*(diameterTube+thicknessTube)^2/4,
    VRed = Modelica.Constants.pi*(diameterTube+thicknessTube)^2/4*lengthX)
    annotation (Placement(transformation(extent={{-10,10},{10,30}})));
  BuildingSystems.Fluid.FixedResistances.Pipe tube(
    diameter = diameterTube,
    thicknessIns = thicknessTube,
    lambdaIns = lambdaTube,
    length = lengthX,
    m_flow_nominal = m_flow_nominal,
    redeclare package Medium = Medium,
    nNodes = nNodesTube,
    useMultipleHeatPorts=false)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-18,40})));
  BuildingSystems.Interfaces.HeatPort heatPort_x1
    annotation (Placement(transformation(extent={{-72,10},{-52,30}}),iconTransformation(extent={{-72,10},{-52,30}})));
  BuildingSystems.Interfaces.HeatPort heatPort_x2
    annotation (Placement(transformation(extent={{50,10},{70,30}}),iconTransformation(extent={{50,10},{70,30}})));
  BuildingSystems.Interfaces.HeatPort heatPort_y2
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={0,80}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,80})));
  BuildingSystems.Interfaces.HeatPort heatPort_y1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={0,-40}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={0,-40})));
  BuildingSystems.Interfaces.HeatPort heatPort_z1
    annotation(Placement(transformation(extent={{-10,-10},{10,10}},origin={-60,-40}),iconTransformation(extent={{-10,-10},{10,10}}, origin={-60,-40})));
  BuildingSystems.Interfaces.HeatPort heatPort_z2
    annotation(Placement(transformation(extent={{-10,-10},{10,10}},origin={60,80}), iconTransformation(extent={{-10,-10},{10,10}}, origin={60,80})));
  protected parameter Modelica.SIunits.Length edgeTube = sqrt(Modelica.Constants.pi*(diameterTube+thicknessTube)^2/4);
equation
  connect(heaCon.heatPort_x2, heatPort_x2) annotation (Line(
      points={{8,20},{60,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heatPort_x1, heaCon.heatPort_x1) annotation (Line(
      points={{-62,20},{-8,20}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaCon.heatPort_y1, heatPort_y1) annotation (Line(
      points={{0,12},{0,-40}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(tube.heatPort, heaCon.heatPort_source) annotation (Line(
      points={{-18,35},{-18,28},{-4,28},{-4,19.8},{0,19.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaCon.heatPort_y2, heatPort_y2) annotation (Line(
      points={{0,28.2},{0,80}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heaCon.heatPort_z2, heatPort_z2) annotation (Line(
      points={{8,27.8},{40,27.8},{40,80},{60,80}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(heatPort_z1, heaCon.heatPort_z1) annotation (Line(
      points={{-60,-40},{-40,-40},{-40,12},{-8,12}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(port_a, tube.port_b) annotation (Line(
      points={{-100,0},{-80,0},{-80,40},{-28,40}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(tube.port_a, port_b) annotation (Line(
      points={{-8,40},{80,40},{80,0},{100,0}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
      graphics={Rectangle(extent={{-60,80},{60,-40}},fillColor={230,230,230}, fillPattern = FillPattern.Solid,pattern=LinePattern.None),
    Text(extent={{-32,70},{12,30}}, lineColor={255,128,0},lineThickness=0.5,fillColor={255,128,0},fillPattern = FillPattern.Solid,textString = "3"),
    Text(extent={{-10,71},{34,28}}, lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},fillPattern = FillPattern.Solid,textString= "D"),
    Rectangle(extent={{-46,16},{44,-16}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={192,192,192}),
    Rectangle(extent={{-46,12},{44,-12}},lineColor={0,0,0},fillPattern=FillPattern.HorizontalCylinder,fillColor={217,236,255})}));
end HeatConduction3DWithTube;
