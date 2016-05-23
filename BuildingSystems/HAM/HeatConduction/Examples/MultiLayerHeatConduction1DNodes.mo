within BuildingSystems.HAM.HeatConduction.Examples;
model MultiLayerHeatConduction1DNodes
  "1D dynamic heat conduction of 2 bodies with an inner discretisation"
  extends Modelica.Icons.Example;

  model Body2Layers
    extends BuildingSystems.HAM.HeatConduction.MultiLayerHeatConduction1DNodes(
      lengthY=1.0,
      lengthZ=1.0,
      nLayers=2,
      nNodes={5,5},
      thickness={0.1,0.1},
      material={insulation,concrete});
    BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete concrete;
    BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation insulation;
  end Body2Layers;

  parameter Integer nBodies = 2;
  Body2Layers body[nBodies]
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TAmb
    annotation (Placement(transformation(extent={{-30,-8},{-14,8}})));
  Modelica.Blocks.Sources.Sine climate(amplitude=10.0,freqHz=1/86400.0,phase=6.2831853071796,offset=293.15)
    annotation (Placement(transformation(extent={{-54,-8},{-38,8}})));
  Modelica.Blocks.Sources.Constant const(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{54,-8},{38,8}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature TConstant
    annotation (Placement(transformation(extent={{30,-8},{14,8}})));
equation
  connect(body[1].heatPort_x2, body[2].heatPort_x1);
  for i in 2:nBodies loop
    connect(body[i-1].heatPort_x2, body[i].heatPort_x1);
  end for;
  connect(climate.y, TAmb.T) annotation (Line(
      points={{-37.2,0},{-31.6,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TAmb.port, body[1].heatPort_x1) annotation (Line(
      points={{-14,0},{-8,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(body[nBodies].heatPort_x2, TConstant.port) annotation (Line(
      points={{8,0},{14,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(TConstant.T, const.y) annotation (Line(
      points={{31.6,0},{37.2,0}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=864000,Interval = 3600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatConduction/Examples/MultiLayerHeatConduction1DNodes.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="1D dynamic heat conduction of 2 bodies with an inner discretisation")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates the 1D dynamic heat conduction of 2 bodies with an inner discretisation.
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
end MultiLayerHeatConduction1DNodes;
