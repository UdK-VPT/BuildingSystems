within BuildingSystems.Buildings.Examples;
model BuildingThermal1Zone3D
  "3D-Thermal building model with 1 zone under real weather data"
  extends Modelica.Icons.Example;

  model Corner3D
    BuildingSystems.HAM.HeatConduction.GridHeatConduction3D concrete21(
      material= BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
      nX=1,nY=1,nZ=nZ,lengthX=thicknessXConcrete,lengthY=thicknessYConcrete,lengthZ=lengthZ)
      annotation (Placement(transformation(extent={{2,-20},{22,0}})));
    BuildingSystems.HAM.HeatConduction.GridHeatConduction3D insulation11(
      material= BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation(),
      nX=1,nY=1,nZ=nZ,lengthX=thicknessXInsulation,lengthY=thicknessYInsulation,lengthZ=lengthZ)
      annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
    BuildingSystems.HAM.HeatConduction.GridHeatConduction3D insulation12(
      material=BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation(),
      nX=1,nY=1,nZ=nZ,lengthX=thicknessXInsulation,lengthY=thicknessYInsulation,lengthZ=lengthZ)
      annotation (Placement(transformation(extent={{-20,2},{0,22}})));
    BuildingSystems.HAM.HeatConduction.GridHeatConduction3D insulation22(
      material=BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation(),
      nX=1,nY=1,nZ=3,lengthX=thicknessXInsulation,lengthY=thicknessYInsulation,lengthZ=lengthZ)
      annotation (Placement(transformation(extent={{2,2},{22,22}})));
    parameter Modelica.SIunits.Length thicknessXConcrete=0.1;
    parameter Modelica.SIunits.Length thicknessYConcrete=0.1;
    parameter Modelica.SIunits.Length thicknessXInsulation=0.1;
    parameter Modelica.SIunits.Length thicknessYInsulation=0.1;
    parameter Modelica.SIunits.Length lengthZ=1.0;
    parameter Integer nZ = 3;
    BuildingSystems.Interfaces.HeatPorts heatPorts_y[2,nZ]
      annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=180,origin={0,-30}), iconTransformation(extent={{-12,-22},{12,-16}})));
    BuildingSystems.Interfaces.HeatPorts heatPorts_x[2,nZ]
      annotation (Placement(transformation(extent={{-4,-4},{4,4}},rotation=270,origin={28,0}), iconTransformation(extent={{-12,-3},{12,3}},rotation=90,origin={20,-1})));
  equation
    connect(insulation11.heatPorts_y2, insulation12.heatPorts_y1) annotation (
        Line(
        points={{-10,-2},{-10,4}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(concrete21.heatPorts_y2, insulation22.heatPorts_y1) annotation (Line(
        points={{12,-2},{12,4}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(insulation12.heatPorts_x2, insulation22.heatPorts_x1) annotation (
        Line(
        points={{-2,12},{4,12}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(insulation11.heatPorts_x2, concrete21.heatPorts_x1) annotation (Line(
        points={{-2,-10},{4,-10}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(heatPorts_y[2,:], concrete21.heatPorts_y1[1,:]) annotation (Line(
        points={{0,-30},{0,-24},{12,-24},{12,-18}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(insulation11.heatPorts_y1[1,:], heatPorts_y[1,:]) annotation (Line(
        points={{-10,-18},{-10,-24},{0,-24},{0,-30}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(concrete21.heatPorts_x2[1,:], heatPorts_x[1,:]) annotation (Line(
        points={{20,-10},{22,-10},{22,0},{28,0}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(insulation22.heatPorts_x2[1,:], heatPorts_x[2,:]) annotation (Line(
        points={{20,12},{22,12},{22,0},{28,0}},
        color={127,0,0},
        smooth=Smooth.None));

    annotation (      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics={
      Rectangle(extent={{-20,20},{20,-20}},lineColor={230,230,230},fillColor={230,230,230},fillPattern = FillPattern.Solid),
      Text(extent={{-28,16},{26,-16}},lineColor={255,0,0},  lineThickness=0.5,fillColor={255,128,0},fillPattern=FillPattern.Solid,textString="3D")}));
  end Corner3D;

  model Building
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
    surfacesToAmbient(nSurfaces=6),
    gridSurface = {{3,3},{3,3},{1,1},{3,3},{1,1},{3,3}},
    nZones=1,
    convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
    useAirPathes = false);

    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction  construction1(
      nLayers=2,
      thickness={0.2,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
      BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()})
      annotation(Placement(transformation(extent={{-34,40},{-14,60}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone1(
      V = 4.0*4.0*2.5,
      height = 2.5,
      nConstructions2=2, gridSurface2={{3,3},{1,1}},
      nConstructions1=1, gridSurface1={{3,3}},
      nConstructions4=2, gridSurface4={{3,3},{1,1}},
      nConstructions3=1, gridSurface3={{3,3}},
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall1(
      nY=3,
      nZ=3,
      height=2.5,
      width=4.0,
      angleDegAzi=90.0,
      angleDegTil=90.0,
      constructionData=construction1)
      annotation (Placement(transformation(extent={{-36,-10},{-16,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall3(
      nY=3,
      nZ=3,
      height=2.5,
      width=4.0,
      angleDegAzi=-90.0,
      angleDegTil=90.0,
      constructionData=construction1)
      annotation (Placement(transformation(extent={{16,-10},{36,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall2(
      nY=3,
      nZ=3,
      height=2.5,
      width=4.0,
      angleDegAzi=180.0,
      angleDegTil=90.0,
      nInnSur = 1,
      AInnSur={window2.A},
      constructionData=construction1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-12,20})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal3D wall4(
      nY=3,
      nZ=3,
      height=2.5,
      width=4.0,
      angleDegAzi=0.0,
      angleDegTil=90.0,
      nInnSur = 1,
      AInnSur={window4.A},
      constructionData=construction1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-12,-24})));
    BuildingSystems.Buildings.Constructions.Windows.Window window2(
      height=1.0,
      width=2.0,
      angleDegAzi=180.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,16})));
    BuildingSystems.Buildings.Constructions.Windows.Window window4(
      height=1.0,
      width=2.0,
      angleDegAzi=0.0,
      angleDegTil=90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={12,-20})));
    Corner3D corner1(
      lengthZ=2.5,
      thicknessXConcrete=0.2,
      thicknessYConcrete=0.2,
      thicknessXInsulation=0.1,
      thicknessYInsulation=0.1)
      annotation (Placement(transformation(extent={{-36,10},{-16,30}})));
    Corner3D corner2(
      lengthZ=2.5,
      thicknessXConcrete=0.2,
      thicknessYConcrete=0.2,
      thicknessXInsulation=0.1,
      thicknessYInsulation=0.1)
      annotation (Placement(transformation(extent={{10,10},{-10,-10}},rotation=270,origin={-26,-24})));
    Corner3D corner3(
      lengthZ=2.5,
      thicknessXConcrete=0.2,
      thicknessYConcrete=0.2,
      thicknessXInsulation=0.1,
      thicknessYInsulation=0.1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={26,20})));
    Corner3D corner4(
      lengthZ=2.5,
      thicknessXConcrete=0.2,
      thicknessYConcrete=0.2,
      thicknessXInsulation=0.1,
      thicknessYInsulation=0.1)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={26,-24})));
  equation
   connect(wall2.toSurfacePort_1, zone1.toConstructionPorts2[1]) annotation (
        Line(
        points={{-12,18},{2,18},{2,9},{4,9}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall1.toSurfacePort_2, zone1.toConstructionPorts1[1]) annotation (
        Line(
        points={{-24,0},{-16,0},{-16,4},{-11,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall4.toSurfacePort_2, zone1.toConstructionPorts4[1]) annotation (
        Line(
        points={{-12,-22},{-12,-14},{-4,-14},{-4,-13}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(window2.toSurfacePort_1, zone1.toConstructionPorts2[2]) annotation (
        Line(
        points={{12,14.2},{10,14.2},{10,13},{4,13}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(window4.toSurfacePort_2, zone1.toConstructionPorts4[2]) annotation (
        Line(
        points={{12,-18.2},{12,-16},{-4,-16},{-4,-9}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall3.toSurfacePort_1, zone1.toConstructionPorts3[1]) annotation (
        Line(
        points={{24,0},{14,0},{14,-4},{11,-4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[1], wall1.toSurfacePort_1)
      annotation (Line(
        points={{-89.9,3.10862e-015},{-55.95,3.10862e-015},{-55.95,0},{-28,0}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[2], wall2.toSurfacePort_2)
      annotation (Line(
        points={{-89.9,0},{-40,0},{-40,28},{-12,28},{-12,22}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[3], window2.toSurfacePort_2)
      annotation (Line(
        points={{-89.9,0},{-40,0},{-40,28},{12,28},{12,17.8}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[4], wall3.toSurfacePort_2)
      annotation (Line(
        points={{-89.9,0},{-40,0},{-40,28},{30,28},{30,0},{28,0}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[5], window4.toSurfacePort_1)
      annotation (Line(
        points={{-89.9,0},{-40,0},{-40,-30},{12,-30},{12,-21.8}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[6], wall4.toSurfacePort_1)
      annotation (Line(
        points={{-89.9,0},{-40,0},{-40,-30},{-12,-30},{-12,-26}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(zone1.T_setCooling, T_setCooling[1]) annotation (Line(
        points={{6,-7},{8,-7},{8,-12},{80,-12},{80,60},{100,60}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(zone1.T_setHeating, T_setHeating[1]) annotation (Line(
        points={{4,-7},{4,-14},{74,-14},{74,80},{100,80}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(corner1.heatPorts_x, wall2.heatPorts_y2) annotation (Line(
        points={{-24,19.9},{-22,19.9},{-22,20},{-19.9,20}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(corner1.heatPorts_y, wall1.heatPorts_y2) annotation (Line(
        points={{-26,18.1},{-26,7.9}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(corner2.heatPorts_x, wall1.heatPorts_y1) annotation (Line(
        points={{-25.9,-22},{-26,-22},{-26,-7.9}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(corner2.heatPorts_y, wall4.heatPorts_y2) annotation (Line(
        points={{-24.1,-24},{-19.9,-24}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(wall2.heatPorts_y1, corner3.heatPorts_y) annotation (Line(
        points={{-4.1,20},{24.1,20}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(corner3.heatPorts_x, wall3.heatPorts_y2) annotation (Line(
        points={{25.9,18},{26,18},{26,7.9}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(corner4.heatPorts_y, wall3.heatPorts_y1) annotation (Line(
        points={{26,-22.1},{26,-7.9}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(wall4.heatPorts_y1, corner4.heatPorts_x) annotation (Line(
        points={{-4.1,-24},{10,-24},{10,-23.9},{24,-23.9}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(zone1.airchange, airchange[1]) annotation (Line(
      points={{11,7},{14,7},{14,12},{86,12},{86,45},{100,45}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone1.xAirAmb, xAirAmb) annotation (Line(
      points={{11,3},{16,3},{16,10},{70,10},{70,100}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(TAirAmb, zone1.TAirAmb) annotation (Line(
      points={{50,100},{50,14},{14,14},{14,5},{11,5}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone1.Q_flow_cooling, Q_flow_cooling[1]) annotation (Line(
      points={{7,7},{7,-80},{-80,-80},{-80,-100}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(zone1.Q_flow_heating, Q_flow_heating[1]) annotation (Line(
      points={{3,7},{3,-34},{80,-34},{80,-100}},
      color={0,0,127},
      smooth=Smooth.None));

  end Building;

  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient,
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile,
    gridSurface=building.gridSurface)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  Building building(nZones=1)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,14})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,6})));
  Modelica.Blocks.Sources.Constant airchange(k=0.5)
     annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,-2})));
equation
   connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts) annotation (Line(
    points={{-22,7.66667},{-20,7.66667},{-20,8},{-20,11.3333},{-20,7.66667},{-9,7.66667}},
    color={0,255,0},
    smooth=Smooth.None));
  connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
    points={{-22,-0.333333},{-16,-0.333333},{-16,-0.333333},{-9,-0.333333}},
    color={85,170,255},
    smooth=Smooth.None));
  connect(TSetHeating.y, building.T_setHeating[1]) annotation (Line(
      points={{15.8,14},{12,14},{12,8},{9.8,8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCooling.y, building.T_setCooling[1]) annotation (Line(
      points={{15.8,6},{9.8,6}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.TAirAmb, ambient.TAirRef) annotation (Line(
      points={{6.2,9.8},{6.2,12},{-40,12},{-40,7},{-38.2,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.xAirAmb, ambient.xAir) annotation (Line(
      points={{8.4,9.8},{8.4,14},{-42,14},{-42,5},{-38.2,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.airchange[1], airchange.y) annotation (Line(
      points={{9.8,4},{12,4},{12,-2},{15.8,-2}},
      color={0,0,127},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=864000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/BuildingThermal1Zone3D.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
    textString="3D-Thermal building model with 1 zone under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates thermal building model with 1 zone, based on 3D-discretized building elements.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
 end BuildingThermal1Zone3D;
