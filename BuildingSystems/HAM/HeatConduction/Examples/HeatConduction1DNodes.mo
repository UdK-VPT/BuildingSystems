within BuildingSystems.HAM.HeatConduction.Examples;
model HeatConduction1DNodes
  "1D dynamic heat conduction of 1 body with an inner discretisation"
  extends Modelica.Icons.Example;

  model Body
    extends BuildingSystems.HAM.HeatConduction.HeatConduction1DNodes(
      lengthY=1.0,
      lengthZ=1.0,
      nNodesX=5,
      lengthX=0.1,
      material= BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete());
  end Body;

  Body body
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TAmb
    annotation (Placement(transformation(extent={{-30,-8},{-14,8}})));
  Modelica.Blocks.Sources.Sine climate(
    amplitude=10.0,
    f=1/86400.0,
    phase=6.2831853071796,
    offset=293.15)
    annotation (Placement(transformation(extent={{-54,-8},{-38,8}})));
  Modelica.Blocks.Sources.Constant const(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{54,-8},{38,8}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TConstant
    annotation (Placement(transformation(extent={{30,-8},{14,8}})));

equation
  connect(climate.y, TAmb.T) annotation (Line(
      points={{-37.2,0},{-31.6,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TAmb.port, body.heatPort_x1) annotation (Line(
      points={{-14,0},{-8,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(body.heatPort_x2, TConstant.port) annotation (Line(
      points={{8,0},{14,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TConstant.T, const.y) annotation (Line(
      points={{31.6,0},{37.2,0}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=864000,Interval = 3600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatConduction/Examples/HeatConduction1DNodes.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="1D dynamic heat conduction of 1 body with an inner discretisation")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates the 1D dynamic heat conduction a body with an inner discretisation.
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
end HeatConduction1DNodes;
