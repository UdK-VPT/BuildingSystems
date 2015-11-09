within BuildingSystems.Buildings.BaseClasses;
partial model WallGeneral
  "General wall model"
  extends BuildingSystems.Buildings.BaseClasses.ConstructionGeneral(
  width = if not equidistantGrid then pointsSegY[nY+1] - pointsSegY[1] else 1.0,
  height = if not equidistantGrid then pointsSegZ[nZ+1] - pointsSegZ[1] else 1.0,
  A = height * width - sum(AInnSur),
  nY = 1,
  nZ = 1);
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_2(
    A=if equidistantGrid then fill(A/(nY*nZ),nY,nZ) else {{lengthSegY[j] * lengthSegZ[k] for k in 1:nZ} for j in 1:nY},
    nY=nY,
    nZ=nZ,
    abs = fill(abs_2,nY,nZ),
    geo.angleDegAzi=angleDegAzi,
    geo.angleDegTil=angleDegTil,
    geo.width=width,
    geo.height=height,
    geo.zMean = zLevel + Modelica.Math.sin(Modelica.Constants.pi/180.0*angleDegTil) * height,
    geo.point.x={0.0,width,width,0.0},
    geo.point.y={0.0,0.0,height,height},
    geo.point.z={0.0,0.0,0.0,0.0},
    epsilon = fill(epsilon_2,nY,nZ))
    annotation (Placement(transformation(extent={{10,-10},{30,10}}), iconTransformation(extent={{10,-10},{30,10}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToConstructionPort toSurfacePort_1(
    A=if equidistantGrid then fill(A/(nY*nZ),nY,nZ) else {{lengthSegY[j] * lengthSegZ[k] for k in 1:nZ} for j in 1:nY},
    nY=nY,
    nZ=nZ,
    abs = fill(abs_1,nY,nZ),
    geo.angleDegAzi=angleDegAzi,
    geo.angleDegTil=angleDegTil,
    geo.width=width,
    geo.height=height,
    geo.zMean = zLevel + Modelica.Math.sin(Modelica.Constants.pi/180.0*angleDegTil) * height,
    geo.point.x={0.0,width,width,0.0},
    geo.point.y={0.0,0.0,height,height},
    geo.point.z={0.0,0.0,0.0,0.0},
    epsilon = fill(epsilon_1,nY,nZ))
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}}), iconTransformation(extent={{-30,-10},{-10,10}})));
  BuildingSystems.Climate.Sources.RadiationFixed radBcPort1(
    IrrDir_constant = 0.0,
    IrrDif_constant = 0.0,
    angleDegInc_constant = 0.0)
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={-20,16})));
  BuildingSystems.Climate.Sources.RadiationFixed radBcPort2(
    IrrDir_constant = 0.0,
    IrrDif_constant = 0.0,
    angleDegInc_constant = 0.0)
    annotation (Placement(transformation(extent={{-8,-8},{8,8}},rotation=270,origin={20,16})));
  parameter Integer nInnSur = 0
    "Number of enclosed surfaces"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Modelica.SIunits.Area AInnSur[nInnSur] = fill(0.0,nInnSur)
    "Area of each enclosed surface"
    annotation(Dialog(tab = "General", group = "Geometry"));
  parameter Boolean equidistantGrid = true
    "True: division in equidistant partions; false: division in non-equidistant partions"
     annotation(HideResult = true,Dialog(tab = "Advanced", group = "3D discretisation"));
  parameter Modelica.SIunits.Length pointsSegY[nY+1] = fill(0.0,nY+1)
    "Grid points of the partitions in y direction"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter Modelica.SIunits.Length pointsSegZ[nZ+1] = fill(0.0,nZ+1)
    "Grid points of the partitions in z direction"
    annotation(Dialog(tab = "Advanced", group = "3D discretisation"), HideResult=true);
  parameter Boolean heatSource = false
    "True: heat source present in specified layer; false: no heat source present in specified layer"
    annotation(HideResult = true,Dialog(tab = "Advanced", group = "Heat sources"));
  parameter Integer layerWithHeatSource = 1
    "Wall layer with internal heat source (used if heatSource = true)"
    annotation(Dialog(tab = "Advanced", group = "Heat sources"));
protected
  parameter Modelica.SIunits.Length lengthSegY[nY] = if equidistantGrid then fill(width/nY,nY) else {pointsSegY[j+1]-pointsSegY[j] for j in 1:nY}
    "Length of the partitions in y direction"
    annotation(HideResult=true);
  parameter Modelica.SIunits.Length lengthSegZ[nZ] = if equidistantGrid then fill(height/nZ,nZ) else {pointsSegZ[k+1]-pointsSegZ[k] for k in 1:nZ}
    "Length of the partitions in z direction"
    annotation(HideResult=true);
equation
  connect(radBcPort1.radiationPort, toSurfacePort_1.radiationPort_out[1,1]) annotation (Line(
      points={{-20,11.2},{-20,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(radBcPort2.radiationPort, toSurfacePort_2.radiationPort_out[1,1]) annotation (Line(
      points={{20,11.2},{20,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
    Rectangle(extent={{-20,80},{20,-80}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid),
    Line(points={{-20,80},{-20,-80}},color={0,0,255},smooth=Smooth.None,thickness=0.5),
    Text(extent={{8,-76},{100,-104}},lineColor={0,0,255},fillColor={230,230,230},fillPattern = FillPattern.Solid,textString= "%name")}));
end WallGeneral;
