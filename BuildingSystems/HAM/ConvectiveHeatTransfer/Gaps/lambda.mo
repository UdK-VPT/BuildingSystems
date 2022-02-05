within BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps;
function lambda
  "Thermal conductivity of gases as function of the temperature"
  input Integer gas
    "Gas: 1:air, 2:argon, 3:krypton, 4:xenon, 5:SF6";
  input Modelica.Units.SI.Temperature T "TGas temperature";
  output Modelica.Units.SI.ThermalConductivity value "Thermal conductivity";
algorithm
  if gas == 1 then // air
    value := 4.377e-4 + 9.696e-5 * T - 3.728e-8 * T^2; // interpolation between 173.15 K and 523.15 K after VDI Waermeatlas Db 16-28
  elseif gas == 2 then // argon
    value := 2.7e-3 + 5.0e-5 * T;
  elseif gas == 3 then // krypton
    value := - 2.0e-3 + 6.0e-5 * T - 5.0e-8 * T^2; // interpolation between 263.15 and 293.15 K after DIN EN 673, table 1
  elseif gas == 4 then // xenon
    value := - 1.5e-3 + 3.0e-5 * T - 3.0e-8 * T^2; // interpolation between 263.15 and 293.15 K after DIN EN 673, table 1
  elseif gas == 5 then // SF6
    value := - 7.5e-3 + 6.0e-5 * T + 2.0e-8 * T^2; // interpolation between 263.15 and 293.15 K after DIN EN 673, table 1
  end if;

  annotation (Documentation(info="<html>
This function computes the heat conductivity of the gases air, argon, krypton, xenon and SF6, dependent
on the temperature <code>T</code>.
<h4>References</h4>
<p>
7th edition of VDI-Waermeatlas Db 16-28
</p>
</html>", revisions="<html>
<ul>
<li>
Jan 16, 2014 by Christoph Nytsch-Geusen:<br/>
First implementation.
</li>
</ul>
</html>"));
end lambda;
