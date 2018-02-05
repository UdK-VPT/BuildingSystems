within BuildingSystems.Buildings.Airvolumes.Examples;
model BCT
  "Model for thermal boundary conditions of air elements"
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPort surfaceToAirPort
    annotation (Placement(transformation(extent={{30,-10},{50,10}})));
  parameter Modelica.SIunits.Temp_K T = 293.15;
  parameter Modelica.SIunits.MassFraction x = 0.005;
  parameter Modelica.SIunits.Area A = 1.0;
  parameter Modelica.SIunits.CoefficientOfHeatTransfer alpha = 1.0;
equation
  surfaceToAirPort.heatPort.Q_flow = A * alpha * (surfaceToAirPort.heatPort.T - T);
  surfaceToAirPort.moisturePort.m_flow = A * alpha * (surfaceToAirPort.moisturePort.x - x);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
    Rectangle(extent={{-40,40},{40,-40}}, lineColor={28,108,200})}),
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
end BCT;
