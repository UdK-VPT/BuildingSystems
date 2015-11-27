within BuildingSystems.Buildings.Interfaces;
connector SurfaceToAirPortGeneral
  "Port for heat and moisture transport between a surface and the adjacent air (complex connector type)"
  parameter Integer nY
    "Number of surface elements in the y dimension";
  parameter Integer nZ
    "Number of surface elements in the z dimension";
  BuildingSystems.Interfaces.HeatPort heatPort[nY,nZ]
    "Port for heat transfer";
  BuildingSystems.Interfaces.MoisturePort moisturePort[nY,nZ]
    "Port for moisture transfer";
  Modelica.SIunits.Velocity vAir[nY,nZ]
    "Air velocity";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAir[nY,nZ]
    "Direction of air motion (0 to 360 deg)";
end SurfaceToAirPortGeneral;
