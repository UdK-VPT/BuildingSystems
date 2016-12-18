within BuildingSystems.Applications.ClimateAnalyses;
model FreeFloatingTemperature
  "Free floating temperature within a building at different climate locations"
  extends Modelica.Icons.Example;

  model Location
    BuildingSystems.Buildings.Ambient ambient(
      nSurfaces=building.nSurfacesAmbient,
      nAirpathes=building.nAirpathes)
      annotation (Placement(transformation(extent={{-40,-28},{-20,-8}})));
    BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D building(
      AAmb=2.8*(4.0+4.0+6.0+6.0) + 4.0*6.0, // building shape: 4 m x 6 m x 2.8 m
      AInn=3.3*2.8*2.0,
      AGro=4.0*6.0,
      nWindows=1,
      AWin={2.0*1.6},
      VAir=4.0*6.0*2.8,
      CAmb=55347250.0,
      CInn=4435200.0,
      CGro=480000.0,
      UValAmb=1.0,
      UValInn=4.0,
      UValGro=1.0,
      UValWin={2.0},
      calcIdealLoads=false)
      annotation (Placement(transformation(extent={{-10,-28},{10,-8}})));

    Modelica.Blocks.Sources.Constant airchange(
      k=0.5)
      annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={24,-14})));
  equation
    connect(ambient.toSurfacePorts, building.toAmbientSurfacesPorts)
      annotation (Line(
        points={{-22,-14},{-9,-14}},
        color={0,255,0},
        smooth=Smooth.None));
    connect(ambient.toAirPorts, building.toAmbientAirPorts) annotation (Line(
        points={{-22,-22},{-9,-22}},
        color={85,170,255},
        smooth=Smooth.None));
    connect(ambient.toAirpathPorts, building.toAmbientAirpathPorts) annotation (
       Line(
        points={{-30,-10},{-30,0},{14,0},{14,-20},{11,-20}},
        color={0,0,255},
        smooth=Smooth.None));
    connect(ambient.TAirRef, building.TAirAmb) annotation (Line(
        points={{-38.2,-11},{-40,-11},{-40,-6},{6.2,-6},{6.2,-8.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(ambient.xAir, building.xAirAmb) annotation (Line(
        points={{-38.2,-13},{-42,-13},{-42,-4},{8.4,-4},{8.4,-8.2}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(building.airchange[1],airchange. y) annotation (Line(
        points={{9.8,-14},{21.8,-14}},
        color={0,0,127},
        smooth=Smooth.None));
    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-50,-50},{50,50}})), Icon(coordinateSystem(preserveAspectRatio=false, extent={{-50,-50},{50,50}}), graphics={
      Rectangle(extent={{-20,20},{20,-20}},lineColor={255,0,0},fillColor={255,0,0},fillPattern=FillPattern.Solid),
      Polygon(points={{-20,20},{0,40},{20,20},{-20,20}},lineColor={255,0,0},smooth=Smooth.None,fillColor={255,0,0},fillPattern=FillPattern.Solid),
      Text(extent={{-42,-16},{42,-38}},lineColor={0,0,255},fillColor={230,230,230},fillPattern=  FillPattern.Solid,textString= "%name")}));
  end Location;

  //Location AmundsenScott(
  //  ambient(weatherDataFile=BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_SouthPole_AmundsenScott()))
  //  annotation (Placement(transformation(extent={{-5,-84},{5,-74}})));
  Location SanFrancisco(
    ambient(redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile))
    annotation (Placement(transformation(extent={{-91,44},{-81,54}})));
  Location ElGouna(
    ambient(redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Egypt_ElGouna weatherDataFile))
    annotation (Placement(transformation(extent={{19,30},{29,40}})));
  Location Berlin(
    ambient(redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin weatherDataFile))
    annotation (Placement(transformation(extent={{3,52},{13,62}})));
  Location NewYork(
    ambient(redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_NewYork weatherDataFile))
    annotation (Placement(transformation(extent={{-61,38},{-51,48}})));
  Location Tokyo(
    ambient(redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Japan_Tokyo  weatherDataFile))
    annotation (Placement(transformation(extent={{95,42},{105,52}})));
  Location Moscow(
    ambient(redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Russia_Moscow weatherDataFile))
    annotation (Placement(transformation(extent={{15,56},{25,66}})));
  Location Bombay(
    ambient(redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_India_Bombay weatherDataFile))
    annotation (Placement(transformation(extent={{53,20},{63,30}})));

    annotation(experiment(StartTime=0, StopTime=31536000,Interval=3600),
      __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Applications/ClimateAnalyses/FreeFloatingTemperature.mos" "Simulate and plot"),
      Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-150,-100},{150,100}}), graphics={Text(extent={{-128,-20},{120,-162}}, lineColor={0,0,255},
      textString="Free floating temperature within a building at different climate locations"), Bitmap(
      extent={{146,88},{-146,-88}}, fileName="modelica://BuildingSystems/Resources/Images/Applications/ClimateAnalyses/world.png",origin={0,6},rotation=180)}),
      Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
  Documentation(info="<html>
  <p>
  Example that simulates the Free floating temperature within a building at different worldwide distributed climate locations.
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
end FreeFloatingTemperature;
