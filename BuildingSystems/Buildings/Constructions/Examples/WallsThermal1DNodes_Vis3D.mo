within BuildingSystems.Buildings.Constructions.Examples;
model WallsThermal1DNodes_Vis3D
  "Four 1D thermal wall models under real weather data incl. 3D visualisation"
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Time updateInterval = 600.0; // update intervall for 3D visualisation
  parameter Modelica.SIunits.Temp_K minTempVis3D= 273.15+17.0;
  parameter Modelica.SIunits.Temp_K maxTempVis3D= 273.15+20.0;
  BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard construction;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes_Vis3D wall1(
    angleDegAzi=180.0,
    angleDegTil=90.0,
    height=2.5,
    width=2.0,
    constructionData=construction,
    updateInterval=updateInterval,
    minTempVis3D=minTempVis3D,
    maxTempVis3D=maxTempVis3D,
    xVis3D = 0.0,
    yVis3D = 0.0,
    zVis3D = 0.0,
    yOpening=1.0,
    zOpening = 0.6,
    widthOpening=0.8,
    heightOpening = 1.2)
      annotation (Placement(transformation(extent={{-10,-34},{10,-14}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToSolid surface2
    annotation (Placement(transformation(extent={{2,-34},{22,-14}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-2,-34},{-22,-14}})));
  BuildingSystems.Buildings.Ambient ambient(
    weatherDataFile=BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco(),
    nSurfaces=4)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature tempBC(T=293.15)
    annotation (Placement(transformation(extent={{30,6},{22,14}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes_Vis3D wall2(
    angleDegAzi = -90.0,
    angleDegTil = 90.0,
    height=2.5,
    width=4.0,
    constructionData=construction,
    updateInterval = updateInterval,
    minTempVis3D=minTempVis3D,
    maxTempVis3D=maxTempVis3D,
    xVis3D = -wall1.width/2.0,
    yVis3D = wall2.width/2.0,
    zVis3D = 0.0,
    yOpening=1.0,
    zOpening = 0.6,
    widthOpening=0.8,
    heightOpening = 1.2)
    annotation (Placement(transformation(extent={{-10,-16},{10,4}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToSolid surface3
    annotation (Placement(transformation(extent={{2,-16},{22,4}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface4
    annotation (Placement(transformation(extent={{-2,-16},{-22,4}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes_Vis3D wall3(
    angleDegAzi = 90.0,
    angleDegTil = 90.0,
    height=2.5,
    width=4.0,
    constructionData=construction,
    updateInterval = updateInterval,
    minTempVis3D=minTempVis3D,
    maxTempVis3D=maxTempVis3D,
    xVis3D = wall1.width/2.0,
    yVis3D = wall2.width/2.0,
    zVis3D = 0.0)
    annotation (Placement(transformation(extent={{-10,2},{10,22}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes_Vis3D wall4(
    angleDegAzi=0.0,
    angleDegTil=90.0,
    height=2.5,
    width=2.0,
    constructionData=construction,
    updateInterval=updateInterval,
    minTempVis3D=minTempVis3D,
    maxTempVis3D=maxTempVis3D,
    xVis3D = 0.0,
    yVis3D = wall2.width,
    zVis3D = 0.0)
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface5
    annotation (Placement(transformation(extent={{-2,2},{-22,22}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface6
    annotation (Placement(transformation(extent={{-2,20},{-22,40}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToSolid surface7
    annotation (Placement(transformation(extent={{2,2},{22,22}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToSolid surface8
    annotation (Placement(transformation(extent={{2,20},{22,40}})));
equation
  connect(surface1.toConstructionPort, wall1.toSurfacePort_1) annotation (Line(
      points={{-11.4,-24},{-2,-24}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall1.toSurfacePort_2, surface2.toConstructionPort) annotation (Line(
      points={{2,-24},{11.4,-24}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-32,1},{-22,1},{-22,-20},{-12.6,-20}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-32,-7},{-22,-7},{-22,-28},{-12.6,-28}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface2.heatPort[1,1], tempBC.port) annotation (Line(
    points={{12.6,-28},{18,-28},{18,10},{22,10}},
    color={191,0,0},
    smooth=Smooth.None));
  connect(ambient.toSurfacePorts[2], surface4.toSurfacesPort) annotation (Line(
      points={{-32,3},{-22,3},{-22,-2},{-12.6,-2}},
      color={0,255,0},
      smooth=Smooth.None));
  connect(ambient.toAirPorts[2], surface4.toAirPort) annotation (Line(
      points={{-32,-5},{-22,-5},{-22,-10},{-12.6,-10}},
      color={85,170,255},
      smooth=Smooth.None));
  connect(surface4.toConstructionPort, wall2.toSurfacePort_1) annotation (Line(
      points={{-11.4,-6},{-2,-6}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall2.toSurfacePort_2, surface3.toConstructionPort) annotation (Line(
      points={{2,-6},{11.4,-6}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface3.heatPort[1, 1], tempBC.port) annotation (Line(
      points={{12.6,-10},{18,-10},{18,10},{22,10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(surface6.toConstructionPort, wall4.toSurfacePort_1) annotation (Line(
      points={{-11.4,30},{-2,30}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall4.toSurfacePort_2, surface8.toConstructionPort) annotation (Line(
      points={{2,30},{11.4,30}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface5.toConstructionPort, wall3.toSurfacePort_1) annotation (Line(
      points={{-11.4,12},{-2,12}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall3.toSurfacePort_2, surface7.toConstructionPort) annotation (Line(
      points={{2,12},{11.4,12}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface7.heatPort[1, 1], tempBC.port) annotation (Line(
      points={{12.6,8},{18,8},{18,10},{22,10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(surface8.heatPort[1, 1], tempBC.port) annotation (Line(
      points={{12.6,26},{18,26},{18,10},{22,10}},
      color={191,0,0},
      smooth=Smooth.None));
  connect(ambient.toSurfacePorts[3], surface6.toSurfacesPort) annotation (Line(
      points={{-32,5},{-22,5},{-22,34},{-12.6,34}},
      color={0,255,0},
      smooth=Smooth.None));
  connect(ambient.toSurfacePorts[4], surface5.toSurfacesPort) annotation (Line(
      points={{-32,7},{-22,7},{-22,16},{-12.6,16}},
      color={0,255,0},
      smooth=Smooth.None));
  connect(ambient.toAirPorts[3], surface6.toAirPort) annotation (Line(
      points={{-32,-3},{-22,-3},{-22,26},{-12.6,26}},
      color={85,170,255},
      smooth=Smooth.None));
  connect(ambient.toAirPorts[4], surface5.toAirPort) annotation (Line(
      points={{-32,-1},{-22,-1},{-22,8},{-12.6,8}},
      color={85,170,255},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=864000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WallsThermal1DNodes_Vis3D.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={
    Text(extent={{-54,-4},{50,-70}},  lineColor={0,0,255}, textString="Four 1D thermal wall models under real weather data, one side with fixed thermal boundary conditions + 3D visualisation")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})));
end WallsThermal1DNodes_Vis3D;
