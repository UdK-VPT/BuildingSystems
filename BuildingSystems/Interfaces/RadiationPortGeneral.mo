within BuildingSystems.Interfaces;
connector RadiationPortGeneral
  "Port for solar radiation transport (base connector type)"
  Modelica.SIunits.RadiantEnergyFluenceRate IrrDir
    "Area specific direct solar radiation";
  Modelica.SIunits.RadiantEnergyFluenceRate IrrDif
    "Area specific diffuse solar radiation";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegInc
    "Incident angle of the direct solar radiation";
    annotation(Documentation(info="<HTML>
      <p>This connector is used for the solar radiation transport between components.
      The variables in the connector are:</p>
      <pre>
        IrrDir direct solar radiation energy fluent rate in [W/m2],
        IrrDif diffuse solar radiation energy fluent rate in [W/m2],
      </pre>
      <p>According to the Modelica sign convention, a <b>positive</b> mass flow
      rate <b>m_flow</b> is considered to flow <b>into</b> a component. This
      convention has to be used whenever this connector is used in a model
      class.</p></HTML>"));
end RadiationPortGeneral;
