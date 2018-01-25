within BuildingSystems.Buildings.Interfaces;
connector SurfaceToConstructionPorts
  "Port for heat and moisture transport between a surface and the adjacent construction, large icon to be used for vectors of SurfaceToConstructionPorts (complex connector type)"
  extends SurfaceToConstructionPortGeneral;
  annotation (defaultComponentName="toConstructionPorts", Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-50,-50},
            {50,50}},                                                                                                                     grid={1,1},initialScale=0.2), graphics={
  Text(extent={{-75,130},{75,100}}, textString="%name"),
  Rectangle(extent={{50,-50},{-50,50}},  lineColor={127,0,0}),
  Polygon(points={{-25,0},{0,-25},{-25,-50},{-50,-25},{-25,0}},
                                                              smooth=Smooth.None,fillColor={127,0,0},
            fillPattern =                                                                                          FillPattern.Solid,pattern=LinePattern.None),
  Polygon(points={{-25,50},{0,25},{-25,0},{-50,25},{-25,50}},
                                                         smooth=Smooth.None,fillColor={127,0,0},
            fillPattern =                                                                                     FillPattern.Solid,pattern=LinePattern.None),
  Polygon(points={{25,0},{50,-25},{25,-50},{0,-25},{25,0}},
                                                          smooth=Smooth.None,fillColor={127,0,0},
            fillPattern =                                                                                      FillPattern.Solid,pattern=LinePattern.None),
  Polygon(points={{25,50},{50,25},{25,0},{0,25},{25,50}},smooth=Smooth.None,fillColor={127,0,0},
            fillPattern =                                                                                     FillPattern.Solid,pattern=LinePattern.None)}),
  Icon(coordinateSystem(preserveAspectRatio=false,extent={{-50,-50},{50,50}},  grid={1,1},initialScale=0.2), graphics={
  Rectangle(extent={{50,-50},{-50,50}},  lineColor={127,0,0}),
  Polygon(points={{-25,0},{0,-25},{-25,-50},{-50,-25},{-25,0}},
                                                              smooth=Smooth.None,fillColor={127,0,0},
            fillPattern =                                                                                          FillPattern.Solid,pattern=LinePattern.None),
  Polygon(points={{-25,50},{0,25},{-25,0},{-50,25},{-25,50}},
                                                         smooth=Smooth.None,fillColor={127,0,0},
            fillPattern =                                                                                     FillPattern.Solid,pattern=LinePattern.None),
  Polygon(points={{25,0},{50,-25},{25,-50},{0,-25},{25,0}},
                                                          smooth=Smooth.None,fillColor={127,0,0},
            fillPattern =                                                                                      FillPattern.Solid,pattern=LinePattern.None),
  Polygon(points={{25,50},{50,25},{25,0},{0,25},{25,50}},smooth=Smooth.None,fillColor={127,0,0},
            fillPattern =                                                                                     FillPattern.Solid,pattern=LinePattern.None)}),
Documentation(info="<html>
<p>
Connector model for heat and moisture transport between a surface and the adjacent construction.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SurfaceToConstructionPorts;
