within BuildingSystems.Fluid.HeatPumps.ModularReversible;
model AirToWaterTableData2D
  "Reversible air to water heat pump based on 2D manufacturer data in Europe"
  extends BuildingSystems.Fluid.HeatPumps.ModularReversible.TableData2D(
    redeclare replaceable package MediumEva = BuildingSystems.Media.Air,
    redeclare replaceable package MediumCon = BuildingSystems.Media.Water,
    redeclare replaceable BuildingSystems.Fluid.HeatPumps.ModularReversible.Data.TableData2D.GenericAirToWater datTabHea
      constrainedby BuildingSystems.Fluid.HeatPumps.ModularReversible.Data.TableData2D.GenericAirToWater,
    redeclare replaceable BuildingSystems.Fluid.Chillers.ModularReversible.Data.TableData2D.Generic datTabCoo
      constrainedby BuildingSystems.Fluid.Chillers.ModularReversible.Data.TableData2D.Generic);

  annotation (Documentation(info="<html>
<p>
  Reversible air-to-water heat pump based on
  two-dimensional data from manufacturer data, (e.g. based on EN 14511),
  using the
  <a href=\"modelica://BuildingSystems.Fluid.HeatPumps.ModularReversible.Modular\">
  BuildingSystems.Fluid.HeatPumps.ModularReversible.Modular</a> approach.
</p>
<p>
  For more information on the approach, see
  <a href=\"modelica://BuildingSystems.Fluid.HeatPumps.ModularReversible.UsersGuide\">
  BuildingSystems.Fluid.HeatPumps.ModularReversible.UsersGuide</a>.
</p>
<p>
  Internal inertias and heat losses are neglected,
  as these are implicitly obtained in measured
  data from manufacturers.
  Also, icing is disabled as the performance degradation
  is already contained in the data.
</p>
<p>
Please read the documentation of the model for heating at
  <a href=\"modelica://BuildingSystems.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.TableData2D\">
  BuildingSystems.Fluid.HeatPumps.ModularReversible.RefrigerantCycle.TableData2D</a>.
</p>
<p>
For cooling, the assumptions are similar, and described at
  <a href=\"modelica://BuildingSystems.Fluid.Chillers.ModularReversible.RefrigerantCycle.TableData2D\">
  BuildingSystems.Fluid.Chillers.ModularReversible.RefrigerantCycle.TableData2D</a>
</p>
<h4>References</h4>
<p>
EN 14511-2018: Air conditioners, liquid chilling packages and heat pumps for space
heating and cooling and process chillers, with electrically driven compressors
<a href=\"https://www.beuth.de/de/norm/din-en-14511-1/298537524\">
https://www.beuth.de/de/norm/din-en-14511-1/298537524</a>
</p>

</html>"));
end AirToWaterTableData2D;
