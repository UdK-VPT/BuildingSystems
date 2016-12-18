within BuildingSystems.Buildings.Examples;
model Building1Zone0D
  "Low-order thermal building model under real weather data"
  extends Modelica.Icons.Example;
  // building1 with ideal load calculation
  BuildingSystems.Buildings.Ambient ambient1(
    nSurfaces=building1.nSurfacesAmbient,
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin weatherDataFile)
      annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D building1(
    AAmb=1000,
    AInn=500,
    AGro=200,
    nWindows=1,
    AWin={100},
    VAir=2000,
    CAmb=100000,
    CInn=100000,
    CGro=100000)
    annotation (Placement(transformation(extent={{-10,20},{10,40}})));
  Modelica.Blocks.Sources.Constant TSetCooling(
    k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={32,40})));
  Modelica.Blocks.Sources.Constant TSetHeating(
    k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={40,46})));
  Modelica.Blocks.Sources.Constant airchange1(
    k=0.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={24,34})));
  // building2 with free floating temperature calculation
  BuildingSystems.Buildings.Ambient ambient2(
    nSurfaces=building2.nSurfacesAmbient,
    weatherDataFile=BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin())
    annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D building2(
    AAmb=1000,
    AInn=500,
    AGro=200,
    nWindows=1,
    AWin={100},
    VAir=2000,
    CAmb=100000,
    CInn=100000,
    CGro=100000,
    calcIdealLoads=false)
    annotation (Placement(transformation(extent={{-10,-28},{10,-8}})));
  Modelica.Blocks.Sources.Constant airchange2(
    k=0.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={24,-14})));
equation
  connect(ambient1.toSurfacePorts, building1.toAmbientSurfacesPorts)
    annotation (Line(
      points={{-22,34},{-9,34}},
      color={0,255,0},
      smooth=Smooth.None));
  connect(ambient1.TAirRef, building1.TAirAmb) annotation (Line(
      points={{-38.2,37},{-40,37},{-40,42},{6.2,42},{6.2,39.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient1.xAir, building1.xAirAmb) annotation (Line(
      points={{-38.2,35},{-42,35},{-42,44},{8.4,44},{8.4,39.8}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building1.airchange[1], airchange1.y) annotation (Line(
      points={{9.8,34},{21.8,34}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient1.toAirPorts, building1.toAmbientAirPorts) annotation (Line(
      points={{-22,26},{-9,26}},
      color={85,170,255},
      smooth=Smooth.None));
  connect(building1.T_setHeating[1], TSetHeating.y) annotation (Line(
      points={{9.8,38},{16,38},{16,46},{37.8,46}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building1.T_setCooling[1], TSetCooling.y) annotation (Line(
      points={{9.8,36},{18,36},{18,40},{29.8,40}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient2.toSurfacePorts, building2.toAmbientSurfacesPorts)
    annotation (Line(
      points={{-22,-14},{-9,-14}},
      color={0,255,0},
      smooth=Smooth.None));
  connect(ambient2.TAirRef, building2.TAirAmb) annotation (Line(
      points={{-38.2,-11},{-40,-11},{-40,-6},{6.2,-6},{6.2,-8.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient2.xAir, building2.xAirAmb) annotation (Line(
      points={{-38.2,-13},{-42,-13},{-42,-4},{8.4,-4},{8.4,-8.2}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(building2.airchange[1],airchange2. y) annotation (Line(
      points={{9.8,-14},{21.8,-14}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient2.toAirPorts, building2.toAmbientAirPorts) annotation (Line(
      points={{-22,-22},{-9,-22}},
      color={85,170,255},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=31536000,Interval=3600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/Building1Zone0D.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={
    Text(extent={{-52,-20},{52,-88}}, lineColor={0,0,255},textString="Low-order thermal building model under real weather data"),
    Text(extent={{-40,42},{0,-12}}, lineColor={0,0,255},textString="Variant 1: ideal load calculation"),
    Text(extent={{-41,6},{17,-74}},lineColor={0,0,255},textString="Variant 2: free floating temperature calculation")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates the ideal heating and cooling load (building1) and the free floating temperature (building2).
based on a low-order building model
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
end Building1Zone0D;
