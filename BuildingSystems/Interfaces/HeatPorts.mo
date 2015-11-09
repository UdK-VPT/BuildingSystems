within BuildingSystems.Interfaces;
connector HeatPorts
  "Port for heat transfer, large icon to be used for vectors of HeatPorts (base connector type)"
  extends Modelica.Thermal.HeatTransfer.Interfaces.HeatPort;
  annotation (defaultComponentName="heatPorts",
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
  Icon(coordinateSystem(preserveAspectRatio=false,extent={{-200,-50},{200,50}},grid={1,1},initialScale=0.2), graphics={
  Rectangle(extent={{-201,50},{200,-50}},lineColor={127,0,0},fillColor={255,255,255},
            fillPattern = FillPattern.Solid),
  Rectangle(extent={{-171,45},{-83,-45}},lineColor={127,0,0},fillColor={127,0,0},
            fillPattern = FillPattern.Solid),
  Rectangle(extent={{-45,45},{43,-45}},lineColor={127,0,0},fillColor={127,0,0},
            fillPattern = FillPattern.Solid),
  Rectangle(extent={{82,45},{170,-45}},lineColor={127,0,0},fillColor={127,0,0},
            fillPattern = FillPattern.Solid)}));
end HeatPorts;
