within BuildingSystems.Interfaces;
connector MoisturePort2D
  "Port for moisture transfer in 2 dimensions (base connector type)"
  parameter Integer nY = 1 "Number of surface elements in the y dimension";
  parameter Integer nZ = 1 "Number of surface elements in the z dimension";
  BuildingSystems.Interfaces.MoisturePort moisturePort[nY,nZ];
    annotation(defaultComponentName = "moisturePort2D",
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-100,100},{100,-100}},lineColor={120,0,120},fillColor={120,0,120},
            fillPattern = FillPattern.Solid),
    Text(extent={{-70,80},{76,-84}},lineColor={0,0,0},textString="2D")}),
    Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-50,50},{50,-50}},lineColor={120,0,120},fillColor={120,0,120},
            fillPattern = FillPattern.Solid),
    Text(extent={{-110,110},{110,50}},lineColor={0,0,255},textString="%name")}));
end MoisturePort2D;
