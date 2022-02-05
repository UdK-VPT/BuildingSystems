within BuildingSystems.Interfaces;
connector RadiationPortGeneral
  "Port for solar radiation transport (base connector type)"
  Modelica.Units.SI.RadiantEnergyFluenceRate IrrDir
    "Area specific direct solar radiation";
  Modelica.Units.SI.RadiantEnergyFluenceRate IrrDif
    "Area specific diffuse solar radiation";
  Modelica.Units.NonSI.Angle_deg angleDegInc
    "Incident angle of the direct solar radiation";
  Modelica.Units.NonSI.Angle_deg angleDegAziSun "Azimuth angle of the sun";
  Modelica.Units.NonSI.Angle_deg angleDegHeightSun "Height angle of the sun";
    annotation(Documentation(info="<HTML>
      <p>This connector is used for the solar radiation transport between components.
      The variables in the connector are:</p>
      <pre>
        IrrDir direct solar radiation energy fluent rate in [W/m2],
        IrrDif diffuse solar radiation energy fluent rate in [W/m2],
        angleDegInc Incident angle of the direct solar radiation [deg],
        angleDegAziSun Azimuth angle of the sun [deg],
        angleDegHeightSun Height angle of the sun [deg]
      </pre>
      <p>According to the Modelica sign convention, a <b>positive</b> mass flow
      rate <b>m_flow</b> is considered to flow <b>into</b> a component. This
      convention has to be used whenever this connector is used in a model
      class.</p></HTML>"));
end RadiationPortGeneral;
