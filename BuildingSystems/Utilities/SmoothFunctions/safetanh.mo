within BuildingSystems.Utilities.SmoothFunctions;
function safetanh "Tanh with NaN catching"
  input Real x;
  output Real y;

algorithm
  y := if ((Modelica.Math.tanh(x) < -Modelica.Constants.inf) or (Modelica.Math.tanh(x) > Modelica.Constants.inf)) then sign(x) else Modelica.Math.tanh(x);
  annotation(Inline=true);
end safetanh;
