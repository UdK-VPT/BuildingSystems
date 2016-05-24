within BuildingSystems.HAM.HeatConduction.BaseClasses;
partial model HeatConductionGeneral
  "General model for heat conduction of a body"
  replaceable parameter BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral material
   "Material of the body"
   annotation(Dialog(tab = "General"),Evaluate=true, choicesAllMatching=true);
  parameter Modelica.SIunits.Length lengthX = 1.0
    "Length in x dimension"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length lengthY = 1.0
    "Length in y dimension"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length lengthZ = 1.0
    "Length in z dimension"
  annotation(Dialog(tab = "General", group = "Geometry"));

  annotation (Icon(graphics={Rectangle(extent={{-80,80},{80,-80}},lineColor={230,230,230},
    fillColor={230,230,230},fillPattern=FillPattern.Solid),
    Text(extent={{8,-76},{100,-104}},lineColor={0,0,255},fillColor={230,230,230},
    fillPattern=FillPattern.Solid,textString="%name")}));
end HeatConductionGeneral;
