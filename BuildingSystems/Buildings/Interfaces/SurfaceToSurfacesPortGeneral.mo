within BuildingSystems.Buildings.Interfaces;
connector SurfaceToSurfacesPortGeneral
  "Port between a single surface and a group of surfaces (complex connector type)"
  parameter Integer nY
    "Number of surface elements in the y dimension";
  parameter Integer nZ
    "Number of surface elements in the z dimension";
  BuildingSystems.Interfaces.HeatPort heatPortLw[nY,nZ]
    "Heat port for long-wave radiation exchange";
  BuildingSystems.Interfaces.HeatPort heatPortSw[nY,nZ]
    "Heat port for absorbed short-wave radiation";
  BuildingSystems.Interfaces.RadiationPort radiationPort_out[nY,nZ]
    "Radiation port for outgoing short wave radiation";
  BuildingSystems.Interfaces.RadiationPort radiationPort_in[nY,nZ]
    "Radiation port for incoming short wave radiation";
  Modelica.SIunits.Area A[nY,nZ] "Surface area";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAzi "Azimuth angle of the surface";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegTil "Tilt angle of the surface";
  Modelica.SIunits.Length zMean "Mean vertical position of the surface";
  Modelica.SIunits.Emissivity epsilon[nY,nZ]
    "Long-wave emittance of the surface";
  BuildingSystems.Types.Absorptance abs[nY,nZ]
    "Short-wave absorptance of the surface";
end SurfaceToSurfacesPortGeneral;
