within BuildingSystems.Buildings.Constructions.Examples;
model WallThermal3D_Vis3D
  "3D thermal wall model under real weather data incl. 3D visualisation"
  extends Modelica.Icons.Example;
  parameter Integer nY = 10;
  parameter Integer nZ = 10;
  parameter Modelica.SIunits.Time updateInterval = 600.0; // update intervall for 3D visualisation
  parameter Modelica.SIunits.Temp_K minTempVis3D= 273.15+17.0;
  parameter Modelica.SIunits.Temp_K maxTempVis3D= 273.15+25.0;
  BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard construction;
  BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete concrete;
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2(
    nY=nY,
    nZ=nZ)
    annotation (Placement(transformation(extent={{2,-10},{22,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1(
    nY=nY,
    nZ=nZ)
    annotation (Placement(transformation(extent={{-2,-10},{-22,10}})));
  BuildingSystems.Buildings.Ambient ambient(
    gridSurface={{nY,nZ},{nY,nZ}},
    nSurfaces=2,
    weatherDataFile=BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco())
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal3D_Vis3D wall(
    nY=nY,
    nZ=nZ,
    height=1.0,
    width=1.0,
    constructionData=construction,
    updateInterval=updateInterval,
    minTempVis3D=minTempVis3D,
    maxTempVis3D=maxTempVis3D,
    xVis3D = 0.0,
    yVis3D = 0.0,
    zVis3D = 0.0)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.HAM.HeatConduction.GridHeatConduction3D adiabaticElement1(
    T_start=273.15 + 40.0,
    nX=wall.constructionData.nLayers,
    nY=1,
    nZ=nZ,
    material=concrete,
    lengthX=wall.constructionData.thicknessTotal,
    lengthY=1.0,
    lengthZ=wall.height)
    annotation (Placement(transformation(extent={{-4,10},{4,18}})));
  BuildingSystems.HAM.HeatConduction.GridHeatConduction3D adiabaticElement2(
    T_start=273.15 + 50.0,
    nX=wall.constructionData.nLayers,
    nY=nY,
    nZ=1,
    material=concrete,
    lengthX=wall.constructionData.thicknessTotal,
    lengthY=wall.width,
    lengthZ=1.0)
    annotation (Placement(transformation(extent={{-12,-18},{-4,-10}})));
equation
  connect(ambient.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-32,4},{-22,4},{-22,4},{-13,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-32,-4},{-22,-4},{-22,-4},{-13,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toSurfacePorts[2], surface2.toSurfacesPort) annotation (Line(
      points={{-32,4},{-24,4},{-24,24},{24,24},{24,4},{13,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toAirPorts[2], surface2.toAirPort) annotation (Line(
      points={{-32,-4},{-24,-4},{-24,-26},{24,-26},{24,-4},{13,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface1.toConstructionPort, wall.toSurfacePort_1) annotation (
      Line(
      points={{-11,0},{-1.9,0}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(surface2.toConstructionPort, wall.toSurfacePort_2) annotation (
      Line(
      points={{11,0},{1.9,0}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(adiabaticElement1.heatPorts_y1, wall.heatPorts_y2) annotation (Line(
      points={{0,10.8},{0,7.9}},
      color={127,0,0},
      smooth=Smooth.None));
  connect(adiabaticElement2.heatPorts_z2, wall.heatPorts_z1) annotation (Line(
      points={{-5.6,-10.8},{-5.6,-6},{-1.9,-6}},
      color={127,0,0},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=86400),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WallThermal3D_Vis3D.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={
    Text(extent={{-54,-4},{50,-70}},  lineColor={0,0,255}, textString="Four 1D thermal wall models under real weather data, one side with fixed thermal boundary conditions + 3D visualisation")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})));
end WallThermal3D_Vis3D;
