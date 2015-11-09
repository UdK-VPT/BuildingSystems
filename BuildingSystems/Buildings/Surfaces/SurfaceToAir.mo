within BuildingSystems.Buildings.Surfaces;
model SurfaceToAir "Surface model between a construction and the air"
  extends Buildings.BaseClasses.SurfaceGeneral;
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPort toAirPort(
    nY=nY,
    nZ=nZ) "Port to the air"
    annotation (Placement(transformation(extent={{-4,-50},{16,-30}}),iconTransformation(extent={{-4,-50},{16,-30}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToSurfacesPort toSurfacesPort(
    nY=nY,
    nZ=nZ,
    epsilon=epsilon,
    abs=abs) "Port to other surfaces"
    annotation (Placement(transformation(extent={{-4,30},{16,50}}), iconTransformation(extent={{-4,30},{16,50}})));
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alpha[nY,nZ]
    "Convective heat transfer coefficient";
  BuildingSystems.Types.MoistureTransferCoefficient beta[nY,nZ]
    "Convective moisture transfer coefficient";
  Modelica.SIunits.Temp_K T[nY,nZ](
    each start=293.15)
    "Temperature";
  Modelica.SIunits.MassFraction x[nY,nZ](
    each start = 0.005)
    "Absolute moisture";
  Modelica.SIunits.Emissivity epsilon[nY,nZ]
    "Long-wave emittance";
  BuildingSystems.Types.Absorptance abs[nY,nZ]
    "Short-wave absorptance";
  parameter BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection convectionOnSurface = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.const
    "Type of convection calculation of the surface";
  parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaConstant = 3.0
    "Convective heat transfer coefficient for simplified calculations";
equation
  toConstructionPort.abs = toSurfacesPort.abs;
  toConstructionPort.epsilon = toSurfacesPort.epsilon;
  toConstructionPort.geo.angleDegAzi = toSurfacesPort.angleDegAzi;
  toConstructionPort.geo.angleDegTil = toSurfacesPort.angleDegTil;
  toConstructionPort.geo.zMean = toSurfacesPort.zMean;
  for j in 1:nY loop
    for k in 1:nZ loop
      toAirPort.heatPort[j,k].Q_flow + toSurfacesPort.heatPortSw[j,k].Q_flow + toSurfacesPort.heatPortLw[j,k].Q_flow = - toConstructionPort.heatPort[j,k].Q_flow;
      // Free convection
      if convectionOnSurface == BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free then
        alpha[j,k] = BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateFree(
          toAirPort.heatPort[j, k].T - T[j, k],
          toConstructionPort.geo.height,
          toConstructionPort.geo.width,
          toConstructionPort.geo.angleDegTil);
      // Forced convection
      elseif convectionOnSurface == BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced then
        alpha[j,k] = BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateForced(toAirPort.vAir[j,k]);
      // Simplified calculation with constant heat transfer coefficient
      else
        alpha[j,k] = alphaConstant;
      end if;
      beta[j,k] = alpha[j,k] * 1.0e-9;
      toAirPort.heatPort[j,k].Q_flow = alpha[j,k] * (toAirPort.heatPort[j,k].T - T[j,k]) * A[j,k];
      toAirPort.moisturePort[j,k].m_flow = - toConstructionPort.moisturePort[j,k].m_flow;
      toAirPort.moisturePort[j,k].m_flow = beta[j,k] * (toAirPort.moisturePort[j,k].x - x[j,k]) * BuildingSystems.Utilities.MoistAirFunctions.p(x[j,k],100000.0) * A[j,k];
      toSurfacesPort.heatPortSw[j,k].T = T[j,k];
      toSurfacesPort.heatPortLw[j,k].T = T[j,k];
      toConstructionPort.heatPort[j,k].T = T[j,k];
      toConstructionPort.moisturePort[j,k].x = x[j,k];
      toSurfacesPort.A[j,k] = A[j,k];
      connect(toConstructionPort.radiationPort_out,toSurfacesPort.radiationPort_out);
      connect(toConstructionPort.radiationPort_in,toSurfacesPort.radiationPort_in);
    end for;
  end for;
end SurfaceToAir;
