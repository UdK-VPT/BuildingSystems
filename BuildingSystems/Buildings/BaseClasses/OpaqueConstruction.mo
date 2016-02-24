within BuildingSystems.Buildings.BaseClasses;
record OpaqueConstruction
  "Template for layered constructions"
  extends Modelica.Icons.Record;
  parameter Integer nLayers(min=1)=1
    "Number of layers of the construction";
  parameter Modelica.SIunits.Length thickness[nLayers]={0.1}
    "Thickness of each construction layer";
  final parameter Modelica.SIunits.Length thicknessTotal=sum(thickness)
    "Total thickness of the construction";
end OpaqueConstruction;
