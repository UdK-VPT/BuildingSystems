within BuildingSystems.HAM.HeatAndMoistureTransport.Sources;
model MoistureFlowPrescribed "Boundary condition of a variable moisture flow"
  extends MoistureSourceGeneral(moisturePort(m_flow = - m_flow));
  input BuildingSystems.Interfaces.MassFlowRateInput m_flow
    "Variable moisture flow rate of water vapour"
    annotation (Placement(transformation(extent={{-70,-20},{-30,20}}), iconTransformation(extent={{-66,-10},{-46,10}})));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Text(extent={{-58,40},{48,-38}},lineColor={170,0,127},textString="m_flow = f(t)")}));
end MoistureFlowPrescribed;
