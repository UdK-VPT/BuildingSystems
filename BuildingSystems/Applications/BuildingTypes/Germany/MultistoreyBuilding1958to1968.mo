within BuildingSystems.Applications.BuildingTypes.Germany;
model MultistoreyBuilding1958to1968
  "Example of a typical German multistorey building from 1958 to 1968 based on IWU building typology"
  extends Modelica.Icons.Example;

  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=building.nSurfacesAmbient,
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin weatherDataFile)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));

  BuildingSystems.Buildings.BuildingTemplates.Building1Zone1DDistrict building(
    heightWindow1=33.17,
    heightWindow2=33.03,
    heightWindow3=33.17,
    heightWindow4=33.03,
    widthWindow1=14.74,
    widthWindow2=14.68,
    widthWindow3=14.74,
    widthWindow4=14.68,
    calcIdealLoads=true,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.OuterWallMultistorey1958to1968 constructionWall4,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.RoofMultistorey1958to1968 constructionCeiling,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.BasePlateMultistorey1958to1968 constructionBottom,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.IntermediateWallMultistorey1958to1968 constructionWallsInterior,
    redeclare BuildingSystems.Buildings.Data.Constructions.Thermal.IntermediateCeilingMultistorey1958to1968 constructionCeilingsInterior,
    width=22.31,
    length=22.5,
    heightSto=2.83,
    nSto=22,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow1,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow2,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow3,
    redeclare BuildingSystems.Buildings.Data.Constructions.Transparent.DoubleGlazing constructionWindow4)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,14})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 100.0) // no heating demand calculation
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,6})));
  Modelica.Blocks.Sources.Constant airchange(k=0.5)
     annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={18,-2})));
equation
   connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts) annotation (Line(
    points={{-22,4},{-9,4}},
    color={0,255,0},
    smooth=Smooth.None));
  connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
    points={{-22,-4},{-9,-4}},
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

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/BuildingTypes/Germany/MultistoreyBuilding1958to1968.mos"
        "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
    textString="Example of a typical German multistorey building from 1958 to 1968 based on IWU building typology")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates the energy demand of a typical German multistorey building from 1958 to 1968 based on IWU building typology.
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
end MultistoreyBuilding1958to1968;
