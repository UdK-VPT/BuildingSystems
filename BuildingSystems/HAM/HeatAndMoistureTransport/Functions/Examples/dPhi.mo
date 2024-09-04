within BuildingSystems.HAM.HeatAndMoistureTransport.Functions.Examples;
model dPhi "Test function dPhi"
  extends Modelica.Icons.Example;
  BuildingSystems.HAM.Data.MaterialProperties.HygroThermal.Beton material;
  parameter Modelica.Units.SI.MassConcentration w=50.0
    "Water content of the material";
  BuildingSystems.Types.RelativeHumidity phi
    "Relative Humidity of the material";
  Real dPhi "Derivative of the water content";

 Modelica.Blocks.Sources.Ramp ramp(
    height=1.1,
    duration=0.75,
    offset=0,
    startTime=0.25)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));

equation
  phi = ramp.y;
  dPhi = BuildingSystems.HAM.HeatAndMoistureTransport.Functions.dPhi(material.dwsTabX, material.dwsTabY,material.dwwTabX,material.dwwTabY, material.wF, w, 0.0,
    BuildingSystems.HAM.HeatAndMoistureTransport.Functions.wDerPhi(w, material.sorTabX, material.sorTabY, material.wF,phi, material.porosity));

  annotation (   experiment(StopTime=1.1),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatAndMoistureTransport/Functions/Examples/dPhi.mos"
        "Simulate and plot"),
    Documentation(info="<html>
    <p> This example tests the implementation of
    <a href=\"modelica://BuildingSystems.HAM.HeatAndMoistureTransport.Functions.dPhi\">
    BuildingSystems.HAM.HeatAndMoisture.Functions.dPhi</a>.
    </p>
    </html>", revisions="<html>
    <ul>
    <li>
    March 3, 2015, by Christoph Nytsch-Geusen:<br/>
    First implementation.
    </li>
    </ul>
    </html>"));
end dPhi;
