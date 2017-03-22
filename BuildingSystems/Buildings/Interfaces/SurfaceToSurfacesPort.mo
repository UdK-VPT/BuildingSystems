within BuildingSystems.Buildings.Interfaces;
connector SurfaceToSurfacesPort
  "Port between a single surface and a group of surfaces, small icon to be used for single SurfaceToSurfacesPort (complex connector type)"
  extends SurfaceToSurfacesPortGeneral;
  annotation (defaultComponentName="toSurfacesPort",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Text(extent={{-110,110},{110,50}},lineColor={0,0,255},textString="%name",fillPattern = FillPattern.Solid,fillColor={255,185,0}),
    Polygon(points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},smooth=Smooth.None,fillColor={0,255,0},fillPattern = FillPattern.Solid,pattern=LinePattern.None)}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
    Polygon(points={{0,100},{100,0},{0,-100},{-100,0},{0,100}},smooth=Smooth.None,fillColor={0,255,0},fillPattern = FillPattern.Solid,pattern=LinePattern.None)}),
Documentation(info="<html>
<p>
Connector model between a single surface and a group of surfaces.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SurfaceToSurfacesPort;
