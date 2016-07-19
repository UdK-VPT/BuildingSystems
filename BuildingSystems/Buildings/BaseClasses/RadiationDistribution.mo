within BuildingSystems.Buildings.BaseClasses;
model RadiationDistribution
  "Model for short-wave and long-wave radiation distribution within a thermal zone"
  parameter Integer nSurfaces = 0
    "Number of surfaces of the thermal zone";
  parameter Integer nHeatSources = 0
    "Number of internal heat sources of the thermal zone"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter BuildingSystems.Types.ViewFactor F[nSurfaces,nSurfaces](
    fixed=false)
    "View factor matrix of the thermal zone"
    annotation(HideResult = true);
  parameter BuildingSystems.Types.ViewFactor ViewFac[nSurfaces,nSurfaces]=fill(fill(0.0,nSurfaces),nSurfaces)
    "Geometric view factor matrix of the thermal zone";
  parameter Boolean geometricViewFactors= false
    "true: use of geometric view factors, false: use of surface area weighted view factors"
     annotation(HideResult = true);
  Modelica.SIunits.Area ATotal
    "Total surface area of the thermal zone";
  BuildingSystems.Buildings.Interfaces.SurfaceToSurfacesPorts toSurfacePorts[nSurfaces](
    each nY=1,
    each nZ=1)
    annotation (Placement(transformation(extent={{-90,-42},{-70,38}})));
  BuildingSystems.Interfaces.HeatPorts heatSourcesPorts[nHeatSources]
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={0,58}), iconTransformation(extent={{-40,68},{40,88}})));
  Modelica.SIunits.HeatFlowRate Q_flow_Sw
    "Total short radiation gains of the thermal zone";
  BuildingSystems.Interfaces.Temp_KOutput TSurfMean
    "Mean temperatures of all surfaces"
    annotation (Placement(transformation(extent={{70,-10},{90,10}}), iconTransformation(extent={{70,-10},{90,10}})));
  protected Modelica.SIunits.HeatFlux J[nSurfaces](each start = 0.0)
    "Radiosity of each surface";
initial equation
  if not geometricViewFactors then
    for i in 1:nSurfaces loop
      for j in 1:nSurfaces loop
        F[i,j] = toSurfacePorts[j].A[1,1]/sum(toSurfacePorts[k].A[1,1] for k in 1:nSurfaces);
      end for;
    end for;
  else
    F=ViewFac;
  end if;
equation
  ATotal = sum(toSurfacePorts[:].A[1,1]);
  // Total short-wave radiation gains of the zone
  Q_flow_Sw = sum({toSurfacePorts[i].radiationPort_out[1,1].IrrDir*toSurfacePorts[i].A[1,1] + toSurfacePorts[i].radiationPort_out[1,1].IrrDif*toSurfacePorts[i].A[1,1] for i in 1:nSurfaces});
  for i in 1:nSurfaces loop
    // Radiosity of each surface
    J[i] = toSurfacePorts[i].epsilon[1,1]*Modelica.Constants.sigma*toSurfacePorts[i].heatPortLw[1,1].T^4 + (1.0-toSurfacePorts[i].epsilon[1,1])*sum({F[i,j]*J[j] for j in 1:nSurfaces});
    // Netto heat flux rate of each surface
    toSurfacePorts[i].heatPortLw[1,1].Q_flow = toSurfacePorts[i].A[1,1]*toSurfacePorts[i].epsilon[1,1]/(1.0-toSurfacePorts[i].epsilon[1,1])*(Modelica.Constants.sigma*toSurfacePorts[i].heatPortLw[1,1].T^4-J[i])
      - toSurfacePorts[i].A[1,1]/ATotal * sum(heatSourcesPorts.Q_flow);
    // Area weighted short-wave radiation distribution on each surface
    toSurfacePorts[i].heatPortSw[1,1].Q_flow = - toSurfacePorts[i].abs[1,1] * toSurfacePorts[i].A[1,1] / ATotal * Q_flow_Sw;
    toSurfacePorts[i].radiationPort_in[1,1].IrrDir= 0.0;
    toSurfacePorts[i].radiationPort_in[1,1].IrrDif = - Q_flow_Sw / ATotal;
    toSurfacePorts[i].radiationPort_in[1,1].angleDegInc = 50.0;
  end for;
  // Mean surface temperature
  TSurfMean = sum({toSurfacePorts[i].heatPortLw[1,1].T * toSurfacePorts[i].A[1,1] for i in 1:nSurfaces}) / ATotal;
  for i in 1:nHeatSources loop
    heatSourcesPorts[i].T = TSurfMean;
  end for;
  annotation (Icon(graphics={Rectangle(extent={{-80,80},{80,-80}},lineColor={255,170,85}, fillColor={255,255,0},fillPattern=FillPattern.Sphere),
    Text(extent={{8,-76},{100,-104}},lineColor={0,0,255},fillColor={85,170,255},fillPattern = FillPattern.Solid,textString="%name")}));
end RadiationDistribution;
