within BuildingSystems.Buildings.Zones;
model ZoneTemplateAirvolume3D
  "Template model for a thermal zone with 3D discretized air volume"
  extends BuildingSystems.Buildings.BaseClasses.ZoneTemplateGeneral(
    redeclare final package Medium = BuildingSystems.Media.Air);
  parameter Integer nAirElements(min=1) = 1
    "Number of air elements, which are included in the air volume"
    annotation(Dialog(tab="General"));
  parameter Modelica.SIunits.Temp_K T_start = 293.15
    "Start air temperature of the zone"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.MassFraction x_start = 0.005
    "Start air moisture of the zone"
    annotation (Dialog(tab="Initialization"));
  output BuildingSystems.Interfaces.Temp_KOutput TAir[nAirElements]
    "Air temperature"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={34,36}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={110,-10})));
  output BuildingSystems.Interfaces.Moisture_absOutput xAir[nAirElements]
    "Absolute air moisture"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={34,46}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={110,-50})));
  output BuildingSystems.Interfaces.VelocityOutput vAir[nAirElements]
    "Air velocity (magnitude)"
    annotation (Placement(transformation(extent={{24,46},{44,66}}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=0,  origin={110,-70})));
  output BuildingSystems.Interfaces.PressureOutput pAir[nAirElements]
    "Air pressure"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},rotation=180,origin={34,26}),
      iconTransformation(extent={{-10,-10},{10,10}},rotation=0,origin={110,-90})));

  replaceable BuildingSystems.Buildings.Airvolumes.Airvolume3DTemplate airvolume(
    nSurfaces=nSurfaces,
    nAirElements=nAirElements,
    V=V,
    T_start=fill(T_start,nAirElements),
    x_start=fill(x_start,nAirElements))
    annotation (Placement(transformation(extent={{-24,64},{24,16}})));
equation
  if not prescribedAirchange then
    for i in 1:nAirpaths loop
      connect(airpathPorts[i], airvolume.airpathPorts[i])
        annotation (Line(points={{-94,-60},{-94,78},{0,78},{0,59.2}}, color={0,127,255}));
    end for;
  end if;
  for i in 1:nConstructions loop
    connect(surfaces.toAirPorts[i],airvolume.toSurfacePorts[i]);
  end for;
  connect(airvolume.T,TAir)
    annotation (Line(points={{19.2,35.2},{22.6,35.2},{22.6,36},{34,36}}, color={0,0,127}));
  connect(airvolume.x,xAir)
    annotation (Line(points={{19.2,44.8},{24.6,44.8},{24.6,46},{34,46}}, color={0,0,127}));
  connect(airvolume.v,vAir)
    annotation (Line(points={{19.2,54.4},{21.6,54.4},{21.6,56},{34,56}}, color={0,0,127}));
  connect(airvolume.p, pAir)
    annotation (Line(points={{19.2,25.6},{22.6,25.6},{22.6,26},{34,26}}, color={0,0,127}));

  annotation(defaultComponentName="zone",
Documentation(info="<html>
  <p>
  This is a template model for a thermal zone with 3D discretized air volume.
  </p>
  </html>", revisions="<html>
  <ul>
  <li>
  October 29, 2020 by Christoph Nytsch-Geusen:<br/>
  Pressure output added.
  </li>
  <li>
  January 29, 2017 by Christoph Nytsch-Geusen:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end ZoneTemplateAirvolume3D;
