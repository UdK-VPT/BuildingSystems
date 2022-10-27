within BuildingSystems.Buildings.Examples;
model BuildingThermal1Zone1DBox
  "1D-hermal box shaped building model with 1 zone with an overhang"
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces=building.nSurfacesAmbience,
    redeclare block WeatherData =
        BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DBox building(
    width=10,
    length=10,
    height=2.8,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionWall1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionWall2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionWall3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionWall4,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionCeiling,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionBottom,
    InteriorWalls=true,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionWallsInterior,
    InteriorCeilings=true,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.ConstructionStandard constructionCeilingsInterior,
    widthWindow1=0.0,
    heightWindow1=0.0,
    widthWindow2=2.0,
    heightWindow2=1.5,
    widthWindow3=0.0,
    heightWindow3=0.0,
    widthWindow4=2.0,
    heightWindow4=1.5,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal19 constructionWindow1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal19 constructionWindow2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal19 constructionWindow3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.HeatProtectionDoubleGlazingUVal19 constructionWindow4,
    BCWall1=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Adiabatic,
    BCWall3=BuildingSystems.Buildings.Types.ThermalBoundaryCondition.Constant,
    use_GSCWindow4_in=true,
    TWall3_constant=293.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant TSetHeating(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,14})));
  Modelica.Blocks.Sources.Constant TSetCooling(
    k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,6})));
  Modelica.Blocks.Sources.Constant airchange(
    k=0.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,-2})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature soilTemp(
    T=283.15)
    "Thermal boundary condition under the building (soil temperature)";
  Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky
    radiation annotation (Placement(transformation(extent={{-14,26},{-4,36}})));
  Constructions.Shadowing.OverhangElement overhang(
    depthOH=0.5,
    heightOH=0.1,
    heightWin=1.5)
    annotation (Placement(transformation(extent={{-6,22},{12,40}})));
  Modelica.Blocks.Sources.Constant angTil(
    k=90.0)
    annotation (Placement(transformation(extent={{-28,26},{-24,30}})));
  Modelica.Blocks.Sources.Constant angAzi(
    k=0.0)
    annotation (Placement(transformation(extent={{-22,22},{-18,26}})));
equation
  connect(soilTemp.port,building.toSolidHeatPorts[1]);
  connect(ambience.toSurfacePorts, building.toAmbienceSurfacesPorts) annotation (Line(
   points={{-21,4},{-20,4},{-20,8},{-20,11.3333},{-20,4},{-9,4}},
   color={0,255,0},smooth=Smooth.None));
  connect(ambience.toAirPorts, building.toAmbienceAirPorts) annotation (Line(
    points={{-21,-4},{-16,-4},{-16,-4},{-9,-4}},
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
  connect(building.TAirAmb, ambience.TAirRef) annotation (Line(
      points={{6.2,9.8},{6.2,12},{-40,12},{-40,7},{-39,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.xAirAmb, ambience.xAir) annotation (Line(
      points={{8.4,9.8},{8.4,14},{-42,14},{-42,5},{-39,5}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.airchange[1], airchange.y) annotation (Line(
      points={{9.8,4},{12,4},{12,-2},{15.8,-2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building.GSCWindow4_in, overhang.SC)
    annotation (Line(points={{3,5.4},{3,22.9}}, color={0,0,127}));
  connect(radiation.radiationPort, overhang.radiationPort_in)
    annotation (Line(points={{-5,31},{-0.6,31}}, color={0,0,0}));
  connect(angTil.y, radiation.angleDegTil) annotation (Line(points={{-23.8,28},{
          -18,28},{-18,30},{-12.8,30}}, color={0,0,127}));
  connect(ambience.IrrDirHor, radiation.IrrDirHor) annotation (Line(points={{-39,
          3},{-44,3},{-44,34},{-12.8,34}}, color={0,0,127}));
  connect(ambience.IrrDifHor, radiation.IrrDifHor) annotation (Line(points={{-39,
          1},{-44,1},{-44,32},{-12.8,32}}, color={0,0,127}));
  connect(ambience.latitudeDeg, radiation.latitudeDeg) annotation (Line(points={
          {-37,9},{-37,38},{-10.9,38},{-10.9,34.8}}, color={0,0,127}));
  connect(ambience.longitudeDeg, radiation.longitudeDeg) annotation (Line(
        points={{-35,9},{-35,40},{-9,40},{-9,34.8}}, color={0,0,127}));
  connect(ambience.longitudeDeg0, radiation.longitudeDeg0) annotation (Line(
        points={{-33,9},{-33,40},{-7,40},{-7,34.8}}, color={0,0,127}));
  connect(angAzi.y, radiation.angleDegAzi) annotation (Line(points={{-17.8,24},{
          -16,24},{-16,28},{-12.8,28}}, color={0,0,127}));
  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/BuildingThermal1Zone1DBox.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
    textString="Predefined 1D-Thermal building model with 1 zone")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a predefined thermal building model with 1 zone, based on 1D-discretized building elements.
The areas of window1 (included in wall1) and window3 (included in wall3) are set to zero. Further wall1 is definend
as an adiabatic wall and the outer surface temperature of wall3 is set to 20 degree Celsius. The soil
temperature under the building is set to 10 degree Celsius. window4 on the south facade is shaded by an horizontal overhang.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
<li>
June 30, 2017, by Christoph Nytsch-Geusen:<br/>
Introduction of an external shadowing coefficient.
</li>
<li>
October 22, 2019, by Christoph Nytsch-Geusen:<br/>
Horizontal overhang model added.
</li>
</ul>
</html>"));
end BuildingThermal1Zone1DBox;
