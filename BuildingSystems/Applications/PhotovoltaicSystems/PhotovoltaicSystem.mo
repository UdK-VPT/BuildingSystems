within BuildingSystems.Applications.PhotovoltaicSystems;
model PhotovoltaicSystem
  "PV system for a private household with an electrical house battery"
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.Photovoltaics.PVModules.PVModuleSimpleMPP pvField(
    redeclare BuildingSystems.Technologies.Photovoltaics.Data.PhotovoltaicModules.TSM230PC05 pvModuleData,
    angleDegTil_constant=30.0,
    angleDegAzi_constant=0.0,
    nModPar=2,
    nModSer=5)
    annotation (Placement(transformation(extent={{-56,34},{-36,54}})));
  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.Germany_Berlin_NetCDF)
    annotation(Placement(transformation(extent={{-86,72},{-74,84}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    rhoAmb = 0.2,
    angleDegL = 0.0)
    annotation (Placement(transformation(extent={{-66,60},{-54,72}})));
  BuildingSystems.Technologies.ElectricalStorages.BatterySimple battery(
    redeclare Technologies.ElectricalStorages.Data.LeadAcid.LeadAcidGeneric batteryData,
    nBat=3)
    annotation (Placement(transformation(extent={{-30,42},{-10,62}})));
  BoundaryConditions.LoadProfiles.Electrical.VDEW_H0_NRW_Jul2016 SLP_July
    annotation (Placement(transformation(extent={{46,46},{34,58}})));
  Modelica.Blocks.Math.Gain load(k=3000/1000)
    annotation (Placement(transformation(extent={{26,46},{14,58}})));
  Modelica.Blocks.Continuous.Integrator EField(y(displayUnit="kWh"))
    "Generated electricity by the PV field"
    annotation (Placement(transformation(extent={{-36,76},{-28,84}})));
  Modelica.Blocks.Continuous.Integrator EGrid(y(displayUnit="kWh"))
    "Electricty taken from the grid"
    annotation (Placement(transformation(extent={{-8,76},{0,84}})));
  Modelica.Blocks.Continuous.Integrator Eload(y(displayUnit="kWh"))
    "Electricty demand"
    annotation (Placement(transformation(extent={{14,76},{22,84}})));
equation
  connect(radiation.radiationPort, pvField.radiationPort)
    annotation (Line(points={{-55.2,65.88},{-46,65.88},{-46,52}},color={255,255,0},smooth=Smooth.None));
  connect(pvField.angleDegTil, radiation.angleDegTil) annotation (Line(
    points={{-52,52},{-70,52},{-70,64.8},{-64.56,64.8}}, color={0,0,127}));
  connect(pvField.angleDegAzi, radiation.angleDegAzi) annotation (Line(
    points={{-52,50},{-68,50},{-68,62.4},{-64.56,62.4}}, color={0,0,127}));
  connect(pvField.PField, battery.PCharge)
    annotation (Line(points={{-40,52},{-25,52}}, color={0,0,127}));
  connect(load.u, SLP_July.y)
    annotation (Line(points={{27.2,52},{33.4,52}}, color={0,0,127}));
  connect(battery.PLoad, load.y)
    annotation (Line(points={{-15,52},{13.4,52}}, color={0,0,127}));
  connect(pvField.PField, EField.u) annotation (Line(points={{-40,52},{-40,52},{
          -40,80},{-36.8,80}}, color={0,0,127}));
  connect(battery.PGrid, EGrid.u) annotation (Line(points={{-14.6,56},{-12,56},{
          -12,80},{-8.8,80}}, color={0,0,127}));
  connect(load.y, Eload.u) annotation (Line(points={{13.4,52},{10,52},{10,80},{13.2,
          80}}, color={0,0,127}));
  connect(weatherData.latitudeDeg, radiation.latitudeDeg) annotation (Line(
          points={{-73.4,83.4},{-70,83.4},{-70,82},{-62.28,82},{-62.28,70.56}},
          color={0,0,127}));
  connect(weatherData.longitudeDeg, radiation.longitudeDeg) annotation (Line(
          points={{-73.4,82.2},{-70,82.2},{-70,82},{-60,82},{-60,70.56}}, color={0,
            0,127}));
  connect(weatherData.longitudeDeg0, radiation.longitudeDeg0) annotation (Line(
          points={{-73.4,81},{-70,81},{-70,82},{-57.6,82},{-57.6,70.56}}, color={0,
            0,127}));
  connect(weatherData.TAirRef, pvField.TAmb) annotation (Line(points={{-84.2,71.4},
          {-84.2,56},{-44,56},{-44,52}}, color={0,0,127}));
  connect(weatherData.IrrDirHor, radiation.IrrDirHor) annotation (Line(points={{
          -81.8,71.4},{-81.8,69.6},{-64.56,69.6}}, color={0,0,127}));
  connect(weatherData.IrrDifHor, radiation.IrrDifHor) annotation (Line(points={{
          -80.6,71.4},{-80.6,67.2},{-64.56,67.2}}, color={0,0,127}));

  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{60,100}}),                                                                     graphics={Text(
    extent={{-86,44},{20,-2}},lineColor={0,0,255},
    textString="PV system for a private household with an electrical house battery")}),
    experiment(StartTime=15721200, StopTime=18399600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/PhotovoltaicSystems/PhotovoltaicSystem.mos" "Simulate and plot"),
Documentation(info="<html>
<p> Example that simulates a photovoltaic system for a private household in Germany in summer (July). The system
has a PV generator of 2.3 kWpeak and an electrical battery pack with 3 x 2.88 kWh. The household has a yearly electricty demand
of 3000 kWh, whereby the electrical load is distributed over the German standard load profile (SLP) for residential buildings.
</p>
</html>", revisions="<html>
<ul>
<li>
June 14, 2018, by Christoph Nytsch-Geusen:<br/>
Adaptation to the new interfaces of the weather data reader.
</li>
<li>
July 5, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end PhotovoltaicSystem;
