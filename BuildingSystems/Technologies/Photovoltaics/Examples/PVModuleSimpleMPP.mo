within BuildingSystems.Technologies.Photovoltaics.Examples;
model PVModuleSimpleMPP
  "Example of a MPP controlled PV generator based on a simplified PV module model"
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.Photovoltaics.PVModules.PVModuleSimpleMPP pvField(
    nModPar = 3,
    nModSer = 10,
    redeclare BuildingSystems.Technologies.Photovoltaics.Data.PhotovoltaicModules.TSM230PC05 pvModuleData,
    angleDegTil=30.0,
    angleDegAzi=0.0)
    annotation (Placement(transformation(extent={{-56,34},{-36,54}})));
  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile)
    annotation(Placement(transformation(extent={{-94,54},{-82,66}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    latitudeDeg = weatherData.latitudeDeg,
    longitudeDeg = weatherData.longitudeDeg,
    longitudeDeg0 = weatherData.longitudeDeg0,
    rhoAmb = 0.2,
    angleDegL = 0.0)
    annotation (Placement(transformation(extent={{-74,68},{-54,88}})));
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation (Placement(transformation(extent={{-72,56},{-64,64}})));
equation
  connect(weatherData.y[1],radiation.IrrDirHor) annotation (Line(
      points={{-81.4,59.4857},{-76,59.4857},{-76,84},{-71.6,84}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(weatherData.y[2],radiation.IrrDifHor) annotation (Line(
      points={{-81.4,59.6571},{-76,59.6571},{-76,80},{-71.6,80}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weatherData.y[3],from_degC.u) annotation (Line(
      points={{-81.4,59.8286},{-76,59.8286},{-76,60},{-72.8,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(radiation.radiationPort, pvField.radiationPort)
    annotation (Line(
      points={{-56,77.8},{-48,77.8},{-48,52}},
      color={255,255,0},
      smooth=Smooth.None));
  connect(pvField.TAmb, from_degC.y) annotation (Line(
      points={{-44,52},{-44,60},{-63.6,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pvField.angleDegTil, radiation.angleDegTil) annotation (Line(
    points={{-52,52},{-52,52},{-76,52},{-76,76},{-71.6,76}}, color={0,0,127}));
  connect(pvField.angleDegAzi, radiation.angleDegAzi) annotation (Line(
    points={{-52,50},{-52,50},{-76,50},{-76,72},{-71.6,72}}, color={0,0,127}));

  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{-20,100}}), graphics={
    Text(extent={{-62,22},{-62,18}},lineColor={0,0,255},fontSize=22,
    textString="PV generator with 3 parallel and
    10 serial connected
    and MPP controlled PV modules
    (1 diode model)
    under real weather data")}),
    experiment(StartTime=0.0, StopTime=3.1536e+007),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/Photovoltaics/Examples/PVModuleSimpleMPP.mos" "Simulate and plot"),
Documentation(info="<html>
<p> This example tests the implementation of
<a href=\"modelica://BuildingSystems.Technologies.Photovoltaics.PVModuleSimpleMPP\">
BuildingSystems.Technologies.Photovoltaics.PVModuleSimpleMPP</a>.
</p>
</html>", revisions="<html>
<ul>
<li>
March 7, 2015, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end PVModuleSimpleMPP;
