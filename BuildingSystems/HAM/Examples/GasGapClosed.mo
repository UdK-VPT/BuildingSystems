within BuildingSystems.HAM.Examples;
model GasGapClosed "Test problem for free convection on plate surfaces"
  extends Modelica.Icons.Example;
  BuildingSystems.HAM.GasGapClosed airGap(
    width=1,
    height=1,
    distance=0.05,
    gas=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature T2(
    T=273.15 + 20.0)
    annotation (Placement(transformation(extent={{14,-4},{6,4}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature T1
    annotation (Placement(transformation(extent={{-14,-4},{-6,4}})));
  Modelica.Blocks.Sources.Sine sine(
    offset=273.15 + 20.0,
    amplitude=20.0,
    freqHz=1/3600,
    phase=62.831853071796)
    annotation (Placement(transformation(extent={{-26,-4},{-18,4}})));
equation
  connect(airGap.heatPort_x2, T2.port) annotation (Line(
      points={{2,0},{6,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(T1.port, airGap.heatPort_x1) annotation (Line(
      points={{-6,0},{-2,0}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(sine.y, T1.T) annotation (Line(
      points={{-17.6,0},{-14.8,0}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0,StopTime=7200),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/Examples/GasGapClosed.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-40,-40},{40,20}}), graphics={Text(extent={{-34,-8},{32,-38}},lineColor={0,0,255},
    textString="Heat transfer
      by convection and heat radiation
      within a closed air gap")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
    Documentation(info="<html>
    <p> This example tests the implementation of
    <a href=\"modelica://BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateFree\">
    BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateFree</a>.
    </p>
    </html>", revisions="<html>
    <ul>
    <li>
    May 26, 2015, by Christoph Nytsch-Geusen:<br/>
    First implementation.
    </li>
    </ul>
    </html>"));
end GasGapClosed;
