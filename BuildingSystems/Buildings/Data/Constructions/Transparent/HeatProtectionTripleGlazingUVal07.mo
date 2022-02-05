within BuildingSystems.Buildings.Data.Constructions.Transparent;
record HeatProtectionTripleGlazingUVal07 =
    BuildingSystems.Buildings.Data.Constructions.TransparentConstruction (
  final nPanes=3,
  thickness={0.003,0.003,0.003},
  UValGla = 0.7,
  UValFra = 0.7,
  g = 0.51,
  b0 = 0.7)
 "Heat protection triple glazing with UValGla = 0.7 W/(m2.K) and g = 0.51"
 annotation (
Documentation(info="<html>
<p>
Parameter set for a generic window with heat protection triple glazing (U-value glass = 0.7 W/(m2.K)).
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
