within BuildingSystems.Buildings.Constructions.Windows.RadiationTransmission;
model RadiationTransmissionSimple
  "Simplified model for short-wave radiation transmission through transparent surfaces"
  BuildingSystems.Interfaces.RadiationPort radiationPort_in
    annotation (Placement(transformation(extent={{-20,-10},{0,10}}), iconTransformation(extent={{-20,-10},{0,10}})));
  BuildingSystems.Interfaces.RadiationPort radiationPort_out
    annotation (Placement(transformation(extent={{0,-10},{20,10}}), iconTransformation(extent={{0,-10},{20,10}})));
  parameter Real tauDir0 = 0.7
    "Transmittance of direct radiation for perpendicular irradiation";
  parameter Real b0 = 0.7
    "Coefficient for radiation transmision curve";
  parameter Real tauDif = 0.7
    "Transmittance of diffuse radiation";
  parameter Real fShadow = 0.0
    "Shadowing coefficient";
  parameter Real framePortion
    "Frame portion of the window";
  Real tauBeam
    "Transmittance of direct radiation";
  Modelica.Blocks.Interfaces.RealInput areaRatioUnglazed
    "Unglazed area of the transparent surface";
equation
  tauBeam = tauDir0 * BuildingSystems.Utilities.SmoothFunctions.softcut_lower((1.0 - b0 * (1.0 / BuildingSystems.Utilities.SmoothFunctions.softcut_lower(Modelica.Math.cos(Modelica.Constants.pi / 180.0 * radiationPort_in.angleDegInc),0.0,0.001) - 1.0)),0.0,0.001);
  radiationPort_out.IrrDir = radiationPort_in.IrrDir * (1.0 - fShadow) * (1.0 - framePortion) * (tauBeam* (1.0- areaRatioUnglazed) + areaRatioUnglazed);
  radiationPort_out.IrrDif = radiationPort_in.IrrDif * (1.0 - framePortion) * (tauDif * (1.0 - areaRatioUnglazed) + areaRatioUnglazed);
  radiationPort_out.angleDegInc = radiationPort_in.angleDegInc;

annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
  Rectangle(extent={{-10,80},{10,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid),
  Rectangle(extent={{6,80},{10,-80}},lineColor={170,255,255},fillColor={170,255,255},fillPattern = FillPattern.Solid),
  Rectangle(extent={{-10,80},{-6,-80}}, lineColor={170,255,255},fillColor={170,255,255},fillPattern = FillPattern.Solid),
  Text(extent={{-44,-76},{48,-104}},lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString= "%name")}),
Documentation(info="<html>
<p>
This is a simplified model for short-wave radiation transmission through transparent surfaces.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end RadiationTransmissionSimple;
