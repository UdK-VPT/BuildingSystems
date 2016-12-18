within BuildingSystems.Buildings.Examples;
model DistrictModel
  "Simulation of strong simplified 50 thermal building models"
  extends Modelica.Icons.Example;

  parameter Integer nBuildings = 40;
  parameter Integer nSurfacesProBuilding = building[1].nSurfacesAmbient;
  BuildingSystems.Buildings.BuildingTemplates.Building1Zone0D building[nBuildings](
    each AAmb=1000,
    each AInn=500,
    each AGro=200,
    each nWindows=1,
    each AWin={100},
    each VAir=2000,
    each CAmb=100000,
    each CInn=100000,
    each CGro=100000,
    angleDegAziBuilding = {10*i for i in 1:nBuildings})
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  //Modelica.Blocks.Sources.Constant TSetCooling(k=1000.0) // -> Free floting temperature
  Modelica.Blocks.Sources.Constant TSetCooling(k=273.15 + 24.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={32,10})));
  //Modelica.Blocks.Sources.Constant TSetHeating(k=0.0) // -> Free floting temperature
  Modelica.Blocks.Sources.Constant TSetHeating(k=273.15 + 20.0)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={40,16})));
  Modelica.Blocks.Sources.Constant airchange(k=0.5)
    annotation (Placement(transformation(extent={{-2,-2},{2,2}},rotation=180,origin={24,4})));
  BuildingSystems.Buildings.Ambient ambient(
    nSurfaces=nBuildings*building[1].nSurfacesAmbient,
    redeclare BuildingSystems.Climate.WeatherDataMeteonorm.WeatherDataFile_Germany_Berlin weatherDataFile)
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
equation
   for i in 1:nBuildings loop
     connect(ambient.toSurfacePorts[nSurfacesProBuilding*(i-1)+1:nSurfacesProBuilding*(i-1)+nSurfacesProBuilding], building[i].toAmbientSurfacesPorts[1:nSurfacesProBuilding]) annotation (Line(
      points={{-22,7.66667},{-20,7.66667},{-20,8},{-20,11.3333},{-20,7.66667},{-9,7.66667}},
      color={0,255,0},
      smooth=Smooth.None));
    connect(ambient.toAirPorts[nSurfacesProBuilding*(i-1)+1:nSurfacesProBuilding*(i-1)+nSurfacesProBuilding], building[i].toAmbientAirPorts[1:nSurfacesProBuilding]) annotation (Line(
      points={{-22,-0.333333},{-16,-0.333333},{-16,-0.333333},{-9,-0.333333}},
      color={85,170,255},
      smooth=Smooth.None));
    connect(ambient.TAirRef, building[i].TAirAmb) annotation (Line(
      points={{-38.2,7},{-40,7},{-40,12},{6.2,12},{6.2,9.8}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(ambient.xAir, building[i].xAirAmb) annotation (Line(
      points={{-38.2,5},{-42,5},{-42,14},{8.4,14},{8.4,9.8}},
      color={0,0,127},
      smooth=Smooth.None));
    connect(building[i].airchange[1], airchange.y) annotation (Line(
        points={{9.8,4},{21.8,4}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(building[i].T_setHeating[1], TSetHeating.y) annotation (Line(
        points={{9.8,8},{16,8},{16,16},{37.8,16}},
        color={0,0,127},
        smooth=Smooth.None));
    connect(building[i].T_setCooling[1], TSetCooling.y) annotation (Line(
        points={{9.8,6},{18,6},{18,10},{29.8,10}},
        color={0,0,127},
        smooth=Smooth.None));
  end for;
  annotation(experiment(StartTime=0, StopTime=31536000),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/Buildings/Examples/DistrictModel.mos" "Simulate and plot"),
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-60,-60},{60,60}}), graphics={Text(extent={{-52,-18},{52,-86}},lineColor={0,0,255},
    textString="Simulation of strong simplified 40 thermal building models")}),
    Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-40},{100,40}})),
Documentation(info="<html>
<p>
Example that simulates 40 strong simplified (low-order) thermal building models.
</p>
</html>",
revisions="<html>
<ul>
<li>
May 21, 2016, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
 end DistrictModel;
