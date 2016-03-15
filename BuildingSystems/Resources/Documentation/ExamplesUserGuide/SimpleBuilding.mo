within ;
model SimpleBuilding
 "User Guide of the BuildingSystems library Chapter 2: Simple Building"
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DBox building(
    width=9.0,
    length=9.0,
    height=3.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014 constructionWall1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014 constructionWall2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014 constructionWall3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallSingle2014 constructionWall4,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.RoofSingle2014 constructionCeiling,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.BasePlateSingle2014 constructionBottom,
    InteriorWalls=false,
    InteriorCeilings=true,
    widthWindow1=3 - 0,
    heightWindow1=1.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal14 constructionWindow1,
    widthWindow2=1.0,
    heightWindow2=1.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal14 constructionWindow2,
    widthWindow3=1.0,
    heightWindow3=1.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow3,
    widthWindow4=1.0,
    heightWindow4=1.0,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal14 constructionWindow4,
    nZones=1) 
    annotation (Placement(transformation(extent={{12,-10},{32,10}})));
  BuildingSystems.Buildings.Ambient ambient(
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin weatherDataFile, 
    nSurfaces=building.nSurfacesAmbient)
    annotation (Placement(transformation(extent={{-30,-10},{-10,10}})));
  Modelica.Blocks.Sources.Constant TSetHeating(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{56,20},{44,32}})));
  Modelica.Blocks.Sources.Constant TSetCooling(
    k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{70,10},{58,22}})));
  Modelica.Blocks.Sources.Constant airchange(
    k=0.5)
    annotation (Placement(transformation(extent={{56,-2},{44,10}})));
equation
  connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts)
    annotation (Line(points={{-12,4},{13,4}}, color={0,255,0}));
  connect(ambient.toAirPorts, building.toAmbientAirPorts)
    annotation (Line(points={{-12,-4},{13,-4}}, color={85,170,255}));
  connect(ambient.TAirRef, building.TAirAmb) annotation (Line(points={{-28.2,7},
          {-32,7},{-32,14},{28.2,14},{28.2,9.8}}, color={0,0,127}));
  connect(ambient.xAir, building.xAirAmb) annotation (Line(points={{-28.2,5},{
          -34,5},{-34,16},{30.4,16},{30.4,9.8}}, color={0,0,127}));
  connect(building.T_setHeating[1], TSetHeating.y) annotation (Line(points={{
          31.8,8},{36,8},{36,26},{40,26},{40,26},{43.4,26}}, color={0,0,127}));
  connect(building.T_setCooling[1], TSetCooling.y) annotation (Line(points={{
          31.8,6},{40,6},{40,16},{57.4,16}}, color={0,0,127}));
  connect(building.airchange[1], airchange.y)
    annotation (Line(points={{31.8,4},{43.4,4},{43.4,4}}, color={0,0,127}));
  
  annotation (experiment(StartTime=0, StopTime=31536000),
    Icon(coordinateSystem(preserveAspectRatio=false,extent={{-40,-20},{80,40}},initialScale=0.1)),
    Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-40,-20},{80,40}},initialScale=0.1)), 
    uses(Modelica(version="3.2.1"), BuildingSystems(version="0.1")));
end SimpleBuilding;
