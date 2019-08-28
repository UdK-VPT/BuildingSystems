within BuildingSystems.Technologies.ElectricalTransformers;
model DCACTransformer
  "direct current to alternating current transformer"
  BuildingSystems.Interfaces.PowerInput P1 annotation (Placement(transformation(
          extent={{80,-30},{40,10}}), iconTransformation(extent={{44,-10},{64,10}})));
  BuildingSystems.Interfaces.PowerOutput P2
    annotation (Placement(transformation(extent={{-28,-26},{-64,10}}),
        iconTransformation(extent={{-60,-10},{-40,10}})));

  parameter Modelica.SIunits.Power P_nom
    "rated capacity of transformer";
  parameter Modelica.SIunits.Efficiency eta_max
    "maximum efficiency at rated capacity";
  parameter Boolean gridConnection;

  Modelica.SIunits.Efficiency eta_dcac
    "efficiency curve of transformer";
  Modelica.SIunits.Efficiency loadFactor
    "current load at transformer";

  Modelica.SIunits.Energy E2(
    displayUnit="kWh")
    "energy from source intor transformer";
  Modelica.SIunits.Energy E1(
    displayUnit="kWh")
    "energyoutput of transformer";

equation
  loadFactor =abs((P1/P_nom)) + 0.001;

  eta_dcac = if gridConnection == true
    then
      0.5*(1.0 - Modelica.Math.tanh(100000.0*(P1)))*1 + 0.5*(1.0 +
        Modelica.Math.tanh(100000.0*(P1)))*
        BuildingSystems.Utilities.Math.Functions.smoothMax(
        eta_max + (0.009*log(loadFactor/0.6))/loadFactor,
        0.3,
        0.001)
    else
      BuildingSystems.Utilities.Math.Functions.smoothMax(
        eta_max + (0.009*log(loadFactor/0.6))/loadFactor,
        0.3,
        0.001);

  P2 = if gridConnection == true
    then
      P1*eta_dcac
    else
      BuildingSystems.Utilities.Math.Functions.smoothMax(
        (P1/eta_dcac),
        0.5*(1 - Modelica.Math.tanh(100000*(0.01 - P1)))*P_nom*(1 - eta_max),
        0.001);

  der(E2) =P2;
  der(E1) =P1;

annotation (defaultComponentName="transformer", Icon(coordinateSystem(preserveAspectRatio=false), graphics={
      Rectangle(extent={{-60,60},{60,-60}},
        lineColor={215,215,215},
        fillColor={215,215,215},
        fillPattern=FillPattern.Solid),
        Line(
          points={{-50,50},{52,-52}},
          color={0,0,0},
          thickness=0.5),
        Line(
          points={{10,44},{50,44}},
          color={0,0,0},
          visible=DynamicSelect(true, gridConnection)),
        Line(
          points={{10,38},{26,38}},
          color={0,0,0},
          visible=DynamicSelect(true, gridConnection)),
        Line(
          points={{34,38},{50,38}},
          color={0,0,0},
          visible=DynamicSelect(true, gridConnection)),
        Line(
          points={{-44,-36},{-34,-26},{-14,-44},{-4,-36}},
          color={0,0,0},
          visible=DynamicSelect(true, gridConnection),
          smooth=Smooth.Bezier),
        Line(
          points={{-44,-32},{-4,-32}},
          color={0,0,0},
          visible=DynamicSelect(true, not
                                         (gridConnection))),
        Line(
          points={{-44,-38},{-28,-38}},
          color={0,0,0},
          visible=DynamicSelect(true, not
                                         (gridConnection))),
        Line(
          points={{-20,-38},{-4,-38}},
          color={0,0,0},
          visible=DynamicSelect(true, not
                                         (gridConnection))),
        Line(
          points={{10,40},{20,50},{40,32},{50,40}},
          color={0,0,0},
          visible=DynamicSelect(true, not
                                         (gridConnection)),
          smooth=Smooth.Bezier),
      Text(extent={{-40,-62},{44,-96}},
        lineColor={0,0,255},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)),
  Documentation(info="<html>
<p>Transformer which can be used </p>
<p>1. DC-AC Transformer to connect a DC power source (like a battery or PV module) to an AC power consumer, like a household.</p>
<p>2. AC-DC Transformer to connect an AC power source (most likely an electrical grid) with the battery component and simulate the AC power demand for missing DC power</p>
<p>Both variants are stated as an example. The used curve for the performance of the transformer is based on Festo Didactics. Transformer losses, effciency, and regulation: Excercise 3, n.d., (2018).</p>
</html>",
  revisions="<html>
  <ul>
  <li>
  June 21, 2018, by Christoph Banhardt:<br/>
  Created BaseClasses for battery model to extend the library to BatterySimple and BatteryComplex.
  </li>
  <li>
  November 11, 2017, by Christoph Nytsch-Geusen:<br/>
  Loss factor to bound energy storage shifted and plausible
  limitations of PChargeEff and PLoadEff added.
  </li>
  <li>
  May 31, 2017, by Christoph Nytsch-Geusen:<br/>
  Integration of the Kinetic Battery Model.
  </li>
  <li>
  June 6, 2016, by Christoph Nytsch-Geusen:<br/>
  First implementation.
  </li>
  </ul>
  </html>"));
end DCACTransformer;
