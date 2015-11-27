within BuildingSystems.Climate.Sources;
model RadiationFixed
  "Boundary condition of a constant direct and diffuse solar irradiation"
  BuildingSystems.Interfaces.RadiationPort radiationPort(
    IrrDir = IrrDir_constant,
    IrrDif = IrrDif_constant,
    angleDegInc = angleDegInc_constant)
    annotation (Placement(transformation(extent={{50,-10},{70,10}}), iconTransformation(extent={{50,-10},{70,10}})));
  parameter Modelica.SIunits.RadiantEnergyFluenceRate IrrDir_constant = 0.0
    "Constant area specific direct solar radiation";
  parameter Modelica.SIunits.RadiantEnergyFluenceRate IrrDif_constant = 0.0
    "Conatant area specific diffuse solar radiation";
  parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegInc_constant = 0.0
    "Constant incident angle of the direct solar radiation";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-60,60},{60,-60}},lineColor={230,230,230},fillColor={230,230,230},fillPattern=  FillPattern.Solid),
    Text(extent={{-44,-56},{48,-84}},lineColor={0,0,255},fillColor={230,230,230},fillPattern=  FillPattern.Solid,textString= "%name"),
    Text(extent={{-58,40},{48,-38}},lineColor={255,128,0},textString="IrrDir,Idif,angleDegInc = const")}));
end RadiationFixed;
