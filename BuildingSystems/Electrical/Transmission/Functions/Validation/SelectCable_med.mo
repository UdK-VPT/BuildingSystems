within BuildingSystems.Electrical.Transmission.Functions.Validation;
model SelectCable_med
  "Validation model for the function that selects the cable"
  extends Modelica.Icons.Example;

  parameter Modelica.Units.SI.Voltage V_nominal=25e3 "Rated voltage";

  parameter Modelica.Units.SI.Power[:] P_nominal=I_nominal*V_nominal/
      safety_factor "Rated power";
  parameter Modelica.Units.SI.Current[:] I_nominal={195,250,285,375,450,640,800}
       .- 10 "Nominal current";

  parameter Real safety_factor = 1.2 "Safety factor";

  parameter BuildingSystems.Electrical.Transmission.MediumVoltageCables.Generic[:] cab = BuildingSystems.Electrical.Transmission.Functions.selectCable_med(
    P_nominal = P_nominal,
    V_nominal = V_nominal)
    "Selected cable";

annotation (
experiment(Tolerance=1e-6, StopTime=1.0),
  __Dymola_Commands(
file="modelica://BuildingSystems/Resources/Scripts/Dymola/Electrical/Transmission/Functions/Validation/SelectCable_med.mos"
"Simulate and plot"),
Documentation(info="<html>
<p>
This model validates
<a href=\"modelica://BuildingSystems.Electrical.Transmission.Functions.selectCable_med\">
BuildingSystems.Electrical.Transmission.Functions.selectCable_med</a>
for a different range of currents.
</p>
</html>", revisions="<html>
<ul>
<li>
August 25, 2020, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end SelectCable_med;
