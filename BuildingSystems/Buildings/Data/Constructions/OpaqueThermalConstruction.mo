within BuildingSystems.Buildings.Data.Constructions;
record OpaqueThermalConstruction
  "Template for opaque thermal layered constructions"
  extends BuildingSystems.Buildings.BaseClasses.OpaqueConstruction;
  parameter BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral material[nLayers];

  annotation (
Documentation(info="<html>
<p>
This template model holds the parameters of a layerd opaque thermal building construction.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end OpaqueThermalConstruction;
