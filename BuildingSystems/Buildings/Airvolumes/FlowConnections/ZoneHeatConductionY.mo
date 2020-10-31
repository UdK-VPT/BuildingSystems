within BuildingSystems.Buildings.Airvolumes.FlowConnections;
model ZoneHeatConductionY
  "Heat conduction connecting element between two FV elements."
  // Ports
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidHeatExt port_1
    annotation (Placement(transformation(extent={{-34,-8},{-14,12}}),
      iconTransformation(extent={{-48,-4},{-40,4}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidHeatExt port_2
    annotation (Placement(transformation(extent={{12,-8},{32,12}}),
      iconTransformation(extent={{40,-4},{48,4}})));
equation
  // Q_flow = lambda*A/l*(T2-T1);
  port_2.Q_flow = 0.0262 *((0.5 *(port_1.dim[1] + port_2.dim[1]))
    * (0.5 *(port_1.dim[3] + port_2.dim[3])))/(abs(port_2.pos[2] - port_1.pos[2]))
    * (port_2.T - port_1.T);
  port_1.Q_flow + port_2.Q_flow = 0.0;

  annotation (Icon(graphics={
    Ellipse(extent={{-48,48},{48,-46}},lineThickness=1,fillColor={213,255,170},fillPattern=FillPattern.Solid,pattern=LinePattern.None),
    Line(points={{0,-46},{0,0},{0,46}},thickness=1,arrow={Arrow.Filled,Arrow.Filled},color={0,140,72})}),
Documentation(info=""));
end ZoneHeatConductionY;
