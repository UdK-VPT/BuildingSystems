within BuildingSystems.HAM.HeatAndMoistureTransport.Examples;
model HeatAndMoistureTransport1DNodes
  "1D combined dynamic heat conduction and moisture transport of a body"
  extends Modelica.Icons.Example;

  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport1DNodes body(
    nNodesX=10,
    phi_start=0.5,
    lengthX=0.3,
    lengthY=1.0,
    lengthZ=1.0,
    material=BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton(),
    T_start=293.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine climate1(
    amplitude=10.0,
    freqHz=1.0/86400.0,
    offset=273.15 + 20.0,
    phase=6.2831853071796)
    annotation (Placement(transformation(extent={{-58,-16},{-46,-4}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TAmb
    annotation (Placement(transformation(extent={{-40,-16},{-28,-4}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TConstant
    annotation (Placement(transformation(extent={{40,-16},{28,-4}})));
  Modelica.Blocks.Sources.Constant const1(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{58,-16},{46,-4}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.AbsoluteMoisturePrescribed absMoistBC1
    annotation (Placement(transformation(extent={{-44,0},{-24,20}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.AbsoluteMoisturePrescribed absMoistBC2
    annotation (Placement(transformation(extent={{44,0},{24,20}})));
  Modelica.Blocks.Sources.Constant const2(k=0.008)
    annotation (Placement(transformation(extent={{58,4},{46,16}})));
  Modelica.Blocks.Sources.Sine climate2(
    freqHz=1.0/86400.0,
    amplitude=0.004,
    phase=6.2831853071796,
    offset=0.008)
    annotation (Placement(transformation(extent={{-58,4},{-46,16}})));
equation
  connect(climate1.y, TAmb.T) annotation (Line(
      points={{-45.4,-10},{-41.2,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(climate2.y, absMoistBC1.x) annotation (Line(
      points={{-45.4,10},{-39.6,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TConstant.T, const1.y) annotation (Line(
      points={{41.2,-10},{45.4,-10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(absMoistBC2.x, const2.y) annotation (Line(
      points={{39.6,10},{45.4,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(absMoistBC1.moisturePort, body.moisturePort_x1) annotation (Line(
      points={{-28,10},{-24,10},{-24,2},{-8,2}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(TAmb.port, body.heatPort_x1) annotation (Line(
      points={{-28,-10},{-24,-10},{-24,0},{-8,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(body.moisturePort_x2, absMoistBC2.moisturePort) annotation (Line(
      points={{8,2},{18,2},{18,10},{28,10}},
      color={120,0,120}));
  connect(body.heatPort_x2, TConstant.port) annotation (Line
      (points={{8,0},{18,0},
      {18,-10},{28,-10}},
      color={191,0,0}));

  annotation(experiment(StartTime=0,StopTime=172800,Interval=360),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatAndMoistureTransport/Examples/HeatAndMoistureTransport1DNodes.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}}),
    graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="1D combined dynamic heat conduction and moisture transport in a body")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})));
end HeatAndMoistureTransport1DNodes;
