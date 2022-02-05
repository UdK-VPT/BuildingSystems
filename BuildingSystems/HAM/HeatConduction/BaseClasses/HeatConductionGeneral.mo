within BuildingSystems.HAM.HeatConduction.BaseClasses;
partial model HeatConductionGeneral
  "General model for heat conduction of a body"

  replaceable parameter BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral material
   "Material of the body"
   annotation(Dialog(tab = "General"),Evaluate=true, choicesAllMatching=true);

  parameter Modelica.Units.SI.Length lengthX=1.0 "Length in x dimension"
    annotation (Dialog(tab="General", group="Geometry"));
  Modelica.Units.SI.Length lengthY=1.0 "Length in y dimension"
    annotation (Dialog(tab="General", group="Geometry"));
  Modelica.Units.SI.Length lengthZ=1.0 "Length in z dimension"
    annotation (Dialog(tab="General", group="Geometry"));

  annotation (Icon(graphics={Rectangle(extent={{-80,80},{80,-80}},lineColor={230,230,230},
    fillColor={230,230,230},fillPattern=FillPattern.Solid),
    Text(extent={{8,-76},{100,-104}},lineColor={0,0,255},fillColor={230,230,230},
    fillPattern=FillPattern.Solid,textString="%name")}),
Documentation(info="<html>
<p>
This partial model describes the geometry of a cuboid shaped body width
the edge length <code>dx</code>, <code>dy</code> and <code>dz</code>
</p>
</html>", revisions="<html>
<ul>
<li>
April 24, 2019 by Christoph Nytsch-Geusen:<br/>
Adaptation to flexible geometries.
</li>
<li>
May 23, 2016 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end HeatConductionGeneral;
