within BuildingSystems.Applications.PhotovoltaicSystems;
model PhotovoltaicSystem
  "PV system for a private household with a electrical house battery"
  extends Modelica.Icons.Example;
  BuildingSystems.Technologies.Photovoltaics.PVModules.PVModuleSimpleMPP pvField(
    redeclare BuildingSystems.Technologies.Photovoltaics.Data.PhotovoltaicModules.TSM230PC05 pvModuleData,
    angleDegTil=30.0,
    angleDegAzi=0.0,
    nModPar=2,
    nModSer=5)
    annotation (Placement(transformation(extent={{-56,34},{-36,54}})));
  BuildingSystems.Climate.WeatherData.WeatherDataNetcdf weatherData(
    redeclare Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin weatherDataFile)
    annotation(Placement(transformation(extent={{-94,54},{-82,66}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radiation(
    rhoAmb = 0.2,
    angleDegL = 0.0)
    annotation (Placement(transformation(extent={{-74,68},{-62,80}})));
  Modelica.Blocks.Math.UnitConversions.From_degC from_degC
    annotation (Placement(transformation(extent={{-72,56},{-64,64}})));
  Technologies.ElectricalStorages.BatterySimple battery(
    PLoadMax=3000,
    E_nominal=25200000,
    eta_nominal=0.95,
    chargeLevelMin=0.2)
    annotation (Placement(transformation(extent={{-30,42},{-10,62}})));
  BoundaryConditions.LoadProfiles.Electrical.VDEW_H0_NRW_Jul2016 SLP_July
    annotation (Placement(transformation(extent={{46,46},{34,58}})));
  Modelica.Blocks.Math.Gain load(k=3000/1000)
    annotation (Placement(transformation(extent={{26,46},{14,58}})));
  Modelica.Blocks.Continuous.Integrator EField(k=1/3600/1000)
    "Generated electricity by the PV field"
    annotation (Placement(transformation(extent={{-36,76},{-28,84}})));
  Modelica.Blocks.Continuous.Integrator EGrid(k=1/3600/1000)
    "Electricty taken from the grid"
    annotation (Placement(transformation(extent={{-8,76},{0,84}})));
  Modelica.Blocks.Continuous.Integrator Eload(k=1/3600/1000)
    "Electricty demand"
    annotation (Placement(transformation(extent={{14,76},{22,84}})));
equation
  connect(weatherData.y[1],radiation.IrrDirHor) annotation (Line(
      points={{-81.4,60},{-76,60},{-76,77.6},{-72.56,77.6}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(weatherData.y[2],radiation.IrrDifHor) annotation (Line(
      points={{-81.4,60},{-76,60},{-76,75.2},{-72.56,75.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(weatherData.y[3],from_degC.u) annotation (Line(
      points={{-81.4,60},{-72.8,60}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(radiation.radiationPort, pvField.radiationPort)
    annotation (Line(
      points={{-63.2,73.88},{-48,73.88},{-48,52}},
      color={255,255,0},
      smooth=Smooth.None));
  connect(pvField.TAmb, from_degC.y) annotation (Line(
      points={{-44,52},{-44,60},{-63.6,60}},
      color={0,0,0},
      smooth=Smooth.None));
  connect(pvField.angleDegTil, radiation.angleDegTil) annotation (Line(
    points={{-52,52},{-52,52},{-76,52},{-76,72.8},{-72.56,72.8}},color={0,0,127}));
  connect(pvField.angleDegAzi, radiation.angleDegAzi) annotation (Line(
    points={{-52,50},{-52,50},{-76,50},{-76,70.4},{-72.56,70.4}},color={0,0,127}));
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
          points={{-81.4,65.4},{-80,65.4},{-80,82},{-70.28,82},{-70.28,78.56}},
          color={0,0,127}));
  connect(weatherData.longitudeDeg, radiation.longitudeDeg) annotation (Line(
          points={{-81.4,64.2},{-80,64.2},{-80,82},{-68,82},{-68,78.56}}, color={0,
            0,127}));
  connect(weatherData.longitudeDeg0, radiation.longitudeDeg0) annotation (Line(
          points={{-81.4,63},{-80,63},{-80,82},{-65.6,82},{-65.6,78.56}}, color={0,
            0,127}));

  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,0},{60,100}},initialScale=0.1),                                                                     graphics={Text(
    extent={{-86,44},{20,-2}},lineColor={0,0,255},
    textString="PV system for a private household with a electrical house battery")}),
    experiment(StartTime=15721200, StopTime=18399600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/PhotovoltaicSystems/PhotovoltaicSystem.mos" "Simulate and plot"),
Documentation(info="<html>
<p> Example that simulates a photovoltaic system for a private household in Germany in summer (July). The system
has a PV generator of 2.3 kWpeak and an electrical battery of 7 kWh. The household has a yearly electricty demand
of 3000 kWh, whereby the electrical load is distributed over the German standard load profile (SLP) for residential buildings.
</p>
</html>", revisions="<html>
<ul>
<li>
July 5, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end PhotovoltaicSystem;
