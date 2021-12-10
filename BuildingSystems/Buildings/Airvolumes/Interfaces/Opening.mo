within BuildingSystems.Buildings.Airvolumes.Interfaces;
partial model Opening
  "Partial door model for bi-directional flow"
  extends BuildingSystems.Fluid.Interfaces.PartialTwoPortInterface(
    // redeclare final package Medium = Medium,
    final allowFlowReversal=true,
    final m_flow_nominal=10/3600*1.2,
    final m_flow_small=1E-4*abs(m_flow_nominal));

  replaceable package Medium =
    Modelica.Media.Interfaces.PartialMedium "Medium in the component"
      annotation (choices(
        choice(redeclare package Medium = BuildingSystems.Media.Air "Moist air")));

  parameter Modelica.SIunits.Length wOpe=1.0 "Width of opening"
    annotation (Dialog(group="Geometry"));
  parameter Modelica.SIunits.Length hOpe=1.0 "Height of opening"
    annotation (Dialog(group="Geometry"));

  parameter Modelica.SIunits.PressureDifference dp_turbulent(
    min=0,
    displayUnit="Pa") = 0.01
    "Pressure difference where laminar and turbulent flow relation coincide"
    annotation(Dialog(tab="Advanced"));

  Modelica.SIunits.VolumeFlowRate VAB_flow(nominal=0.001)
    "Volume flow rate from A to B if positive";

  input Modelica.SIunits.Velocity vAB(nominal=0.01)
    "Average velocity from A to B";

protected
  final parameter Modelica.SIunits.Area AOpe = wOpe*hOpe
    "Open aperture area";

  constant Real conTP = BuildingSystems.Media.Air.dStp*Modelica.Media.IdealGases.Common.SingleGasesData.Air.R
    "Conversion factor for converting temperature difference to pressure difference";

  parameter Medium.ThermodynamicState sta_default=Medium.setState_pTX(
      T=Medium.T_default,
      p=Medium.p_default,
      X=Medium.X_default);

  parameter Modelica.SIunits.Density rho_default=Medium.density(sta_default)
    "Density";

  Modelica.SIunits.VolumeFlowRate VABp_flow(nominal=0.001)
    "Volume flow rate from A to B if positive due to static pressure difference";
  Modelica.SIunits.MassFlowRate mABt_flow(nominal=0.001)
    "Mass flow rate from A to B if positive due to buoyancy";

  Medium.ThermodynamicState state_a_inflow=
    Medium.setState_phX(port_a.p, inStream(port_a.h_outflow), inStream(port_a.Xi_outflow))
    "state for medium inflowing through port_a";
  Medium.ThermodynamicState state_b_inflow=
    Medium.setState_phX(port_b.p, inStream(port_b.h_outflow), inStream(port_b.Xi_outflow))
    "state for medium inflowing through port_b";
equation
  // Net flow rate
  port_a.m_flow = (rho_default * VABp_flow/2 + mABt_flow);

  // Average velocity (using the whole orifice area)
  //VAB_flow = max(port_a.m_flow, 0)/rho_default;
  //VBA_flow = max(port_b.m_flow, 0)/rho_default;

  // Energy balance (no storage, no heat loss/gain)
  port_a.h_outflow = inStream(port_b.h_outflow);
  port_b.h_outflow = inStream(port_a.h_outflow);

  // Mass balance (no storage)
  port_a.m_flow = -port_b.m_flow;

  port_a.Xi_outflow = inStream(port_b.Xi_outflow);
  port_b.Xi_outflow = inStream(port_a.Xi_outflow);

  // Transport of trace substances
  port_a.C_outflow = inStream(port_b.C_outflow);
  port_b.C_outflow = inStream(port_a.C_outflow);

  annotation (
    Icon(graphics={
        Rectangle(
          extent={{-60,80},{60,-84}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={85,75,55},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-54,72},{56,-84}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{56,72},{-36,66},{-36,-90},{56,-84},{56,72}},
          lineColor={0,0,0},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-30,-10},{-16,-8},{-16,-14},{-30,-16},{-30,-10}},
          lineColor={0,0,255},
          pattern=LinePattern.None,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
    Documentation(info="<html>
<p>
This is a partial model for the bi-directional air flow through a door.
</p>
</html>",
revisions="<html>
<ul>
<li>
October 6, 2020, by Michael Wetter:<br/>
First implementation for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1353\">#1353</a>.
</li>
</ul>
</html>"));
end Opening;
