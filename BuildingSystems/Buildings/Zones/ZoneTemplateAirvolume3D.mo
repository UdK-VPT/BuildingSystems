within BuildingSystems.Buildings.Zones;
model ZoneTemplateAirvolume3D
  "Template model for a thermal zone with a 3D-discretized air volume"
  extends BuildingSystems.Buildings.BaseClasses.ZoneTemplateGeneral;
   /***************************************************************************/
   // Creation of the pure air-volume-body
   /*
  |-----------------|
  |                /|
  h              /  |    Y
  e           h     |    |    Z
  i         t       |    |  /
  g       d         |    |/
  h     i           |    |---- X
  t   w             |
  | /               |
  |-------length----|
  */
  //
  //
  // length = length, divided into elemX element of the size dxVec
  // width = height, divided into elemY element of the size dyVec
  // heigth = width, divided into elemZ element of the size dzVec

  parameter Modelica.SIunits.Length length = 1.0 "Overall length of the zone" annotation(Dialog(tab = "Airvolume", group = "Airvolume Geometry"));
  parameter Modelica.SIunits.Length width = 1.0 "Overall width of the zone" annotation(Dialog(tab = "Airvolume", group = "Airvolume Geometry"));
  //parameter Modelica.SIunits.Length height = 1.0 "Overall height of the zone" annotation(Dialog(tab = "Airvolume", group = "Airvolume Geometry"));
  parameter Integer elemX = 3 "Number of FiniteVolumes in X-direction" annotation (Dialog(tab = "Airvolume", group = "Airvolume Discretization"));
  parameter Integer elemY = 3 "Number of FiniteVolumes in Y-direction" annotation (Dialog(tab = "Airvolume", group = "Airvolume Discretization"));
  parameter Integer elemZ = 3 "Number of FiniteVolumes in Z-direction" annotation (Dialog(tab = "Airvolume", group = "Airvolume Discretization"));
  parameter Modelica.SIunits.Length dxVec[elemX] = fill(length/elemX,elemX)
    "Size of FiniteVolumes in X-direction"   annotation (Dialog(tab = "Airvolume", group = "Airvolume Discretization"));
  parameter Modelica.SIunits.Length dyVec[elemY] = fill(width/elemY,elemY)
    "Size of FiniteVolumes in Y-direction"   annotation (Dialog(tab = "Airvolume", group = "Airvolume Discretization"));
  parameter Modelica.SIunits.Length dzVec[elemZ] = fill(height/elemZ,elemZ)
    "Size of FiniteVolumes in Z-direction"   annotation (Dialog(tab = "Airvolume", group = "Airvolume Discretization"));
  parameter Modelica.SIunits.Temp_K T_start = 293.15 "Start temperature";
  /********************************************************************/
  //dim = {3, 3},
  /********************************************************************/
  parameter Integer surf1ai[elemY,elemZ] = {{3,3,3},{2,2,2},{1,1,1}}
    "surf1 index i"  annotation(Dialog(tab = "Surface Construction", group = "Surface1 Placement - sidewall 1"), HideResult=true);
  parameter Integer surf1aj[elemY,elemZ] = {{1,2,3},{1,2,3},{1,2,3}}
    "surf1 index j"  annotation(Dialog(tab = "Surface Construction", group = "Surface1 Placement - sidewall 1"), HideResult=true);
  parameter Integer surf1nCon[elemY,elemZ] = {{1,1,1},{1,1,1},{1,1,1}}
    "surf1 Construction number"  annotation(Dialog(tab = "Surface Construction", group = "Surface1 Placement - sidewall 1"), HideResult=true);
  parameter Integer surf2ai[elemY,elemX] = {{3,3,3},{2,2,2},{1,1,1}}
    "surf2 index i"  annotation(Dialog(tab = "Surface Construction", group = "Surface2 Placement - sidewall 2"), HideResult=true);
  parameter Integer surf2aj[elemY,elemX] = {{1,2,3},{1,2,3},{1,2,3}}
    "surf2 index j"  annotation(Dialog(tab = "Surface Construction", group = "Surface2 Placement - sidewall 2"), HideResult=true);
  parameter Integer surf2nCon[elemY,elemX] = {{1,1,1},{1,1,1},{1,1,1}}
    "surf2 Construction number"  annotation(Dialog(tab = "Surface Construction", group = "Surface2 Placement - sidewall 2"), HideResult=true);
  parameter Integer surf3ai[elemY,elemZ] = {{3,3,3},{2,2,2},{1,1,1}}
    "surf3 index i"  annotation(Dialog(tab = "Surface Construction", group = "Surface3 Placement - sidewall 3"), HideResult=true);
  parameter Integer surf3aj[elemY,elemZ] = {{1,2,3},{1,2,3},{1,2,3}}
    "surf3 index j"  annotation(Dialog(tab = "Surface Construction", group = "Surface3 Placement - sidewall 3"), HideResult=true);
  parameter Integer surf3nCon[elemY,elemZ] = {{1,1,1},{1,1,1},{1,1,1}}
    "surf3 Construction number"  annotation(Dialog(tab = "Surface Construction", group = "Surface3 Placement - sidewall 3"), HideResult=true);
  parameter Integer surf4ai[elemY,elemX] = {{3,3,3},{2,2,2},{1,1,1}}
    "surf4 index i"  annotation(Dialog(tab = "Surface Construction", group = "Surface4 Placement - sidewall 4"), HideResult=true);
  parameter Integer surf4aj[elemY,elemX] = {{1,2,3},{1,2,3},{1,2,3}}
    "surf4 index j"  annotation(Dialog(tab = "Surface Construction", group = "Surface4 Placement - sidewall 4"), HideResult=true);
  parameter Integer surf4nCon[elemY,elemX] = {{1,1,1},{1,1,1},{1,1,1}}
    "surf4 Construction number"  annotation(Dialog(tab = "Surface Construction", group = "Surface4 Placement - sidewall 4"), HideResult=true);
  parameter Integer surf5ai[elemZ,elemX] = {{3,3,3},{2,2,2},{1,1,1}}
    "surf5 index i"  annotation(Dialog(tab = "Surface Construction", group = "Surface5 Placement - floor"), HideResult=true);
  parameter Integer surf5aj[elemZ,elemX] = {{1,2,3},{1,2,3},{1,2,3}}
    "surf5 index j"  annotation(Dialog(tab = "Surface Construction", group = "Surface5 Placement - floor"), HideResult=true);
  parameter Integer surf5nCon[elemZ,elemX] = {{1,1,1},{1,1,1},{1,1,1}}
    "surf5 Construction number"  annotation(Dialog(tab = "Surface Construction", group = "Surface5 Placement - floor"), HideResult=true);
  parameter Integer surf6ai[elemZ,elemX] = {{3,3,3},{2,2,2},{1,1,1}}
    "surf6 index i" annotation(Dialog(tab = "Surface Construction", group = "Surface6 Placement - ceiling"), HideResult=true);
  parameter Integer surf6aj[elemZ,elemX] = {{1,2,3},{1,2,3},{1,2,3}}
    "surf6 index j" annotation(Dialog(tab = "Surface Construction", group = "Surface6 Placement - ceiling"), HideResult=true);
  parameter Integer surf6nCon[elemZ,elemX] = {{1,1,1},{1,1,1},{1,1,1}}
    "surf6 Construction number"  annotation(Dialog(tab = "Surface Construction", group = "Surface6 Placement - ceiling"), HideResult=true);

  BuildingSystems.Buildings.Airvolumes.Airvolume3D.zone3Dwrap airvolume(
    T_start = T_start,
    length=length,
    height=width,
    width=height,
    nConstructions1=nConstructions1,
    nConstructions2=nConstructions2,
    nConstructions3=nConstructions3,
    nConstructions4=nConstructions4,
    nConstructions5=nConstructions5,
    nConstructions6=nConstructions6,
    gridSurface1=gridSurface1,
    gridSurface2=gridSurface2,
    gridSurface3=gridSurface3,
    gridSurface4=gridSurface4,
    gridSurface5=gridSurface5,
    gridSurface6=gridSurface6,
    surf1ai=surf1ai,
    surf1aj=surf1aj,
    surf1nCon=surf1nCon,
    surf2ai=surf2ai,
    surf2aj=surf2aj,
    surf2nCon=surf2nCon,
    surf3ai=surf3ai,
    surf3aj=surf3aj,
    surf3nCon=surf3nCon,
    surf4ai=surf4ai,
    surf4aj=surf4aj,
    surf4nCon=surf4nCon,
    surf5ai=surf5ai,
    surf5aj=surf5aj,
    surf5nCon=surf5nCon,
    surf6ai=surf6ai,
    surf6aj=surf6aj,
    surf6nCon=surf6nCon,
    elemX=elemX,
    dxVec=dxVec,
    elemY=elemZ,
    dyVec=dzVec,
    elemZ=elemY,
    dzVec=dyVec);

  //********************************************************************/
   // T_set_Heating/Cooling - no Effect at the moment
  parameter Boolean calcIdealLoads = false
    "True: calculation of the ideal heating and cooling loads; false: no calculation"
    annotation(Dialog(tab="General",group="Ideal heating and cooling"));
  input BuildingSystems.Interfaces.Temp_KInput T_setHeating if calcIdealLoads
    "Set air temperature for heating of the zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-100,4}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={50,-70})));
  input BuildingSystems.Interfaces.Temp_KInput T_setCooling if calcIdealLoads
    "Set air temperature for cooling of the zone"
    annotation (Placement(transformation(extent={{-10,-10},{10,10}},origin={-100,-10}), iconTransformation(extent={{-10,-10},{10,10}},rotation=270,origin={70,-70})));

      //********************************************************************/

  // external construction-surfaces to airvolume connections

equation
    // intern west
    for i in 1:nConstructions1 loop
      connect(surfaces1.toAirPorts[i],airvolume.toSurfacePortW[i]);
    end for;
    // intern north
    for i in 1:nConstructions2 loop
      connect(surfaces2.toAirPorts[i],airvolume.toSurfacePortN[i]);
    end for;
    // intern east
    for i in 1:nConstructions3 loop
      connect(surfaces3.toAirPorts[i],airvolume.toSurfacePortE[i]);
    end for;
    // intern south
    for i in 1:nConstructions4 loop
      connect(surfaces4.toAirPorts[i],airvolume.toSurfacePortS[i]);
    end for;
    // intern floor
    for i in 1:nConstructions5 loop
      connect(surfaces5.toAirPorts[i],airvolume.toSurfacePortF[i]);
    end for;
    // intern ceiling
    for i in 1:nConstructions6 loop
      connect(surfaces6.toAirPorts[i],airvolume.toSurfacePortC[i]);
    end for;
  /********************************************************************/

  annotation (
    Documentation(
     info="<html>
<p>This Template creates a rectangular-shaped thermal zone. The indoor room could be divided into discrete air volumes of various sizes. </p>
<p>Inside every air volume a thermodynamic state is calculated by solving energy-, mass- and humidity balance equations and additional equations for temperature and pressure. </p>
<p>All air volumes are connected with six neighbours (air volumes or wall elements).</p>
<p><img src=\"modelica://BuildingSystems/Resources/Images/Airvolume3Ddoc/airVolumeConnectionS.png\"/></p>
<p>To calculate the velocity distribution between two air volume elements a simplified one dimensional form of the impulse equation is solved. </p>
<p>The resulting mass flows are distributed to the air volumes to determine a characteristic velocity.</p>
<p>To compensate neglected modelling of turbulence and boundary layers the impulse equations are parameterized.</p>
<p><img src=\"modelica://BuildingSystems/Resources/Images/Airvolume3Ddoc/boxPlacementS.png\"/></p>
<p>Figure 2 shows the spatial arrangement of the air volume elements. When instantiating ZoneTemplateAirvolume3D several parameters need to be specified. The Tab <b>General </b>are equal to </p>
<p>ZoneTemplateAirvolumeMixed. The Tab <b>Airvolume</b> needs information about overall size of the zone, the number of discrete air volumes in each direction and the size of them. By default the size is set </p>
<p>to an equidistant grid. The tab <b>Surface construction</b> describes the interface to the surrounding walls. If the number of constructions of each surface are equal to one, these values are set </p>
<p>by default (see example BuildingsSystems.Buildings.Examples.ThermalModelHouse3D).</p>
<p>If the number of constructions of one surface are greater than one the corresponding Surface Placement must providing information about the spatial arrangement of each construction. Figure 3 works as </p>
<p>the basis for this action, an example can be found under BuildingsSystems.Buildings.Examples.ThermalModelHouse3Dwindow.</p>
<p><br><img src=\"modelica://BuildingSystems/Resources/Images/Airvolume3Ddoc/wallPlacementS.png\"/></p>
<p><br><u><i>Please note that a lot of parameters (e.g. the dimension of the gridSurface1, the number of the finite volumes corresponding to this surface and the surface construction) must be consistent to each other <b>and</b> to the connected wall element.</i></u></p>
<p><br><br>More informations about the zonal approach underneath could be found in:</p>
<p>Mucha, K., Nytsch-Geusen, C. &amp; Streuling, C. (2014). <i>Ein simulationsbasierter Ansatz zur Analyse von Hitzestre&szlig;ereignissen in Innenr&auml;umen</i>, Proceedings of the 5th German-Austrian IBPSA Conference, 22.-24. September, Aachen Germany. </p>
</html>"));
end ZoneTemplateAirvolume3D;
