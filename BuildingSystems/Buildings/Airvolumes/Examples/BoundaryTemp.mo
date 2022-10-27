within BuildingSystems.Buildings.Airvolumes.Examples;
model BoundaryTemp
  "Model for thermal boundary conditions of air elements"
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPort surfaceToAirPort
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  parameter Modelica.Units.SI.Temperature T=293.15;
  parameter Modelica.Units.SI.Area A=1.0;
  parameter Modelica.Units.SI.CoefficientOfHeatTransfer alpha=1.0;
equation
  surfaceToAirPort.heatPort.Q_flow = A * alpha * (surfaceToAirPort.heatPort.T - T);
  surfaceToAirPort.moisturePort.m_flow = 0.0;

annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
  Rectangle(extent={{-40,40},{40,-40}}, lineColor={28,108,200}),
  Text(extent={{-22,32},{22,-36}},lineColor={238,46,47},textString="T")}),
  Diagram(coordinateSystem(preserveAspectRatio=false)),
Documentation(info="<html>
<p>
This model defines the thermal boundary conditions of air elements.
</p>
</html>", revisions="<html>
<ul>
<li>
February 21, 2017, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end BoundaryTemp;
