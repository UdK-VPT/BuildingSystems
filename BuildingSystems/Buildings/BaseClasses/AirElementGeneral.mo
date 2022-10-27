within BuildingSystems.Buildings.BaseClasses;
partial model AirElementGeneral
  "An air element for three-dimensional air flow simulation"
  ///////////////////////////////////////////////////////
  /////////////     CONSTANTS     ///////////////////////
  constant Modelica.Units.SI.SpecificHeatCapacity cAir=1005.00
    "Specific heat capacity" annotation (HideResult=true);
  constant Modelica.Units.SI.SpecificHeatCapacity cH20=1860.0
    "Specific heat capacity of water vapor" annotation (HideResult=true);
  constant Modelica.Units.SI.SpecificHeatCapacity cH20Liq=4190.0
    "Specific heat capacity of liquid water" annotation (HideResult=true);
  constant Modelica.Units.SI.MolarMass n=0.0289644
    "Molar mass of dry air: 0.0289644 kg / mol" annotation (HideResult=true);
  constant Modelica.Units.SI.DynamicViscosity nu=18.232*10^(-6)
    "Dynamic viscosity" annotation (HideResult=true);
  // nominal-values
  constant Modelica.Units.SI.Density rho_nominal=1.2
    "Air density under nominal conditions" annotation (HideResult=true);
  constant Modelica.Units.SI.Temperature T_nominal=293.15
    "Air temperature under nominal conditions" annotation (HideResult=true);
  constant Real R_v(unit="J/(kg.K)") = 461.4
    "Gas constant for water vapor to be used in the gas equation"
    annotation (HideResult=true);
  constant Real rH2O(unit="J/kg") = 2500000.0
    "Enthalpy of vaporization for water"
    annotation (HideResult=true);
  ///////////////////////////////////////////////////////
  /////////////     PARAMETER     ///////////////////////
  parameter Modelica.Units.SI.Length[3] scalF
    "Dimension of this finite volume [edge lengths x,y,z]"
    annotation (Dialog(tab="General", group="Dimension"));
  // Absolut position in space (center)
  parameter Modelica.Units.SI.Length posX "FV absolute central position X"
    annotation (Dialog(tab="General", group="Position"));
  parameter Modelica.Units.SI.Length posY "FV absolute central position Y"
    annotation (Dialog(tab="General", group="Position"));
  parameter Modelica.Units.SI.Length posZ "FV absolute central position Z"
    annotation (Dialog(tab="General", group="Position"));
  // Relative Position in space (near-wall or inside)
  parameter Boolean BCwall_south = false
    "Inner or boundary volume (direction X1)"
    annotation (Dialog(tab = "General", group = "Boundaries"));
  parameter Boolean BCwall_north = false
    "Inner or boundary volume (direction X2)"
    annotation (Dialog(tab = "General", group = "Boundaries"));
  parameter Boolean BCwall_floor = false
    "Inner or boundary volume (direction Y1)"
    annotation (Dialog(tab = "General", group = "Boundaries"));
  parameter Boolean BCwall_roof = false
    "Inner or boundary volume (direction Y2)"
    annotation (Dialog(tab = "General", group = "Boundaries"));
  parameter Boolean BCwall_east = false
    "Inner or boundary volume (direction Z1)"
    annotation (Dialog(tab = "General", group = "Boundaries"));
  parameter Boolean BCwall_west = false
    "Inner or boundary volume (direction Z2)"
    annotation (Dialog(tab = "General", group = "Boundaries"));
  //////////////////////////////////////////////////////
  parameter Modelica.Units.SI.Temperature T_start=293.15
    "Start value air temperature" annotation (Dialog(tab="Initialization"));
  parameter Modelica.Units.SI.Density rho_start=1.2 "Start value air density"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.Units.SI.MassFraction x_start=0.005
    "Start value air moisture" annotation (Dialog(tab="Initialization"));
  final parameter Modelica.Units.SI.Mass mAir_start=dx*dy*dz*rho_nominal
    "Start value Mass of dry air of the air volume";
  final parameter Modelica.Units.SI.Mass mH2OAir_start=x_start*dx*dy*dz*
      rho_nominal "Start value Mass of water vapor";
  parameter Modelica.Units.SI.Mass mH2OLiq_start=0.0
    "Start value Mass of liquid water" annotation (Dialog(tab="Initialization"));
  final parameter Modelica.Units.SI.InternalEnergy U_start=(rho_nominal*(dx*dy*
      dz)*cAir + rho_nominal*(dx*dy*dz)*x_start*cH20)*T_start + rH2O*
      rho_nominal*(dx*dy*dz)*x_start
    "Start value of the internal energy of the air volume";
  //////////////////  INTERN  //////////////////////////
  final parameter Modelica.Units.SI.Length[3] pos={posX,posY,posZ}
    annotation (HideResult=true);
  // Scaling factor for finite element size
  // 1x1x1-Box - finite volume element
  final parameter Modelica.Units.SI.Length dx=scalF[1]
    annotation (HideResult=true);
  final parameter Modelica.Units.SI.Length dy=scalF[2]
    annotation (HideResult=true);
  final parameter Modelica.Units.SI.Length dz=scalF[3]
    annotation (HideResult=true);
  final parameter Modelica.Units.SI.Length[3] dim={dx,dy,dz}
    annotation (HideResult=false);
  /////////////////    SOURCES    ///////////////////////
  parameter Modelica.Units.SI.MassFlowRate SourceM_flow=0.0 "Source Option"
    annotation (Dialog(tab="General", group="Sources"));
  parameter Modelica.Units.SI.SpecificEnthalpy Source_h=cAir*T_start
    "Source Option" annotation (Dialog(tab="General", group="Sources"));

  /////////////     CONSTANTS    //////////////////////
  /////////////     PARAMETER    //////////////////////
  /////////////      SOURCES    ///////////////////////
  ////////////  THERMOPHYSICAL PROPERTIES  /////////////

  // Simple Air
  // replaceable package Medium = Modelica.Media.Air.SimpleAir
  // constrainedby Modelica.Media.Interfaces.PartialMedium;
  // Base properties (p, rho, T, h, u, R, MM and, if applicable, X and Xi) of a medium
  // Medium.BaseProperties fluid;

  // alternativ:

  // record: {T, p, rho, h, x}
  // BuildingSystems.Buildings.Airvolumes.AirElements.FluidProp fluid(
  //   x(start = 0.005, fixed = true));
  BuildingSystems.Buildings.Airvolumes.AirElements.FluidProp fluid
    "Record of fluid properties {T, p, rho, h, x}";
  /////////////////////////////////////////////////////
  /////////////      VARIABLES    /////////////////////
  //
  // Characteristic Velocity of the finite Volume
  Modelica.Units.SI.Velocity[3] vVec(start={0,0,0}) "Characteristic Velocity";
  // for comparisons
  Modelica.Units.SI.Velocity velMag(start=0.0)
    "Start value of the air speed (magnitude of the velocity)"
    annotation (Dialog(tab="Initialization"));
  // Relative air humidity
  BuildingSystems.Types.RelativeHumidity phi(
    start = 0.5)
    "Start value of the relative humidity"
    annotation (Dialog(tab = "Initialization"));
  ///////////////////////////////////////////////////////
  ////////////////     PORTS   //////////////////////////
  // 3D-Fluid-Ports
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid flowPort_X1
    "Connection to flow-/wall-element, direction X1"
    annotation (Placement(transformation(extent={{-90,-12},{-70,8}}),
        iconTransformation(extent={{-90,-12},{-70,8}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid flowPort_X2
    "Connection to flow-/wall-element, direction X2"
    annotation (Placement(transformation(extent={{70,-10},{90,10}}),
      iconTransformation(extent={{70,-10},{90,10}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid flowPort_Y1
    "Connection to flow-/wall-element, direction Y1"
    annotation (Placement(transformation(extent={{-10,-90},{10,-70}}),
      iconTransformation(extent={{-10,-90},{10,-70}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid flowPort_Y2
    "Connection to flow-/wall-element, direction Y2"
    annotation (Placement(transformation(extent={{-10,70},{10,90}}),
      iconTransformation(extent={{-10,70},{10,90}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid flowPort_Z1
    "Connection to flow-/wall-element, direction Z1"
    annotation (Placement(transformation(extent={{-90,-90},{-70,-70}}),
      iconTransformation(extent={{-90,-90},{-70,-70}})));
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid flowPort_Z2
    "Connection to flow-/wall-element, direction Z2"
    annotation (Placement(transformation(extent={{70,70},{90,90}}),
      iconTransformation(extent={{70,70},{90,90}})));
  //"heat conduction (FV <-> FV)"
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidHeatExt heatPort_intern
    annotation (Placement(transformation(extent={{-10,-40},{10,-20}}),
      iconTransformation(extent={{-10,-40},{10,-20}})));
  //"heat convection (walls, incl. Radiation <-> FV)"
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort_extern
    annotation (Placement(transformation(extent={{-10,-10},{10,10}}),
      iconTransformation(extent={{-10,-10},{10,10}})));
  // Connection to thermophys. model
  BuildingSystems.Buildings.Airvolumes.Interfaces.AssessmentPort assessementPort;
algorithm
  // Velocities: assign by massflows: V = m_flow/(rho*A)
  // depends on the flow-direction of both sides
  // |1| -> |FV| -> |2|   FV: V1
  // |1| <- |FV| <- |2|   FV: V2
  // |1| -> |FV| <- |2|   FV: V1-V2
  // Exceptions at Boundaries
  //////////////////////////////////////////////////////
  // Vx
  if (not BCwall_east and not BCwall_west) then
    if noEvent(flowPort_X1.m_flow > 0) and noEvent(flowPort_X2.m_flow <= 0) then
      vVec[1] := flowPort_X1.m_flow/(inStream(flowPort_X1.rho)*dz*dy);
    elseif noEvent(flowPort_X1.m_flow <= 0) and noEvent(flowPort_X2.m_flow > 0) then
      vVec[1] := - flowPort_X2.m_flow/(inStream(flowPort_X2.rho)*dz*dy);
    elseif noEvent(flowPort_X1.m_flow > 0) and noEvent(flowPort_X2.m_flow > 0) then
      vVec[1] := (flowPort_X1.m_flow/(inStream(flowPort_X1.rho)*dz*dy) - flowPort_X2.m_flow/(inStream(flowPort_X2.rho)*dz*dy));
    else
      vVec[1] := 0;
    end if;

  elseif (BCwall_west and not BCwall_east) then
    if noEvent(flowPort_X1.m_flow > 0 or flowPort_X1.m_flow < 0) then
      vVec[1] := flowPort_X1.m_flow/(inStream(flowPort_X1.rho)*dz*dy); // BC
    elseif noEvent(abs(flowPort_X1.m_flow) < Modelica.Constants.small and flowPort_X2.m_flow > 0.0) then
      vVec[1] := - flowPort_X2.m_flow/(inStream(flowPort_X2.rho)*dz*dy);
    elseif noEvent(abs(flowPort_X1.m_flow) < Modelica.Constants.small and flowPort_X2.m_flow <= 0.0) then
      vVec[1] := min(0.05,(log(1 + dim[1]))) * (- flowPort_X2.m_flow/(inStream(flowPort_X2.rho)*dz*dy));
    else
      vVec[1] := 0;
    end if;

  elseif (BCwall_east and not BCwall_west) then
    if noEvent(flowPort_X2.m_flow > 0 or flowPort_X2.m_flow < 0) then
      vVec[1] := - flowPort_X2.m_flow/(inStream(flowPort_X2.rho)*dz*dy); // BC
    elseif noEvent(abs(flowPort_X2.m_flow) < Modelica.Constants.small and flowPort_X1.m_flow > 0.0) then
      vVec[1] := flowPort_X1.m_flow/(inStream(flowPort_X1.rho)*dz*dy);
    elseif noEvent(abs(flowPort_X2.m_flow) < Modelica.Constants.small and flowPort_X1.m_flow <= 0.0) then
       vVec[1] := min(0.05,(log(1 + dim[1]))) * flowPort_X1.m_flow/(inStream(flowPort_X1.rho)*dz*dy);
    else
    vVec[1] := 0;
    end if;

  // one-element-gap:
  elseif (BCwall_east and  BCwall_west) then
    if noEvent(flowPort_X1.m_flow > 0) and noEvent(flowPort_X2.m_flow < 0) then
      vVec[1] := flowPort_X1.m_flow/(inStream(flowPort_X1.rho)*dz*dy);
    elseif noEvent(flowPort_X1.m_flow > 0) and noEvent(abs(flowPort_X2.m_flow) < Modelica.Constants.small) then
      vVec[1] := min(0.05,(log(1 + dim[1]))) * flowPort_X1.m_flow/(inStream(flowPort_X1.rho)*dz*dy);
    elseif noEvent(flowPort_X1.m_flow < 0) and noEvent(flowPort_X2.m_flow > 0) then
      vVec[1] := - flowPort_X2.m_flow/(inStream(flowPort_X2.rho)*dz*dy);
    elseif noEvent(abs(flowPort_X1.m_flow) < Modelica.Constants.small) and noEvent(flowPort_X2.m_flow > 0) then
      vVec[1] := - min(0.05,(log(1 + dim[1]))) * flowPort_X2.m_flow/(inStream(flowPort_X2.rho)*dz*dy);
    elseif noEvent(flowPort_X1.m_flow > 0) and noEvent(flowPort_X2.m_flow > 0) then
      vVec[1] := (flowPort_X1.m_flow/(inStream(flowPort_X1.rho)*dz*dy) - flowPort_X2.m_flow/(inStream(flowPort_X2.rho)*dz*dy));
    else
      vVec[1] := 0;
    end if;

  // end-else
  else
    vVec[1] := 0;
  end if;

  //////////////////////////////////////////////////////
  // Vy
  if (not BCwall_roof and not BCwall_floor) then
  if noEvent(flowPort_Y1.m_flow > 0) and noEvent(flowPort_Y2.m_flow <= 0) then
    vVec[2] := flowPort_Y1.m_flow/(inStream(flowPort_Y1.rho)*dz*dx);
  elseif noEvent(flowPort_Y1.m_flow <= 0) and noEvent(flowPort_Y2.m_flow > 0) then
    vVec[2] := - flowPort_Y2.m_flow/(inStream(flowPort_Y2.rho)*dz*dx);
  elseif noEvent(flowPort_Y1.m_flow > 0) and noEvent(flowPort_Y2.m_flow > 0) then
    vVec[2] := flowPort_Y1.m_flow/(inStream(flowPort_Y1.rho)*dz*dx) - flowPort_Y2.m_flow/(inStream(flowPort_Y2.rho)*dz*dx);
  else
    vVec[2] := 0;
  end if;

  elseif (BCwall_floor and not BCwall_roof) then
    if noEvent(flowPort_Y1.m_flow > 0 or flowPort_Y1.m_flow < 0) then
      vVec[2] := flowPort_Y1.m_flow/(inStream(flowPort_Y1.rho)*dz*dx);  // BC
    elseif noEvent(abs(flowPort_Y1.m_flow) < Modelica.Constants.small and flowPort_Y2.m_flow > 0.0) then
      vVec[2] := - flowPort_Y2.m_flow/(inStream(flowPort_Y2.rho)*dz*dx);
    elseif noEvent(abs(flowPort_Y1.m_flow) < Modelica.Constants.small and flowPort_Y2.m_flow <= 0.0) then
      vVec[2] := min(0.05,(log(1 + dim[2]))) * (- flowPort_Y2.m_flow/(inStream(flowPort_Y2.rho)*dz*dx));
    else
      vVec[2] := 0;
    end if;

  elseif (BCwall_roof and not BCwall_floor) then
    if noEvent(flowPort_Y2.m_flow > 0 or flowPort_Y2.m_flow < 0) then
      vVec[2] := - flowPort_Y2.m_flow/(inStream(flowPort_Y2.rho)*dz*dx);  // BC
    elseif noEvent(abs(flowPort_Y2.m_flow) < Modelica.Constants.small and flowPort_Y1.m_flow > 0.0) then
      vVec[2] := flowPort_Y1.m_flow/(inStream(flowPort_Y1.rho)*dz*dx);
    elseif noEvent(abs(flowPort_Y2.m_flow) < Modelica.Constants.small and flowPort_Y1.m_flow <= 0.0) then
      vVec[2] :=  min(0.05,(log(1 + dim[2]))) * (flowPort_Y1.m_flow/(inStream(flowPort_Y1.rho)*dz*dx));
    else
      vVec[2] := 0;
    end if;

   // one-element-gap:
  elseif (BCwall_roof and BCwall_floor) then
    if noEvent(flowPort_Y1.m_flow > 0) and noEvent(flowPort_Y2.m_flow < 0) then
      vVec[2] := flowPort_Y1.m_flow/(inStream(flowPort_Y1.rho)*dz*dx);
    elseif noEvent(flowPort_Y1.m_flow > 0) and noEvent(abs(flowPort_Y2.m_flow) < Modelica.Constants.small) then
      vVec[2] := min(0.05,(log(1 + dim[2]))) * flowPort_Y1.m_flow/(inStream(flowPort_Y1.rho)*dz*dx);
    elseif noEvent(flowPort_Y1.m_flow < 0) and noEvent(flowPort_Y2.m_flow > 0) then
      vVec[2]:= - flowPort_Y2.m_flow/(inStream(flowPort_Y2.rho)*dz*dx);
    elseif noEvent(abs(flowPort_Y1.m_flow) < Modelica.Constants.small) and noEvent(flowPort_Y2.m_flow > 0) then
      vVec[2]:= - min(0.05,(log(1 + dim[2]))) * flowPort_Y2.m_flow/(inStream(flowPort_Y2.rho)*dz*dx);
    elseif noEvent(flowPort_Y1.m_flow > 0) and noEvent(flowPort_Y2.m_flow > 0) then
      vVec[2] := flowPort_Y1.m_flow/(inStream(flowPort_Y1.rho)*dz*dx) - flowPort_Y2.m_flow/(inStream(flowPort_Y2.rho)*dz*dx);
    else
      vVec[2] := 0;
    end if;

  // end-else
  else
    vVec[2] := 0;
  end if;

  //////////////////////////////////////////////////////
  // Vz
  if (not BCwall_north and not BCwall_south) then
    if noEvent(flowPort_Z1.m_flow > 0) and noEvent(flowPort_Z2.m_flow <= 0) then
      vVec[3] := flowPort_Z1.m_flow/(inStream(flowPort_Z1.rho)*dy*dx);
    elseif noEvent(flowPort_Z1.m_flow <= 0) and noEvent(flowPort_Z2.m_flow > 0) then
      vVec[3] := - flowPort_Z2.m_flow/(inStream(flowPort_Z2.rho)*dy*dx);
    elseif noEvent(flowPort_Z1.m_flow > 0) and noEvent(flowPort_Z2.m_flow > 0) then
      vVec[3]:= flowPort_Z1.m_flow/(inStream(flowPort_Z1.rho)*dy*dx) - flowPort_Z2.m_flow/(inStream(flowPort_Z2.rho)*dy*dx);
    else
      vVec[3] := 0;
    end if;

  elseif (BCwall_south and not BCwall_north) then
    if noEvent(flowPort_Z1.m_flow > 0 or flowPort_Z1.m_flow < 0) then
      vVec[3] := flowPort_Z1.m_flow/(inStream(flowPort_Z1.rho)*dy*dx);  // BC
    elseif noEvent(abs(flowPort_Z1.m_flow) < Modelica.Constants.small and flowPort_Z2.m_flow > 0.0) then
      vVec[3] := - flowPort_Z2.m_flow/(inStream(flowPort_Z2.rho)*dy*dx);
    elseif noEvent(abs(flowPort_Z1.m_flow) < Modelica.Constants.small and flowPort_Z2.m_flow <= 0.0) then
      vVec[3] := min(0.05,(log(1 + dim[3]))) * (- flowPort_Z2.m_flow/(inStream(flowPort_Z2.rho)*dy*dx));
    else
      vVec[3] := 0;
    end if;

  elseif (BCwall_north and not BCwall_south) then
    if noEvent(flowPort_Z2.m_flow > 0 or flowPort_Z2.m_flow < 0) then
      vVec[3] := - flowPort_Z2.m_flow/(inStream(flowPort_Z2.rho)*dy*dx);  // BC
    elseif noEvent(abs(flowPort_Z2.m_flow) < Modelica.Constants.small and flowPort_Z1.m_flow > 0.0) then
      vVec[3] := flowPort_Z1.m_flow/(inStream(flowPort_Z1.rho)*dy*dx);
    elseif noEvent(abs(flowPort_Z2.m_flow) < Modelica.Constants.small and flowPort_Z1.m_flow <= 0.0) then
      vVec[3] := min(0.05,(log(1 + dim[3]))) * (flowPort_Z1.m_flow/(inStream(flowPort_Z1.rho)*dy*dx));
    else
      vVec[3] := 0;
    end if;

  // one-element-gap:
  elseif (BCwall_north and BCwall_south) then
    if noEvent(flowPort_Z1.m_flow > 0) and noEvent(flowPort_Z2.m_flow < 0) then
      vVec[3] := flowPort_Z1.m_flow/(inStream(flowPort_Z1.rho)*dy*dx);
    elseif noEvent(flowPort_Z1.m_flow > 0) and noEvent(abs(flowPort_Z2.m_flow) < Modelica.Constants.small) then
      vVec[3] := min(0.05,(log(1 + dim[3]))) * flowPort_Z1.m_flow/(inStream(flowPort_Z1.rho)*dy*dx);
    elseif noEvent(flowPort_Z1.m_flow < 0) and noEvent(flowPort_Z2.m_flow > 0) then
      vVec[3] := - flowPort_Z2.m_flow/(inStream(flowPort_Z2.rho)*dy*dx);
    elseif noEvent(abs(flowPort_Z1.m_flow) < Modelica.Constants.small) and noEvent(flowPort_Z2.m_flow > 0) then
      vVec[3] := - min(0.05,(log(1 + dim[3]))) * flowPort_Z2.m_flow/(inStream(flowPort_Z2.rho)*dy*dx);
    elseif noEvent(flowPort_Z1.m_flow > 0) and noEvent(flowPort_Z2.m_flow > 0) then
      vVec[3]:= flowPort_Z1.m_flow/(inStream(flowPort_Z1.rho)*dy*dx) - flowPort_Z2.m_flow/(inStream(flowPort_Z2.rho)*dy*dx);
    else
      vVec[3] := 0;
    end if;

  // end-else
  else
    vVec[3] := 0;
  end if;

  // Magnitude
  velMag := sqrt(vVec*vVec);


  ///*****************************************************************///
  assessementPort.Tair := fluid.T;
  assessementPort.velMag := velMag;
  assessementPort.HumRel := phi;
  ///*****************************************************************///
equation
  // Redistribution to Ports -> flowConnections
  //
  // rho: Differential equation solved
  flowPort_X1.rho = fluid.rho;
  flowPort_X2.rho = fluid.rho;
  flowPort_Y1.rho = fluid.rho;
  flowPort_Y2.rho = fluid.rho;
  flowPort_Z1.rho = fluid.rho;
  flowPort_Z2.rho = fluid.rho;
  //h: Differential equation solved
  flowPort_X1.h = fluid.h;
  flowPort_X2.h = fluid.h;
  flowPort_Y1.h = fluid.h;
  flowPort_Y2.h = fluid.h;
  flowPort_Z1.h = fluid.h;
  flowPort_Z2.h = fluid.h;
  //x: absolute moisture
  flowPort_X1.moist.x = fluid.x;
  flowPort_X2.moist.x = fluid.x;
  flowPort_Y1.moist.x = fluid.x;
  flowPort_Y2.moist.x = fluid.x;
  flowPort_Z1.moist.x = fluid.x;
  flowPort_Z2.moist.x = fluid.x;
  //p: ideal gas equation
  flowPort_X1.p = fluid.p;
  flowPort_X2.p = fluid.p;
  flowPort_Y1.p = fluid.p;
  flowPort_Y2.p = fluid.p;
  flowPort_Z1.p = fluid.p;
  flowPort_Z2.p = fluid.p;
  //v: associated
  flowPort_X1.vVec = vVec;
  flowPort_X2.vVec = vVec;
  flowPort_Y1.vVec = vVec;
  flowPort_Y2.vVec = vVec;
  flowPort_Z1.vVec = vVec;
  flowPort_Z2.vVec = vVec;
  // geometric information
  flowPort_X1.pos = pos;
  flowPort_X2.pos = pos;
  flowPort_Y1.pos = pos;
  flowPort_Y2.pos = pos;
  flowPort_Z1.pos = pos;
  flowPort_Z2.pos = pos;
  // geometric information
  flowPort_X1.dim = dim;
  flowPort_X2.dim = dim;
  flowPort_Y1.dim = dim;
  flowPort_Y2.dim = dim;
  flowPort_Z1.dim = dim;
  flowPort_Z2.dim = dim;
  ////T: ideal gas equation
  heatPort_intern.T = fluid.T;
  heatPort_intern.pos = pos;
  heatPort_intern.dim = dim;
  // potential wall connection
  heatPort_extern.T = fluid.T;
 // Parts of the Viscous-Forces
algorithm
  flowPort_X1.ForceVF :=  nu*((flowPort_Y2.visgr1 - flowPort_Y1.visgr1)*dx*dz + (flowPort_Z2.visgr1 - flowPort_Z1.visgr1)*dx*dy);
  flowPort_X2.ForceVF :=  nu*((flowPort_Y2.visgr1 - flowPort_Y1.visgr1)*dx*dz + (flowPort_Z2.visgr1 - flowPort_Z1.visgr1)*dx*dy);
  flowPort_Y1.ForceVF :=  nu*((flowPort_X2.visgr1 - flowPort_X1.visgr1)*dy*dz + (flowPort_Z2.visgr2 - flowPort_Z1.visgr2)*dx*dy);
  flowPort_Y2.ForceVF :=  nu*((flowPort_X2.visgr1 - flowPort_X1.visgr1)*dy*dz + (flowPort_Z2.visgr2 - flowPort_Z1.visgr2)*dx*dy);
  flowPort_Z1.ForceVF :=  nu*((flowPort_X2.visgr2 - flowPort_X1.visgr2)*dy*dz + (flowPort_Y2.visgr2 - flowPort_Y1.visgr2)*dx*dz);
  flowPort_Z2.ForceVF :=  nu*((flowPort_X2.visgr2 - flowPort_X1.visgr2)*dy*dz + (flowPort_Y2.visgr2 - flowPort_Y1.visgr2)*dx*dz);
//*****************************************************************//
initial equation
  fluid.T = T_start;
  fluid.p = rho_start*Modelica.Constants.R/n*fluid.T;

  annotation (defaultComponentName = "airEle",
    Icon(coordinateSystem(preserveAspectRatio=false,extent={{-100,-100},{100,100}}),graphics={
    Rectangle(extent={{-80,80},{80,-80}},lineColor={0,0,255},fillColor={170,213,255},
      fillPattern=FillPattern.Solid,lineThickness=0.5),
    Text(extent={{12,-78},{98,-102}},lineColor={0,0,255},fillColor={170,213,255},
      fillPattern=FillPattern.Solid,textString="%name"),
    Line(points={{-80,80},{-62,98}}, pattern=LinePattern.None),
    Polygon(points={{-80,80},{-60,100},{100,100},{80,80},{-80,80}},lineColor={0,0,255},
      fillColor={170,213,255},fillPattern=FillPattern.Solid,lineThickness=0.5),
    Polygon(points={{80,-80},{100,-60},{100,100},{80,80},{80,-80}},lineColor={0,0,255},
      fillColor={170,213,255},fillPattern=FillPattern.Solid,lineThickness=0.5),
    Text(extent={{-34,74},{42,8}},lineColor={0,0,255},lineThickness=0.5,
      fillColor={170,213,255},fillPattern=FillPattern.Solid,textString="3D")}),
      HideResult=true,
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}})),
    Documentation(info="<html>
    <p>
    This partial model defines the base functionalities of an air element
    for tree-dimensional air flow simulation in rooms.
    </p>
    </html>", revisions="<html>
    <ul>
    <li>
    February 21, 2017, by Christoph Nytsch-Geusen:<br/>
    Re-integration into the BuildingSystems library.
    </li>
    <li>
    October 31, 2016, by Katharina Mucha:<br/>
    First implementation.
    </li>
    </ul>
    </html>"));
end AirElementGeneral;
