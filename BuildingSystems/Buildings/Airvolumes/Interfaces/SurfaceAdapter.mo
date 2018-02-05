within BuildingSystems.Buildings.Airvolumes.Interfaces;
model SurfaceAdapter
  BuildingSystems.Buildings.Airvolumes.Interfaces.FluidFluid PortF
    annotation (Placement(transformation(extent={{0,-10},{20,10}}),
      iconTransformation(extent={{0,-10},{20,10}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a PortHeat
    annotation (Placement(transformation(extent={{0,-50},{20,-30}}),
      iconTransformation(extent={{0,-50},{20,-30}})));
  BuildingSystems.Buildings.Interfaces.SurfaceToAirPort surfaceToAirPort
    annotation (Placement(transformation(extent={{-20,-10},{0,10}}),
      iconTransformation(extent={{-20,-10},{0,10}})));
  //south, north, west, east, floor, roof
  parameter String location = " "
    "south, north, west, east, floor, roof"
    annotation (HideResult=false);
  parameter Modelica.SIunits.Length posX
    "Boudary-FVconnection absolut central position X"
    annotation (HideResult=true);
  parameter Modelica.SIunits.Length posY
    "Boudary-FVconnection absolut central position Y"
    annotation (HideResult=true);
  parameter Modelica.SIunits.Length posZ
    "Boudary-FVconnection absolut central position Z"
    annotation (HideResult=true);
  final parameter Modelica.SIunits.Velocity[3] vVec = {0,0,0}
    annotation (HideResult=true);
  final parameter Modelica.SIunits.Density rhoAir = 1.2
    annotation (HideResult=true);
  constant Modelica.SIunits.SpecificHeatCapacity cp = 1005.00;
  // water vaper from moisture transfer of surfaces - default/ start value
  parameter Modelica.SIunits.MassFlowRate moistMflow_start = 0.0
    "Start value Moist Flow"
    annotation (HideResult=true);
  constant Modelica.SIunits.MassFraction x_constant = 0.005
    "Air moisture";
  constant Modelica.SIunits.Velocity vAir_constant = 0.0
    "Air velocity";
  constant Modelica.SIunits.Conversions.NonSIunits.Angle_deg angleDegAir_constant = 0.0
    "Direction of the air flow";
equation
  connect(PortHeat,surfaceToAirPort.heatPort);
  surfaceToAirPort.angleDegAir = angleDegAir_constant;
  surfaceToAirPort.vAir = vAir_constant;
  surfaceToAirPort.moisturePort.x = x_constant;

  if (location == "east" or location == "west") then
    PortF.m_flow = rhoAir*(PortF.dim[2]*PortF.dim[3])*vVec[1];
    PortF.visgr1 = (2*PortF.vVec[2])/(PortF.dim[1]/2);
    PortF.visgr2 = (2*PortF.vVec[3])/(PortF.dim[1]/2);

  elseif (location == "roof" or location == "floor") then
    PortF.m_flow = rhoAir*(PortF.dim[1]*PortF.dim[3])*vVec[2];
    PortF.visgr1 = (2*PortF.vVec[1])/(PortF.dim[2]/2);
    PortF.visgr2 = (2*PortF.vVec[3])/(PortF.dim[2]/2);
  elseif (location == "north" or location == "south") then
    PortF.m_flow = rhoAir*(PortF.dim[1]*PortF.dim[2])*vVec[3];
    PortF.visgr1 = (2*PortF.vVec[1])/(PortF.dim[3]/2);
    PortF.visgr2 = (2*PortF.vVec[2])/(PortF.dim[3]/2);
  else
    PortF.m_flow = 0.0;
    PortF.visgr1 = 0.0;
    PortF.visgr2 = 0.0;
  end if;

  PortF.rho = rhoAir;
  PortF.h = 0.0;
  PortF.moist.moistMflow = moistMflow_start;

  annotation (HideResult=true,HideResult=false,HideResult=true,HideResult=true,
    Diagram(graphics),Icon(graphics={Rectangle(extent={{-10,80},{10,-80}},
    fillColor={215,215,215},fillPattern=FillPattern.Solid,pattern=LinePattern.None)}),
    Documentation(info=""));
end SurfaceAdapter;
