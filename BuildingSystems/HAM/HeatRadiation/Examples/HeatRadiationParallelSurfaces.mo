within BuildingSystems.HAM.HeatRadiation.Examples;
model HeatRadiationParallelSurfaces
  "Test problem for heat radiation between two parallel surfaces"
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Emissivity epsilon1 = 0.9
    "Long-wave emission coefficient of surface 1";
  parameter Modelica.SIunits.Emissivity epsilon2 = 0.9
    "Long-wave emission coefficient of surface 2";
  parameter Modelica.SIunits.Temp_K T1 = 273.15 + 20.0
    "Temperature surface 1";
  Modelica.SIunits.Temp_K T2
    "Temperature surface 2";
  Modelica.SIunits.HeatFlux q_flow
    "Heat flux between surface 1 and surface 2";
equation
  T2 = 293.15 + 20.0 * Modelica.Math.sin(2.0*Modelica.Constants.pi*time/3600);
  q_flow = BuildingSystems.HAM.HeatRadiation.HeatRadiationTwoParallelSurfaces(T1,T2,epsilon1,epsilon2);
  annotation(experiment(StopTime=3600.0),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/HeatRadiation/Examples/HeatRadiationTwoParallelSurfaces.mos" "Simulate and plot"),
    Documentation(info="<html>
    <p> This example tests the implementation of
    <a href=\"modelica://BuildingSystems.HAM.HeatRadiation.HeatRadiationTwoParallelSurfaces\">
    BuildingSystems.HAM.HeatRadiation.HeatRadiationTwoParallelSurfaces</a>.
    </p>
    </html>", revisions="<html>
    <ul>
    <li>
    May 25, 2015, by Christoph Nytsch-Geusen:<br/>
    First implementation.
    </li>
    </ul>
    </html>"));
end HeatRadiationParallelSurfaces;
