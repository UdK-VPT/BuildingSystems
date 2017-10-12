within BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyProductionUnits;
model Central
  extends BuildingSystems.Technologies.DistrictHeatingNetworks.EnergyProductionUnits.BaseClasses.PartialCentral(hex(
        allowFlowReversal1=allowFlowReversal, allowFlowReversal2=
          allowFlowReversal));
  Fluid.Sources.MassFlowSource_T source(
    redeclare package Medium = Medium,
    m_flow=999999999,
    T=T,
    nPorts=1)
    annotation (Placement(transformation(extent={{36,2},{16,22}})));
  BuildingSystems.Fluid.Sources.FixedBoundary bou(
    redeclare package Medium = Medium, nPorts=1)
    annotation (Placement(transformation(extent={{-36,2},{-16,22}})));
  parameter Modelica.Media.Interfaces.Types.Temperature T = 273.15 + 95
    "Production temperature, value close to DHN supply temperature";
equation
  connect(bou.ports[1], hex.port_b1) annotation (Line(
      points={{-16,12},{-10,12}},
      color={0,127,255},
      smooth=Smooth.None));
  connect(hex.port_a1, source.ports[1]) annotation (Line(
      points={{10,12},{16,12}},
      color={0,127,255},
      smooth=Smooth.None));

  annotation (           Documentation(info="<html>
    <p>
    The central acts as endless power central unit. A huge mass flow at a set temperature <code>T</code> flows in order to ensure a supply temperature close to this temperature <code>T</code>.
    </p>
    </html>"),
    experiment(
      StartTime=2.88576e+007,
      StopTime=6.3072e+007,
      Interval=3600,
      Tolerance=1e-005,
      __Dymola_Algorithm="Dassl"));
end Central;
