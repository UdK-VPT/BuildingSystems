within BuildingSystems.Fluid.Movers.Data.Pumps.Wilo;
record Stratos50slash1to12 "Pump data for a Wilo Stratos 50/1-12 pump"
  extends Generic(
    final powerOrEfficiencyIsHydraulic=false,
    etaHydMet=BuildingSystems.Fluid.Movers.BaseClasses.Types.HydraulicEfficiencyMethod.Power_VolumeFlowRate,
    power(V_flow={5.55555555556e-07, 0.00209948320413, 0.00303617571059,
                   0.00389750215332,  0.0046188630491, 0.00546942291128,
                   0.00621231696813, 0.00695521102498, 0.00755813953488},
               P={    205.291823945,    337.504763698,    400.584905585,
                       453.68913657,    488.040727585,    515.872422868,
                      528.307902115,    531.276246541,     523.90128749}),
    pressure(V_flow={5.55555555556e-07, 0.00209948320413, 0.00303617571059,
                      0.00389750215332,  0.0046188630491, 0.00546942291128,
                      0.00621231696813, 0.00695521102498, 0.00755813953488},
                 dp={    74298.6885246,    74154.3248189,    73404.0823485,
                         70722.2584827,    66879.2916508,    59372.6282882,
                         49547.6683187,    37985.8558902,    27964.6709874}));
  annotation (
defaultComponentPrefixes="parameter",
defaultComponentName="per",
Documentation(info="<html>
  <p>Data from:
  <a href=\"http://productfinder.wilo.com/en/COM/product/00000018000029520002003a/fc_product_datasheet\">
  http://productfinder.wilo.com/en/COM/product/0000000e000379df0002003a/fc_product_datasheet
  </a>
  </p>
  <p>See
  <a href=\"modelica://BuildingSystems.Fluid.Movers.Data.Pumps.Wilo.Stratos25slash1to6\">
  BuildingSystems.Fluid.Movers.Data.Pumps.Wilo.Stratos25slash1to6
  </a>
  for more information about how the data is derived.
  </p>
  </html>", revisions="<html>
<ul>
<li>
March 29, 2023, by Hongxiang Fu:<br/>
Deleted angular speed parameters with the unit rpm.
This is for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/1704\">IBPSA, #1704</a>.
</li>
<li>
October 14, 2021, by Hongxiang Fu:<br/>
Rewrote the statements using <code>use_powerCharacteristic</code>
to support the implementation of
<a href=\"Modelica://BuildingSystems.Fluid.Movers.BaseClasses.Euler\">
<code>BuildingSystems.Fluid.Movers.BaseClasses.Euler</code></a>.
This is for
<a href=\"https://github.com/lbl-srg/modelica-buildings/issues/2668\">#2668</a>.
</li>
<li>
February 17, 2016, by Michael Wetter:<br/>
Updated parameter names for
<a href=\"https://github.com/ibpsa/modelica-ibpsa/issues/396\">#396</a>.
</li>
<li>
December 12, 2014, by Michael Wetter:<br/>
Added <code>defaultComponentPrefixes</code> and
<code>defaultComponentName</code> annotations.
</li>
<li>April 22, 2014
    by Filip Jorissen:<br/>
       Initial version
</li>
</ul>
</html>"));
end Stratos50slash1to12;
