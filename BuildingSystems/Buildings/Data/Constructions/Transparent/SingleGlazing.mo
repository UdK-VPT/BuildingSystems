within BuildingSystems.Buildings.Data.Constructions.Transparent;
record SingleGlazing =
    BuildingSystems.Buildings.Data.Constructions.TransparentConstruction (
  final nPanes=1,
  thickness={0.003},
  UValGla = 5.8,
  UValFra = 2.8,
  g = 0.92,
  b0 = 0.7)
 "Single glazing with UValGla = 5.8 W/(m2.K) and g = 0.92"
 annotation (
Documentation(info="<html>
<p>
Parameter set for a generic window with single glazing (U-value glass = 5.8 W/(m2.K)).
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
