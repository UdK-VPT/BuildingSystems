within BuildingSystems.HAM.HeatConduction;
model GridHeatConduction3D "Discretized Body with 3D heat conduction"

  BuildingSystems.HAM.HeatConduction.HeatConduction3D cell[nX,nY,nZ](each material=material,
    each lengthY=lengthY/nY,each lengthZ=lengthZ/nZ,each lengthX=lengthX/nX, each T_start=T_start);
  BuildingSystems.Interfaces.HeatPorts heatPorts_x1[nY,nZ]
    "Discretized heat port in direction x1"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-80,0}), iconTransformation(extent={{-20,-6},{20,6}}, rotation=270,origin={-80,0})));
  BuildingSystems.Interfaces.HeatPorts heatPorts_x2[nY,nZ]
    "Discretized heat port in direction x2"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={80,0}), iconTransformation(extent={{-20,-6},{20,6}},rotation=270,origin={80,0})));
  BuildingSystems.Interfaces.HeatPorts heatPorts_y1[nX,nZ]
    "Discretized heat port in direction y1"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},origin={0,-82}), iconTransformation(extent={{-20,-6},{20,6}}, origin={0,-80})));
  BuildingSystems.Interfaces.HeatPorts heatPorts_y2[nX,nZ]
    "Discretized heat port in direction y2"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},origin={0,80}),  iconTransformation(extent={{-20,-6},{20,6}}, origin={0,80})));
  BuildingSystems.Interfaces.HeatPorts heatPorts_z1[nX,nY]
    "Discretized heat port in direction z1"
   annotation(Placement(transformation(extent={{-8,-8},{8,8}},origin={-48,-82}),iconTransformation(extent={{-20,-6},{20,6}}, origin={-60,-80})));
  BuildingSystems.Interfaces.HeatPorts heatPorts_z2[nX,nY]
    "Discretized heat port in direction z2"
    annotation(Placement(transformation(extent={{-8,-8},{8,8}},origin={64,80}), iconTransformation(extent={{-20,-6},{20,6}}, origin={60,80})));
  parameter Integer nX = 1
    "Number of cells in the y dimension";
  parameter Integer nY = 1
    "Number of cells in the y dimension";
  parameter Integer nZ = 1
    "Number of cells in the z dimension";
  parameter
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral material
    "Material of the body";
  parameter Modelica.SIunits.Length lengthX = 1.0
    "Length in x dimension";
  parameter Modelica.SIunits.Length lengthY = 1.0
    "Length in y dimension";
  parameter Modelica.SIunits.Length lengthZ = 1.0
    "Length in z dimension";
  parameter Modelica.SIunits.Temp_K T_start=293.15
    "Start temperature"
    annotation (Dialog(tab="Initialization"));

equation
  // Connects to outer connectors
  // x-dimension
  for j in 1:nY loop
    for k in 1:nZ loop
      connect(heatPorts_x1[j,k],cell[1,j,k].heatPort_x1);
      connect(heatPorts_x2[j,k],cell[nX,j,k].heatPort_x2);
    end for;
  end for;

  // y-dimension

  for i in 1:nX loop
   for k in 1:nZ loop
      connect(heatPorts_y1[i,k],cell[i,1,k].heatPort_y1);
      connect(heatPorts_y2[i,k],cell[i,nY,k].heatPort_y2);
    end for;
  end for;

  // z-dimension
  for i in 1:nX loop
    for j in 1:nY loop
      connect(heatPorts_z1[i,j],cell[i,j,1].heatPort_z1);
      connect(heatPorts_z2[i,j],cell[i,j,nZ].heatPort_z1);
    end for;
  end for;

  // Connects of components
  // z-dimension
  for i in 1:nX loop
    for j in 1:nY loop
      for k in 1:nZ-1 loop
        connect(cell[i,j,k].heatPort_z2,cell[i,j,k+1].heatPort_z1);
      end for;
    end for;
  end for;
  // y-dimension
  for i in 1:nX loop
    for j in 1:nY-1 loop
      for k in 1:nZ loop
        connect(cell[i,j,k].heatPort_y2,cell[i,j+1,k].heatPort_y1);
      end for;
    end for;
  end for;
  // x-dimension
  for i in 1:nX-1 loop
    for j in 1:nY loop
      for k in 1:nZ loop
        connect(cell[i,j,k].heatPort_x2,cell[i+1,j,k].heatPort_x1);
      end for;
    end for;
  end for;

  annotation(defaultComponentName = "gridHeatConduction3D",Icon(graphics={
    Rectangle(extent={{0,80},{80,0}}, ineColor={255,170,85},fillColor={255,170,85},fillPattern=  FillPattern.Solid),
    Rectangle(extent={{-80,80},{0,0}},  lineColor={255,85,85},fillColor={255,0,0},fillPattern=  FillPattern.Solid),
    Text(extent={{-14,71},{54,5}},lineColor={255,0,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=  FillPattern.Solid,textString= "D"),
    Text(extent={{-52,71},{16,5}},lineColor={255,128,0},lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="3"),
    Text(extent={{-46,-78},{46,-106}},lineColor={0,0,255},fillColor={230,230,230},fillPattern=  FillPattern.Solid,textString= "%name"),
    Rectangle(extent={{-80,0},{0,-80}},   lineColor={255,170,85},fillColor={255,170,85},fillPattern=  FillPattern.Solid),
    Rectangle(extent={{0,0},{80,-80}},  lineColor={255,85,85},fillColor={255,0,0},fillPattern=   FillPattern.Solid)}));
end GridHeatConduction3D;
