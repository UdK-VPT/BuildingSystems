within BuildingSystems.Buildings.BaseClasses;
partial model ZoneTemplateGeneral
  "Common template model for a thermal zone"

  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
    "Medium in the air model of the zone"
    annotation (choicesAllMatching = true);

  function indexM
    "Mapping function from 2-dimensional surfaces to 1-dimensional array"
    input Integer I;
    input Integer J;
    input Integer K;
    input Integer gridSurface[:,2];
    output Integer m = 0;
  algorithm
    for i in 1:I-1 loop
      m := m + gridSurface[i,1]*gridSurface[i,2];
    end for;
    m := m + (J-1)*gridSurface[I,2]+K;
  end indexM;

  function numberOfGridSurfaces
    "Counting function for all 2-dimensional surfaces of the thermal zone"
    input Integer gridSurface[:,2];
    output Integer val;
  algorithm
    val := 0;
    for i in 1:size(gridSurface,1) loop
      for j in 1:gridSurface[i,1] loop
        for k in 1:gridSurface[i,2] loop
          val := val + 1;
        end for;
      end for;
    end for;
  end numberOfGridSurfaces;

  parameter Modelica.SIunits.Volume V = 1.0
    "Air volume of the zone"
    annotation(Dialog(tab="General",group="Zone geometry"));
  parameter Modelica.SIunits.Length height = 1.0
    "Vertical height of the zone"
    annotation(Dialog(tab="General",group="Zone geometry"));
  parameter BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection convectionOnSurfaces = BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.const
    "Type of convection calculation of the zone surfaces"
    annotation(Dialog(tab="Advanced",group="Convection model on building facades"));
  parameter Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaConstant = 1.0
    "Convective heat transfer coefficient for simplified calculations"
    annotation(Dialog(tab="Advanced",group="Convection model on building facades"));
  parameter Integer nMoistureSources = 0
    "Number of internal moisture sources of the thermal zone"
    annotation(Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer gridSurface1[nConstructions1,2]=fill({1,1},nConstructions1)
    "Grid in y and z dimension of each surface with orientation 1"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter Integer gridSurface2[nConstructions2,2]=fill({1,1},nConstructions2)
    "Grid in y and z dimension of each surface with orientation 2"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter Integer gridSurface3[nConstructions3,2]=fill({1,1},nConstructions3)
    "Grid in y and z dimension of each surface with orientation 3"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter Integer gridSurface4[nConstructions4,2]=fill({1,1},nConstructions4)
    "Grid in y and z dimension of each surface with orientation 4"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter Integer gridSurface5[nConstructions5,2]=fill({1,1},nConstructions5)
    "Grid in y and z dimension of each surface with orientation 5"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter Integer gridSurface6[nConstructions6,2]=fill({1,1},nConstructions6)
    "Grid in y and z dimension of each surface with orientation 6"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter Integer nConstructions1 = 0
    "Number of constructions with orientation 1"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions2 = 0
    "Number of constructions with orientation 2"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions3 = 0
    "Number of constructions with orientation 3"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions4 = 0
    "Number of constructions with orientation 4"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions5 = 0
    "Number of constructions with orientation 5"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nConstructions6 = 0
    "Number of constructions orientation 6"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes1 = 0
   "Number of air pathes with orientation 1"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes2 = 0
   "Number of air pathes with orientation 2"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes3 = 0
   "Number of air pathes with orientation 3"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes4 = 0
   "Number of air pathes with orientation 4"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes5 = 0
   "Number of air pathes with orientation 5"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Integer nAirpathes6 = 0
   "Number of air pathes with orientation 6"
    annotation(HideResult = true, Evaluate=true, Dialog(connectorSizing=true, tab="General",group="Ports"));
  parameter Boolean prescribedAirchange = true
    "True: zone air change rate is prescribed by zone ambient; false: air path calculation"
    annotation(HideResult = true, Dialog(tab="General",group="Air change"));
  parameter Boolean geometricViewFactors = false
    "true: use of geometric view factors, false: use of surface area weighted view factors"
    annotation(HideResult = true, Dialog(tab="Advanced",group="View Factors"));
  parameter BuildingSystems.Types.ViewFactor ViewFac[nGridSurfaces,nGridSurfaces]=fill(fill(0.0,nGridSurfaces),nGridSurfaces)
    "Geometric view factor matrix of the thermal zone"
    annotation(HideResult = true,Dialog(tab="Advanced",group="View Factors"));
  BuildingSystems.Buildings.BaseClasses.RadiationDistribution radiationDistribution(
    nSurfaces=nGridSurfaces,
    nHeatSources=nHeatSourcesTotal,
    geometricViewFactors=geometricViewFactors,
    ViewFac=ViewFac)
    "Long-wave and short-wave radiation calculation of the zone"
    annotation (Placement(transformation(extent={{-24,-44},{24,4}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts1[nConstructions1](
    nY=gridSurface1[:,1],
    nZ=gridSurface1[:,2],
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 1"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=180,origin={-94,40}), iconTransformation(extent={{-120,0},{-100,80}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts3[nConstructions3]
    (nY=gridSurface3[:,1],
    nZ=gridSurface3[:,2],
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 2"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=180,origin={94,-40}), iconTransformation(extent={{100,-80},{120,0}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts2[nConstructions2](
    nY=gridSurface2[:,1],
    nZ=gridSurface2[:,2],
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 3"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=90,origin={40,94}), iconTransformation(extent={{-10,-40},{10,40}},rotation=90,origin={40,110})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts4[nConstructions4](
    nY=gridSurface4[:,1],
    nZ=gridSurface4[:,2],
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 4"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=90,origin={-40,-94}), iconTransformation(extent={{-10,-40},{10,40}},rotation=90,origin={-40,-110})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts5[nConstructions5](
    nY=gridSurface5[:,1],
    nZ=gridSurface5[:,2],
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 5"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=180,origin={84,80}),  iconTransformation(extent={{80,20},{100,100}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPorts toConstructionPorts6[nConstructions6](
    nY=gridSurface6[:,1],
    nZ=gridSurface6[:,2],
    moisturePort.x(each start = 0.005))
    "Interfaces of the zone to constructions with orientation 6"
    annotation (Placement(transformation(extent={{-10,-40},{10,40}},rotation=180,origin={-84,-80}), iconTransformation(extent={{-10,-40},{10,40}},rotation=180,origin={-90,-60})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts1[nAirpathes1](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 1"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},origin={-94,-60}, rotation=270), iconTransformation(extent={{-40,-10},{40,10}},rotation=90,origin={-110,-40})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts2[nAirpathes2](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 2"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=180,origin={-40,94}), iconTransformation(extent={{-40,-10},{40,10}},rotation=180,origin={-40,110})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts3[nAirpathes3](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 3"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=270,origin={94,60}), iconTransformation(extent={{-40,-10},{40,10}},rotation=270,origin={110,40})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts4[nAirpathes4](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 4"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=180,origin={42,-94}), iconTransformation(extent={{-40,-10},{40,10}},rotation=180,origin={40,-110})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts5[nAirpathes5](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 5"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=270,origin={-84,-40}),iconTransformation(extent={{-40,-10},{40,10}},rotation=90,origin={-90,20})));
  Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b airpathPorts6[nAirpathes6](
    redeclare each final package Medium = Medium) if not prescribedAirchange
    "Interfaces of the zone to air pathes with orientation 6"
    annotation (Placement(transformation(extent={{-40,-10},{40,10}},rotation=270,origin={84,40}), iconTransformation(extent={{-40,-10},{40,10}},rotation=270,origin={90,-20})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces1(
    nSurfaces=nConstructions1,
    gridSurface=gridSurface1,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 1"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},origin={-80,40})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces2(
    nSurfaces=nConstructions2,
    gridSurface=gridSurface2,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 2"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},rotation=-90,origin={40,80})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces3(
    nSurfaces=nConstructions3,
    gridSurface=gridSurface3,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 3"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},rotation=180,origin={80,-40})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces4(
    nSurfaces=nConstructions4,
    gridSurface=gridSurface4,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 4"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},rotation=90,origin={-40,-80})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces5(
    nSurfaces=nConstructions5,
    gridSurface=gridSurface5,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 5"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},rotation=180,origin={80,-40})));
  BuildingSystems.Buildings.Surfaces.SurfacesToAir surfaces6(
    nSurfaces=nConstructions6,
    gridSurface=gridSurface6,
    each surface.convectionOnSurface = convectionOnSurfaces,
    each surface.alphaConstant = alphaConstant)
    "surface models of the zone with orientation 6"
    annotation (Placement(transformation(extent={{-24,-26},{24,26}},rotation=90,origin={-40,-80})));
  BuildingSystems.Interfaces.Temp_KOutput TSurfMean
    "Mean surface temperature of the zone"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={36,-20}),  iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={-50,70})));
protected
  parameter Integer nHeatSourcesTotal = 0
    "Overall number of internal heat sources of the thermal zone";
  parameter Integer nGridSurfaces = numberOfGridSurfaces(gridSurface1) + numberOfGridSurfaces(gridSurface2) + numberOfGridSurfaces(gridSurface3)
    + numberOfGridSurfaces(gridSurface4)+ numberOfGridSurfaces(gridSurface5)+ numberOfGridSurfaces(gridSurface6)
    "Overall number of all sub-surfaces";
	// Note, that with following three lines it is assumed, that there is always at least ONE construction!
  parameter Integer nSumConstructions = nConstructions1 + nConstructions2 + nConstructions3 + nConstructions4 + nConstructions5 + nConstructions6;
  parameter Integer gridSurfaceZone[nSurfaces,2] = if nSumConstructions > 0 then cat(1,gridSurface1,gridSurface2,gridSurface3,gridSurface4,gridSurface5,gridSurface6) else [1,1];
  parameter Integer nSurfaces = max(nSumConstructions,1)
    "Overall number of surfaces of the zone";
  parameter Integer nAirpathes = if prescribedAirchange then 2 else + nAirpathes1 + nAirpathes2 + nAirpathes3 + nAirpathes4 + nAirpathes5 + nAirpathes6
    "Overall number of air pathes of the zone";
  constant Modelica.SIunits.Density rho_nominal = 1.2
    "Air density under nominal conditions";
equation
  for i in 1:nConstructions1 loop
    connect(surfaces1.toConstructionPorts[i],toConstructionPorts1[i]);
    for j in 1:gridSurface1[i,1] loop
      for k in 1:gridSurface1[i,2] loop
        surfaces1.toSurfacesPorts[i].angleDegAzi = radiationDistribution.toSurfacePorts[indexM(i,j,k,gridSurface1)].angleDegAzi;
        surfaces1.toSurfacesPorts[i].angleDegTil = radiationDistribution.toSurfacePorts[indexM(i,j,k,gridSurface1)].angleDegTil;
        surfaces1.toSurfacesPorts[i].zMean = radiationDistribution.toSurfacePorts[indexM(i,j,k,gridSurface1)].zMean;
        surfaces1.toSurfacesPorts[i].A[j,k] = radiationDistribution.toSurfacePorts[indexM(i,j,k,gridSurface1)].A[1,1];
        surfaces1.toSurfacesPorts[i].epsilon[j,k] = radiationDistribution.toSurfacePorts[indexM(i,j,k,gridSurface1)].epsilon[1,1];
        surfaces1.toSurfacesPorts[i].abs[j,k] = radiationDistribution.toSurfacePorts[indexM(i,j,k,gridSurface1)].abs[1,1];
        connect(surfaces1.toSurfacesPorts[i].heatPortLw[j,k],radiationDistribution.toSurfacePorts[indexM(i,j,k,gridSurface1)].heatPortLw[1,1]);
        connect(surfaces1.toSurfacesPorts[i].heatPortSw[j,k],radiationDistribution.toSurfacePorts[indexM(i,j,k,gridSurface1)].heatPortSw[1,1]);
        connect(surfaces1.toSurfacesPorts[i].radiationPort_in[j,k],radiationDistribution.toSurfacePorts[indexM(i,j,k,gridSurface1)].radiationPort_in[1,1]);
        connect(surfaces1.toSurfacesPorts[i].radiationPort_out[j,k],radiationDistribution.toSurfacePorts[indexM(i,j,k,gridSurface1)].radiationPort_out[1,1]);
      end for;
    end for;
  end for;
  for i in 1:nConstructions2 loop
    connect(surfaces2.toConstructionPorts[i],toConstructionPorts2[i]);
    for j in 1:gridSurface2[i,1] loop
      for k in 1:gridSurface2[i,2] loop
        surfaces2.toSurfacesPorts[i].angleDegAzi = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+indexM(i,j,k,gridSurface2)].angleDegAzi;
        surfaces2.toSurfacesPorts[i].angleDegTil = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+indexM(i,j,k,gridSurface2)].angleDegTil;
        surfaces2.toSurfacesPorts[i].zMean = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+indexM(i,j,k,gridSurface2)].zMean;
        surfaces2.toSurfacesPorts[i].A[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+indexM(i,j,k,gridSurface2)].A[1,1];
        surfaces2.toSurfacesPorts[i].epsilon[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+indexM(i,j,k,gridSurface2)].epsilon[1,1];
        surfaces2.toSurfacesPorts[i].abs[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+indexM(i,j,k,gridSurface2)].abs[1,1];
        connect(surfaces2.toSurfacesPorts[i].heatPortLw[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+indexM(i,j,k,gridSurface2)].heatPortLw[1,1]);
        connect(surfaces2.toSurfacesPorts[i].heatPortSw[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+indexM(i,j,k,gridSurface2)].heatPortSw[1,1]);
        connect(surfaces2.toSurfacesPorts[i].radiationPort_in[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+indexM(i,j,k,gridSurface2)].radiationPort_in[1,1]);
        connect(surfaces2.toSurfacesPorts[i].radiationPort_out[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+indexM(i,j,k,gridSurface2)].radiationPort_out[1,1]);
      end for;
    end for;
  end for;
  for i in 1:nConstructions3 loop
    connect(surfaces3.toConstructionPorts[i],toConstructionPorts3[i]);
    for j in 1:gridSurface3[i,1] loop
      for k in 1:gridSurface3[i,2] loop
        surfaces3.toSurfacesPorts[i].angleDegAzi = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+indexM(i,j,k,gridSurface3)].angleDegAzi;
        surfaces3.toSurfacesPorts[i].angleDegTil = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+indexM(i,j,k,gridSurface3)].angleDegTil;
        surfaces3.toSurfacesPorts[i].zMean = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+indexM(i,j,k,gridSurface3)].zMean;
        surfaces3.toSurfacesPorts[i].A[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+indexM(i,j,k,gridSurface3)].A[1,1];
        surfaces3.toSurfacesPorts[i].epsilon[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+indexM(i,j,k,gridSurface3)].epsilon[1,1];
        surfaces3.toSurfacesPorts[i].abs[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+indexM(i,j,k,gridSurface3)].abs[1,1];
        connect(surfaces3.toSurfacesPorts[i].heatPortLw[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+indexM(i,j,k,gridSurface3)].heatPortLw[1,1]);
        connect(surfaces3.toSurfacesPorts[i].heatPortSw[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+indexM(i,j,k,gridSurface3)].heatPortSw[1,1]);
        connect(surfaces3.toSurfacesPorts[i].radiationPort_in[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+indexM(i,j,k,gridSurface3)].radiationPort_in[1,1]);
        connect(surfaces3.toSurfacesPorts[i].radiationPort_out[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+indexM(i,j,k,gridSurface3)].radiationPort_out[1,1]);
      end for;
    end for;
  end for;
  for i in 1:nConstructions4 loop
    connect(surfaces4.toConstructionPorts[i],toConstructionPorts4[i]);
     for j in 1:gridSurface4[i,1] loop
      for k in 1:gridSurface4[i,2] loop
        surfaces4.toSurfacesPorts[i].angleDegAzi = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+indexM(i,j,k,gridSurface4)].angleDegAzi;
        surfaces4.toSurfacesPorts[i].angleDegTil = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+indexM(i,j,k,gridSurface4)].angleDegTil;
        surfaces4.toSurfacesPorts[i].zMean = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+indexM(i,j,k,gridSurface4)].zMean;
        surfaces4.toSurfacesPorts[i].A[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+indexM(i,j,k,gridSurface4)].A[1,1];
        surfaces4.toSurfacesPorts[i].epsilon[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+indexM(i,j,k,gridSurface4)].epsilon[1,1];
        surfaces4.toSurfacesPorts[i].abs[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+indexM(i,j,k,gridSurface4)].abs[1,1];
        connect(surfaces4.toSurfacesPorts[i].heatPortLw[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+indexM(i,j,k,gridSurface4)].heatPortLw[1,1]);
        connect(surfaces4.toSurfacesPorts[i].heatPortSw[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+indexM(i,j,k,gridSurface4)].heatPortSw[1,1]);
        connect(surfaces4.toSurfacesPorts[i].radiationPort_in[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+indexM(i,j,k,gridSurface4)].radiationPort_in[1,1]);
        connect(surfaces4.toSurfacesPorts[i].radiationPort_out[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+indexM(i,j,k,gridSurface4)].radiationPort_out[1,1]);
      end for;
    end for;
  end for;
  for i in 1:nConstructions5 loop
    connect(surfaces5.toConstructionPorts[i],toConstructionPorts5[i]);
    for j in 1:gridSurface5[i,1] loop
      for k in 1:gridSurface5[i,2] loop
        surfaces5.toSurfacesPorts[i].angleDegAzi = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+indexM(i,j,k,gridSurface5)].angleDegAzi;
        surfaces5.toSurfacesPorts[i].angleDegTil = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+indexM(i,j,k,gridSurface5)].angleDegTil;
        surfaces5.toSurfacesPorts[i].zMean = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+indexM(i,j,k,gridSurface5)].zMean;
        surfaces5.toSurfacesPorts[i].A[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+indexM(i,j,k,gridSurface5)].A[1,1];
        surfaces5.toSurfacesPorts[i].epsilon[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+indexM(i,j,k,gridSurface5)].epsilon[1,1];
        surfaces5.toSurfacesPorts[i].abs[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+indexM(i,j,k,gridSurface5)].abs[1,1];
        connect(surfaces5.toSurfacesPorts[i].heatPortLw[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+indexM(i,j,k,gridSurface5)].heatPortLw[1,1]);
        connect(surfaces5.toSurfacesPorts[i].heatPortSw[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+indexM(i,j,k,gridSurface5)].heatPortSw[1,1]);
        connect(surfaces5.toSurfacesPorts[i].radiationPort_in[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+indexM(i,j,k,gridSurface5)].radiationPort_in[1,1]);
        connect(surfaces5.toSurfacesPorts[i].radiationPort_out[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+indexM(i,j,k,gridSurface5)].radiationPort_out[1,1]);
      end for;
    end for;
  end for;
  for i in 1:nConstructions6 loop
    connect(surfaces6.toConstructionPorts[i],toConstructionPorts6[i]);
     for j in 1:gridSurface6[i,1] loop
      for k in 1:gridSurface6[i,2] loop
        surfaces6.toSurfacesPorts[i].angleDegAzi = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+numberOfGridSurfaces(gridSurface5)+ indexM(i,j,k,gridSurface6)].angleDegAzi;
        surfaces6.toSurfacesPorts[i].angleDegTil = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+numberOfGridSurfaces(gridSurface5)+indexM(i,j,k,gridSurface6)].angleDegTil;
        surfaces6.toSurfacesPorts[i].zMean = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+numberOfGridSurfaces(gridSurface5)+indexM(i,j,k,gridSurface6)].zMean;
        surfaces6.toSurfacesPorts[i].A[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+numberOfGridSurfaces(gridSurface5)+indexM(i,j,k,gridSurface6)].A[1,1];
        surfaces6.toSurfacesPorts[i].epsilon[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+numberOfGridSurfaces(gridSurface5)+indexM(i,j,k,gridSurface6)].epsilon[1,1];
        surfaces6.toSurfacesPorts[i].abs[j,k] = radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+numberOfGridSurfaces(gridSurface5)+indexM(i,j,k,gridSurface6)].abs[1,1];
        connect(surfaces6.toSurfacesPorts[i].heatPortLw[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+numberOfGridSurfaces(gridSurface5)+indexM(i,j,k,gridSurface6)].heatPortLw[1,1]);
        connect(surfaces6.toSurfacesPorts[i].heatPortSw[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+numberOfGridSurfaces(gridSurface5)+indexM(i,j,k,gridSurface6)].heatPortSw[1,1]);
        connect(surfaces6.toSurfacesPorts[i].radiationPort_in[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+numberOfGridSurfaces(gridSurface5)+indexM(i,j,k,gridSurface6)].radiationPort_in[1,1]);
        connect(surfaces6.toSurfacesPorts[i].radiationPort_out[j,k],radiationDistribution.toSurfacePorts[numberOfGridSurfaces(gridSurface1)+numberOfGridSurfaces(gridSurface2)+numberOfGridSurfaces(gridSurface3)+numberOfGridSurfaces(gridSurface4)+numberOfGridSurfaces(gridSurface5)+indexM(i,j,k,gridSurface6)].radiationPort_out[1,1]);
      end for;
    end for;
  end for;

  connect(radiationDistribution.TSurfMean, TSurfMean)
    annotation (Line(points={{19.2,-20},{36,-20},{36,-20}}, color={0,0,127}));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={
  Rectangle(extent={{-80,80},{80,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern =FillPattern.Solid),
  Text(extent={{-82,16},{10,-12}}, lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString= "%name"),
  Rectangle(extent={{100,100},{80,-100}},lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid),
  Rectangle(extent={{-80,100},{-100,-100}},lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid),
  Rectangle(extent={{-80,100},{80,80}}, lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid),
  Rectangle(extent={{-80,-80},{80,-100}},lineColor={255,170,85},fillColor={255,170,85},fillPattern = FillPattern.Solid)}));
end ZoneTemplateGeneral;
