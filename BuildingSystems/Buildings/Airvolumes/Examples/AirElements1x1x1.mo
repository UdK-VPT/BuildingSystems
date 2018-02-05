within BuildingSystems.Buildings.Airvolumes.Examples;
model AirElements1x1x1
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
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter south11(
    posX=0,
    posY=0.5,
    posZ=0.5,
    location="south")
    annotation (Placement(transformation(extent={{-26,-10},{-6,10}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter roof11(
    posX=0.5,
    posY=1,
    posZ=0.5,
    location="roof")
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=-90,origin={0,30})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter floor11(
    posX=0.5,
    posY=0,
    posZ=0.5,
    location="floor")
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},rotation=90,origin={0,-30})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter west11(
    posX=0.5,
    posY=0.5,
    posZ=1.0,
    location="west")
    annotation (Placement(transformation(extent={{30,10},{10,30}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter east11(
    posX=0.5,
    posY=0.5,
    posZ=0,
    location="east")
    annotation (Placement(transformation(extent={{-30,-30},{-10,-10}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter north11(
    posX=1,
    posY=0.5,
    posZ=0.5,
    location="north")
    annotation (Placement(transformation(extent={{26,-10},{6,10}})));
  BuildingSystems.Buildings.Airvolumes.Examples.BCT bcTSouth1(T=294.15)
    annotation (Placement(transformation(extent={{-34,-10},{-14,10}})));
  BuildingSystems.Buildings.Airvolumes.Examples.BCT bcTNorth1(T=292.15)
    annotation (Placement(transformation(extent={{36,-10},{16,10}})));
equation
  connect(south11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={{-15,-4},
          {-8,-4},{-8,-2},{-8,0},{0,0}},              color={0,0,0}));
  connect(east11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={{-19,-24},
          {-19,-24},{0,-24},{0,-8},{0,0}},                     color={0,0,0}));
  connect(floor11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={{4,-29},
          {4,-29},{4,0},{0,0}},                          color={0,0,0}));
  connect(roof11.PortHeat, airEle111.heatPort_extern)
    annotation (Line(points={{-4,29},{-4,0},{0,0}},     color={0,0,0}));
  connect(west11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={{19,16},
          {19,16},{6,16},{0,16},{0,0}},                    color={0,0,0}));
  connect(roof11.PortF, airEle111.flowPort_Y2) annotation (Line(points={{0,29},{
          0,8}},                     color={0,0,0}));
  connect(west11.PortF, airEle111.flowPort_Z2) annotation (Line(points={{19,20},
          {13,20},{13,8},{8,8}},   color={0,0,0}));
  connect(south11.PortF, airEle111.flowPort_X1) annotation (Line(points={{-15,0},
          {-18.4,0},{-18.4,-0.2},{-8,-0.2}},
                                       color={0,0,0}));
  connect(east11.PortF, airEle111.flowPort_Z1) annotation (Line(points={{-19,-20},
          {-13,-20},{-13,-8},{-8,-8}},
                                     color={0,0,0}));
  connect(floor11.PortF, airEle111.flowPort_Y1) annotation (Line(points={{0,-29},
          {0,-8}},                   color={0,0,0}));
  connect(bcTSouth1.surfaceToAirPort, south11.surfaceToAirPort)
    annotation (Line(points={{-20,0},{-17,0}},     color={0,0,0}));
  connect(north11.surfaceToAirPort, bcTNorth1.surfaceToAirPort)
    annotation (Line(points={{17,0},{17,0},{22,0}},       color={0,0,0}));

  connect(airEle111.flowPort_X2, north11.PortF)
    annotation (Line(points={{8,0},{15,0}}, color={0,0,0}));
  connect(north11.PortHeat, airEle111.heatPort_extern)
    annotation (Line(points={{15,-4},{6,-4},{6,0},{0,0}}, color={191,0,0}));

  annotation(experiment(StartTime=0, StopTime=180, __Dymola_Algorithm="Cvode"),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Airvolumes/Examples/AirElements1x1x1.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
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
end AirElements1x1x1;
