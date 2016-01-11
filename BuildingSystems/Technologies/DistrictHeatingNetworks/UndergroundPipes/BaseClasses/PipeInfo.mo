within BuildingSystems.Technologies.DistrictHeatingNetworks.UndergroundPipes.BaseClasses;
model PipeInfo

  parameter Modelica.SIunits.Diameter d_i "Pipe's inner diameter"
    annotation(Dialog(tab="General", group="Geometry"));
  parameter Modelica.SIunits.Diameter d_o = d_i/(0.0366*Modelica.Math.log(d_i)+0.769)
    "Pipe's outter diameter"
    annotation(Dialog(tab="General", group="Geometry"));
  parameter Modelica.SIunits.Thickness th_ins = 0.05 "Insulation's thickness"
    annotation(Dialog(tab="General", group="Geometry"));
  parameter Modelica.SIunits.Thickness th_c = 0.005 "Cover's thickness"
    annotation(Dialog(tab="General", group="Geometry"));
  parameter Modelica.SIunits.ThermalConductivity lam_ins(min=1E-4) = 0.032
    "Heat conductivity of the pipe's insulation"
    annotation(Dialog(tab="General", group="Thermal properties"));
  parameter Modelica.SIunits.ThermalConductivity lam_c(min=1E-4) = 0.43
    "Heat conductivity of the covers material"
    annotation(Dialog(tab="General", group="Thermal properties"));
protected
  parameter Modelica.SIunits.Diameter d_ins = d_o + 2*th_ins
    "Insulation's thickness";
  parameter Modelica.SIunits.Diameter d_c = d_ins + 2*th_c
    "Cover's outter diameter";
equation
  assert(d_o > d_i, " Outter's pipe diameter d_o, " + String(d_o)  +" , must be greater than pipe's inner diameter: " + String(d_i));
  annotation (Icon(graphics));
end PipeInfo;
