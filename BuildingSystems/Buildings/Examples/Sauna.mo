within BuildingSystems.Buildings.Examples;
model Sauna
  "Simulation of heat up process of a sauna room"
  extends Modelica.Icons.Example;

  model Building
    extends BuildingSystems.Buildings.BaseClasses.BuildingTemplate(
      surfacesToAmbient(nSurfaces=12),
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.forced,
      useAirPathes = false);

    BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction  construction1(
      nLayers=1,
      thickness={0.2},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()})
      annotation(Placement(transformation(extent={{-96,74},{-76,94}})));
    BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction  construction2(
      nLayers=3,
      thickness={0.1,0.4,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Holz(),
      BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Mineralwolle(),
      BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Holz()})
      annotation(Placement(transformation(extent={{-74,74},{-54,94}})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed sauna(
      nConstructions3=1,
      calcIdealLoads=false,
      nConstructions2=2,
      V=2.0*3.0*2.4,
      height=2.4,
      heatSources=true,
      nHeatSources=nHeatSources,
      nAirpathes1=2,
      heightAirpath={1.5,0.5},
      moistureSources=true,
      nMoistureSources=nMoistureSources,
      nConstructions1=1,
      nConstructions4=2,
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free,
      prescribedAirchange=false,
      T_start = 293.15,
      x_start = 0.01)
      annotation (Placement(transformation(extent={{10,-10},{30,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall1(
      angleDegAzi=90.0,
      angleDegTil=90.0,
      width=2.0,
      height=2.4,
      nNodes={32,32,32},
      constructionData=construction2)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-2,-10})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall3(
      angleDegAzi=-90.0,
      angleDegTil=90.0,
      width=2,
      height=2.4,
      nNodes={32,32,32},
      constructionData=construction2)
      annotation (Placement(transformation(extent={{32,-10},{52,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes  wall2(
      angleDegAzi=180.0,
      angleDegTil=90.0,
      width=3.0,
      height=2.4,
      nNodes={32,32,32},
      constructionData=construction2)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,22})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall4(
      angleDegAzi=0.0,
      angleDegTil=90.0,
      width=3,
      height=2.4,
      nNodes={32,32,32},
      constructionData=construction2)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-22})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes floor1(
      angleDegAzi=0.0,
      width=3.0,
      height=2.0,
      angleDegTil=0.0,
      nNodes={32,32,32},
      constructionData=construction2)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={32,-32})));
    BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes ceiling1(
      width=2.0,
      height=3.0,
      angleDegAzi=0.0,
      angleDegTil=180.0,
      nNodes={32,32,32},
      constructionData=construction2)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={32,34})));
    BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed anteroom(
      nConstructions1=1,
      nConstructions4=2,
      nConstructions3=3,
      calcIdealLoads=false,
      height=2.4,
      V=6.0*5.0*2.4,
      nConstructions2=2,
      nAirpathes3=2,
      heightAirpath={0.5,1.5},
      convectionOnSurfaces=BuildingSystems.HAM.ConvectiveHeatTransfer.Types.Convection.free,
      prescribedAirchange=false,
      T_start = 293.15,
      x_start = 0.01)
      annotation (Placement(transformation(extent={{-44,-10},{-24,10}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall5(
      angleDegTil=90.0,
      constructionData=construction1,
      width=2.0,
      height=2.4,
      angleDegAzi=-90.0,
      nNodes={4})
      annotation (Placement(transformation(extent={{-12,26},{8,46}})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall6(
      angleDegTil=90.0,
      constructionData=construction1,
      height=2.4,
      nNodes={4},
      width=5.0,
      angleDegAzi=180.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-34,48})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall7(
      angleDegTil=90.0,
      constructionData=construction1,
      height=2.4,
      nNodes={4},
      width=6.0,
      angleDegAzi=90.0)
     annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-68,0})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall8(
      angleDegTil=90.0,
      constructionData=construction1,
      height=2.4,
      nNodes={4},
      width=5.0,
      angleDegAzi=0.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-32,-48})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall9(
      angleDegTil=90.0,
      constructionData=construction1,
      height=2.4,
      nNodes={4},
      width=2.0,
      angleDegAzi=-90.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,origin={-2,-36})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceiling2(
      constructionData=construction1,
      nNodes={4},
      width=5.0,
      angleDegAzi=180.0,
      height=6.0,
      angleDegTil=0.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-14,60})));
    BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor2(
      constructionData=construction1,
      height=2.4,
      nNodes={4},
      width=5.0,
      angleDegAzi=0.0,
      angleDegTil=0.0)
      annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-14,-62})));
    BuildingSystems.Buildings.Airpathes.AirpathVariable airpathDown
      annotation (Placement(transformation(extent={{-12,-6},{8,14}})));
    BuildingSystems.Buildings.Airpathes.AirpathVariable airpathUp
      annotation (Placement(transformation(extent={{-16,2},{4,22}})));
    Modelica.Blocks.Sources.Constant nd(k=0.5)
      annotation (Placement(transformation(extent={{6,20},{2,24}})));
    Modelica.Blocks.Sources.TimeTable k(table=[0.0,0.001;340,0.001;340,0.1;350,0.1;350,0.001;1000.0,0.001])
      annotation (Placement(transformation(extent={{-12,20},{-8,24}})));
  equation
   connect(wall3.toSurfacePort_1,sauna. toConstructionPorts3[1]) annotation (
       Line(
       points={{40,0},{36,0},{36,-4},{31,-4}},
       color={0,0,0},
       pattern=LinePattern.Solid,
       smooth=Smooth.None));
    connect(wall2.toSurfacePort_1, sauna.toConstructionPorts2[1]) annotation (
        Line(
        points={{20,20},{20,14},{26,14},{26,11}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(ceiling1.toSurfacePort_1, sauna.toConstructionPorts2[2]) annotation (
        Line(
        points={{32,32},{32,14},{22,14},{22,11}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall6.toSurfacePort_1, anteroom.toConstructionPorts2[1]) annotation (
        Line(
        points={{-34,46},{-34,18},{-28,18},{-28,11}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall7.toSurfacePort_1, anteroom.toConstructionPorts1[1]) annotation (
        Line(
        points={{-66,0},{-50,0},{-50,4},{-45,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall8.toSurfacePort_1, anteroom.toConstructionPorts4[1]) annotation (
        Line(
        points={{-32,-46},{-32,-16},{-36,-16},{-36,-11}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(floor2.toSurfacePort_1, anteroom.toConstructionPorts4[2]) annotation (
        Line(
        points={{-14,-60},{-14,-16},{-40,-16},{-40,-11}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(ceiling2.toSurfacePort_1, anteroom.toConstructionPorts2[2])
      annotation (Line(
        points={{-14,58},{-14,18},{-32,18},{-32,11}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall9.toSurfacePort_1, anteroom.toConstructionPorts3[1]) annotation (
        Line(
        points={{-4,-36},{-10,-36},{-10,-6.66667},{-23,-6.66667}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall5.toSurfacePort_1, anteroom.toConstructionPorts3[2]) annotation (
        Line(
        points={{-4,36},{-14,36},{-14,-4},{-23,-4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[1], wall7.toSurfacePort_2)
      annotation (Line(
        points={{-173.9,0},{-70,0}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[2], wall6.toSurfacePort_2)
      annotation (Line(
        points={{-173.9,3.55271e-015},{-84,3.55271e-015},{-84,72},{-34,72},{-34,50}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(wall5.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[3])
      annotation (Line(
        points={{0,36},{0,72},{-84,72},{-84,3.55271e-015},{-173.9,3.55271e-015}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall8.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[4])
      annotation (Line(
        points={{-32,-50},{-32,-72},{-84,-72},{-84,3.55271e-015},{-173.9,3.55271e-015}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(floor2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[5])
      annotation (Line(
        points={{-14,-64},{-14,-72},{-84,-72},{-84,3.55271e-015},{-173.9,3.55271e-015}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall9.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[6])
      annotation (Line(
        points={{0,-36},{0,-72},{-84,-72},{-84,3.55271e-015},{-173.9,3.55271e-015}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall3.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[7])
      annotation (Line(
        points={{44,0},{46,0},{46,-72},{-84,-72},{-84,3.55271e-015},{-173.9,3.55271e-015}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(ceiling1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[8])
      annotation (Line(
        points={{32,36},{32,72},{-84,72},{-84,3.55271e-015},{-173.9,3.55271e-015}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(surfacesToAmbient.toConstructionPorts[9],  ceiling2.toSurfacePort_2)
      annotation (Line(
        points={{-173.9,3.55271e-015},{-84,3.55271e-015},{-84,72},{-14,72},{-14,62}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(wall2.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[10])
      annotation (Line(
        points={{20,24},{20,72},{-84,72},{-84,3.55271e-015},{-173.9,3.55271e-015}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(anteroom.airpathPorts3[2], airpathUp.airpathPort_1) annotation (Line(
        points={{-23,2},{-10,2},{-10,12}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(anteroom.airpathPorts3[1], airpathDown.airpathPort_1) annotation (Line(
        points={{-23,6},{-14,6},{-14,4},{-6,4}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(airpathUp.airpathPort_2, sauna.airpathPorts1[2]) annotation (Line(
        points={{-2,12},{6,12},{6,-2},{9,-2}},
        color={0,0,255},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(airpathDown.airpathPort_2, sauna.airpathPorts1[1]) annotation (Line(
        points={{2,4},{4,4},{4,-6},{9,-6}},
        color={0,0,255},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(airpathUp.mVar, nd.y) annotation (Line(
        points={{-5,12.6},{-5,22},{1.8,22}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(airpathDown.mVar, nd.y) annotation (Line(
        points={{-1,4.6},{-1,22},{1.8,22}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(k.y, airpathUp.kVar) annotation (Line(
        points={{-7.8,22},{-7,22},{-7,12.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(k.y, airpathDown.kVar) annotation (Line(
        points={{-7.8,22},{-3,22},{-3,4.6}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(moisturePorts, sauna.moistureSourcesPorts) annotation (Line(
        points={{-88,120},{-88,96},{62,96},{62,-4},{26.5,-4},{26.5,-7.3}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(anteroom.toConstructionPorts3[3], wall1.toSurfacePort_2) annotation (
        Line(
        points={{-23,-1.33333},{-14,-1.33333},{-14,-10},{-4,-10}},
        color={127,0,0},
        smooth=Smooth.None));
    connect(wall1.toSurfacePort_1, sauna.toConstructionPorts1[1]) annotation (
        Line(
        points={{0,-10},{6,-10},{6,4},{9,4}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall4.toSurfacePort_1, sauna.toConstructionPorts4[1]) annotation (
        Line(
        points={{20,-20},{20,-16},{18,-16},{18,-11}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(floor1.toSurfacePort_1, sauna.toConstructionPorts4[2]) annotation (
        Line(
        points={{32,-30},{32,-16},{14,-16},{14,-11}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(wall4.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[11])
      annotation (Line(
        points={{20,-24},{20,-72},{-84,-72},{-84,3.55271e-015},{-173.9,3.55271e-015}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(floor1.toSurfacePort_2, surfacesToAmbient.toConstructionPorts[12])
      annotation (Line(
        points={{32,-34},{32,-72},{-84,-72},{-84,3.55271e-015},{-173.9,3.55271e-015}},
        color={0,0,0},
        pattern=LinePattern.Solid,
        smooth=Smooth.None));
    connect(conHeatSourcesPorts, sauna.conHeatSourcesPorts) annotation (Line(
          points={{-44,120},{-44,100},{80,100},{80,0},{14.9,0},{14.9,-7.3}},
          color={127,0,0}));
    connect(radHeatSourcesPorts, sauna.radHeatSourcesPorts) annotation (Line(
          points={{0,120},{0,100},{80,100},{80,0},{20.7,0},{20.7,-7.3}}, color={127,0,0}));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false), graphics={
    Rectangle(extent={{2,18},{38,-18}},fillColor={213,255,170},fillPattern=FillPattern.Solid,pattern=LinePattern.Solid,lineColor={0,0,0}),
    Rectangle(extent={{-64,44},{-6,-44}},fillColor={213,255,170},fillPattern=FillPattern.Solid,pattern=LinePattern.Solid,lineColor={0,0,0})}));
  end Building;

  BuildingSystems.Buildings.Ambient ambient(
   nSurfaces=building.nSurfacesAmbient,
   redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin weatherDataFile)
   annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
 Building building(
   calcIdealLoads=false,
   heatSources=true,
   nHeatSources=1,
   moistureSources=true,
   nMoistureSources=1,
   prescribedAirchange=false)
   annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
 Modelica.Blocks.Sources.Constant saunaOven(k=12000.0)
   annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={12,26})));
 Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatingSauna
   annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=270,origin={2,22})));
 BuildingSystems.HAM.HeatAndMoistureTransport.Sources.MoistureFlowPrescribed waterSauna
   annotation (Placement(transformation(extent={{-12,22},{-4,30}})));
 Modelica.Blocks.Sources.TimeTable waterTable(
   table=[0.0,0.0; 360.0,0.0; 360.0,0.03; 400.0, 0.03; 400.0,0.0012;1000.0,0.0024])
   annotation (Placement(transformation(extent={{-16,24},{-12,28}})));
 BaseClasses.RelationRadiationConvection relationRadiationConvection(
     radiationportion=0.5) annotation (Placement(transformation(
       extent={{-4,4},{4,-4}},
       rotation=-90,
       origin={2,16})));
equation
  connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts) annotation (Line(
   points={{-22,4},{-9,4}},
   color={0,255,0},
   smooth=Smooth.None));
 connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
   points={{-22,-4},{-9,-4}},
   color={85,170,255},
   smooth=Smooth.None));
 connect(saunaOven.y,heatingSauna. Q_flow) annotation (Line(
     points={{9.8,26},{2,26},{2,24}},
     color={0,0,127},
     smooth=Smooth.None));
 connect(waterSauna.moisturePort, building.moisturePorts[1]) annotation (Line(
     points={{-5.6,26},{-3,26},{-3,10}},
     color={120,0,120},
     smooth=Smooth.None));
 connect(waterTable.y, waterSauna.m_flow) annotation (Line(
     points={{-11.8,26},{-10.24,26}},
     color={0,0,127},
     smooth=Smooth.None));
 connect(relationRadiationConvection.heatPort, heatingSauna.port)
   annotation (Line(points={{2,17.2},{2,18.6},{2,20}}, color={191,0,0}));
 connect(relationRadiationConvection.heatPortCv, building.conHeatSourcesPorts[1])
   annotation (Line(points={{1.2,14.4},{1.2,12.2},{0,12.2},{0,10}}, color={191,
         0,0}));
 connect(relationRadiationConvection.heatPortLw, building.radHeatSourcesPorts[1])
   annotation (Line(points={{2.8,14.4},{2.8,12.2},{3,12.2},{3,10}}, color={191,0,0}));

  annotation(experiment(StartTime=0, StopTime=1000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/Sauna.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
    textString="Simulation of a heat up process of a sauna room")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates the heat up process of a sauna room (hygro-thermal room model) an adjacent anteroom (thermal room model).
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
end Sauna;
