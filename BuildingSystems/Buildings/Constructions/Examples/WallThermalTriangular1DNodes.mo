within BuildingSystems.Buildings.Constructions.Examples;
model WallThermalTriangular1DNodes
  "1D thermal triangular wall model"
  extends Modelica.Icons.Example;
  record Construction
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction (
      nLayers=2,
      thickness={0.1,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
                BuildingSystems.HAM.Data.MaterialProperties.Thermal.Insulation()});
  end Construction;
  BuildingSystems.Buildings.Constructions.Walls.WallThermalTriangular1DNodes wall(
    angleDegAzi = 0.0,
    angleDegTil = 90.0,
    coordinateType=BuildingSystems.Buildings.Types.CoordinateType.Local,
    verticesLocal={{0.0,0.0},{1.0,0.0},{0.0,1.0}},
    nNodes={2,2},
    redeclare Construction constructionData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface2
    annotation (Placement(transformation(extent={{2,-10},{22,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-2,-10},{-22,10}})));
  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces=2,
    redeclare block WeatherData = BuildingSystems.Climate.WeatherDataMeteonorm.USA_SanFrancisco_Meteonorm_ASCII)
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
  connect(ambience.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-32,3.5},{-22,3.5},{-22,4},{-13,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-32,-4.5},{-22,-4.5},{-22,0},{-13,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toSurfacePorts[2], surface2.toSurfacesPort) annotation (Line(
      points={{-32,4.5},{-24,4.5},{-24,16},{24,16},{24,4},{13,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambience.toAirPorts[2], surface2.toAirPort) annotation (Line(
      points={{-32,-3.5},{-28,-3.5},{-28,-6},{-24,-6},{-24,-14},{24,-14},{24,0},
          {13,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=31536000,Interval=3600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WallThermalTriangular1DNodes.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}), graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="1D thermal triangular wall model")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a 1D-layered thermal triangular wall model.
</p>
</html>",
revisions="<html>
<ul>
<li>
August 9, 2020, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end WallThermalTriangular1DNodes;
