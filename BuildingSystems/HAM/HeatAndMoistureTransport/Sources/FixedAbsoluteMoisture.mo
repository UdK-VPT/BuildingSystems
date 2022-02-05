within BuildingSystems.HAM.HeatAndMoistureTransport.Sources;
model FixedAbsoluteMoisture
  "Boundary condition of a constant absolute moisture"
  extends MoistureSourceGeneral(moisturePort(x = x_constant));
  parameter Modelica.Units.SI.MassFraction x_constant=0.05
    "Constant absolute moisture";

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Text(extent={{-50,40},{44,-36}},lineColor={170,0,127},textString="x = const")}));
end FixedAbsoluteMoisture;
