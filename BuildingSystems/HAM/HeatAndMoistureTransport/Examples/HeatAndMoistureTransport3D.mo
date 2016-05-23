within BuildingSystems.HAM.HeatAndMoistureTransport.Examples;
model HeatAndMoistureTransport3D
  "3D combined dynamic heat conduction and moisture transport of 9 bodies"
  extends Modelica.Icons.Example;

  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport3D el21(
    T_start=293.15,
    phi_start = 0.5,
    lengthX=0.3,
    lengthY=0.1,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Vollziegel material)
    annotation (Placement(transformation(extent={{-30,-4},{-10,16}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport3D el22(
    T_start=293.15,
    phi_start = 0.5,
    lengthX=0.3,
    lengthY=0.1,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Polystyrol material)
    annotation (Placement(transformation(extent={{-10,-4},{10,16}})));
  Modelica.Blocks.Sources.Sine climate1(
    amplitude=10.0,
    freqHz=1.0/86400.0,
    offset=273.15 + 20.0,
    phase=6.2831853071796)
    annotation (Placement(transformation(extent={{-68,-10},{-56,2}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TAmb
    annotation (Placement(transformation(extent={{-50,-10},{-38,2}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TConstant
    annotation (Placement(transformation(extent={{52,-10},{40,2}})));
  Modelica.Blocks.Sources.Constant const1(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{70,-10},{58,2}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.AbsoluteMoisturePrescribed absMoistBC1
    annotation (Placement(transformation(extent={{-54,6},{-34,26}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.AbsoluteMoisturePrescribed absMoistBC2
    annotation (Placement(transformation(extent={{56,6},{36,26}})));
  Modelica.Blocks.Sources.Constant const2(
    k=0.008)
    annotation (Placement(transformation(extent={{70,10},{58,22}})));
  Modelica.Blocks.Sources.Sine climate2(
    freqHz=1.0/86400.0,
    amplitude=0.004,
    phase=6.2831853071796,
    offset=0.008)
    annotation (Placement(transformation(extent={{-68,10},{-56,22}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport3D el23(
    phi_start=0.5,
    lengthX=0.3,
    lengthY=0.1,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Vollziegel material,
    T_start=293.15)
    annotation (Placement(transformation(extent={{10,-4},{30,16}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport3D el11(
    phi_start=0.5,
    lengthX=0.3,
    lengthY=1.0,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Vollziegel material,
    T_start=293.15)
    annotation (Placement(transformation(extent={{-30,16},{-10,36}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport3D el12(
    phi_start=0.5,
    lengthX=0.3,
    lengthY=1.0,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Vollziegel material,
    T_start=293.15)
    annotation (Placement(transformation(extent={{-10,16},{10,36}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport3D el13(
    phi_start=0.5,
    lengthX=0.3,
    lengthY=1.0,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Vollziegel material,
    T_start=293.15)
    annotation (Placement(transformation(extent={{10,16},{30,36}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport3D el31(
    phi_start=0.5,
    lengthX=0.3,
    lengthY=1.0,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Vollziegel material,
    T_start=293.15)
    annotation (Placement(transformation(extent={{-30,-24},{-10,-4}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport3D el32(
    phi_start=0.5,
    lengthX=0.3,
    lengthY=1.0,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Vollziegel material,
    T_start=293.15)
    annotation (Placement(transformation(extent={{-10,-24},{10,-4}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.HeatAndMoistureTransport3D el33(
    phi_start=0.5,
    lengthX=0.3,
    lengthY=1.0,
    lengthZ=1.0,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Vollziegel material,
    T_start=293.15)
    annotation (Placement(transformation(extent={{10,-24},{30,-4}})));
equation
  connect(el21.heatPort_x2, el22.heatPort_x1) annotation (Line(
      points={{-12,6},{-8,6}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el21.moisturePort_x2, el22.moisturePort_x1) annotation (Line(
      points={{-12,8},{-8,8}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(climate1.y, TAmb.T) annotation (Line(
      points={{-55.4,-4},{-51.2,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(climate2.y, absMoistBC1.x) annotation (Line(
      points={{-55.4,16},{-49.6,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TConstant.T, const1.y) annotation (Line(
      points={{53.2,-4},{57.4,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(absMoistBC2.x, const2.y) annotation (Line(
      points={{51.6,16},{57.4,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(absMoistBC1.moisturePort, el21.moisturePort_x1)
    annotation (Line(
      points={{-38,16},{-34,16},{-34,8},{-28,8}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(TAmb.port, el21.heatPort_x1) annotation (Line(
      points={{-38,-4},{-34,-4},{-34,6},{-28,6}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el22.moisturePort_x2, el23.moisturePort_x1) annotation (Line(
      points={{8,8},{12,8}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el22.heatPort_x2, el23.heatPort_x1) annotation (Line(
      points={{8,6},{12,6}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el11.heatPort_y1, el21.heatPort_y2) annotation (Line(
      points={{-20,18},{-20,14.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el11.moisturePort_y1, el21.moisturePort_y2) annotation (Line(
      points={{-18,18},{-18,14.2}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el12.heatPort_y1, el22.heatPort_y2) annotation (Line(
      points={{0,18},{0,14.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el12.moisturePort_y1, el22.moisturePort_y2) annotation (Line(
      points={{2,18},{2,14.2}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el21.heatPort_y1, el31.heatPort_y2) annotation (Line(
      points={{-20,-2},{-20,-5.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el21.moisturePort_y1, el31.moisturePort_y2) annotation (Line(
      points={{-18,-2},{-18,-5.8}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el22.heatPort_y1, el32.heatPort_y2) annotation (Line(
      points={{0,-2},{0,-5.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el22.moisturePort_y1, el32.moisturePort_y2) annotation (Line(
      points={{2,-2},{2,-5.8}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el23.heatPort_y1, el33.heatPort_y2) annotation (Line(
      points={{20,-2},{20,-5.8}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el23.moisturePort_y1, el33.moisturePort_y2) annotation (Line(
      points={{22,-2},{22,-5.8}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el13.heatPort_y1, el23.heatPort_y2) annotation (Line(
      points={{20,18},{20,14.2}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el13.moisturePort_y1, el23.moisturePort_y2) annotation (Line(
      points={{22,18},{22,14.2}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el11.moisturePort_x2, el12.moisturePort_x1) annotation (Line(
      points={{-12,28},{-8,28}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el11.heatPort_x2, el12.heatPort_x1) annotation (Line(
      points={{-12,26},{-8,26}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el12.moisturePort_x2, el13.moisturePort_x1) annotation (Line(
      points={{8,28},{12,28}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el12.heatPort_x2, el13.heatPort_x1) annotation (Line(
      points={{8,26},{12,26}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el32.moisturePort_x2, el33.moisturePort_x1) annotation (Line(
      points={{8,-12},{12,-12}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el32.heatPort_x2, el33.heatPort_x1) annotation (Line(
      points={{8,-14},{12,-14}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el31.moisturePort_x2, el32.moisturePort_x1) annotation (Line(
      points={{-12,-12},{-8,-12}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el31.heatPort_x2, el32.heatPort_x1) annotation (Line(
      points={{-12,-14},{-8,-14}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(absMoistBC1.moisturePort, el11.moisturePort_x1) annotation (Line(
      points={{-38,16},{-34,16},{-34,28},{-28,28}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(TAmb.port, el31.heatPort_x1) annotation (Line(
      points={{-38,-4},{-34,-4},{-34,-14},{-28,-14}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(absMoistBC1.moisturePort, el31.moisturePort_x1) annotation (Line(
      points={{-38,16},{-34,16},{-34,-12},{-28,-12}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el13.moisturePort_x2, absMoistBC2.moisturePort) annotation (Line(
      points={{28,28},{34,28},{34,16},{40,16}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el23.moisturePort_x2, absMoistBC2.moisturePort) annotation (Line(
      points={{28,8},{34,8},{34,16},{40,16}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el33.moisturePort_x2, absMoistBC2.moisturePort) annotation (Line(
      points={{28,-12},{34,-12},{34,16},{40,16}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(el23.heatPort_x2, TConstant.port) annotation (Line(
      points={{28,6},{34,6},{34,-4},{40,-4}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el13.heatPort_x2, TConstant.port) annotation (Line(
      points={{28,26},{34,26},{34,-4},{40,-4}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TAmb.port, el11.heatPort_x1) annotation (Line(
      points={{-38,-4},{-34,-4},{-34,26},{-28,26}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(el33.heatPort_x2, TConstant.port) annotation (Line(
      points={{28,-14},{34,-14},{34,-4},{40,-4}},
      color={191,0,0},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0,StopTime=172800,Interval=360),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatAndMoistureTransport/Examples/HeatAndMoistureTransport3D.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}}), graphics={Text(extent={{-64,-2},{68,-62}}, lineColor={0,0,255},
    textString="3D combined dynamic heat conduction and moisture transport of 9 bodies
    (el22 is from insulation, the others from brick)")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates the 3D combined dynamic heat conduction and moisture transport of 9 bodies
(el22 is from insulation, the others elements from brick).
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
end HeatAndMoistureTransport3D;
