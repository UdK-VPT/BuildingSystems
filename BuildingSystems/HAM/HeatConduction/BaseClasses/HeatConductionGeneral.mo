within BuildingSystems.HAM.HeatConduction.BaseClasses;
partial model HeatConductionGeneral
  "General model for heat conduction of a body"
  parameter
    BuildingSystems.HAM.Data.MaterialProperties.BaseClasses.MaterialThermalGeneral
    material "Material of the body";
  parameter Modelica.SIunits.Length lengthX "Length in x dimension"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length lengthY "Length in y dimension"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Length lengthZ "Length in z dimension"
  annotation(Dialog(tab = "General", group = "Geometry"));

  annotation (Icon(graphics={Rectangle(extent={{-80,80},{80,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern=FillPattern.Solid),
    Text(extent={{8,-76},{100,-104}},lineColor={0,0,255},fillColor={230,230,230},fillPattern=FillPattern.Solid,textString="%name")}));
end HeatConductionGeneral;
