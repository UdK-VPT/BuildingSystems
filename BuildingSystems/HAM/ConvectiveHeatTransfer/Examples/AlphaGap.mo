within BuildingSystems.HAM.ConvectiveHeatTransfer.Examples;
model AlphaGap
  "Test problem for free convection within a gap"
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Length width = 0.02
    "Width of the gap";
  parameter Modelica.SIunits.Length height = 1.0
    "Height of the gap";
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaAir
    "Coefficient of heat transfer for convection within a gap filled with air";
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaArgon
    "Coefficient of heat transfer for convection within a gap filled with argon";
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaKrypton
    "Coefficient of heat transfer for convection within a gap filled with krypton";
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alphaXenon
    "Coefficient of heat transfer for convection within a gap filled with xenon";
  Modelica.SIunits.TemperatureDifference deltaT "Temperature difference";
equation
  deltaT = 2.0 * Modelica.Math.sin(2.0*Modelica.Constants.pi*time/3600);
  alphaAir = BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.alphaGap(293.15,293.15-deltaT,width,height,1);
  alphaArgon = BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.alphaGap(293.15,293.15-deltaT,width,height,2);
  alphaKrypton = BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.alphaGap(293.15,293.15-deltaT,width,height,3);
  alphaXenon = BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.alphaGap(293.15,293.15-deltaT,width,height,4);

  annotation(experiment(StopTime=3600.0),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/ConvectiveHeatTransfer/Examples/AlphaGap.mos" "Simulate and plot"),
    Documentation(info="<html>
    <p> This example tests the implementation of
    <a href=\"modelica://BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.alphaGap\">
    BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps.alphaGap</a>.
    </p>
    </html>", revisions="<html>
    <ul>
    <li>
    March 3, 2015, by Christoph Nytsch-Geusen:<br/>
    First implementation.
    </li>
    </ul>
    </html>"));
end AlphaGap;
