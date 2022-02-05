within BuildingSystems.HAM.HeatAndMoistureTransport.Functions.Examples;
model phiSor "Test function phiSor"
  extends Modelica.Icons.Example;
  BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton material;
  Modelica.Units.SI.MassConcentration w "Water content of the material";
  BuildingSystems.Types.RelativeHumidity phiSor
    "Relative Humidity of the material";

  Modelica.Blocks.Sources.Ramp ramp(
    height=200,
    duration=150,
    offset=0,
    startTime=25)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

equation
  w = ramp.y;
  phiSor = BuildingSystems.HAM.HeatAndMoistureTransport.Functions.phiSor(material.sorTabX,material.sorTabY,w, material.wF,material.porosity);
  annotation (   experiment(StopTime=200.0),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatAndMoistureTransport/Functions/Examples/phiSor.mos"
        "Simulate and plot"),
    Documentation(info="<html>
    <p> This example tests the implementation of
    <a href=\"modelica://BuildingSystems.HAM.HeatAndMoistureTransport.Functions.phiSor\">
    BuildingSystems.HAM.HeatAndMoistureTransport.Functions.phiSor</a>.
    </p>
    </html>", revisions="<html>
    <ul>
    <li>
    March 3, 2015, by Christoph Nytsch-Geusen:<br/>
    First implementation.
    </li>
    </ul>
    </html>"));
end phiSor;
