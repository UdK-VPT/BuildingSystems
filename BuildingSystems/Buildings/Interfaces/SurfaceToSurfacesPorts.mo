within BuildingSystems.Buildings.Interfaces;
connector SurfaceToSurfacesPorts
  "Port between a single surface and a group of surfaces, large icon to be used for vectors of SurfaceToSurfacesPorts (complex connector type)"
  extends SurfaceToSurfacesPortGeneral;
  annotation (defaultComponentName="toSurfacesPorts",Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-50,-200},{50,200}},grid={1,1},initialScale=0.2), graphics={
  Text(extent={{-75,130},{75,100}}, textString="%name"),
  Rectangle(extent={{25,-100},{-25,100}},lineColor={0,255,0}),
  Polygon(points={{0,-39},{26,-66},{0,-91},{-25,-65},{0,-39}},smooth=Smooth.None,fillColor={0,255,0},fillPattern = FillPattern.Solid,pattern=LinePattern.None),
  Polygon(points={{0,26},{26,-1},{0,-26},{-25,0},{0,26}},smooth=Smooth.None,fillColor={0,255,0},fillPattern = FillPattern.Solid,pattern=LinePattern.None),
  Polygon(points={{0,91},{26,64},{0,39},{-25,65},{0,91}}, smooth=Smooth.None,fillColor={0,255,0},fillPattern = FillPattern.Solid,pattern=LinePattern.None)}),
  Icon(coordinateSystem(preserveAspectRatio=false,extent={{-50,-200},{50,200}},grid={1,1},initialScale=0.2), graphics={
  Rectangle(extent={{50,-200},{-50,200}},lineColor={0,255,0},fillColor={255,255,255},fillPattern = FillPattern.Solid),
  Polygon(points={{0,180},{50,130},{0,80},{-50,130},{0,180}},smooth=Smooth.None,fillColor={0,255,0},fillPattern = FillPattern.Solid,pattern=LinePattern.None),
  Polygon(points={{0,50},{50,0},{0,-50},{-50,0},{0,50}},smooth=Smooth.None,fillColor={0,255,0},fillPattern = FillPattern.Solid,pattern=LinePattern.None),
  Polygon(points={{0,-80},{50,-130},{0,-180},{-50,-130},{0,-80}},smooth=Smooth.None,fillColor={0,255,0},fillPattern = FillPattern.Solid,pattern=LinePattern.None)}));
end SurfaceToSurfacesPorts;
