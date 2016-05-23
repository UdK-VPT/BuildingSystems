within BuildingSystems.HAM.HeatConduction.Examples;
model HeatConduction2DCorner
  "2D dynamic heat conduction problem of a corner"
  extends Modelica.Icons.Example;

  model Concrete
    extends BuildingSystems.HAM.HeatConduction.HeatConduction3D(
    lengthX=0.1,
    lengthY=0.1,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete material);
  end Concrete;

  model Insulation
    extends BuildingSystems.HAM.HeatConduction.HeatConduction3D(
    lengthX=0.1,
    lengthY=0.1,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation material);
  end Insulation;

  Insulation ele13
    annotation (Placement(transformation(extent={{-40,40},{-20,60}})));
  Insulation ele14
    annotation (Placement(transformation(extent={{-20,40},{0,60}})));
  Insulation ele15
    annotation (Placement(transformation(extent={{0,40},{20,60}})));
  Insulation ele16
    annotation (Placement(transformation(extent={{20,40},{40,60}})));
  Insulation ele26
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  Insulation ele36
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Insulation ele46
    annotation (Placement(transformation(extent={{20,-20},{40,0}})));
  Concrete ele23
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Concrete ele24
    annotation (Placement(transformation(extent={{-20,20},{0,40}})));
  Concrete ele25
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Concrete ele35
    annotation (Placement(transformation(extent={{0,0},{20,20}})));
  Concrete ele45
    annotation (Placement(transformation(extent={{0,-20},{20,0}})));
  Insulation ele12
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Concrete ele22
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
  Concrete ele55
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Insulation ele56
    annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
  Concrete ele65
    annotation (Placement(transformation(extent={{0,-60},{20,-40}})));
  Insulation ele66
    annotation (Placement(transformation(extent={{20,-60},{40,-40}})));
  Concrete ele21
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  Insulation ele11
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Thermal.HeatTransfer.Components.Convection con21
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=270,origin={-70,12})));
  Modelica.Thermal.HeatTransfer.Components.Convection con22
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=270,origin={-50,12})));
  Modelica.Thermal.HeatTransfer.Components.Convection con23
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=270,origin={-30,12})));
  Modelica.Thermal.HeatTransfer.Components.Convection con24
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=270,origin={-10,12})));
  Modelica.Thermal.HeatTransfer.Components.Convection con35
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=180,origin={-8,10})));
  Modelica.Thermal.HeatTransfer.Components.Convection con45
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=180,origin={-8,-10})));
  Modelica.Thermal.HeatTransfer.Components.Convection con55
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=180,origin={-8,-30})));
  Modelica.Thermal.HeatTransfer.Components.Convection con65
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=180,origin={-8,-50})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TRoom(
    T=293.15)
    annotation (Placement(transformation(extent={{-84,-24},{-76,-16}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TAmb1(
    T=263.15)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=270,origin={-20,96})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TAmb2(
    T=263.15)
    annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=180,origin={80,0})));
  Modelica.Thermal.HeatTransfer.Components.Convection con11
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=90,origin={-70,68})));
  Modelica.Thermal.HeatTransfer.Components.Convection con12
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=90,origin={-50,68})));
  Modelica.Thermal.HeatTransfer.Components.Convection con13
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=90,origin={-30,68})));
  Modelica.Thermal.HeatTransfer.Components.Convection con14
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=90,origin={-10,68})));
  Modelica.Thermal.HeatTransfer.Components.Convection con15
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=90,origin={10,68})));
  Modelica.Thermal.HeatTransfer.Components.Convection con16_1
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=90,origin={30,68})));
  Modelica.Thermal.HeatTransfer.Components.Convection con16_2
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=0,origin={48,50})));
  Modelica.Thermal.HeatTransfer.Components.Convection con26
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=0,origin={48,30})));
  Modelica.Thermal.HeatTransfer.Components.Convection con36
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=0,origin={48,10})));
  Modelica.Thermal.HeatTransfer.Components.Convection con46
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=0,origin={48,-10})));
  Modelica.Thermal.HeatTransfer.Components.Convection con56
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=0,origin={48,-30})));
  Modelica.Thermal.HeatTransfer.Components.Convection con66
    annotation (Placement(transformation(extent={{-6,-6},{6,6}},rotation=0,origin={48,-50})));
  Modelica.Blocks.Sources.Constant alphaIns(
    k=1.0)
    annotation (Placement(transformation(extent={{-84,-44},{-76,-36}})));
  Modelica.Blocks.Sources.Constant alphaOut1(
    k=1.0)
    annotation (Placement(transformation(extent={{-94,84},{-86,92}})));
  Modelica.Blocks.Sources.Constant alphaOut2(
    k=1.0)
    annotation (Placement(transformation(extent={{84,62},{76,70}})));
equation
  connect(ele65.heatPort_x2, ele66.heatPort_x1) annotation (Line(
      points={{18,-50},{22,-50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele55.heatPort_x2, ele56.heatPort_x1) annotation (Line(
      points={{18,-30},{22,-30}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele45.heatPort_x2, ele46.heatPort_x1) annotation (Line(
      points={{18,-10},{22,-10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele35.heatPort_x2, ele36.heatPort_x1) annotation (Line(
      points={{18,10},{22,10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele25.heatPort_x2, ele26.heatPort_x1) annotation (Line(
      points={{18,30},{22,30}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele15.heatPort_x2, ele16.heatPort_x1) annotation (Line(
      points={{18,50},{22,50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele24.heatPort_x2, ele25.heatPort_x1) annotation (Line(
      points={{-2,30},{2,30}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele14.heatPort_x2, ele15.heatPort_x1) annotation (Line(
      points={{-2,50},{2,50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele23.heatPort_x2, ele24.heatPort_x1) annotation (Line(
      points={{-22,30},{-18,30}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele13.heatPort_x2, ele14.heatPort_x1) annotation (Line(
      points={{-22,50},{-18,50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele22.heatPort_x2, ele23.heatPort_x1) annotation (Line(
      points={{-42,30},{-38,30}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele12.heatPort_x2, ele13.heatPort_x1) annotation (Line(
      points={{-42,50},{-38,50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele11.heatPort_x2, ele12.heatPort_x1) annotation (Line(
      points={{-62,50},{-58,50}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele21.heatPort_x2, ele22.heatPort_x1) annotation (Line(
      points={{-62,30},{-58,30}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele11.heatPort_y1, ele21.heatPort_y2) annotation (Line(
      points={{-70,42},{-70,38.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele12.heatPort_y1, ele22.heatPort_y2) annotation (Line(
      points={{-50,42},{-50,38.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele13.heatPort_y1, ele23.heatPort_y2) annotation (Line(
      points={{-30,42},{-30,38.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele14.heatPort_y1, ele24.heatPort_y2) annotation (Line(
      points={{-10,42},{-10,38.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele15.heatPort_y1, ele25.heatPort_y2) annotation (Line(
      points={{10,42},{10,38.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele25.heatPort_y1, ele35.heatPort_y2) annotation (Line(
      points={{10,22},{10,18.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele35.heatPort_y1, ele45.heatPort_y2) annotation (Line(
      points={{10,2},{10,-1.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele45.heatPort_y1, ele55.heatPort_y2) annotation (Line(
      points={{10,-18},{10,-21.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele55.heatPort_y1, ele65.heatPort_y2) annotation (Line(
      points={{10,-38},{10,-41.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele16.heatPort_y1, ele26.heatPort_y2) annotation (Line(
      points={{30,42},{30,38.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele26.heatPort_y1, ele36.heatPort_y2) annotation (Line(
      points={{30,22},{30,18.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele36.heatPort_y1, ele46.heatPort_y2) annotation (Line(
      points={{30,2},{30,-1.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele46.heatPort_y1, ele56.heatPort_y2) annotation (Line(
      points={{30,-18},{30,-21.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ele56.heatPort_y1, ele66.heatPort_y2) annotation (Line(
      points={{30,-38},{30,-41.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(con11.solid, ele11.heatPort_y2) annotation (Line(points={{-70,62},{-70,
          58.2},{-70,58.2}}, color={191,0,0}));
  connect(con12.solid, ele12.heatPort_y2) annotation (Line(points={{-50,62},{-50,
          58.2},{-50,58.2}}, color={191,0,0}));
  connect(con13.solid, ele13.heatPort_y2) annotation (Line(points={{-30,62},{-30,
          58.2},{-30,58.2}}, color={191,0,0}));
  connect(con14.solid, ele14.heatPort_y2) annotation (Line(points={{-10,62},{-10,
          58.2},{-10,58.2}}, color={191,0,0}));
  connect(con15.solid, ele15.heatPort_y2)
    annotation (Line(points={{10,62},{10,58.2},{10,58.2}}, color={191,0,0}));
  connect(con16_1.solid, ele16.heatPort_y2)
    annotation (Line(points={{30,62},{30,58.2},{30,58.2}}, color={191,0,0}));
  connect(con16_2.solid, ele16.heatPort_x2)
    annotation (Line(points={{42,50},{40,50},{38,50}}, color={191,0,0}));
  connect(con26.solid, ele26.heatPort_x2)
    annotation (Line(points={{42,30},{40,30},{38,30}}, color={191,0,0}));
  connect(con36.solid, ele36.heatPort_x2)
    annotation (Line(points={{42,10},{40,10},{38,10}}, color={191,0,0}));
  connect(con46.solid, ele46.heatPort_x2)
    annotation (Line(points={{42,-10},{40,-10},{38,-10}}, color={191,0,0}));
  connect(con56.solid, ele56.heatPort_x2)
    annotation (Line(points={{42,-30},{40,-30},{38,-30}}, color={191,0,0}));
  connect(con66.solid, ele66.heatPort_x2)
    annotation (Line(points={{42,-50},{40,-50},{38,-50}}, color={191,0,0}));
  connect(con21.solid, ele21.heatPort_y1)
    annotation (Line(points={{-70,18},{-70,20},{-70,22}}, color={191,0,0}));
  connect(con22.solid, ele22.heatPort_y1)
    annotation (Line(points={{-50,18},{-50,20},{-50,22}}, color={191,0,0}));
  connect(con23.solid, ele23.heatPort_y1)
    annotation (Line(points={{-30,18},{-30,20},{-30,22}}, color={191,0,0}));
  connect(con24.solid, ele24.heatPort_y1)
    annotation (Line(points={{-10,18},{-10,20},{-10,22}}, color={191,0,0}));
  connect(con35.solid, ele35.heatPort_x1)
    annotation (Line(points={{-2,10},{0,10},{2,10}}, color={191,0,0}));
  connect(con45.solid, ele45.heatPort_x1)
    annotation (Line(points={{-2,-10},{-2,-10},{2,-10}}, color={191,0,0}));
  connect(con55.solid, ele55.heatPort_x1)
    annotation (Line(points={{-2,-30},{-2,-30},{2,-30}}, color={191,0,0}));
  connect(con65.solid, ele65.heatPort_x1)
    annotation (Line(points={{-2,-50},{-2,-50},{2,-50}}, color={191,0,0}));
  connect(TRoom.port, con65.fluid) annotation (Line(points={{-76,-20},{-26,-20},
          {-26,-50},{-14,-50}}, color={191,0,0}));
  connect(TRoom.port, con55.fluid) annotation (Line(points={{-76,-20},{-26,-20},
          {-26,-30},{-14,-30}}, color={191,0,0}));
  connect(TRoom.port, con45.fluid) annotation (Line(points={{-76,-20},{-26,-20},
          {-26,-10},{-14,-10}}, color={191,0,0}));
  connect(TRoom.port, con24.fluid) annotation (Line(points={{-76,-20},{-26,-20},
          {-26,6},{-10,6}}, color={191,0,0}));
  connect(TRoom.port, con23.fluid)
    annotation (Line(points={{-76,-20},{-30,-20},{-30,6}}, color={191,0,0}));
  connect(TRoom.port, con22.fluid)
    annotation (Line(points={{-76,-20},{-50,-20},{-50,6}}, color={191,0,0}));
  connect(TRoom.port, con21.fluid)
    annotation (Line(points={{-76,-20},{-70,-20},{-70,6}}, color={191,0,0}));
  connect(TRoom.port, con35.fluid) annotation (Line(points={{-76,-20},{-26,-20},
          {-26,10},{-14,10}}, color={191,0,0}));
  connect(TAmb1.port, con11.fluid) annotation (Line(points={{-20,92},{-20,92},{-20,
          80},{-70,80},{-70,74}}, color={191,0,0}));
  connect(TAmb1.port, con12.fluid) annotation (Line(points={{-20,92},{-20,92},{-20,
          80},{-50,80},{-50,74}}, color={191,0,0}));
  connect(TAmb1.port, con13.fluid) annotation (Line(points={{-20,92},{-20,92},{-20,
          80},{-30,80},{-30,74}}, color={191,0,0}));
  connect(TAmb1.port, con14.fluid) annotation (Line(points={{-20,92},{-20,92},{-20,
          80},{-10,80},{-10,74}}, color={191,0,0}));
  connect(TAmb1.port, con15.fluid) annotation (Line(points={{-20,92},{-20,80},{10,
          80},{10,74}}, color={191,0,0}));
  connect(TAmb1.port, con16_1.fluid) annotation (Line(points={{-20,92},{-20,80},
          {30,80},{30,74}}, color={191,0,0}));
  connect(con16_2.fluid, TAmb2.port)
    annotation (Line(points={{54,50},{60,50},{60,0},{76,0}}, color={191,0,0}));
  connect(con26.fluid, TAmb2.port) annotation (Line(points={{54,30},{60,30},{60,
          0},{76,0},{76,4.996e-016}}, color={191,0,0}));
  connect(con36.fluid, TAmb2.port) annotation (Line(points={{54,10},{60,10},{60,
          0},{76,0},{76,4.996e-016}}, color={191,0,0}));
  connect(con46.fluid, TAmb2.port) annotation (Line(points={{54,-10},{60,-10},{60,
          0},{76,0},{76,4.996e-016}}, color={191,0,0}));
  connect(con56.fluid, TAmb2.port) annotation (Line(points={{54,-30},{60,-30},{60,
          0},{76,0},{76,4.996e-016}}, color={191,0,0}));
  connect(con66.fluid, TAmb2.port) annotation (Line(points={{54,-50},{60,-50},{60,
          0},{76,0},{76,4.996e-016}}, color={191,0,0}));
  connect(alphaOut1.y, con11.Gc) annotation (Line(points={{-85.6,88},{-84,88},{-84,
          68},{-76,68}}, color={0,0,127}));
  connect(alphaOut1.y, con12.Gc) annotation (Line(points={{-85.6,88},{-85.6,88},
          {-60,88},{-60,68},{-56,68}}, color={0,0,127}));
  connect(con13.Gc, alphaOut1.y) annotation (Line(points={{-36,68},{-40,68},{-40,
          88},{-85.6,88}}, color={0,0,127}));
  connect(con14.Gc, alphaOut1.y) annotation (Line(points={{-16,68},{-22,68},{-22,
          88},{-85.6,88}}, color={0,0,127}));
  connect(con15.Gc, alphaOut1.y) annotation (Line(points={{4,68},{0,68},{0,88},{
          -85.6,88}}, color={0,0,127}));
  connect(con16_1.Gc, alphaOut1.y) annotation (Line(points={{24,68},{20,68},{20,
          88},{-85.6,88}}, color={0,0,127}));
  connect(con16_2.Gc, alphaOut2.y)
    annotation (Line(points={{48,56},{48,66},{75.6,66}}, color={0,0,127}));
  connect(con26.Gc, alphaOut2.y) annotation (Line(points={{48,36},{48,40},{66,40},
          {66,66},{75.6,66}}, color={0,0,127}));
  connect(con36.Gc, alphaOut2.y) annotation (Line(points={{48,16},{48,20},{66,20},
          {66,66},{75.6,66}}, color={0,0,127}));
  connect(con46.Gc, alphaOut2.y) annotation (Line(points={{48,-4},{48,2},{66,2},
          {66,66},{75.6,66}}, color={0,0,127}));
  connect(con56.Gc, alphaOut2.y) annotation (Line(points={{48,-24},{48,-20},{66,
          -20},{66,66},{75.6,66}}, color={0,0,127}));
  connect(con66.Gc, alphaOut2.y) annotation (Line(points={{48,-44},{48,-40},{66,
          -40},{66,66},{75.6,66}}, color={0,0,127}));
  connect(alphaIns.y, con21.Gc) annotation (Line(points={{-75.6,-40},{-60,-40},{
          -60,12},{-64,12}}, color={0,0,127}));
  connect(alphaIns.y, con22.Gc) annotation (Line(points={{-75.6,-40},{-58,-40},{
          -40,-40},{-40,12},{-44,12}}, color={0,0,127}));
  connect(alphaIns.y, con23.Gc) annotation (Line(points={{-75.6,-40},{-22,-40},{
          -22,12},{-24,12}}, color={0,0,127}));
  connect(alphaIns.y, con65.Gc) annotation (Line(points={{-75.6,-40},{-46,-40},{
          -22,-40},{-22,-60},{-8,-60},{-8,-56}}, color={0,0,127}));
  connect(alphaIns.y, con55.Gc) annotation (Line(points={{-75.6,-40},{-42,-40},{
          -8,-40},{-8,-36}}, color={0,0,127}));
  connect(alphaIns.y, con45.Gc) annotation (Line(points={{-75.6,-40},{-22,-40},{
          -22,-20},{-8,-20},{-8,-16}}, color={0,0,127}));
  connect(alphaIns.y, con35.Gc) annotation (Line(points={{-75.6,-40},{-48,-40},{
          -22,-40},{-22,0},{-8,0},{-8,4}}, color={0,0,127}));
  connect(con24.Gc, alphaIns.y) annotation (Line(points={{-4,12},{0,12},{0,12},{
          0,12},{0,0},{-22,0},{-22,-40},{-75.6,-40}}, color={0,0,127}));

  annotation(experiment(StartTime=0,StopTime=172800),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatConduction/Examples/HeatConduction2DCorner.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Text(extent={{-60,-44},{44,-112}},lineColor={0,0,255},
    textString="2D dynamic heat conduction of a corner problem")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates the 2D dynamic heat conduction of a corner problem.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end HeatConduction2DCorner;
