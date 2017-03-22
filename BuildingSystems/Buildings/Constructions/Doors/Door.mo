within BuildingSystems.Buildings.Constructions.Doors;
model Door
  "Model of a door"
  extends BuildingSystems.Buildings.BaseClasses.OpeningDiscretizedOperable(
    final wOpe = width,
    final hOpe = height,
    redeclare package Medium = BuildingSystems.Media.Air);
  extends BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes
    annotation(IconMap(primitivesVisible=false),DiagramMap(primitivesVisible=true));

  annotation (defaultComponentName="door",Icon(graphics={
    Rectangle(
      extent={{-20,80},{20,62}},
      fillColor={135,135,135},
      fillPattern=FillPattern.Solid,
      pattern=LinePattern.None),
    Rectangle(
      extent={{-20,-62},{20,-80}},
      fillColor={135,135,135},
      fillPattern=FillPattern.Solid,
      pattern=LinePattern.None),
    Rectangle(
      extent={{-6,62},{6,-62}},
      pattern=LinePattern.None,
      fillColor={135,135,135},
      fillPattern=FillPattern.Solid)}),
Documentation(info="<html>
<p>
This is a model of an openable door.
</p>
</html>", revisions="<html>
<ul>
<li>
March 21, 2017 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Door;
