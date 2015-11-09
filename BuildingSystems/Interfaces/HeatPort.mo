within BuildingSystems.Interfaces;
connector HeatPort
  "Port for heat transfer, small icon to be used for single HeatPort (base connector type)"
  extends Modelica.Thermal.HeatTransfer.Interfaces.HeatPort;
  annotation(defaultComponentName = "heatPort",
  Documentation(info="<HTML>
    <p>This connector is used for the heat flow between components.
    The variables in the connector are:</p>
    <pre>
       T       Temperature in [K].
       Q_flow  Heat flow rate in [W].
    </pre>
    <p>According to the Modelica sign convention, a <b>positive</b> heat flow
    rate <b>Q_flow</b> is considered to flow <b>into</b> a component. This
    convention has to be used whenever this connector is used in a model
    class.</p></HTML>"),
  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
  Rectangle(extent={{-100,100},{100,-100}},lineColor={191,0,0},fillColor={191,0,0},
            fillPattern = FillPattern.Solid)}),
  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
  Rectangle(extent={{-50,50},{50,-50}},lineColor={191,0,0},fillColor={191,0,0},
            fillPattern = FillPattern.Solid),
  Text(extent={{-110,110},{110,50}},lineColor={0,0,255},textString="%name")}));
end HeatPort;
