within BuildingSystems.Buildings.Comfort;
model ThermalComfortConnector
  "Model for dynamically connecting comfort input variables with a Thermal Comfort model."
  Modelica.Blocks.Interfaces.RealInput clo_in(min = 0.0, max = 2.0)
    "Clothing input";
    annotation(HideResult = false, Dialog(tab="Advanced",group="Thermal comfort"));
  Modelica.Blocks.Interfaces.RealInput met_in(min = 0.7, max = 7.0)
    "Metabolism rate input";
    annotation(HideResult = false, Dialog(tab="Advanced",group="Thermal comfort"));
  Modelica.Blocks.Interfaces.RealInput wme_in(min = 0.0, max = 10.0)
    "External work input";
    annotation(HideResult = false, Dialog(tab="Advanced",group="Thermal comfort"));
  Modelica.Blocks.Interfaces.RealInput vAir_in(min = 0.0, max = 1.0)
    "Mean relative air velocity in the area of the user presence input";
    annotation(HideResult = false, Dialog(tab="Advanced",group="Thermal comfort"));
  Modelica.Blocks.Interfaces.RealOutput clo_out
    "Clothing output";
    annotation(HideResult = false, Dialog(tab="Advanced",group="Thermal comfort"));
  Modelica.Blocks.Interfaces.RealOutput met_out
    "Metabolism rate output";
    annotation(HideResult = false, Dialog(tab="Advanced",group="Thermal comfort"));
  Modelica.Blocks.Interfaces.RealOutput wme_out
    "External work output";
    annotation(HideResult = false, Dialog(tab="Advanced",group="Thermal comfort"));
  Modelica.Blocks.Interfaces.RealOutput vAir_out
    "Mean relative air velocity in the area of the user presence output";
    annotation(HideResult = false, Dialog(tab="Advanced",group="Thermal comfort"));

equation
  clo_out = clo_in;
  met_out = met_in;
  wme_out = wme_in;
  vAir_out = vAir_in;

annotation (Documentation(info="<html>
<p> This connector is used for to dynamically connect thermal comfort variables.
</p>
</html>", revisions="<html>
<ul>
<li>
November 7, 2023 by Philippe Pinçon:<br/>
First implementation.
</li>
</ul>
</html>"));
end ThermalComfortConnector;