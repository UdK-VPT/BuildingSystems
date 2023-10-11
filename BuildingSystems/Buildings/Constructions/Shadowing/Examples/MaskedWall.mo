within BuildingSystems.Buildings.Constructions.Shadowing.Examples;
model MaskedWall
  "Masked wall model"
  extends Modelica.Icons.Example;

  record Construction
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueThermalConstruction(
      nLayers=2,
      thickness={0.1,0.1},
      material={BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete(),
                BuildingSystems.HAM.Data.MaterialProperties.Thermal.Concrete()});
  end Construction;

  BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes wall(
    position={0.0,0.0,0.5},
    angleDegAzi = -90.0,
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

  BuildingSystems.Buildings.Ambience ambience(
    nSurfaces = 2,
    useSolarMask = true,
    redeclare block WeatherData =
      BuildingSystems.Climate.WeatherDataMeteonorm.Algeria_Tamanrasset_Meteonorm_ASCII)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));

  Modelica.Blocks.Interfaces.RealInput SC_surface1(min = 0.0, max = 1.0);
    annotation (Dialog(group = "Solarmask related input"));
  Modelica.Blocks.Interfaces.RealInput SC_surface2(min = 0.0, max = 1.0);
    annotation (Dialog(group = "Solarmask related input"));

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
  connect(ambience.solarmask[1].SC, SC_surface1);
  connect(ambience.solarmask[2].SC, SC_surface2);

  annotation(experiment(StartTime=1.728e+07, StopTime=1.73664e+07),
  Documentation(info="<html>
  <p>
  Example that simulates a wall using a solar mask.
  The solar mask is calculated outside buildingSystems.
  The shading coefficients of the two wall surfaces are input at each time step.
  </p>
  </html>",
  revisions="<html>
  <ul>
  <li>
  October 3, 2023 by Philippe Pinçon:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end MaskedWall;