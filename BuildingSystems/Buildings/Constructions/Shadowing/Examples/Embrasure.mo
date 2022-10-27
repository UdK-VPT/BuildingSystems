within BuildingSystems.Buildings.Constructions.Shadowing.Examples;
model Embrasure
  "Embrasure of a Window"
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.Constructions.Shadowing.Embrasure embSouth(
    width=1.0,
    height=2.0,
    angleDegAzi=0.0,
    angleDegTil=90.0,
    depth=0.1)
    annotation (Placement(transformation(extent={{30,2},{50,22}})));
  BuildingSystems.Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radEast
    annotation (Placement(transformation(extent={{0,30},{20,50}})));
  BuildingSystems.Climate.WeatherData.WeatherDataReader weaDat(
    redeclare block WeatherData =
        BuildingSystems.Climate.WeatherDataMeteonorm.Egypt_ElGouna_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-56,38},{-36,58}})));
  Modelica.Blocks.Sources.Constant angTilSouth(k=90)
    annotation (Placement(transformation(extent={{-18,10},{-10,18}})));
  Modelica.Blocks.Sources.Constant angAziSouth(k=0.0)
    annotation (Placement(transformation(extent={{-28,2},{-20,10}})));
  BuildingSystems.Buildings.Constructions.Shadowing.Embrasure embEast(
    width=1.0,
    height=2.0,
    angleDegTil=90.0,
    depth=0.1,
    angleDegAzi=-90.0)
    annotation (Placement(transformation(extent={{30,30},{50,50}})));
  BuildingSystems.Buildings.Constructions.Shadowing.Embrasure embWest(
    width=1.0,
    height=2.0,
    angleDegTil=90.0,
    depth=0.1,
    angleDegAzi=90.0)
    annotation (Placement(transformation(extent={{30,-24},{50,-4}})));
  Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radSouth
    annotation (Placement(transformation(extent={{0,2},{20,22}})));
  Climate.SolarRadiationTransformers.SolarRadiationTransformerIsotropicSky radWest
    annotation (Placement(transformation(extent={{0,-24},{20,-4}})));
  Modelica.Blocks.Sources.Constant angAziWest(
    k=90.0)
    annotation (Placement(transformation(extent={{-28,-24},{-20,-16}})));
  Modelica.Blocks.Sources.Constant angTilWest(
    k=90.0)
    annotation (Placement(transformation(extent={{-18,-16},{-10,-8}})));
  Modelica.Blocks.Sources.Constant angAziEast(
    k=-90.0)
    annotation (Placement(transformation(extent={{-28,30},{-20,38}})));
  Modelica.Blocks.Sources.Constant angTilEast(
     k=90.0)
    annotation (Placement(transformation(extent={{-18,38},{-10,46}})));
equation
  connect(weaDat.longitudeDeg0, radEast.longitudeDeg0)
    annotation (Line(points={{-35,53},{14,53},{14,47.6}}, color={0,0,127}));
  connect(weaDat.longitudeDeg, radEast.longitudeDeg)
    annotation (Line(points={{-35,55},{10,55},{10,47.6}}, color={0,0,127}));
  connect(weaDat.latitudeDeg, radEast.latitudeDeg)
    annotation (Line(points={{-35,57},{6.2,57},{6.2,47.6}}, color={0,0,127}));

  connect(angAziSouth.y, radSouth.angleDegAzi)
    annotation (Line(points={{-19.6,6},{2.4,6}}, color={0,0,127}));
  connect(angTilSouth.y, radSouth.angleDegTil) annotation (Line(points={{-9.6,14},
          {-6,14},{-6,10},{2.4,10}}, color={0,0,127}));
  connect(radEast.radiationPort, embEast.radiationPort_in)
    annotation (Line(points={{18,40},{36,40}}, color={0,0,0}));
  connect(radSouth.radiationPort, embSouth.radiationPort_in)
    annotation (Line(points={{18,12},{36,12}}, color={0,0,0}));
  connect(radWest.radiationPort, embWest.radiationPort_in)
    annotation (Line(points={{18,-14},{36,-14}}, color={0,0,0}));
  connect(angAziEast.y, radEast.angleDegAzi)
    annotation (Line(points={{-19.6,34},{2.4,34}}, color={0,0,127}));
  connect(angAziWest.y, radWest.angleDegAzi)
    annotation (Line(points={{-19.6,-20},{2.4,-20}}, color={0,0,127}));
  connect(angTilWest.y, radWest.angleDegTil) annotation (Line(points={{-9.6,-12},
          {-6,-12},{-6,-16},{2.4,-16}}, color={0,0,127}));
  connect(angTilEast.y, radEast.angleDegTil) annotation (Line(points={{-9.6,42},
          {-6,42},{-6,38},{2.4,38}}, color={0,0,127}));
  connect(weaDat.latitudeDeg, radSouth.latitudeDeg) annotation (Line(points={{-35,
          57},{-32,57},{-32,24},{6.2,24},{6.2,19.6}}, color={0,0,127}));
  connect(weaDat.latitudeDeg, radWest.latitudeDeg) annotation (Line(points={{-35,
          57},{-32,57},{-32,-2},{6.2,-2},{6.2,-6.4}}, color={0,0,127}));
  connect(weaDat.longitudeDeg, radSouth.longitudeDeg) annotation (Line(points={{
          -35,55},{-32,55},{-32,24},{10,24},{10,19.6}}, color={0,0,127}));
  connect(weaDat.longitudeDeg, radWest.longitudeDeg) annotation (Line(points={{-35,
          55},{-36,55},{-36,54},{-32,54},{-32,-2},{10,-2},{10,-6.4}}, color={0,0,
          127}));
  connect(weaDat.longitudeDeg0, radSouth.longitudeDeg0) annotation (Line(points=
         {{-35,53},{-35,54},{-32,54},{-32,24},{14,24},{14,19.6}}, color={0,0,127}));
  connect(weaDat.longitudeDeg0, radWest.longitudeDeg0) annotation (Line(points={
          {-35,53},{-32,53},{-32,-2},{14,-2},{14,-6.4}}, color={0,0,127}));
  connect(weaDat.IrrDirHor, radEast.IrrDirHor) annotation (Line(points={{-49,37},
          {-49,24},{-32,24},{-32,50},{-2,50},{-2,46},{2.4,46}}, color={0,0,127}));
  connect(weaDat.IrrDirHor, radSouth.IrrDirHor) annotation (Line(points={{-49,37},
          {-49,24},{-2,24},{-2,18},{2.4,18}}, color={0,0,127}));
  connect(weaDat.IrrDirHor, radWest.IrrDirHor) annotation (Line(points={{-49,37},
          {-49,-4},{-2,-4},{-2,-8},{2.4,-8}}, color={0,0,127}));
  connect(weaDat.IrrDifHor, radEast.IrrDifHor) annotation (Line(points={{-47,37},
          {-47,24},{-32,24},{-32,50},{-2,50},{-2,42},{2.4,42}}, color={0,0,127}));
  connect(weaDat.IrrDifHor, radSouth.IrrDifHor) annotation (Line(points={{-47,37},
          {-47,24},{-2,24},{-2,14},{2.4,14}}, color={0,0,127}));
  connect(weaDat.IrrDifHor, radWest.IrrDifHor) annotation (Line(points={{-47,37},
          {-47,-4},{-2,-4},{-2,-12},{2.4,-12}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=259200.0),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Shadowing/Examples/Embrasure.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,60}},initialScale=0.1),graphics={
    Text(extent={{-52,0},{52,-68}},lineColor={0,0,255},textString="Embrasure model of a window")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,60}},initialScale=0.1)),
  Documentation(info="<html>
  <p>
  Example that simulates three different oriented embrasure models of a window.
  </p>
  </html>",
  revisions="<html>
  <ul>
  <li>
  September 29, 2019, by Christoph Nytsch-Geusen:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end Embrasure;
