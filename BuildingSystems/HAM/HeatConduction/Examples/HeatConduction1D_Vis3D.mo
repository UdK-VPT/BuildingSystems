within BuildingSystems.HAM.HeatConduction.Examples;
model HeatConduction1D_Vis3D
  "1D dynamic heat conduction of 5 bodies and an additional 3D visualisation"
  extends Modelica.Icons.Example;

  parameter Modelica.SIunits.Time updateInterval = 120.0; // update intervall for 3D visualisation
  parameter Modelica.SIunits.Temp_K minTempVis3D= 273.15+15.0;
  parameter Modelica.SIunits.Temp_K maxTempVis3D= 273.15+24.0;

  BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete concrete;

  BuildingSystems.HAM.HeatConduction.HeatConduction1D_Vis3D body1(
    T_start=293.15,lengthX=0.1,lengthY=0.1,lengthZ=0.1,material=concrete,
    xVis3D = 0.0, yVis3D = 0.0, zVis3D = 0.0,
    xAngleVis3D = 0.0, yAngleVis3D = 0.0, zAngleVis3D = 90.0,
    updateInterval = updateInterval,
    minTempVis3D=minTempVis3D, maxTempVis3D=maxTempVis3D)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D_Vis3D body2(
    T_start=293.15,lengthX=0.1,lengthY=0.1,lengthZ=0.1,material=concrete,
    xVis3D = 0.1, yVis3D = 0.0, zVis3D = 0.0,
    xAngleVis3D = 0.0, yAngleVis3D = 0.0, zAngleVis3D = 90.0,
    updateInterval = updateInterval,
    minTempVis3D=minTempVis3D, maxTempVis3D=maxTempVis3D)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D_Vis3D body3(
    T_start=293.15,lengthX=0.1,lengthY=0.1,lengthZ=0.1,material=concrete,
    xVis3D = 0.2, yVis3D = 0.0, zVis3D = 0.0,
    xAngleVis3D = 0.0, yAngleVis3D = 0.0, zAngleVis3D = 90.0,
    updateInterval = updateInterval,
    minTempVis3D=minTempVis3D, maxTempVis3D=maxTempVis3D)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D_Vis3D body4(
    T_start=293.15,lengthX=0.1,lengthY=0.1,lengthZ=0.1,material=concrete,
    xVis3D = 0.3, yVis3D = 0.0, zVis3D = 0.0,
    xAngleVis3D = 0.0, yAngleVis3D = 0.0, zAngleVis3D = 90.0,
    updateInterval = updateInterval,
    minTempVis3D=minTempVis3D, maxTempVis3D=maxTempVis3D)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D_Vis3D body5(
    T_start=293.15,lengthX=0.1,lengthY=0.1,lengthZ=0.1,material=concrete,
    xVis3D = 0.4, yVis3D = 0.0, zVis3D = 0.0,
    xAngleVis3D = 0.0, yAngleVis3D = 0.0, zAngleVis3D = 90.0,
    updateInterval = updateInterval,
    minTempVis3D=minTempVis3D, maxTempVis3D=maxTempVis3D)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TAmb1
    annotation (Placement(transformation(extent={{-68,-8},{-52,8}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TAmb2
    annotation (Placement(transformation(extent={{68,-8},{52,8}})));
  Modelica.Blocks.Sources.Sine climate1(amplitude=5.0,freqHz=1.0/86400.0,phase=6.2831853071796,offset=273.15+20.0)
    annotation (Placement(transformation(extent={{-92,-8},{-76,8}})));
  Modelica.Blocks.Sources.Sine climate2(amplitude=5.0,freqHz=1.0/86400.0,offset=273.15 + 20.0,phase=6.2831853071796)
    annotation (Placement(transformation(extent={{92,-8},{76,8}})));

equation
  connect(body1.heatPort_x2, body2.heatPort_x1) annotation (Line(
      points={{-32,0},{-28,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(body3.heatPort_x2,body4. heatPort_x1) annotation (Line(
      points={{8,0},{12,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(body2.heatPort_x2, body3.heatPort_x1) annotation (Line(
      points={{-12,0},{-8,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(body4.heatPort_x2, body5.heatPort_x1) annotation (Line(
      points={{28,0},{32,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(climate1.y,TAmb1.T) annotation (Line(
      points={{-75.2,0},{-69.6,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TAmb1.port, body1.heatPort_x1) annotation (Line(
      points={{-52,0},{-48,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TAmb2.T, climate2.y) annotation (Line(
      points={{69.6,0},{75.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(body5.heatPort_x2, TAmb2.port) annotation (Line(
      points={{48,0},{52,0}},
      color={191,0,0},
      smooth=Smooth.None));
  annotation(experiment(StartTime=0, StopTime=172800,Interval = 360),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatConduction/Examples/HeatConduction1D_Vis3D.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="1D dynamic heat conduction of 5 bodies + 3D visualisation")}),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})));
end HeatConduction1D_Vis3D;
