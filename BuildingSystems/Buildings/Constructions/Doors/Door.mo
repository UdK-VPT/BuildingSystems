within BuildingSystems.Buildings.Constructions.Doors;
model Door
  "Model of a door"
  extends BuildingSystems.Buildings.Constructions.Walls.WallThermal1DNodes
    annotation(IconMap(primitivesVisible=false),DiagramMap(primitivesVisible=true));
  final package Medium = BuildingSystems.Media.Air;
  // Ventilation
  parameter Boolean calcAirchange = false
    "True: calculation of air exchange through the door, false: no air exchange"
    annotation(Dialog(tab = "General", group = "Air change calculation"));
  parameter Integer nCom=10
    "Number of compartments for the discretization"
    annotation(Dialog(tab = "General", group = "Air change calculation"));
  parameter Modelica.SIunits.Area LClo(min=0)=0.001
    "Effective leakage area of closed door"
    annotation(Dialog(tab = "General", group = "Air change calculation"));
  BuildingSystems.Airflow.Multizone.DoorDiscretizedOperable ope(
    redeclare package Medium = Medium,
    LClo=LClo,
    nCom=nCom,
    final wOpe = width,
    final hOpe = height) if calcAirchange
    "Opening of the window"
    annotation (Placement(transformation(extent={{-10,70},{10,90}})));
  input Modelica.Blocks.Interfaces.RealInput y(min=0, max=1, unit="1") if calcAirchange
    "Percentage of the openable part of the opening (1.0 = 100 % open, 0.0 = 100 % closed)"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=0,  origin={-28,80}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=90, origin={0,-90})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a1(
    redeclare final package Medium = Medium) if calcAirchange
    "Fluid connector a1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{-30,50},{-10,70}}),
      iconTransformation(extent={{-30,50},{-10,70}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b1(
     redeclare final package Medium = Medium) if calcAirchange
    "Fluid connector b1 (positive design flow direction is from port_a1 to port_b1)"
    annotation (Placement(transformation(extent={{30,50},{10,70}}),
      iconTransformation(extent={{30,50},{10,70}})));
  Modelica.Fluid.Interfaces.FluidPort_a port_a2(
     redeclare final package Medium = Medium) if calcAirchange
    "Fluid connector a2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{10,-70},{30,-50}}),
      iconTransformation(extent={{10,-70},{30,-50}})));
  Modelica.Fluid.Interfaces.FluidPort_b port_b2(
     redeclare final package Medium = Medium) if calcAirchange
    "Fluid connector b2 (positive design flow direction is from port_a2 to port_b2)"
    annotation (Placement(transformation(extent={{-10,-70},{-30,-50}}),
      iconTransformation(extent={{-10,-70},{-30,-50}})));
equation
  // Ventilation
  connect(ope.y, y)
      annotation (Line(points={{-11,80},{-28,80}}, color={0,0,127}));
  connect(ope.port_b1, port_b1) annotation (Line(points={{10,86},{40,86},{40,60},
            {20,60}}, color={0,127,255}));
  connect(ope.port_a1, port_a1) annotation (Line(points={{-10,86},{-40,86},{-40,
          60},{-20,60}}, color={0,127,255}));
  connect(ope.port_a2, port_a2) annotation (Line(points={{10,74},{60,74},{60,-60},
          {20,-60}}, color={0,127,255}));
  connect(ope.port_b2, port_b2) annotation (Line(points={{-10,74},{-60,74},{-60,
          -60},{-20,-60}}, color={0,127,255}));

      annotation (Placement(transformation(extent={{-10,-70},{-30,-50}}),
          iconTransformation(extent={{-10,-70},{-30,-50}})),
              defaultComponentName="door",Icon(graphics={
    Rectangle(
      extent={{-20,80},{20,62}},
      fillColor={135,135,135},
      fillPattern=FillPattern.Solid,
      pattern=LinePattern.None),
    Rectangle(
      extent={{-20,-62},{20,-80}},
      fillColor={135,135,135},
      fillPattern=FillPattern.Solid,
      pattern=LinePattern.None),
    Rectangle(
      extent={{-6,62},{6,-62}},
      pattern=LinePattern.None,
      fillColor={135,135,135},
      fillPattern=FillPattern.Solid)}),
Documentation(info="<html>
<p>
This is a model of an openable door.
</p>
</html>", revisions="<html>
<ul>
<li>
March 19, 2019 by Christoph Nytsch-Geusen:<br/>
Adaptation to the BuildingSystems.Airflow package.
</li>
<li>
March 21, 2017 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end Door;
