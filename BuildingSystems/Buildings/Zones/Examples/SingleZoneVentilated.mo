within BuildingSystems.Buildings.Zones.Examples;
model SingleZoneVentilated
  "Zone model ventilated by two air paths"
  extends Modelica.Icons.Example;
  ZoneTemplateAirvolumeMixed zone(
    V=10*10*2.8,
    height=2.8,
    prescribedAirchange=false,
    calcIdealLoads=false,
    nConstructions=1,
    nAirpaths=2)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Constructions.Walls.WallThermal1DNodes wall(redeclare
      Data.Constructions.Thermal.ConstructionStandard constructionData)
    annotation (Placement(transformation(extent={{-26,-10},{-6,10}})));
  Surfaces.SurfaceToSolid surfaceToSolid
    annotation (Placement(transformation(extent={{-12,-10},{-32,10}})));
  Fluid.Sources.MassFlowSource_T bou1(
    redeclare package Medium = Media.Air,
    use_Xi_in=true,
    use_m_flow_in=true,
    use_T_in=true,
    nPorts=1) annotation (Placement(transformation(extent={{-60,18},{-40,38}})));
  Fluid.Sources.Boundary_pT bou2(
    redeclare package Medium = Media.Air,
    nPorts=1)
    annotation (Placement(transformation(extent={{40,18},{20,38}})));
  Modelica.Blocks.Sources.Constant TAirIn(
    k=273.15 + 30.0)
    annotation (Placement(transformation(extent={{-86,38},{-74,26}})));
  Modelica.Blocks.Sources.Constant xAirIn(
    k=0.005)
    annotation (Placement(transformation(extent={{-86,6},{-74,-6}})));
  Modelica.Blocks.Sources.Constant m_flowIn(
    k=180.0/3600.0*1.2)
    annotation (Placement(transformation(extent={{-86,62},{-74,50}})));
equation
  connect(wall.toSurfacePort_2, zone.toConstructionPorts[1])
    annotation (Line(points={{-14,0},{0,0}}, color={0,0,0}));
  connect(surfaceToSolid.toConstructionPort, wall.toSurfacePort_1)
    annotation (Line(points={{-21.4,0},{-18,0}}, color={0,0,0}));
  connect(bou1.ports[1], zone.airpathPorts[1])
    annotation (Line(points={{-40,28},{-4,28},{-4,11}}, color={0,127,255}));
  connect(bou2.ports[1], zone.airpathPorts[2]) annotation (Line(points={{20,28},
          {-6,28},{-6,11},{-8,11}}, color={0,127,255}));
  connect(xAirIn.y, bou1.Xi_in[1]) annotation (Line(points={{-73.4,0},{-68,0},{
          -68,24},{-62,24}}, color={0,0,127}));
  connect(TAirIn.y, bou1.T_in)
    annotation (Line(points={{-73.4,32},{-62,32}}, color={0,0,127}));
  connect(m_flowIn.y, bou1.m_flow_in) annotation (Line(points={{-73.4,56},{-68,56},
          {-68,36},{-62,36}}, color={0,0,127}));

  annotation (experiment(StopTime=3600),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Zones/Examples/SingleZoneVentilated.mos" "Simulate and plot"),
    Diagram(coordinateSystem(extent={{-100,-40},{60,80}}), graphics={
    Text(extent={{-88,6},{16,-62}},   lineColor={0,0,255},
    textString="Thermal zone model ventilated by two air paths")}),
    Icon(coordinateSystem(extent={{-100,-40},{60,80}})),
Documentation(info="<html>
<p>
Example that simulates thermal zone model ventilated by two air paths.
</p>
</html>",
revisions="<html>
<ul>
<li>
October 27, 2020, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end SingleZoneVentilated;
