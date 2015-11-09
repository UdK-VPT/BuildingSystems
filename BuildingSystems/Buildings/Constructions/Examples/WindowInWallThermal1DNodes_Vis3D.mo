within BuildingSystems.Buildings.Constructions.Examples;
model WindowInWallThermal1DNodes_Vis3D
    "1D Wall model, which includes a window model under real weather data and an additional 3D visualisation"
    extends Modelica.Icons.Example;
    parameter Modelica.SIunits.Time updateInterval = 600.0; // update intervall for 3D visualisation
    parameter Modelica.SIunits.Temp_K minTempVis3D= 273.15+9.0;
    parameter Modelica.SIunits.Temp_K maxTempVis3D= 273.15+20.0;
    BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard construction;
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes_Vis3D wall(
      height=2.5,
      width=4.0,
      angleDegAzi=-90.0,
      angleDegTil=90.0,
      nNodes={2,2},
      constructionData=construction,
      nInnSur = 1,
      AInnSur={window.A},
      updateInterval=updateInterval,
      minTempVis3D=minTempVis3D,
      maxTempVis3D=maxTempVis3D,
      yOpening = 2.0,
      zOpening = 0.6,
      widthOpening = window.width,
      heightOpening = window.height,
      xVis3D = 0.0,
      yVis3D = 0.0,
      zVis3D = 0.0)
      annotation (Placement(transformation(extent={{-10,-40},{10,-20}})));
    BuildingSystems.Buildings.Constructions.Windows.Window_Vis3D window(
      height=1.2,
      width=1.0,
      angleDegAzi=-90.0,
      angleDegTil=90.0,
      updateInterval=updateInterval,
      minTempVis3D=minTempVis3D,
      maxTempVis3D=maxTempVis3D,
      xVis3D = -wall.constructionData.thicknessTotal/2.0,
      yVis3D = -wall.width/2.0+window.width/2.0+wall.yOpening,
      zVis3D = -wall.height/2.0+window.height/2.0+wall.zOpening)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2
      annotation (Placement(transformation(extent={{2,-10},{22,10}})));
    BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
      annotation (Placement(transformation(extent={{-2,-10},{-22,10}})));
    BuildingSystems.Buildings.Surfaces.SurfaceToAir surface3
      annotation (Placement(transformation(extent={{2,-40},{22,-20}})));
    BuildingSystems.Buildings.Surfaces.SurfaceToAir surface4
      annotation (Placement(transformation(extent={{-2,-40},{-22,-20}})));
    BuildingSystems.Buildings.Ambient ambient(nSurfaces=4, gridSurface={{1,1},{1,1},{1,1},{1,1}},
      weatherDataFile=BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco())
      annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  equation
    connect(surface1.toConstructionPort, window.toSurfacePort_1) annotation (Line(
        points={{-11,0},{-1.8,0}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(window.toSurfacePort_2, surface2.toConstructionPort) annotation (Line(
        points={{1.8,0},{11,0}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(ambient.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
        points={{-32,3.5},{-22,3.5},{-22,4},{-13,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(ambient.toAirPorts[1], surface1.toAirPort) annotation (Line(
        points={{-32,-4.5},{-22,-4.5},{-22,0},{-13,0}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(ambient.toSurfacePorts[2], surface2.toSurfacesPort) annotation (Line(
        points={{-32,4.5},{-24,4.5},{-24,16},{24,16},{24,4},{13,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(ambient.toAirPorts[2], surface2.toAirPort) annotation (Line(
        points={{-32,-3.5},{-28,-3.5},{-28,-6},{-24,-6},{-24,-14},{24,-14},{24,0},
            {13,0}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface4.toConstructionPort, wall.toSurfacePort_1) annotation (Line(
        points={{-11.4,-30},{-2,-30}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall.toSurfacePort_2, surface3.toConstructionPort) annotation (Line(
        points={{2,-30},{11.4,-30}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface3.toSurfacesPort, ambient.toSurfacePorts[3]) annotation (Line(
        points={{12.6,-26},{28,-26},{28,22},{-32,22},{-32,5}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface4.toSurfacesPort, ambient.toSurfacePorts[4]) annotation (Line(
        points={{-12.6,-26},{-54,-26},{-54,22},{-32,22},{-32,7}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface4.toAirPort, ambient.toAirPorts[3]) annotation (Line(
        points={{-12.6,-34},{-32,-34},{-32,-3}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surface3.toAirPort, ambient.toAirPorts[4]) annotation (Line(
        points={{12.6,-34},{16,-34},{16,-42},{-32,-42},{-32,-1}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));

    annotation(experiment(StartTime=0, StopTime=864000,Interval=360),
      __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WindowInWallThermal1DNodes_Vis3D.mos" "Simulate and plot"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,40}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
      textString="1D Wall model, which includes a window model
      under real weather data + 3D visualisation")}),Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})));
end WindowInWallThermal1DNodes_Vis3D;
