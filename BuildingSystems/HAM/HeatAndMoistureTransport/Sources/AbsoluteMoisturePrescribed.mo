within BuildingSystems.HAM.HeatAndMoistureTransport.Sources;
model AbsoluteMoisturePrescribed
  "Boundary condition of a variable absolute moisture"
  extends MoistureSourceGeneral(moisturePort(x = x));
  input BuildingSystems.Interfaces.Moisture_absInput x
    "Variable absolute moisture"
    annotation (Placement(transformation(extent={{-70,-20},{-30,20}}), iconTransformation(extent={{-66,-10},{-46,10}})));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Text(extent={{-46,72},{48,-4}}, lineColor={170,0,127},textString="x = f(t)")}));
end AbsoluteMoisturePrescribed;
