within BuildingSystems.Interfaces;
connector MoisturePort
  "Port for moisture transfer, small icon to be used for single MoisturePort (base connector type)"
  extends BuildingSystems.Interfaces.MoisturePortGeneral;
  annotation(defaultComponentName = "moisturePort",
  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
  Rectangle(extent={{-100,100},{100,-100}},lineColor={120,0,120},fillColor={120,0,120},
            fillPattern = FillPattern.Solid)}),
  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
  Rectangle(extent={{-50,50},{50,-50}},lineColor={120,0,120},fillColor={120,0,120},
            fillPattern = FillPattern.Solid),
  Text(extent={{-110,110},{110,50}},lineColor={0,0,255},textString="%name")}));
end MoisturePort;
