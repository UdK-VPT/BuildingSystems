within BuildingSystems.HAM.HeatAndMoistureTransport.Functions.Examples;
model myPhiMoist "Test function myPhiMoist"
  extends Modelica.Icons.Example;
  BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton material;
  BuildingSystems.Types.RelativeHumidity phi
    "Relative Humidity of the material";
  BuildingSystems.Types.WaterVapourDiffusionResistance  myPhiMoist
    "Water vapour diffusion coefficient";

  Modelica.Blocks.Sources.Ramp ramp(
    height=1.1,
    duration=0.75,
    offset=0,
    startTime=0.25)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

equation
  phi = ramp.y;
  myPhiMoist = BuildingSystems.HAM.HeatAndMoistureTransport.Functions.myPhiMoist(material.myTabX, material.myTabY, material.myDry, phi);

  annotation(Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}),graphics),
    experiment(StopTime=1.1),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatAndMoistureTransport/Functions/Examples/myPhiMoist.mos"
        "Simulate and plot"),
    Documentation(info="<html>
    <p> This example tests the implementation of
    <a href=\"modelica://BuildingSystems.HAM.HeatAndMoistureTransport.Functions.myPhiMoist\">
    BuildingSystems.HAM.HeatAndMoisture.Functions.myPhiMoist</a>.
    </p>
    </html>", revisions="<html>
    <ul>
    <li>
    March 3, 2015, by Christoph Nytsch-Geusen:<br/>
    First implementation.
    </li>
    </ul>
    </html>"));
end myPhiMoist;
