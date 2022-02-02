within BuildingSystems.Buildings.Airvolumes.Examples;
model AirElementsThermal1x1x1
  extends Modelica.Icons.Example;
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle111(
    BCwall_east=true,
    BCwall_south=true,
    BCwall_west=true,
    BCwall_floor=true,
    BCwall_roof=true,
    posX=0.5,
    posY=0.5,
    posZ=0.5,
    scalF={1,1,1},
    BCwall_north=true,
    T_start=303.15)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.Boundary west11(
    posX=0,
    posY=0.5,
    posZ=0.5,
    location=BuildingSystems.Buildings.Types.OrientationType.West)
    annotation (Placement(transformation(extent={{-26,-10},{-6,10}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.Boundary roof11(
    posX=0.5,
    posY=1,
    posZ=0.5,
    location=BuildingSystems.Buildings.Types.OrientationType.Roof)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={0,30})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.Boundary floor11(
    posX=0.5,
    posY=0,
    posZ=0.5,
    location=BuildingSystems.Buildings.Types.OrientationType.Floor)
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,-30})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.Boundary north11(
    posX=0.5,
    posY=0.5,
    posZ=1.0,
    location=BuildingSystems.Buildings.Types.OrientationType.North)
    annotation (Placement(transformation(extent={{30,10},{10,30}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.Boundary south11(
    posX=0.5,
    posY=0.5,
    posZ=0,
    location=BuildingSystems.Buildings.Types.OrientationType.South)
    annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.Boundary east11(
    posX=1,
    posY=0.5,
    posZ=0.5,
    location=BuildingSystems.Buildings.Types.OrientationType.East)
    annotation (Placement(transformation(extent={{26,-10},{6,10}})));
  BuildingSystems.Buildings.Airvolumes.Examples.BoundaryTemp bcTSouth1(T=294.15)
    annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
  BuildingSystems.Buildings.Airvolumes.Examples.BoundaryTemp bcTNorth1(T=292.15)
    annotation (Placement(transformation(extent={{36,-10},{16,10}})));
equation
  connect(west11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={{
          -15,-4},{-8,-4},{-8,-2},{-8,0},{0,0}}, color={0,0,0}));
  connect(south11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={
          {-19,-24},{-19,-24},{0,-24},{0,-8},{0,0}}, color={0,0,0}));
  connect(floor11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={{4,-29},
          {4,-29},{4,0},{0,0}},                          color={0,0,0}));
  connect(roof11.PortHeat, airEle111.heatPort_extern)
    annotation (Line(points={{-4,29},{-4,0},{0,0}},     color={0,0,0}));
  connect(north11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={
          {19,16},{19,16},{6,16},{0,16},{0,0}}, color={0,0,0}));
  connect(roof11.PortF, airEle111.flowPort_Y2) annotation (Line(points={{0,29},{
          0,8}},                     color={0,0,0}));
  connect(north11.PortF, airEle111.flowPort_Z2)
    annotation (Line(points={{19,20},{13,20},{13,8},{8,8}}, color={0,0,0}));
  connect(west11.PortF, airEle111.flowPort_X1) annotation (Line(points={{-15,0},
          {-18.4,0},{-18.4,-0.2},{-8,-0.2}}, color={0,0,0}));
  connect(south11.PortF, airEle111.flowPort_Z1) annotation (Line(points={{-19,-20},
          {-13,-20},{-13,-8},{-8,-8}}, color={0,0,0}));
  connect(floor11.PortF, airEle111.flowPort_Y1) annotation (Line(points={{0,-29},
          {0,-8}},                   color={0,0,0}));
  connect(bcTSouth1.surfaceToAirPort, west11.surfaceToAirPort)
    annotation (Line(points={{-20,0},{-17,0}}, color={0,0,0}));
  connect(east11.surfaceToAirPort, bcTNorth1.surfaceToAirPort)
    annotation (Line(points={{17,0},{17,0},{22,0}}, color={0,0,0}));
  connect(airEle111.flowPort_X2, east11.PortF)
    annotation (Line(points={{8,0},{15,0}}, color={0,0,0}));
  connect(east11.PortHeat, airEle111.heatPort_extern)
    annotation (Line(points={{15,-4},{6,-4},{6,0},{0,0}}, color={191,0,0}));

  annotation(experiment(StartTime=0, StopTime=180, __Dymola_Algorithm="Cvode"),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Airvolumes/Examples/AirElementsThermal1x1x1.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-50,-50},{50,50}}),graphics={
        Line(
          points={{-50,-50},{-40,-50}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Open},
          thickness=1),
        Line(
          points={{-50,-50},{-50,-40}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Open},
          thickness=1),
        Line(
          points={{-50,-50},{-42,-42}},
          color={28,108,200},
          arrow={Arrow.None,Arrow.Open},
          thickness=1),
        Text(
          extent={{-40,-46},{-34,-54}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="X"),
        Text(
          extent={{-42,-34},{-36,-42}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Z"),
        Text(
          extent={{-54,-32},{-48,-40}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          textString="Y")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-50,-50},{50,50}})),
Documentation(info="<html>
<p>
Example that simulates thermal behaviour of a single air element.
</p>
</html>",
revisions="<html>
<ul>
<li>
February 21, 2017, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end AirElementsThermal1x1x1;
