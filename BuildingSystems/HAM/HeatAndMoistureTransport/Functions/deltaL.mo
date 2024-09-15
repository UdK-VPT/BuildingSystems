within BuildingSystems.HAM.HeatAndMoistureTransport.Functions;
function deltaL
  "Calculates the water vapour permeability"
  input Modelica.Units.SI.Temperature T;
  output BuildingSystems.Types.WaterVapourPermeability value;
protected
  Modelica.Units.SI.Pressure pL=101300;

algorithm
  value := 2.0e-7 * T^0.81 / pL;

  annotation (Documentation(info="<html>
<p>This function outputs the water vapour permeability dependent on the temperature.</p>
</html>", revisions="<html>
<ul>
<li>March 3, 2015, by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end deltaL;
