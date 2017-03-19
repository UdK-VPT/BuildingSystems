within BuildingSystems.Buildings.BaseClasses;
partial record OpaqueConstruction
  "Template for layered constructions"
  extends Modelica.Icons.Record;
  parameter Integer nLayers(min=1)=1
    "Number of layers of the construction";
  parameter Modelica.SIunits.Length thickness[nLayers]={0.1}
    "Thickness of each construction layer";
  final parameter Modelica.SIunits.Length thicknessTotal=sum(thickness)
    "Total thickness of the construction";

  annotation (
Documentation(info="<html>
<p>
This is partial model description for a layered opaque building construction.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end OpaqueConstruction;
