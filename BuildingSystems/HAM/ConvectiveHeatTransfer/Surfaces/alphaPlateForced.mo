within BuildingSystems.HAM.ConvectiveHeatTransfer.Surfaces;
function alphaPlateForced "Heat transfer by forced convection for plates"
  input Modelica.Units.SI.Velocity vAir;
  output Modelica.Units.SI.SurfaceCoefficientOfHeatTransfer value;
algorithm
  value := 1.8 + 4.8 * vAir;
end alphaPlateForced;
