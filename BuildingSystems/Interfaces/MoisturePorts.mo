within BuildingSystems.Interfaces;
connector MoisturePorts
  "Port for moisture transfer, large icon to be used for vectors of MoisturePorts (base connector type)"
  extends BuildingSystems.Interfaces.MoisturePortGeneral;
  annotation (defaultComponentName="moisturePorts",Icon(coordinateSystem(preserveAspectRatio=false,extent={{-200,-50},{200,50}},grid={1,1},initialScale=0.2), graphics={
  Rectangle(extent={{-201,50},{200,-50}},lineColor={0,0,255},fillColor={255,255,255},
            fillPattern = FillPattern.Solid),
  Rectangle(extent={{-171,45},{-83,-45}},lineColor={0,0,255},fillColor={120,0,120},
            fillPattern = FillPattern.Solid),
  Rectangle(extent={{-45,45},{43,-45}},lineColor={0,0,255},fillColor={120,0,120},
            fillPattern = FillPattern.Solid),
  Rectangle(extent={{82,45},{170,-45}},lineColor={0,0,255},fillColor={120,0,120},
            fillPattern =  FillPattern.Solid)}));
end MoisturePorts;
