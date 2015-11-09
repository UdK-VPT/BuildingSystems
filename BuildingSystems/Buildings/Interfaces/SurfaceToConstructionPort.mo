within BuildingSystems.Buildings.Interfaces;
connector SurfaceToConstructionPort
  "Port for heat and moisture transport between a surface and the adjacent construction, small icon to be used for single SurfaceToConstructionPort (complex connector type)"
  extends SurfaceToConstructionPortGeneral;
  annotation (defaultComponentName="toConstructionPort", Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
  Text(extent={{-110,110},{110,50}},lineColor={0,0,255},textString="%name",fillPattern = FillPattern.Solid,fillColor={255,185,0}),
  Polygon(points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},smooth=Smooth.None,fillColor={127,0,0},fillPattern = FillPattern.Solid, pattern=LinePattern.None,lineColor={0,0,0})}),
  Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
  Polygon(points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},smooth=Smooth.None, pattern=LinePattern.None,lineColor={0,0,0},fillPattern = FillPattern.Solid,fillColor={127,0,0})}));
end SurfaceToConstructionPort;
