within BuildingSystems.Interfaces;
connector FlowPort
  "Port for fluid transport, small icon to be used for single FlowPort (base connector type)"
  extends Modelica.Fluid.Interfaces.FluidPort;
  annotation(defaultComponentName = "flowPort",
  Documentation(info="<HTML>
    <p>This connector is used for the fluid flow between components.
    The variables in the connector are:</p>
    <pre>
      m_flow          Mass flow rate in [kg/s].
      p               Thermodynamic pressure in [Pa].
      h_outflow       Specific thermodynamic enthalpy in [J/kg];
      Xi_outflow      Independent mixture mass fractions m_i/m close [kg/kg]
      C_outflow       Properties c_i/m []
    </pre>
    <p>According to the Modelica sign convention, a <b>positive</b> mass flow
    rate <b>m_flow</b> is considered to flow <b>into</b> a component. This
    convention has to be used whenever this connector is used in a model
    class.</p></HTML>"),
  Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
  Ellipse(extent={{-40,40},{40,-40}},lineColor={0,0,0},fillColor={0,127,255},fillPattern=FillPattern.Solid),
  Text(extent={{-150,110},{150,50}},textString="%name")}),
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
  Ellipse(extent={{-100,100},{100,-100}},lineColor={0,127,255},fillColor={0,127,255},
            fillPattern = FillPattern.Solid),
  Ellipse(extent={{-100,100},{100,-100}},lineColor={0,0,0},fillColor={0,127,255},
            fillPattern = FillPattern.Solid)}));
end FlowPort;
