within BuildingSystems.Buildings.Surfaces;
model SurfaceToAir
  "Surface model between a construction and the air"
  extends Buildings.BaseClasses.SurfaceGeneral;
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPort toAirPort
    "Port to the air"
    annotation (Placement(transformation(extent={{-4,-50},{16,-30}}),iconTransformation(extent={{-4,-50},{16,-30}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToSurfacesPort toSurfacesPort(
    epsilon=epsilon,
    abs=abs)
    "Port to other surfaces"
    annotation (Placement(transformation(extent={{-4,30},{16,50}}), iconTransformation(extent={{-4,30},{16,50}})));
  Modelica.Units.SI.SurfaceCoefficientOfHeatTransfer alpha
    "Convective heat transfer coefficient";
  BuildingSystems.Types.MoistureTransferCoefficient beta
    "Convective moisture transfer coefficient";
  Modelica.Units.SI.Temperature T(start=293.15) "Temperature";
  Modelica.Units.SI.MassFraction x(start=0.005) "Absolute moisture";
  Modelica.Units.SI.Emissivity epsilon "Long-wave emittance";
  BuildingSystems.Types.Absorptance abs
    "Short-wave absorptance";
  parameter BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection convectionOnSurface = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.const
    "Type of convection calculation of the surface";
  parameter Modelica.Units.SI.SurfaceCoefficientOfHeatTransfer alphaConstant=
      3.0 "Convective heat transfer coefficient for simplified calculations";
equation
  toConstructionPort.abs = toSurfacesPort.abs;
  toConstructionPort.epsilon = toSurfacesPort.epsilon;
  toConstructionPort.geo.angleDegAzi = toSurfacesPort.angleDegAzi;
  toConstructionPort.geo.angleDegTil = toSurfacesPort.angleDegTil;
  toConstructionPort.geo.zMean = toSurfacesPort.zMean;
  // Energy balance on the surface
  toAirPort.heatPort.Q_flow + toSurfacesPort.heatPortSw.Q_flow + toSurfacesPort.heatPortLw.Q_flow = - toConstructionPort.heatPort.Q_flow;
  // Free convection
  if convectionOnSurface == BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free then
    alpha = BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateFree(
      toAirPort.heatPort.T - T, toConstructionPort.geo.height,
      toConstructionPort.geo.width, toConstructionPort.geo.angleDegTil);
  // Forced convection
  elseif convectionOnSurface == BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced then
    alpha = BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateForced(toAirPort.vAir);
  // Simplified calculation with constant heat transfer coefficient
  else
    alpha = alphaConstant;
  end if;
  toAirPort.heatPort.Q_flow = alpha * (toAirPort.heatPort.T - T) * ASur;
  // Moisture balance on the surface
  toAirPort.moisturePort.m_flow = - toConstructionPort.moisturePort.m_flow;
  toAirPort.moisturePort.m_flow = beta * (toAirPort.moisturePort.x - x) * BuildingSystems.Utilities.MoistAirFunctions.p(x,100000.0) * ASur;
  beta = alpha * 1.0e-9;
  //
  toSurfacesPort.heatPortSw.T = T;
  toSurfacesPort.heatPortLw.T = T;
  toSurfacesPort.A = ASur;
  toConstructionPort.heatPort.T = T;
  toConstructionPort.moisturePort.x = x;
  connect(toConstructionPort.radiationPort_out,toSurfacesPort.radiationPort_out);
  connect(toConstructionPort.radiationPort_in,toSurfacesPort.radiationPort_in);

  annotation (
Documentation(info="<html>
<p>
This is model describes the energy and moisture balance of surface between a construction and the air.
</p>
</html>", revisions="<html>
<ul>
<li>
May 23, 2015 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SurfaceToAir;
