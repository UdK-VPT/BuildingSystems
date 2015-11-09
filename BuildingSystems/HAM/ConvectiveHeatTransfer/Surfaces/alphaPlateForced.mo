within BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces;
function alphaPlateForced "Heat transfer by forced convection for plates"
  input Modelica.SIunits.Velocity vAir;
  output Modelica.SIunits.SurfaceCoefficientOfHeatTransfer value;
algorithm
  value := 1.8 + 4.8 * vAir;
end alphaPlateForced;
