within BuildingSystems.Buildings.Data.Constructions;
record TransparentConstruction
  "Template for transparent constructions"
  extends Modelica.Icons.Record;
  parameter Integer nPanes(min=1)=1
    "Number of panes of the construction";
  parameter Modelica.SIunits.Length thickness[nPanes]={0.003}
    "Thickness of each pane";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UValGla
    "U-value of the glass construction";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer UValFra
    "U-value of the frame";
  parameter Real g(unit = "1")
    "g-value of of the transparent construction";

  annotation (
Documentation(info="<html>
<p>
This is template model holds the parameters of a transparent building construction.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end TransparentConstruction;
