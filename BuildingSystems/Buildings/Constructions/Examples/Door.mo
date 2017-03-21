within BuildingSystems.Buildings.Constructions.Examples;
model Door
  "Door model with airpathes under real weather data"
  extends Modelica.Icons.Example;

  record ConstructionDoor
    "Bottom construction"
    extends
      BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=1,
      thickness={0.030},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Wood()});
  end ConstructionDoor;

  BuildingSystems.Buildings.Constructions.Doors.Door door(
    redeclare ConstructionDoor constructionData,
    angleDegAzi = 0.0,
    angleDegTil = 90.0,
    height=2.0,
    width=1.0,
    LClo=0.01)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-6,-10},{-26,10}})));
  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=1,
    nAirpathes=2,
    heightAirpath={0.5,1.5},
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  Zones.ZoneTemplateAirvolumeMixed zone(
    nConstructions1=1,
    V=4*4*2.8,
    height=2.8,
    heightAirpath={0.5,1.5},
    calcIdealLoads=true,
    prescribedAirchange=false,
    nAirpathes1=2)
    annotation (Placement(transformation(extent={{16,-10},{36,10}})));
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{20,-6},{24,-2}})));
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{26,-2},{30,2}})));
  Modelica.Blocks.Sources.Trapezoid control(
    amplitude=1.0,
    rising=10,
    falling=10,
    offset=0.0,
    startTime=0.0,
    width=1800,
    period=3600)
    annotation (Placement(transformation(extent={{-10,-22},{-2,-14}})));
equation
  connect(surface1.toConstructionPort, door.toSurfacePort_1) annotation (Line(
      points={{-15.4,0},{-2,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-32,4},{-16.6,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-32,-4},{-16.6,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(door.toSurfacePort_2, zone.toConstructionPorts1[1]) annotation (Line(
      points={{2,0},{4,0},{4,4},{15,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(TSetHeating.y, zone.T_setHeating) annotation (Line(
      points={{24.2,-4},{27,-4},{27,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(TSetCooling.y, zone.T_setCooling) annotation (Line(
      points={{30.2,0},{31,0},{31,7}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(ambient.toAirpathPorts[1], door.port_a1) annotation (Line(points={{-38,
          9},{-38,12},{-10,12},{-10,6}}, color={0,127,255}));
  connect(ambient.toAirpathPorts[2], door.port_b2) annotation (Line(points={{-42,
          9},{-42,12},{-52,12},{-52,-12},{-10,-12},{-10,-6}}, color={0,127,255}));
  connect(door.port_b1, zone.airpathPorts1[1]) annotation (Line(points={{10,6},
          {12,6},{12,-6},{15,-6}}, color={0,127,255}));
  connect(door.port_a2, zone.airpathPorts1[2])
    annotation (Line(points={{10,-6},{15,-6},{15,-2}}, color={0,127,255}));
  connect(control.y, door.y)
    annotation (Line(points={{-1.6,-18},{0,-18},{0,-9}}, color={0,0,127}));

  annotation(experiment(StartTime=0, StopTime=86400.0),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/Door.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={
    Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},textString="Door model with two airpathes under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a door model with airpathes under real weather data.
</p>
</html>",
revisions="<html>
<ul>
<li>
March 21, 2017, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Door;
