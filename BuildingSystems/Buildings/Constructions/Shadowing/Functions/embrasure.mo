within BuildingSystems.Buildings.Constructions.Shadowing.Functions;
function embrasure
  "Calculates the shadowing coefficent of an embrasure"
  extends Modelica.Icons.Function;
  input Modelica.SIunits.Length height
    "Height of the embrasure";
  input Modelica.SIunits.Length width
    "Width of the embrasure";
  input Modelica.SIunits.Length depth
    "Depth of the embrasure";
  input Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAzi
    "Azimuth angle of the embrasure: south: 0 deg, east: -90 deg, west +90 deg, north: 180 deg";
  input Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAziSun
    "Azimuth angle of the sun: south: 0 deg, east: -90 deg, west +90 deg, north: 180 deg";
  input Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegHeightSun
    "Height angle of the sun";
  output Real SC
    "Shading coefficient";
algorithm
  if angleDegHeightSun > 0.0 then
    SC := BuildingSystems.Utilities.Math.Functions.smoothLimit(
          (1.0 - depth / height * Modelica.Math.tan(Modelica.Constants.pi / 180.0 * angleDegHeightSun)
          / Modelica.Math.cos(Modelica.Constants.pi / 180.0 * (angleDegAziSun - angleDegAzi)))
          * (1.0 - depth / width * abs(Modelica.Math.tan(Modelica.Constants.pi / 180.0 * (angleDegAziSun - angleDegAzi)))),
          0.0,1.0,0.01);
  else
    SC := 0.0;
  end if;

  annotation (
Documentation(info="<html>
<p>
This is a model of an embrasure.
</p>
</html>", revisions="<html>
<ul>
<li>
October 10, 2019 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end embrasure;
