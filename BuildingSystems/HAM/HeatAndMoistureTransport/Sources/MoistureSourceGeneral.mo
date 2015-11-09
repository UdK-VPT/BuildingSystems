within BuildingSystems.HAM.HeatAndMoistureTransport.Sources;
partial model MoistureSourceGeneral "Partial moisture boundary condition model"
    BuildingSystems.Interfaces.MoisturePort moisturePort "Moisture port"
    annotation (Placement(transformation(extent={{50,-10},{70,10}}), iconTransformation(extent={{50,-10},{70,10}})));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-60,60},{60,-60}},lineColor={230,230,230},fillColor={230,230,230},fillPattern=  FillPattern.Solid),
    Text(extent={{-44,-56},{48,-84}},lineColor={0,0,255},fillColor={230,230,230},fillPattern=  FillPattern.Solid,textString= "%name")}));
end MoistureSourceGeneral;
