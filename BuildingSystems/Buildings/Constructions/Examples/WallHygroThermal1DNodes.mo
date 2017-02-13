within BuildingSystems.Buildings.Constructions.Examples;
model WallHygroThermal1DNodes
"1D thermal wall model under real weather data"
  extends Modelica.Icons.Example;
  record Construction
    extends BuildingSystems.Buildings.Data.Constructions.OpaqueHygroThermalConstruction(
      nLayers=3,
      thickness={0.015,0.2,0.02},
      material={BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Gipsputz(),
        BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Vollziegel(),
        BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Kalkputz()});
  end Construction;
  BuildingSystems.Buildings.Constructions.Walls.WallHygroThermal1DNodes wall(
    angleDegAzi = 0.0,
    angleDegTil = 90.0,
    height=1.0,
    width=1.0,
    nNodes={10,10,10},
    redeclare Construction constructionData)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToAir surface1
    annotation (Placement(transformation(extent={{-2,-10},{-22,10}})));
  BuildingSystems.Buildings.Ambient ambient(
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_USA_SanFrancisco weatherDataFile,
    nSurfaces=1)
    annotation (Placement(transformation(extent={{-50,-10},{-30,10}})));
  BuildingSystems.Buildings.Surfaces.SurfaceToSolid surface2(calcHygroThermal=true)
    annotation (Placement(transformation(extent={{2,-10},{22,10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature tempBC(T=293.15)
    annotation (Placement(transformation(extent={{26,-10},{18,-2}})));
  BuildingSystems.HAM.HeatAndMoistureTransport.Sources.AbsoluteMoistureFixed moistBC(
    x_constant =0.008)
    annotation (Placement(transformation(extent={{28,0},{16,12}})));
equation
  connect(surface1.toConstructionPort, wall.toSurfacePort_1) annotation (Line(
      points={{-11.4,0},{-2,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toSurfacePorts[1], surface1.toSurfacesPort) annotation (Line(
      points={{-32,4},{-22,4},{-22,4},{-12.6,4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(ambient.toAirPorts[1], surface1.toAirPort) annotation (Line(
      points={{-32,-4},{-22,-4},{-22,-4},{-12.6,-4}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(wall.toSurfacePort_2, surface2.toConstructionPort) annotation (Line(
      points={{2,0},{11.4,0}},
      color={0,0,0},
      pattern=LinePattern.Solid,
      smooth=Smooth.None));
  connect(surface2.moisturePort, moistBC.moisturePort) annotation (Line(
      points={{12.6,4},{16,4},{16,6},{18.4,6}},
      color={120,0,120},
      smooth=Smooth.None));
  connect(surface2.heatPort, tempBC.port) annotation (Line(
      points={{12.6,-4},{16,-4},{16,-6},{18,-6}},
      color={191,0,0},
      smooth=Smooth.None));

  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Constructions/Examples/WallHygroThermal1DNodes.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-40},{60,40}}),                                                                       graphics={Text(extent={{-52,6},{52,-62}},lineColor={0,0,255},
    textString="1D hygro-thermal wall model under real weather data")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates a 1D-layered hygro-thermal wall model under real weather data
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
  end WallHygroThermal1DNodes;
