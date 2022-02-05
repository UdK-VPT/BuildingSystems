within BuildingSystems.Climate.Sources;
model RadiationFixed
  "Boundary condition for constant direct and diffuse solar irradiation"
  BuildingSystems.Interfaces.RadiationPort radiationPort(
    IrrDir = IrrDir_constant,
    IrrDif = IrrDif_constant,
    angleDegInc = angleDegInc_constant,
    angleDegAziSun = 0.0,
    angleDegHeightSun = 0.0)
    annotation (Placement(transformation(extent={{50,-10},{70,10}}), iconTransformation(extent={{50,-10},{70,10}})));
  parameter Modelica.Units.SI.RadiantEnergyFluenceRate IrrDir_constant=0.0
    "Constant area specific direct solar radiation";
  parameter Modelica.Units.SI.RadiantEnergyFluenceRate IrrDif_constant=0.0
    "Conatant area specific diffuse solar radiation";
  parameter Modelica.Units.NonSI.Angle_deg angleDegInc_constant=0.0
    "Constant incident angle of the direct solar radiation";
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
    Rectangle(extent={{-60,60},{60,-60}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid),
    Text(extent={{-44,-56},{48,-84}},lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString= "%name"),
    Text(extent={{-58,40},{48,-38}},lineColor={255,128,0},textString="IrrDir,Idif,angleDegInc = const")}),
Documentation(info="<html>
<p>
This model calculates a boundary condition for constant direct and diffuse solar irradiation.
</p>
</html>", revisions="<html>
<ul>
<li>
September 24, 2019 by Christoph Nytsch-Geusen:<br/>
Last modification.
</li>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end RadiationFixed;
