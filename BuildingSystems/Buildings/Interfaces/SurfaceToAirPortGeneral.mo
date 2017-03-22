within BuildingSystems.Buildings.Interfaces;
connector SurfaceToAirPortGeneral
  "Port for heat and moisture transport between a surface and the adjacent air (complex connector type)"
  BuildingSystems.Interfaces.HeatPort heatPort
    "Port for heat transfer";
  BuildingSystems.Interfaces.MoisturePort moisturePort
    "Port for moisture transfer";
  Modelica.SIunits.Velocity vAir
    "Air velocity";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAir
    "Direction of air motion (0 to 360 deg)";

  annotation(
Documentation(info="<html>
<p>
General connector model for heat and moisture transport between a surface and the adjacent air.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SurfaceToAirPortGeneral;
