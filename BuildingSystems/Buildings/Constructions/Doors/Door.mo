within BuildingSystems.Buildings.Constructions.Doors;
model Door
  "Model of a door"
  extends BuildingSystems.Buildings.BaseClasses.OpeningDiscretizedOperable(
    final wOpe = width,
    final hOpe = height,
    redeclare package Medium = BuildingSystems.Media.Air);
  extends BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes;

  annotation (defaultComponentName="door",
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
