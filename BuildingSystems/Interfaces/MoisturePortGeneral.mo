within BuildingSystems.Interfaces;
connector MoisturePortGeneral
  "Port for moisture transfer (base connector type)"
  Modelica.Units.SI.MassFraction x(start=0.01) "Absolute moisture";
                                                // start value is necessary for numerical reasons
  flow Modelica.Units.SI.MassFlowRate m_flow "Mass flow rate water vapor";
    annotation(Documentation(info="<HTML>
    <p>This connector is used for the moisture flow between components.
    The variables in the connector are:</p>
    <pre>
       x       Absolute moisture in [kg water vapor/kg dry air].
       m_flow  Mass flow rate water vapor in [kg/s].
    </pre>
    <p>According to the Modelica sign convention, a <b>positive</b> moisture flow
    rate <b>m_flow</b> is considered to flow <b>into</b> a component. This
    convention has to be used whenever this connector is used in a model
    class.</p></HTML>"));
end MoisturePortGeneral;
