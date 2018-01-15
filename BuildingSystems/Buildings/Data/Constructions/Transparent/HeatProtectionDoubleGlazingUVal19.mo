within BuildingSystems.Buildings.Data.Constructions.Transparent;
record HeatProtectionDoubleGlazingUVal19 = BuildingSystems.Buildings.Data.Constructions.TransparentConstruction(
  final nPanes=2,
  thickness={0.003,0.003},
  UValGla = 1.9,
  UValFra = 2.0,
  g = 0.7,
  b0 = 0.7)
 "Heat protection double glazing with UValGla = 1.9 W/(m2.K) and g = 0.7"

 annotation (
Documentation(info="<html>
<p>
Parameter set for a generic window with heat protection double glazing (U-value glass = 1.9 W/(m2.K)).
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
