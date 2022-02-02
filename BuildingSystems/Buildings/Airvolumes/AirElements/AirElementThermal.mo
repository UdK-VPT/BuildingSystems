within BuildingSystems.Buildings.Airvolumes.AirElements;
model AirElementThermal
  "A thermal finite volume air element"
  extends BuildingSystems.Buildings.BaseClasses.AirElementGeneral;
  /////////////      CONSTANT      /////////////////////
  /////////////      PARAMETER     /////////////////////

  /////////////      VARIABLES     ///////////////////
  Modelica.SIunits.Mass mAir = mAir_start
    "Mass of dry air of the air volume";
  Modelica.SIunits.Mass mH2OAir = mH2OAir_start
    "Mass of water vapor in the air of the air volume";
  Modelica.SIunits.Mass mH2OLiq = mH2OLiq_start
    "Mass of liquid water of the air volume";
  Modelica.SIunits.InternalEnergy U=U_start
    "Internal energy of the air volume";
  ///*****************************************************************///
equation
  // Mass conservation: FV_i * der(rho) = m_flow{for north,east,south,west,front,back} + Source
  dx*dy*dz*der(fluid.rho) =
    flowPort_X1.m_flow + flowPort_X2.m_flow
    + flowPort_Y1.m_flow + flowPort_Y2.m_flow
    + flowPort_Z1.m_flow + flowPort_Z2.m_flow + SourceM_flow;

  // Enthalpy conservation: rho * FV_i * der(h) = m_flow*hi/inStream(hi) {for n,o,s,w,v,h} + Sorcem_flow*h  + HeatFlow Q_flow
  fluid.rho*dx*dy*dz*der(fluid.h) =
    (flowPort_X1.m_flow*actualStream(flowPort_X1.h) + flowPort_X2.m_flow*actualStream(flowPort_X2.h)
    + flowPort_Y1.m_flow*actualStream(flowPort_Y1.h) + flowPort_Y2.m_flow*actualStream(flowPort_Y2.h)
    + flowPort_Z1.m_flow*actualStream(flowPort_Z1.h) + flowPort_Z2.m_flow*actualStream(flowPort_Z2.h)
    + SourceM_flow *(if noEvent(SourceM_flow > 0) then Source_h else fluid.h)
    + heatPort_extern.Q_flow+ heatPort_intern.Q_flow);

  ////////// dummy values /////////////
  fluid.x = 0.005;
  phi = 0.5;
  //
  // T and P: dry air
  // Temperatur: h = cAir * T
  fluid.h =fluid.T*cAir;
  // Pressure: p = rho * R_s* T
  fluid.p = fluid.rho*(Modelica.Constants.R/n)*fluid.T;
  //fluid.p = fluid.rho*(Modelica.Constants.R/n)*fluid.T - fluid.rho*Modelica.Constants.g_n*posY;

  annotation (defaultComponentName = "airEle",
Documentation(info="<html>
<p>
This model defines the base functionalities of an thermal air element
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
end AirElementThermal;
