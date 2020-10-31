within BuildingSystems.Buildings.Airvolumes.Examples;
model MixingVolumeMoistAirFlexible
  "Test model for mixing volume with moist air input"
  extends Modelica.Icons.Example;

  package Medium = BuildingSystems.Media.Air;

  parameter Modelica.SIunits.MassFlowRate m_flow_nominal = 0.001
    "Nominal mass flow rate";

  BuildingSystems.Buildings.Airvolumes.MixingVolumeMoistAir vol1(
    redeclare package Medium = Medium,
    T_start=293.15,
    geometryType=BuildingSystems.Buildings.Types.GeometryType.Flexible,
    V=1,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    m_flow_nominal=m_flow_nominal,
    nPorts=1)
    "Volume"
    annotation (Placement(transformation(extent={{20,0},{40,20}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor TSen
    "Temperature sensor"
    annotation (Placement(transformation(extent={{20,30},{40,50}})));
  BuildingSystems.Fluid.Sources.Boundary_pT bou(
    redeclare package Medium = Medium,
    T=293.15,
    nPorts=1)
    annotation (Placement(transformation(origin={70,-12},
      extent={{-10,-10},{10,10}},rotation=180)));
  BuildingSystems.Fluid.FixedResistances.PressureDrop res(
    redeclare package Medium = Medium,
    from_dp=true,
    dp_nominal=2.5,
    m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{32,-22},{52,-2}})));
  Modelica.Blocks.Sources.Sine fleVol(
    amplitude=0.2,
    freqHz=1.0/3600.0,
    offset=1.0)
    "time dependent volume"
    annotation (Placement(transformation(extent={{-14,10},{-6,18}})));
  Modelica.Blocks.Sources.Constant mWat_flow(k=0.0)
    "mass flow rate water"
    annotation (Placement(transformation(extent={{-14,30},{-6,38}})));
equation
  connect(res.port_b, bou.ports[1])
    annotation (Line(points={{52,-12},{60,-12}}, color={0,127,255}));
  connect(fleVol.y, vol1.V_in)
    annotation (Line(points={{-5.6,14},{18,14}}, color={0,0,127}));
  connect(vol1.heatPort, TSen.port) annotation (Line(points={{20,10},{10,10},{10,
          40},{20,40}}, color={191,0,0}));
  connect(mWat_flow.y, vol1.mWat_flow) annotation (Line(points={{-5.6,34},{6,34},
          {6,18},{18,18}}, color={0,0,127}));
  connect(res.port_a, vol1.ports[1])
    annotation (Line(points={{32,-12},{30,-12},{30,0}}, color={0,127,255}));

    annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-40,-60},{100,60}})),
      experiment(StopTime=7200, Tolerance=1e-06),
      __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Airvolumes/Examples/MixingVolumeMoistAirFlexible.mos" "Simulate and plot"),
Documentation(info="<html>
<p>
This model tests
<a href=\"modelica://BuildingSystems.Fluid.MixingVolumes.MixingVolumeMoistAir\">
BuildingSystems.Fluid.MixingVolumes.MixingVolumeMoistAir</a>.
Test of the dynamic change of the size of the air volumne.
</p>
</html>", revisions="<html>
<ul>
<li>
October 28, 2020, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-40,-60},{100,60}})));
end MixingVolumeMoistAirFlexible;
