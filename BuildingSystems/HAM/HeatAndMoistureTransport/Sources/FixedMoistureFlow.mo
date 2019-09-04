within BuildingSystems.HAM.HeatAndMoistureTransport.Sources;
model FixedMoistureFlow "Boundary condition of a constant moisture flow"
  extends MoistureSourceGeneral(moisturePort(m_flow = - m_flow_constant));
  parameter Modelica.SIunits.MassFlowRate m_flow_constant = 0.0
    "Constant moisture flow rate of water vapour";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Text(extent={{-58,40},{48,-38}},lineColor={170,0,127},textString="m_flow = const")}));
end FixedMoistureFlow;
