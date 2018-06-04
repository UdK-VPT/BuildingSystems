within BuildingSystems.Buildings.Airvolumes.AirElements;
model AirElementHygroThermal
  "A hygro-thermal finite volume element"
  extends BuildingSystems.Buildings.BaseClasses.AirElementGeneral;
  /////////////     CONSTANT     ///////////////////////
  /////////////     PARAMETER     //////////////////////
  parameter Modelica.SIunits.MassFraction x_start=0.005
    "Start air moisture"
    annotation (Dialog(tab="Initialization"));
  parameter Modelica.SIunits.Mass mH2OLiq_start = 0.0
    "Start liquid water mass";
  //
  /////////////////    SOURCES    ///////////////////////
  // Source, Heatsource, moisture source
  parameter Modelica.SIunits.MassFlowRate moistureSourcesMflow = 0;
  parameter Modelica.SIunits.SpecificEnthalpy moistureSource_h = cAir * T_start;
  ///////////////////////////////////////////////////////
  /////////////      VARIABLES    //////////////////////
  Modelica.SIunits.Mass mAir(start = dx*dy*dz * rho_nominal)
    "Mass of dry air";
  Modelica.SIunits.Mass mH2OAir(start = x_start * dx*dy*dz * rho_nominal, fixed = true)
    "Mass of water vapor in the air";
  Modelica.SIunits.Mass mH2OLiq(start = mH2OLiq_start, fixed = true)
    "Mass of liquid water";
  Modelica.SIunits.InternalEnergy U=U_start
    "Internal energy of the air volume";
  ///*****************************************************************///
equation
  // Mass conservation: FV_i * der(rho) = m_flow{for north,east,south,west,front,back} + Source
  dx*dy*dz*der(fluid.rho) =
    flowPort_X1.m_flow + flowPort_X2.m_flow
    + flowPort_Y1.m_flow + flowPort_Y2.m_flow
    + flowPort_Z1.m_flow + flowPort_Z2.m_flow + SourceM_flow;
  // Enthalpy conservation:
  // rho * V_i * der(h) = sum(m_flow_i*inStream(h_i))_{for n,o,s,w,v,h} + SorceMdot*h  + HeatFlow Q_flow
  fluid.rho*dx*dy*dz*der(fluid.h) =
    (flowPort_X1.m_flow*actualStream(flowPort_X1.h) + flowPort_X2.m_flow*actualStream(flowPort_X2.h)
    + flowPort_Y1.m_flow*actualStream(flowPort_Y1.h) + flowPort_Y2.m_flow*actualStream(flowPort_Y2.h)
    + flowPort_Z1.m_flow*actualStream(flowPort_Z1.h) + flowPort_Z2.m_flow*actualStream(flowPort_Z2.h)
    + SourceM_flow *(if noEvent(SourceM_flow > 0) then Source_h else fluid.h)
    + moistureSourcesMflow *(if noEvent(moistureSourcesMflow > 0) then moistureSource_h else fluid.h)
    + heatPort_extern.Q_flow+ heatPort_intern.Q_flow);
  //// T and P: humid air
  //// h = cAir * T + (cVap * xD + cWat* xF + cE * x)*fluid.T + hv * xD − hs*xD //-> incl. air, vapour, liquid, ice
  //// fluid.h = cAir * fluid.T + (cH20 * xD + cH20Liq * xF + 2070 * x)*fluid.T + rH2O * xD − 333.4*xD;
  //// h = cAir * T + (cVap * xD + cWat* xF + cE * x)*fluid.T + hv * xD − hs*xD //-> incl. air, vapour, liquid
  fluid.h = cAir * fluid.T + (cH20 * mH2OAir/mAir + cH20Liq * mH2OLiq/mAir)*fluid.T + rH2O * mH2OAir/mAir;
  // Druck: p*V = (0.622 + x) * m * R_v * T;
  fluid.p * dx*dy*dz = (0.622 + fluid.Xi) * mAir * R_v * fluid.T;
  //////////////////////////////////////////////////////////
  // Humidity calculation <- out of buildingSystems
  //////////////////////////////////////////////////////////
  // Mass of ...
  mAir = fluid.rho*dx*dy*dz;
  fluid.Xi = mH2OAir/mAir;

  //Mass balance of water vapor in the air
  der(mH2OAir) =
    flowPort_X1.moist.moistMflow + flowPort_X2.moist.moistMflow +
    flowPort_Y1.moist.moistMflow + flowPort_Y2.moist.moistMflow +
    flowPort_Z1.moist.moistMflow + flowPort_Z2.moist.moistMflow
    + (-0.5 * Modelica.Math.tanh(100.0*(phi-1.0)) + 0.5) * moistureSourcesMflow
    + BuildingSystems.Utilities.SmoothFunctions.softcut(1.0-phi,0.0,1.0,0.001) * mH2OLiq;
    // 1. water vaper from moisture transfer of surfaces + water vapor within air mass flows through air paths
    // 2. water vapor from moisture sources
    // 3. evaporated water from liquid reservoir

  // Mass balance of liquid water
  der(mH2OLiq) =
    (1.0 - (-0.5 * Modelica.Math.tanh(100.0*(phi-1.0)) + 0.5)) * moistureSourcesMflow
    - BuildingSystems.Utilities.SmoothFunctions.softcut(1.0-phi,0.0,1.0,0.001) * mH2OLiq;
    // water vapor surplus from moisture sources if relative moisture becomes close to 1
    // evaporated water which leaves the liquid reservoir

  // relative air humidity
  phi = BuildingSystems.Utilities.Psychrometrics.Functions.phi_pTX(100000.0,fluid.T,fluid.Xi);

  annotation (defaultComponentName = "airEle",
Documentation(info="<html>
<p>
This model defines the base functionalities of an hygro-thermal air element
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
end AirElementHygroThermal;
