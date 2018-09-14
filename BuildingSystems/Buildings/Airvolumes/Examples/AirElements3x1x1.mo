within BuildingSystems.Buildings.Airvolumes.Examples;
model AirElements3x1x1
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
    BCwall_north=false)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle211(
    scalF={1,1,1},
    posX=1.5,
    posY=0.5,
    posZ=0.5,
    BCwall_east=true,
    BCwall_south=false,
    BCwall_west=true,
    BCwall_floor=true,
    BCwall_roof=true,
    BCwall_north=false)
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConnectionX(
    BCwall_east=true,
    BCwall_west=true,
    BCwall_floor=true,
    BCwall_roof=true,
    BCwall_north=false,
    BCwall_south=false)
    annotation (Placement(transformation(extent={{-50,-60},{-30,-40}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter south11(
    posX=0,
    posY=0.5,
    posZ=0.5,
    location="south")
    annotation (Placement(transformation(extent={{-96,-60},{-76,-40}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX zoneHeatConductionX
    annotation (Placement(transformation(extent={{-50,-70},{-30,-50}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter roof11(
    posX=0.5,
    posY=1,
    posZ=0.5,
    location="roof") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-70,-20})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter floor11(
    posX=0.5,
    posY=0,
    posZ=0.5,
    location="floor") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-70,-80})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter west11(
    posX=0.5,
    posY=0.5,
    posZ=1.0,
    location="west")
    annotation (Placement(transformation(extent={{-40,-40},{-60,-20}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter east11(
    posX=0.5,
    posY=0.5,
    posZ=0,
    location="east")
    annotation (Placement(transformation(extent={{-100,-80},{-80,-60}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter floor21(
    posX=1.5,
    posY=0,
    posZ=0.5,
    location="floor") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-10,-78})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter east21(
    posX=1.5,
    posY=0.5,
    posZ=0.0,
    location="east")
    annotation (Placement(transformation(extent={{-34,-80},{-14,-60}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter roof21(
    posX=1.5,
    posY=1,
    posZ=0.5,
    location="roof") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-10,-20})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter west21(
    posX=1.5,
    posY=0.5,
    posZ=1,
    location="west")
    annotation (Placement(transformation(extent={{20,-40},{0,-20}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.FlowConnectionX flowConnectionX1(
    BCwall_east=true,
    BCwall_west=true,
    BCwall_roof=true,
    BCwall_north=false,
    BCwall_south=false,
    BCwall_floor=true)
    annotation (Placement(transformation(extent={{10,-60},{30,-40}})));
  BuildingSystems.Buildings.Airvolumes.FlowConnections.ZoneHeatConductionX zoneHeatConductionX1
    annotation (Placement(transformation(extent={{10,-70},{30,-50}})));
  BuildingSystems.Buildings.Airvolumes.AirElements.AirElementThermal airEle311(
    scalF={1,1,1},
    posX=2.5,
    posY=0.5,
    posZ=0.5,
    BCwall_north=true,
    BCwall_west=true,
    BCwall_floor=true,
    BCwall_roof=true,
    BCwall_east=true,
    BCwall_south=false)
    annotation (Placement(transformation(extent={{40,-60},{60,-40}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter north11(
    posX=3,
    posY=0.5,
    posZ=0.5,
    location="north")
    annotation (Placement(transformation(extent={{90,-60},{70,-40}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter roof31(
    posX=2.5,
    posY=1,
    posZ=0.5,
    location="roof") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={50,-20})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter floor31(
    posX=2.5,
    posY=0,
    posZ=0.5,
    location="floor") annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={50,-78})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter west31(
    posX=2.5,
    posY=0.5,
    posZ=1,
    location="west")
    annotation (Placement(transformation(extent={{78,-38},{58,-18}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.SurfaceAdapter east31(
    posX=2.5,
    posY=0.5,
    posZ=0,
    location="east")
    annotation (Placement(transformation(extent={{24,-80},{44,-60}})));
  BuildingSystems.Buildings.Airvolumes.Examples.BCT bcTSouth1(T=294.15)
    annotation (Placement(transformation(extent={{-104,-60},{-84,-40}})));
  BuildingSystems.Buildings.Airvolumes.Examples.BCT bcTNorth1(T=292.15)
    annotation (Placement(transformation(extent={{100,-60},{80,-40}})));
equation
  connect(flowConnectionX.port_2, airEle211.flowPort_X1)
    annotation (Line(points={{-35.4,-50},{-22,-50},{-22,-50.2},{-18,-50.2}}));
  connect(airEle211.flowPort_X2, flowConnectionX1.port_1)
    annotation (Line(points={{-2,-50},{15.2,-50}}));
  connect(south11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={{-85,-54},
          {-78,-54},{-78,-52},{-78,-50},{-70,-50}},   color={0,0,0}));
  connect(airEle111.flowPort_X2, flowConnectionX.port_1)
    annotation (Line(points={{-62,-50},{-44.8,-50}},
                                                 color={0,0,0}));
  connect(airEle111.heatPort_intern, zoneHeatConductionX.port_1) annotation (Line(
        points={{-70,-53},{-46.7,-53},{-46.7,-60},{-44.4,-60}},
                                                              color={0,0,0}));
  connect(zoneHeatConductionX.port_2, airEle211.heatPort_intern) annotation (Line(
        points={{-35.6,-60},{-28.08,-60},{-28.08,-53},{-10,-53}},
                                                              color={0,0,0}));
  connect(east11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={{-89,-74},
          {-89,-74},{-70,-74},{-70,-58},{-70,-50}},            color={0,0,0}));
  connect(floor11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={{-66,-79},
          {-66,-79},{-66,-50},{-70,-50}},                color={0,0,0}));
  connect(roof11.PortHeat, airEle111.heatPort_extern)
    annotation (Line(points={{-74,-21},{-74,-50},{-70,-50}},
                                                        color={0,0,0}));
  connect(west11.PortHeat, airEle111.heatPort_extern) annotation (Line(points={{-51,-34},
          {-51,-34},{-64,-34},{-70,-34},{-70,-50}},        color={0,0,0}));
  connect(roof11.PortF, airEle111.flowPort_Y2) annotation (Line(points={{-70,-21},{-70,
          -42}},                     color={0,0,0}));
  connect(west11.PortF, airEle111.flowPort_Z2) annotation (Line(points={{-51,-30},{-57,
          -30},{-57,-42},{-62,-42}},
                                   color={0,0,0}));
  connect(south11.PortF, airEle111.flowPort_X1) annotation (Line(points={{-85,-50},{-88.4,
          -50},{-88.4,-50.2},{-78,-50.2}},
                                       color={0,0,0}));
  connect(east11.PortF, airEle111.flowPort_Z1) annotation (Line(points={{-89,-70},{-83,
          -70},{-83,-58},{-78,-58}}, color={0,0,0}));
  connect(floor11.PortF, airEle111.flowPort_Y1) annotation (Line(points={{-70,-79},{-70,
          -58}},                     color={0,0,0}));
  connect(roof21.PortHeat, airEle211.heatPort_extern) annotation (Line(points={{-14,-21},
          {-14,-50},{-10,-50}},            color={0,0,0}));
  connect(west21.PortHeat, airEle211.heatPort_extern) annotation (Line(points={{9,-34},
          {9,-33.85},{-10,-33.85},{-10,-50}},
                                           color={0,0,0}));
  connect(floor21.PortHeat, airEle211.heatPort_extern)
    annotation (Line(points={{-6,-77},{-6,-50},{-10,-50}},
                                                   color={0,0,0}));
  connect(floor21.PortF, airEle211.flowPort_Y1) annotation (Line(points={{-10,-77},{-10,
          -58}},                color={0,0,0}));
  connect(east21.PortF, airEle211.flowPort_Z1) annotation (Line(points={{-23,-70},{-21,
          -70},{-21,-58},{-18,-58}}, color={0,0,0}));
  connect(east21.PortHeat, airEle211.heatPort_extern) annotation (Line(points={{-23,-74},
          {-23,-74.55},{-10,-74.55},{-10,-50}},color={0,0,0}));
  connect(roof21.PortF, airEle211.flowPort_Y2)
    annotation (Line(points={{-10,-21},{-10,-32},{-10,-42}},
                                                    color={0,0,0}));
  connect(west21.PortF, airEle211.flowPort_Z2)
    annotation (Line(points={{9,-30},{9,-30},{4,-30},{2,-30},{2,-42},{-2,-42}},
                                                               color={0,0,0}));
  connect(airEle211.heatPort_intern, zoneHeatConductionX1.port_1) annotation (
      Line(points={{-10,-53},{0.85,-53},{0.85,-60},{15.6,-60}},
                                                              color={0,0,0}));
  connect(flowConnectionX1.port_2, airEle311.flowPort_X1)
    annotation (Line(points={{24.6,-50},{34,-50},{34,-50.2},{42,-50.2}}));
  connect(zoneHeatConductionX1.port_2, airEle311.heatPort_intern)
    annotation (Line(points={{24.4,-60},{50,-60},{50,-53}},color={0,0,0}));
  connect(airEle311.flowPort_X2, north11.PortF)
    annotation (Line(points={{58,-50},{58,-50},{79,-50}}));
  connect(roof31.PortF, airEle311.flowPort_Y2)
    annotation (Line(points={{50,-21},{50,-32},{50,-42}},
                                                     color={0,0,0}));
  connect(roof31.PortHeat, airEle311.heatPort_extern)
    annotation (Line(points={{46,-21},{46,-50},{50,-50}},    color={0,0,0}));
  connect(west31.PortHeat, airEle311.heatPort_extern) annotation (Line(points={{67,-32},
          {67,-31.2},{50,-31.2},{50,-50}}, color={0,0,0}));
  connect(west31.PortF, airEle311.flowPort_Z2) annotation (Line(points={{67,-28},{63,
          -28},{63,-42},{58,-42}},
                            color={0,0,0}));
  connect(north11.PortHeat, airEle311.heatPort_extern)
    annotation (Line(points={{79,-54},{50,-54},{50,-50}},
                                                      color={0,0,0}));
  connect(floor31.PortHeat, airEle311.heatPort_extern)
    annotation (Line(points={{54,-77},{54,-50},{50,-50}},
                                                      color={0,0,0}));
  connect(floor31.PortF, airEle311.flowPort_Y1) annotation (Line(points={{50,-77},{50,
          -58}},                 color={0,0,0}));
  connect(east31.PortF, airEle311.flowPort_Z1) annotation (Line(points={{35,-70},{39,
          -70},{39,-58},{42,-58}},    color={0,0,0}));
  connect(east31.PortHeat, airEle311.heatPort_extern) annotation (Line(points={{35,-74},
          {35,-73.55},{50,-73.55},{50,-50}},    color={0,0,0}));
  connect(bcTSouth1.surfaceToAirPort, south11.surfaceToAirPort)
    annotation (Line(points={{-90,-50},{-87,-50}}, color={0,0,0}));
  connect(north11.surfaceToAirPort, bcTNorth1.surfaceToAirPort)
    annotation (Line(points={{81,-50},{81,-50},{86,-50}}, color={0,0,0}));

  annotation(experiment(StartTime=0, StopTime=180, __Dymola_Algorithm="Cvode"),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Airvolumes/Examples/AirElements3x1x1.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates the air flow between three serial connected air elements, where the left
element airEle111 has a thermal boundary condition of 21 degree Celsius and the right element airEle311
a thermal boundary condition of 19 degree Celsius.
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
end AirElements3x1x1;
