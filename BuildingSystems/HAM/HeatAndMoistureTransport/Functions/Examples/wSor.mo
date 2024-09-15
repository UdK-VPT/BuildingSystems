within BuildingSystems.HAM.HeatAndMoistureTransport.Functions.Examples;
model wSor "Test function wSor"
  extends Modelica.Icons.Example;
  BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton material;
  Modelica.Units.SI.MassConcentration wSor "Water content of the material";
  BuildingSystems.Types.RelativeHumidity phi
    "Relative Humidity of the material";

  Modelica.Blocks.Sources.Ramp ramp(
    height=1.0,
    duration=0.75,
    offset=0,
    startTime=0.0)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

equation
  phi = ramp.y;
  wSor = BuildingSystems.HAM.HeatAndMoistureTransport.Functions.wSor(material.sorTabX,material.sorTabY,phi,material.wF,material.porosity);

  annotation (   experiment(StopTime=1.1),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatAndMoistureTransport/Functions/Examples/wSor.mos"
        "Simulate and plot"),
    Documentation(info="<html>
    <p> This example tests the implementation of
    <a href=\"modelica://BuildingSystems.HAM.HeatAndMoistureTransport.Functions.wSor\">
    BuildingSystems.HAM.HeatAndMoistureTransport.Functions.wSor</a>.
    </p>
    </html>", revisions="<html>
    <ul>
    <li>
    March 3, 2015, by Christoph Nytsch-Geusen:<br/>
    First implementation.
    </li>
    </ul>
    </html>"));
end wSor;
