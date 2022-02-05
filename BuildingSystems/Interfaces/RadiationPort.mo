within BuildingSystems.Interfaces;
connector RadiationPort
  "Port for solar radiation transport, small icon to be used for single RadiationPort (base connector type)"
  extends BuildingSystems.Interfaces.RadiationPortGeneral;
  annotation(defaultComponentName = "radiationPort",
  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
  Ellipse(extent={{-100,100},{100,-100}}, fillColor={255,128,0},fillPattern=FillPattern.Solid,pattern=LinePattern.None)}),
  Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
  Text(extent={{-110,110},{110,50}},lineColor={0,0,255},textString="%name",fillPattern = FillPattern.Solid,fillColor={255,185,0}),
  Ellipse(extent={{-40,40},{40,-40}},fillColor={255,128,0},fillPattern=FillPattern.Solid,pattern=LinePattern.None)}));
end RadiationPort;
