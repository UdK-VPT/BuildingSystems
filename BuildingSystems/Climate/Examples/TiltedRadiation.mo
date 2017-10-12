within BuildingSystems.Climate.Examples;
model TiltedRadiation
  "Example which demonstrates the radiation calculation for tilted surfaces"
  extends Modelica.Icons.Example;
  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile)
    annotation(Placement(transformation(extent={{-94,50},{-82,62}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky
    radiationFixed(rhoAmb=0.2,
    angleDegL=0.0)
    annotation (Placement(transformation(extent={{-74,68},{-54,88}})));
  Modelica.Blocks.Sources.Constant angleDegTil(
    k=30.0)
    annotation (Placement(transformation(extent={{-96,82},{-88,90}})));
  Modelica.Blocks.Sources.Constant angleDegAzi(
    k=0.0)
    annotation (Placement(transformation(extent={{-96,68},{-88,76}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiationOneAxisTracked(
    rhoAmb=0.2, angleDegL=0.0,
    OneAxisTracking=true)
    annotation (Placement(transformation(extent={{-74,24},{-54,44}})));
equation
  connect(weatherData.y[1], radiationFixed.IrrDirHor) annotation (Line(
      points={{-81.4,56},{-76,56},{-76,84},{-71.6,84}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(weatherData.y[2], radiationFixed.IrrDifHor) annotation (Line(
      points={{-81.4,56},{-76,56},{-76,80},{-71.6,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(angleDegTil.y, radiationFixed.angleDegTil) annotation (Line(points={{-87.6,
          86},{-84,86},{-84,76},{-71.6,76}}, color={0,0,127}));
  connect(angleDegAzi.y, radiationFixed.angleDegAzi)
    annotation (Line(points={{-87.6,72},{-71.6,72}}, color={0,0,127}));
  connect(weatherData.latitudeDeg, radiationFixed.latitudeDeg) annotation (Line(
        points={{-81.4,61.4},{-78,61.4},{-78,90},{-67.8,90},{-67.8,85.6}},
        color={0,0,127}));
  connect(weatherData.longitudeDeg, radiationFixed.longitudeDeg) annotation (
      Line(points={{-81.4,60.2},{-78,60.2},{-78,90},{-64,90},{-64,85.6}}, color=
         {0,0,127}));
  connect(weatherData.longitudeDeg0, radiationFixed.longitudeDeg0) annotation (
      Line(points={{-81.4,59},{-78,59},{-78,90},{-60,90},{-60,85.6}}, color={0,0,
          127}));
  connect(weatherData.latitudeDeg, radiationOneAxisTracked.latitudeDeg)
    annotation (Line(points={{-81.4,61.4},{-67.8,61.4},{-67.8,41.6}}, color={0,0,
          127}));
  connect(weatherData.longitudeDeg, radiationOneAxisTracked.longitudeDeg)
    annotation (Line(points={{-81.4,60.2},{-64,60.2},{-64,41.6}}, color={0,0,127}));
  connect(weatherData.longitudeDeg0, radiationOneAxisTracked.longitudeDeg0)
    annotation (Line(points={{-81.4,59},{-60,59},{-60,41.6}}, color={0,0,127}));
  connect(weatherData.y[1], radiationOneAxisTracked.IrrDirHor) annotation (Line(
        points={{-81.4,56},{-76,56},{-76,40},{-71.6,40}}, color={0,0,127}));
  connect(weatherData.y[2], radiationOneAxisTracked.IrrDifHor) annotation (Line(
        points={{-81.4,56},{-76,56},{-76,36},{-71.6,36}}, color={0,0,127}));
  connect(angleDegAzi.y, radiationOneAxisTracked.angleDegAzi) annotation (Line(
        points={{-87.6,72},{-78,72},{-78,28},{-71.6,28}}, color={0,0,127}));

  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{-20,100}}), graphics={
    Text(extent={{-34,-6},{-90,32}},lineColor={0,0,255},fontSize=22,
          textString="Solar radiation calculation for
 two tilted surfaces: The first surface
has a fixed tilt angle, the second
surface is 1 axis tracked ")}),
  experiment(StartTime=0.0, StopTime=3.1536e+007),
  __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Climate/Examples/TiltedRadiation.mos" "Simulate and plot"),
Documentation(info="<html>
<p>
This example demonstrates the radiaton calculation for tilted surfaces.
</p>
</html>", revisions="<html>
<ul>
<li>
September 5, 2017, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end TiltedRadiation;
