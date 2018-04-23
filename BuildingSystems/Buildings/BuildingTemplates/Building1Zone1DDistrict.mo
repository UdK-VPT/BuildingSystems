within BuildingSystems.Buildings.BuildingTemplates;
model Building1Zone1DDistrict
  "Simplified 1D building model for district simulation"
  extends BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DBox(
  final height = heightSto * nSto,
  final InteriorCeilings = if nSto > 1 then true else false,
  final InteriorWalls=true,
  final AInteriorCeilings = if nSto > 1 then 2.0 * length*width * (nSto-1) else 0.0,
  final AInteriorWalls = (2.0 * integer(width/sqrt(ARoom) +0.5) * length + 2.0 * integer(length/sqrt(ARoom)+0.5) * width) * nSto);
  parameter Modelica.SIunits.Length heightSto = 3.0
    "Height of one storey";
  parameter Real nSto = 2.0
    "Number of storeys";
  parameter Modelica.SIunits.Area ARoom = 4.0 * 4.0
    "Mean floor area of a room";

  annotation(defaultComponentName="building",
Documentation(info="<html>
<p>
This is a 1 simplified 1D building model for district simulation.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Building1Zone1DDistrict;
