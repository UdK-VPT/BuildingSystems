within BuildingSystems.Buildings.Constructions.Examples;
model WallThermal1DNodes
  "1D thermal wall model under real weather data"
  extends Modelica.Icons.Example;
  record Construction
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
      nLayers=2,
      thickness={0.1,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
                BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()});
  end Construction;
  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall(
    angleDegAzi = 0.0,
    angleDegTil = 90.0,
    height=1.0,
    width=1.0,
    nNodes={2,2},
    redeclare Construction constructionData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2
    annotation (Placement(transformation(extent={{2,-10},{22,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-2,-10},{-22,10}})));
  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=2,
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
equation
  connect(surface1.toConstructionPort, wall.toSurfacePort_1) annotation (Line(
      points={{-11,0},{-8,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall.toSurfacePort_2, surface2.toConstructionPort) annotation (Line(
      points={{8,0},{11,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-32,3.5},{-22,3.5},{-22,4},{-13,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-32,-4.5},{-22,-4.5},{-22,0},{-13,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toSurfacePorts[2], surface2.toSurfacesPort) annotation (Line(
      points={{-32,4.5},{-24,4.5},{-24,16},{24,16},{24,4},{13,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toAirPorts[2], surface2.toAirPort) annotation (Line(
      points={{-32,-3.5},{-28,-3.5},{-28,-6},{-24,-6},{-24,-14},{24,-14},{24,0},
          {13,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=31536000,Interval=3600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WallThermal1DNodes.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="1D thermal wall model under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a 1D-layered thermal wall model under real weather data.
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
end WallThermal1DNodes;
