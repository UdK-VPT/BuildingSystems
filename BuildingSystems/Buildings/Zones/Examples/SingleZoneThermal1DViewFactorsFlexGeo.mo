within BuildingSystems.Buildings.Zones.Examples;
model SingleZoneThermal1DViewFactorsFlexGeo
  "Thermal zone model with geometrical view factor calculution and a flexible zone geometry"
  extends Modelica.Icons.Example;
  // Vertices and surfaces of the zone
  parameter Modelica.Units.SI.Length vertex1[3] = {0.0,0.0,0.0};
  parameter Modelica.Units.SI.Length vertex2[3] = {3.0,0.0,0.0};
  Modelica.Units.SI.Length vertex3[3] = {3.0,0.0,flexibleHeight.y};
  Modelica.Units.SI.Length vertex4[3] = {0.0,0.0,flexibleHeight.y};
  parameter Modelica.Units.SI.Length vertex5[3] = {0.0,3.0,0.0};
  parameter Modelica.Units.SI.Length vertex6[3] = {3.0,3.0,0.0};
  Modelica.Units.SI.Length vertex7[3] = {3.0,3.0,flexibleHeight.y};
  Modelica.Units.SI.Length vertex8[3] = {0.0,3.0,flexibleHeight.y};
  // 1: surface wall1 = vertex1, vertex5, vertex7, vertex4
  // 2: surface wall2 = vertex5, vertex6, vertex7, vertex8
  // 3: surface wall3 = vertex6, vertex2, vertex3, vertex7
  // 4: surface wall4 = vertex4, vertex3, vertex2, vertex1
  // 5: surface floor = vertex1, vertex2, vertex6, vertex5
  // 6: surface ceiling = vertex8, vertex7, vertex3, vertex4

  // View factor calculation
  parameter Integer nRect = 6;
  Real a1[nRect] = {vertex1[1],vertex5[1],vertex6[1],vertex4[1],vertex1[1],vertex8[1]};
  Real a2[nRect] = {vertex1[2],vertex5[2],vertex6[2],vertex4[2],vertex1[2],vertex8[2]};
  Real a3[nRect] = {vertex1[3],vertex5[3],vertex6[3],vertex4[3],vertex1[3],vertex8[3]};
  Real b1[nRect] = {vertex5[1],vertex6[1],vertex2[1],vertex3[1],vertex2[1],vertex7[1]};
  Real b2[nRect] = {vertex5[2],vertex6[2],vertex2[2],vertex3[2],vertex2[2],vertex7[2]};
  Real b3[nRect] = {vertex5[3],vertex6[3],vertex2[3],vertex3[3],vertex2[3],vertex7[3]};
  Real c1[nRect] = {vertex7[1],vertex7[1],vertex3[1],vertex2[1],vertex6[1],vertex3[1]};
  Real c2[nRect] = {vertex7[2],vertex7[2],vertex3[2],vertex2[2],vertex6[2],vertex3[2]};
  Real c3[nRect] = {vertex7[3],vertex7[3],vertex3[3],vertex2[3],vertex6[3],vertex3[3]};
  Real d1[nRect] = {vertex4[1],vertex8[1],vertex7[1],vertex1[1],vertex5[1],vertex4[1]};
  Real d2[nRect] = {vertex4[2],vertex8[2],vertex7[2],vertex1[2],vertex5[2],vertex4[2]};
  Real d3[nRect] = {vertex4[3],vertex8[3],vertex7[3],vertex1[3],vertex5[3],vertex4[3]};
  parameter Integer r[nRect] = {1,1,1,1,1,1};
  parameter Integer z[nRect]={2 for i in 1:nRect};
  Modelica.Blocks.Sources.RealExpression viewFac[nRect,nRect](
    y=BuildingSystems.Buildings.Geometries.Viewfactors.Functions.PhiRect(nRect,a1,a2,a3,b1,b2,b3,c1,c2,c3,d1,d2,d3,r,z,true))
    annotation (Placement(transformation(extent={{-54,2},{-46,10}})));

  // wall1: west orientation
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall1(
    geometryType=BuildingSystems.Buildings.Types.GeometryType.Flexible,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-30,0})));
  // wall2: north orientation
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall2(
    geometryType=BuildingSystems.Buildings.Types.GeometryType.Flexible,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,16})));
  // wall3: east orientation
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall3(
    geometryType=BuildingSystems.Buildings.Types.GeometryType.Flexible,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{24,-10},{44,10}})));
  // wall4: south orientation
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall4(
    geometryType=BuildingSystems.Buildings.Types.GeometryType.Flexible,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionData,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-18,-20})));
  BuildingSystems.Buildings.Ambience ambience(
    redeclare block WeatherData =
        BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII,
    nSurfaces=6)
    annotation (Placement(transformation(extent={{-62,-18},{-42,2}})));
  BuildingSystems.Buildings.Zones.ZoneTemplateAirvolumeMixed zone(
    geometryType=BuildingSystems.Buildings.Types.GeometryType.Flexible,
    height=3.0,
    calcIdealLoads=true,
    viewFacCalcType=BuildingSystems.Buildings.Types.ViewFactorCalculationType.Input,
    nConstructions=6)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2 annotation (
    Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={-18,26})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface3
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={42,0})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface4
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={-18,-28})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=180,origin={-38,0})));
  Modelica.Blocks.Sources.Constant TSetHeating(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-20,6},{-18,8}})));
  Modelica.Blocks.Sources.Constant TSetCooling(
    k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{-18,4},{-16,6}})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes ceiling(
    geometryType=BuildingSystems.Buildings.Types.GeometryType.Fixed,
    position={1.5,1.5,3.0},
    height=3.0,
    width=3.0,
    redeclare Data.Constructions.Thermal.ConstructionStandard constructionData,
    angleDegAzi=0.0,
    angleDegTil=180.0,
    nNodes={2,2})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,18})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface6
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={20,26})));
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes floor(
    geometryType=BuildingSystems.Buildings.Types.GeometryType.Fixed,
    position={1.5,1.5,0.0},
    height=3.0,
    width=3.0,
    angleDegAzi=0.0,
    redeclare Data.Constructions.Thermal.ConstructionStandard constructionData,
    angleDegTil=0.0,
    nNodes={2,2}) annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-20})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface5
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=270,origin={20,-28})));
  Modelica.Blocks.Sources.Constant airchange1(
    k=0.5)
    annotation (Placement(transformation(extent={{1,-1},{-1,1}},rotation=180,origin={-17,-3})));
  Modelica.Blocks.Sources.Constant const(k=0.0)
    annotation (Placement(transformation(extent={{-52,12},{-46,18}})));
  Modelica.Blocks.Sources.Constant const1(k=90.0)
    annotation (Placement(transformation(extent={{-52,22},{-46,28}})));
  Modelica.Blocks.Sources.Constant const2(k=3.0)
    annotation (Placement(transformation(extent={{-52,32},{-46,38}})));
  Modelica.Blocks.Sources.RealExpression flexibleHeight(
    y=2.5 + 0.5*sin(time/86400*2*Modelica.Constants.pi))
    annotation (Placement(transformation(extent={{-58,-44},{-48,-32}})));
  Modelica.Blocks.Sources.Constant posWall3[3]
    (k={0.0,0.0,1.5})
    annotation (Placement(transformation(extent={{54,8},{48,14}})));
  Modelica.Blocks.Sources.Constant posWall4[3](
    k={3.0,1.5,1.5})
    annotation (Placement(transformation(extent={{4,-28},{-2,-22}})));
  Modelica.Blocks.Sources.Constant posWall1[3](
    k={0.0,1.5,1.5})
    annotation (Placement(transformation(extent={{-52,-26},{-46,-20}})));
  Modelica.Blocks.Sources.Constant posWall2[3](
    k={0.0,3.0,1.5})
    annotation (Placement(transformation(extent={{-20,32},{-26,38}})));
  Modelica.Blocks.Sources.Constant aziWall1(
    k=90.0)
    annotation (Placement(transformation(extent={{-66,32},{-60,38}})));
  Modelica.Blocks.Sources.Constant aziWall2(
    k=180.0)
    annotation (Placement(transformation(extent={{-66,22},{-60,28}})));
  Modelica.Blocks.Sources.Constant aziWall3(
    k=-90.0)
    annotation (Placement(transformation(extent={{-66,12},{-60,18}})));
  Modelica.Blocks.Sources.Constant aziWall4(
    k=0.0)
    annotation (Placement(transformation(extent={{-66,2},{-60,8}})));
  Modelica.Blocks.Sources.RealExpression flexibleVolume(
    y=3.0*3.0*flexibleHeight.y)
    annotation (Placement(transformation(extent={{-58,-52},{-48,-40}})));
  Modelica.Blocks.Sources.Constant posZone[3]
    (k={1.5,1.5,1.5})
    annotation (Placement(transformation(extent={{-2,16},{-8,22}})));
equation
  connect(surface1.toAirPort, ambience.toAirPorts[1])
    annotation (Line(
      points={{-38.6,4},{-38.6,-13.6667},{-43,-13.6667}},
      color={85,170,255},
      smooth=Smooth.None));
  connect(surface2.toAirPort, ambience.toAirPorts[2]) annotation (Line(
      points={{-14,26.6},{-14,30},{-43,30},{-43,-13}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface4.toAirPort, ambience.toAirPorts[4])
    annotation (Line(
      points={{-22,-28.6},{-22,-32},{-43,-32},{-43,-11.6667}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface3.toAirPort, ambience.toAirPorts[3])
    annotation (Line(
      points={{42.6,-4},{44,-4},{44,-32},{-43,-32},{-43,-12.3333}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface6.toAirPort, ambience.toAirPorts[6]) annotation (Line(
      points={{24,26.6},{24,30},{-43,30},{-43,-10.3333}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface5.toAirPort, ambience.toAirPorts[5]) annotation (Line(
      points={{16,-28.6},{16,-32},{-43,-32},{-43,-11}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface2.toSurfacesPort, ambience.toSurfacePorts[2]) annotation (Line(
      points={{-22,26.6},{-22,30},{-43,30},{-43,-5}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface3.toSurfacesPort, ambience.toSurfacePorts[3])
    annotation (Line(
      points={{42.6,4},{44,4},{44,30},{-43,30},{-43,-4.33333}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface1.toSurfacesPort, ambience.toSurfacePorts[1])
    annotation (Line(
      points={{-38.6,-4},{-43,-4},{-43,-5.66667}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface4.toSurfacesPort, ambience.toSurfacePorts[4])
    annotation (Line(
      points={{-14,-28.6},{-14,-32},{-43,-32},{-43,-3.66667}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface6.toSurfacesPort, ambience.toSurfacePorts[6])
    annotation (Line(points={{16,26.6},{16,30},{-43,30},{-43,-2.33333}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
 connect(surface5.toSurfacesPort, ambience.toSurfacePorts[5])
   annotation (Line(points={{24,-28.6},{24,-32},{-43,-32},{-43,-3}},      color={0,0,0}));
  connect(surface3.toConstructionPort, wall3.toSurfacePort_2)
    annotation (Line(
      points={{41.4,0},{36,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface2.toConstructionPort, wall2.toSurfacePort_2) annotation (Line(
      points={{-18,25.4},{-18,18}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface1.toConstructionPort, wall1.toSurfacePort_2) annotation (Line(
      points={{-37.4,0},{-32,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface4.toConstructionPort, wall4.toSurfacePort_2) annotation (Line(
      points={{-18,-27.4},{-18,-22}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface5.toConstructionPort, floor.toSurfacePort_2) annotation (Line(
      points={{20,-27.4},{20,-22}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ceiling.toSurfacePort_2, surface6.toConstructionPort) annotation (
      Line(
      points={{20,20},{20,25.4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(TSetCooling.y, zone.T_setCooling) annotation (Line(
      points={{-15.9,5},{-11,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetHeating.y, zone.T_setHeating) annotation (Line(
      points={{-17.9,7},{-11,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambience.TAirRef, zone.TAirAmb) annotation (Line(
      points={{-61,-1},{-64,-1},{-64,-30},{-26,-30},{-26,-4},{-11,-4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambience.xAir, zone.xAirAmb) annotation (Line(
      points={{-61,-3},{-64,-3},{-64,-30},{-26,-30},{-26,-8},{-11,-8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(airchange1.y, zone.airchange) annotation (Line(
      points={{-15.9,-3},{-12,-3},{-12,-2},{-11,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(wall2.toSurfacePort_1, zone.toConstructionPorts[2]) annotation (Line(
        points={{-18,14},{-18,12},{0,12},{0,-0.5}}, color={0,0,0}));
  connect(ceiling.toSurfacePort_1, zone.toConstructionPorts[6])
    annotation (Line(points={{20,16},{20,12},{0,12},{0,0.833333}},
                                                               color={0,0,0}));
  connect(wall1.toSurfacePort_1, zone.toConstructionPorts[1]) annotation (Line(
        points={{-28,-8.88178e-16},{-14,-8.88178e-16},{-14,-0.833333},{0,-0.833333}},
                                                       color={0,0,0}));
  connect(wall3.toSurfacePort_1, zone.toConstructionPorts[3])
    annotation (Line(points={{32,0},{16,0},{16,-0.166667},{0,-0.166667}},
                                                               color={0,0,0}));
  connect(wall4.toSurfacePort_1, zone.toConstructionPorts[4]) annotation (Line(
        points={{-18,-18},{-18,-12},{0,-12},{0,0.166667}},
                                                      color={0,0,0}));
  connect(floor.toSurfacePort_1, zone.toConstructionPorts[5]) annotation (Line(
        points={{20,-18},{20,-12},{0,-12},{0,0.5}}, color={0,0,0}));
  connect(const.y, wall2.AInnSur_in) annotation (Line(points={{-45.7,15},{-36,15},
          {-36,12},{-12,12},{-12,14}}, color={0,0,127}));
  connect(const.y, wall4.AInnSur_in) annotation (Line(points={{-45.7,15},{-36,15},
          {-36,12},{-24,12},{-24,-18}}, color={0,0,127}));
  connect(const.y, wall1.AInnSur_in) annotation (Line(points={{-45.7,15},{-36,15},
          {-36,12},{-24,12},{-24,6},{-28,6}}, color={0,0,127}));
  connect(const.y, wall3.AInnSur_in) annotation (Line(points={{-45.7,15},{-38,15},
          {-38,16},{-36,16},{-36,12},{28,12},{28,-6},{32,-6}}, color={0,0,127}));
  connect(wall2.angleDegTil_in, const1.y) annotation (Line(points={{-16,18.2},{-16,
          20},{-34,20},{-34,26},{-38,26},{-38,25},{-45.7,25}}, color={0,0,127}));
  connect(const1.y, wall1.angleDegTil_in) annotation (Line(points={{-45.7,25},{-34,
          25},{-34,2},{-32.2,2}}, color={0,0,127}));
  connect(const1.y, wall3.angleDegTil_in) annotation (Line(points={{-45.7,25},{38,
          25},{38,-2},{36.2,-2}}, color={0,0,127}));
  connect(const1.y, wall4.angleDegTil_in) annotation (Line(points={{-45.7,25},{-34,
          25},{-34,-24},{-20,-24},{-20,-22.2}}, color={0,0,127}));
  connect(const2.y, wall1.width_in) annotation (Line(points={{-45.7,35},{-34,35},
          {-34,10},{-26,10},{-26,2},{-28,2}}, color={0,0,127}));
  connect(const2.y, wall4.width_in) annotation (Line(points={{-45.7,35},{-36,35},
          {-36,12},{-20,12},{-20,-18}}, color={0,0,127}));
  connect(const2.y, wall2.width_in) annotation (Line(points={{-45.7,35},{-40,35},
          {-40,36},{-34,36},{-34,12},{-16,12},{-16,14}}, color={0,0,127}));
  connect(const2.y, wall3.width_in) annotation (Line(points={{-45.7,35},{-40,35},
          {-40,36},{-34,36},{-34,30},{28,30},{28,-2},{32,-2}}, color={0,0,127}));
  connect(flexibleHeight.y, wall1.height_in) annotation (Line(points={{-47.5,-38},
          {-26,-38},{-26,4},{-28,4}}, color={0,0,127}));
  connect(flexibleHeight.y, wall4.height_in) annotation (Line(points={{-47.5,-38},
          {-26,-38},{-26,-16},{-22,-16},{-22,-18}}, color={0,0,127}));
  connect(flexibleHeight.y, wall3.height_in) annotation (Line(points={{-47.5,-38},
          {28,-38},{28,-4},{32,-4}}, color={0,0,127}));
  connect(flexibleHeight.y, wall2.height_in) annotation (Line(points={{-47.5,-38},
          {-26,-38},{-26,10},{-14,10},{-14,14}}, color={0,0,127}));
  connect(posWall3.y, wall3.position_in) annotation (Line(points={{47.7,11},{38,
          11},{38,2},{36.2,2}}, color={0,0,127}));
  connect(posWall4.y, wall4.position_in) annotation (Line(points={{-2.3,-25},{-16,
          -25},{-16,-22.2}}, color={0,0,127}));
  connect(posWall1.y, wall1.position_in) annotation (Line(points={{-45.7,-23},{-36,
          -23},{-36,-2},{-32.2,-2}}, color={0,0,127}));
  connect(posWall2.y, wall2.position_in) annotation (Line(points={{-26.3,35},{-30,
          35},{-30,20},{-20,20},{-20,18.2}}, color={0,0,127}));
  connect(aziWall1.y, wall1.angleDegAzi_in) annotation (Line(points={{-59.7,35},
          {-56,35},{-56,10},{-36,10},{-36,4},{-32.2,4}}, color={0,0,127}));
  connect(aziWall2.y, wall2.angleDegAzi_in) annotation (Line(points={{-59.7,25},
          {-58,25},{-58,20},{-14,20},{-14,18.2}}, color={0,0,127}));
  connect(aziWall3.y, wall3.angleDegAzi_in) annotation (Line(points={{-59.7,15},
          {-58,15},{-58,34},{38,34},{38,-4},{36.2,-4}}, color={0,0,127}));
  connect(aziWall4.y, wall4.angleDegAzi_in) annotation (Line(points={{-59.7,5},{
          -58,5},{-58,6},{-56,6},{-56,10},{-36,10},{-36,-26},{-22,-26},{-22,-22.2}},
        color={0,0,127}));
  connect(flexibleVolume.y, zone.V_in) annotation (Line(points={{-47.5,-46},{-26,
          -46},{-26,0},{-11,0}}, color={0,0,127}));
  connect(posZone.y, zone.position_in) annotation (Line(points={{-8.3,19},{-8,19},
          {-8,12},{-14,12},{-14,2},{-11,2}}, color={0,0,127}));
  connect(viewFac.y, zone.ViewFac_in) annotation (Line(points={{-45.6,6},{-40,6},
          {-40,10},{-26,10},{-26,9},{-11,9}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=86400),
  __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Zones/Examples/SingleZoneThermal1DViewFactorsFlexGeo.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-70,-60},{60,40}}), graphics={
    Text(extent={{-54,-20},{50,-88}}, lineColor={0,0,255},
    textString="Thermal zone model where the zone height is changing over the time")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-70,-60},{60,40}})),
Documentation(info="<html>
<p>
Example that simulates a thermal zone model and some 1D-constructions elements
with a flexible geometry during runtime. For this purpose, the view factor
calculation takes place time dependent.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 14, 2022, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SingleZoneThermal1DViewFactorsFlexGeo;