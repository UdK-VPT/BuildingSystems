within BuildingSystems.Buildings.Data.Constructions;
record OpaqueHygroThermalConstruction
  "Template for opaque hygro-thermal layered constructions"
  extends BuildingSystems.Buildings.BaseClasses.OpaqueConstruction;
  parameter BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialHygroThermalGeneral material[nLayers];

  annotation (
Documentation(info="<html>
<p>
This is partial model description a layerd opaque hygro-thermal building construction.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end OpaqueHygroThermalConstruction;
