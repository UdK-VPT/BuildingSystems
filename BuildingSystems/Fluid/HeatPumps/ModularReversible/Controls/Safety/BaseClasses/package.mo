within BuildingSystems.Fluid.HeatPumps.ModularReversible.Controls.Safety;
package BaseClasses "Package with base classes for BuildingSystems.Fluid.HeatPump.Controls.Safety"

annotation (Icon(graphics={
        Rectangle(
          lineColor={200,200,200},
          fillColor={248,248,248},
          fillPattern=FillPattern.HorizontalCylinder,
          extent={{-100.0,-100.0},{100.0,100.0}},
          radius=25.0),
        Rectangle(
          lineColor={128,128,128},
          extent={{-100.0,-100.0},{100.0,100.0}},
          radius=25.0),
        Ellipse(
          extent={{-30.0,-30.0},{30.0,30.0}},
          lineColor={128,128,128},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid)}), Documentation(revisions="<html><ul>
  <li>
    <i>November 26, 2018,</i> by Fabian Wuellhorst:<br/>
    First implementation (see issue <a href=
    \"https://github.com/RWTH-EBC/AixLib/issues/577\">AixLib #577</a>)
  </li>
</ul>
</html>", info="<html>
<p>
  This package contains base classes that are used to construct the
  models in <a href=\"modelica://BuildingSystems.Fluid.HeatPumps.ModularReversible.Controls.Safety\">
  BuildingSystems.Fluid.HeatPumps.ModularReversible.Controls.Safety</a>
</p>
</html>"));
end BaseClasses;
