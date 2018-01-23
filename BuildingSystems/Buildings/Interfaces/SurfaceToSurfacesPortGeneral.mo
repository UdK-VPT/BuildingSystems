within BuildingSystems.Buildings.Interfaces;
connector SurfaceToSurfacesPortGeneral
  "Port between a single surface and a group of surfaces (complex connector type)"
  BuildingSystems.Interfaces.HeatPort heatPortLw
    "Heat port for long-wave radiation exchange";
  BuildingSystems.Interfaces.HeatPort heatPortSw
    "Heat port for absorbed short-wave radiation";
  BuildingSystems.Interfaces.RadiationPort radiationPort_out
    "Radiation port for outgoing short wave radiation";
  BuildingSystems.Interfaces.RadiationPort radiationPort_in
    "Radiation port for incoming short wave radiation";
  Modelica.SIunits.Area A "Surface area";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAzi
    "Azimuth angle of the surface";
  Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegTil
    "Tilt angle of the surface";
  Modelica.SIunits.Length zMean
    "Mean vertical position of the surface";
  Modelica.SIunits.Emissivity epsilon
    "Long-wave emittance of the surface";
  BuildingSystems.Types.Absorptance abs
    "Short-wave absorptance of the surface";

  annotation (defaultComponentName="toSurfacesPort",Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
Documentation(info="<html>
<p>
General connector model between a single surface and a group of surfaces.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SurfaceToSurfacesPortGeneral;
