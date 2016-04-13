within BuildingSystems.Technologies.ThermalStorages.BaseClasses.StratificationModel;
package Examples
extends Modelica.Icons.ExamplesPackage;
  model InletStratification
  extends Modelica.Icons.Example;
    replaceable PartialInletStratification partialInletStratification(
      redeclare package Medium = Medium, nEle=3)
      annotation (Placement(transformation(extent={{32,-50},{12,-30}})));
    BuildingSystems.Fluid.Sources.MassFlowSource_T boundary1(
      redeclare package Medium = Medium,
      use_m_flow_in = false,
      m_flow=1,
      nPorts=1,
      use_T_in=true,
      T=328.15)
      annotation (Placement(transformation(extent={{64,-60},{44,-40}})));
    BuildingSystems.Fluid.Sources.FixedBoundary bou1(
      redeclare package Medium = Medium, nPorts=1)
      annotation (Placement(transformation(extent={{-80,-90},{-60,-70}})));
    replaceable package Medium = BuildingSystems.Media.Water;
    Modelica.Blocks.Sources.RealExpression fixedTemperature1(y=273.15 + 50)
      annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
    BuildingSystems.Fluid.Sources.FixedBoundary bou2(
      redeclare package Medium = Medium,
      nPorts=1)
      annotation (Placement(transformation(extent={{-80,-50},{-60,-30}})));
    Modelica.Blocks.Sources.RealExpression fixedTemperature2(y=274.15 + 60)
      annotation (Placement(transformation(extent={{-80,44},{-60,64}})));
    BuildingSystems.Fluid.Sources.FixedBoundary bou3(
      redeclare package Medium = Medium, nPorts=1)
      annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
    Modelica.Blocks.Sources.RealExpression fixedTemperature3(y=274.15 + 70)
      annotation (Placement(transformation(extent={{-80,68},{-60,88}})));
    Modelica.Blocks.Sources.RealExpression T_vol_4(y=313.15 + 0.1*time)
      annotation (Placement(transformation(extent={{94,-48},{74,-28}})));
  equation
    connect(partialInletStratification.port_a, boundary1.ports[1]) annotation (
        Line(
        points={{27,-49},{38,-49},{38,-50},{44,-50}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(bou2.ports[1], partialInletStratification.ports_b[1]) annotation (Line(
        points={{-60,-40},{13,-40}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(bou1.ports[1], partialInletStratification.port_b_bot) annotation (
        Line(
        points={{-60,-80},{-22,-80},{-22,-49},{13,-49}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(bou3.ports[1], partialInletStratification.port_b_top) annotation (
        Line(
        points={{-60,0},{-14,0},{-14,-31},{13,-31}},
        color={0,127,255},
        smooth=Smooth.None));
    connect(boundary1.T_in, T_vol_4.y) annotation (Line(
        points={{66,-46},{68,-46},{68,-38},{73,-38}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(fixedTemperature1.y, partialInletStratification.T[1]) annotation (
        Line(
        points={{-59,30},{22,30},{22,-28.6667}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(fixedTemperature2.y, partialInletStratification.T[2]) annotation (
        Line(
        points={{-59,54},{22,54},{22,-30}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(fixedTemperature3.y, partialInletStratification.T[3]) annotation (
        Line(
        points={{-59,78},{22,78},{22,-31.3333}},
        color={0,0,127},
        smooth=Smooth.None));

    annotation (      __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Technologies/ThermalStorages/BaseClasses/StratificationModel/Examples/InletStratification.mos" "Simulate and plot"));
  end InletStratification;
end Examples;
