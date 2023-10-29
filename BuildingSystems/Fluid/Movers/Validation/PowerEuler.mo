within BuildingSystems.Fluid.Movers.Validation;
model PowerEuler
  "Power calculation comparison among three mover types, using Euler number computation for m_flow and dp"
  extends BuildingSystems.Fluid.Movers.Validation.PowerSimplified(
    pump_dp(per=perPea),
    pump_m_flow(per=perPea));

  parameter BuildingSystems.Fluid.Movers.Data.Generic perPea(
    final powerOrEfficiencyIsHydraulic=per.powerOrEfficiencyIsHydraulic,
    final etaHydMet=
            BuildingSystems.Fluid.Movers.BaseClasses.Types.HydraulicEfficiencyMethod.EulerNumber,
    final etaMotMet=
            BuildingSystems.Fluid.Movers.BaseClasses.Types.MotorEfficiencyMethod.NotProvided,
    final peak=BuildingSystems.Fluid.Movers.BaseClasses.Euler.getPeak(
                 pressure=per.pressure,
                 power=per.power))
    "Peak condition";

  annotation (
    experiment(Tolerance=1e-6, StopTime=200),
    __Dymola_Commands(file=
          "modelica://BuildingSystems/Resources/Scripts/Dymola/Fluid/Movers/Validation/PowerEuler.mos"
        "Simulate and plot"),
        Documentation(
info="<html>
<p>
This example is identical to
<a href=\"modelica://BuildingSystems.Fluid.Movers.Validation.PowerSimplified\">
BuildingSystems.Fluid.Movers.Validation.PowerSimplified</a>,
except that the efficiency of the flow controlled pumps
<code>pump_dp</code> and <code>pump_m_flow</code>
is estimated by using the Euler number and its correlation as implemented in
<a href=\"modelica://BuildingSystems.Fluid.Movers.BaseClasses.Euler\">
BuildingSystems.Fluid.Movers.BaseClasses.Euler</a>.
</p>
<p>
The figure below shows the approximation error for the
power calculation where the speed <i>y</i> differs from
the nominal speed <i>y<sub>nominal</sub></i>.
</p>
<p align=\"center\">
<img alt=\"image\" src=\"modelica://BuildingSystems/Resources/Images/Fluid/Movers/Validation/PowerEuler.png\"/>
</p>
</html>",
revisions="<html>
<ul>
<li>
November 22, 2021, by Hongxiang Fu:<br/>
First implementation.
</li>
</ul>
</html>"));
end PowerEuler;
