within BuildingSystems.HAM.ConvectiveHeatTransfer.Examples;
model AlphaPlateFree "Test problem for free convection on plate surfaces"
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Length height = 2.8;
  parameter Modelica.SIunits.Length width = 1.0;
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alpha0
    "Coefficient of heat transfer for convection (surface with an tilt angle of 0 degree)";
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alpha90
    "Coefficient of heat transfer for convection (surface with an tilt angle of 90 degree)";
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alpha180
    "Coefficient of heat transfer for convection (surface with an tilt angle of 180 degree)";
  Modelica.SIunits.SurfaceCoefficientOfHeatTransfer alpha45
    "Coefficient of heat transfer for convection (surface with an tilt angle of 45 degree)";
  Modelica.SIunits.TemperatureDifference deltaT "Temperature difference";

equation
  deltaT = 2.0 * Modelica.Math.sin(2.0*Modelica.Constants.pi*time/3600);
  alpha0 = BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateFree(deltaT,height,width, 0.0);
  alpha90 = BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateFree(deltaT,height,width, 90.0);
  alpha180 = BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateFree(deltaT,height,width, 180.0);
  alpha45 = BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateFree(deltaT,height,width, 45.0);
  annotation(    experiment(StopTime=3600.0),
    __Dymola_Commands(file="modelica://BuildingSystems/Resources/Scripts/Dymola/HAM/ConvectiveHeatTransfer/Examples/AlphaPlateFree.mos"
        "Simulate and plot"),
    Documentation(info="<html>
    <p> This example tests the implementation of
    <a href=\"modelica://BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateFree\">
    BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces.alphaPlateFree</a>.
    </p>
    </html>", revisions="<html>
    <ul>
    <li>
    March 3, 2015, by Christoph Nytsch-Geusen:<br/>
    First implementation.
    </li>
    </ul>
    </html>"));
end AlphaPlateFree;
