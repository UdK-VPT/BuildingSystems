within BuildingSystems.HAM.HeatConduction.Examples;
model HeatConduction1D "1D dynamic heat conduction of 5 bodies"
  extends Modelica.Icons.Example;

  BuildingSystems.HAM.HeatConduction.HeatConduction1D body1(
    T_start=293.15,
    lengthX=0.1,
    lengthY=0.1,
    lengthZ=0.1,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete material)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D body2(
    T_start=293.15,
    lengthX=0.1,
    lengthY=0.1,
    lengthZ=0.1,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete material)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D body3(
    T_start=293.15,
    lengthX=0.1,
    lengthY=0.1,
    lengthZ=0.1,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete material)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D body4(
    T_start=293.15,
    lengthX=0.1,
    lengthY=0.1,
    lengthZ=0.1,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete material)
    annotation (Placement(transformation(extent={{10,-10},{30,10}})));
  BuildingSystems.HAM.HeatConduction.HeatConduction1D body5(
    T_start=293.15,
    lengthX=0.1,
    lengthY=0.1,
    lengthZ=0.1,
    redeclare BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete material)
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TAmb
    annotation (Placement(transformation(extent={{-68,-8},{-52,8}})));
  Modelica.Blocks.Sources.Sine climate(
    amplitude=10.0,freqHz=1.0/86400.0,
    phase=6.2831853071796,
    offset=273.15+20.0)
    annotation (Placement(transformation(extent={{-92,-8},{-76,8}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TConstant
    annotation (Placement(transformation(extent={{68,-8},{52,8}})));
  Modelica.Blocks.Sources.Constant const(
    k=273.15 + 20.0)
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
  connect(climate.y,TAmb. T) annotation (Line(
      points={{-75.2,0},{-69.6,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TAmb.port, body1.heatPort_x1) annotation (Line(
      points={{-52,0},{-48,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TConstant.T, const.y) annotation (Line(
      points={{69.6,0},{75.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(body5.heatPort_x2, TConstant.port) annotation (Line(
      points={{48,0},{52,0}},
      color={191,0,0},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0,StopTime=172800),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatConduction/Examples/HeatConduction1D.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="1D dynamic heat conduction of 5 bodies")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates the 1D dynamic heat conduction of 5 bodies.
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
end HeatConduction1D;
