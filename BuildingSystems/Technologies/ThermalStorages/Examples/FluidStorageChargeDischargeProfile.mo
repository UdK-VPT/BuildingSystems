within BuildingSystems.Technologies.ThermalStorages.Examples;
model FluidStorageChargeDischargeProfile
  "Model to test the preservation of a temperature profile and show the numerical"
  extends Modelica.Icons.Example;
  replaceable package Medium =   BuildingSystems.Media.Water;
  BuildingSystems.Technologies.ThermalStorages.FluidStorage storage(
    redeclare package Medium = Medium,
    height=2.0,
    redeclare
      BuildingSystems.Technologies.ThermalStorages.BaseClasses.BuoyancyModels.Buoyancy1
      HeatBuoyancy,
    HX_2=false,
    Ele_HX_1=3,
    UA_HX_1=500.0,
    AdditionalFluidPorts=false,
    nEle=100,
    HX_1=false,
    T_start(displayUnit="degC") = 293.15,
    PerfectlyIsolated=true)
    annotation (Placement(transformation(extent={{80,-14},{40,26}})));
  Modelica.Blocks.Sources.TimeTable consumptionProfile(table=[0,0.0; 10,1; 1000,
        1; 1020,0; 4590,0; 4610,-1; 5590,-1; 5610,0; 6000,0.0])
    "Mass flow rate"
    annotation (Placement(transformation(extent={{-94,48},{-74,68}})));
  BuildingSystems.Fluid.Sources.Boundary_pT sink_consumption(
    redeclare package Medium = Medium,
    use_T_in=false,
    p(displayUnit="Pa"),
    T=293.15,
    nPorts=1) "Sink" annotation (Placement(transformation(extent={{-10,-10},{10,
            10}}, origin={4,-12})));
  BuildingSystems.Fluid.Sources.MassFlowSource_T source_consumption(
    redeclare package Medium = Medium,
    m_flow=0.0,
    use_m_flow_in=true,
    use_T_in=true,
    T=298.15,
    nPorts=1) "Flow source"
    annotation (Placement(transformation(extent={{-46,14},{-26,34}})));
  Modelica.Blocks.Sources.Ramp ramp(
    duration=3600,
    height=70,
    offset=20 + 273.15)
    annotation (Placement(transformation(extent={{-94,18},{-74,38}})));
  BuildingSystems.Fluid.Sensors.Temperature senTem_bottom(redeclare package
      Medium =
        Medium) annotation (Placement(transformation(extent={{24,-8},{44,12}})));
  BuildingSystems.Fluid.Sensors.VolumeFlowRate senVolFlo(redeclare package
      Medium =
        Medium, m_flow_nominal=1)
    annotation (Placement(transformation(extent={{-12,14},{8,34}})));
  Modelica.SIunits.Volume V;
  Modelica.SIunits.Heat Q_in(start=0)
    "cumulated amount of energy entering into the TES";
  Modelica.SIunits.Heat Q_out(start=0)
    "cumulated amount of energy leaving into the TES";
  Real HRF = noEvent(if Q_in>0 then Q_out/max(1,Q_in) else 0)
    "heat recovery factor";
equation
  der(V)=senVolFlo.V_flow;
  der(Q_in) =abs(max(0,storage.port_a2.m_flow)*(inStream(storage.port_a2.h_outflow)-storage.port_b2.h_outflow));
  der(Q_out)=abs(max(0,-storage.port_a2.m_flow)*(inStream(storage.port_b2.h_outflow)-storage.port_a2.h_outflow));
  connect(source_consumption.m_flow_in, consumptionProfile.y) annotation (Line(
      points={{-46,32},{-58,32},{-58,58},{-73,58}},
      color={0,0,127},
      smooth=Smooth.None));

  connect(ramp.y, source_consumption.T_in)
    annotation (Line(points={{-73,28},{-48,28}}, color={0,0,127}));
  connect(senVolFlo.port_a, source_consumption.ports[1])
    annotation (Line(points={{-12,24},{-26,24}}, color={0,127,255}));
  connect(senVolFlo.port_b, storage.port_a2)
    annotation (Line(points={{8,24},{46,24}}, color={0,127,255}));
  connect(storage.port_b2, sink_consumption.ports[1])
    annotation (Line(points={{46,-12},{46,-12},{14,-12}}, color={0,127,255}));
  connect(storage.port_b2, senTem_bottom.port)
    annotation (Line(points={{46,-12},{34,-12},{34,-8}}, color={0,127,255}));
  annotation (    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/ThermalStorages/Examples/FluidStorageChargeDischargeProfile.mos"
        "Simulate and plot"),
    Documentation(info="<html>
<p>Charges storage of 1 m&sup3; from the top with increasing temperature for 1000 s at 1 kg/s. After 1 h, discharges the for same duration at the same rate.</p>
<p>Different storage discretizations show different results, e.g. HRF.</p>
</html>"),
    experiment(StopTime=11000),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})));
end FluidStorageChargeDischargeProfile;
