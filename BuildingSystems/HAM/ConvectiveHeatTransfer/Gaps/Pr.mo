within BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps;
function Pr
  "Prandtl number of gases as function of the temperature"
  input Integer gas
    "Gas: 1:air, 2:argon, 3:krypton, 4:xenon, 5:SF6";
  input Modelica.Units.SI.Temperature T "Gas temperature";
  output Modelica.Units.SI.PrandtlNumber value "Prandtl number";
algorithm
  if gas == 1 then // air
    value := 8.345e-1 - 7.789e-4 * T + 1.669e-6 * T^2 - 1.564e-9 * T^3 + 6.196e-13 * T^4; // interpolation between 173.15 K and 523.15 K after VDI Waermeatlas Db 16-28
  elseif gas == 2 then // argon
    value := 7.429e-1 - 5.0e-4 * T + 9.0e-7 * T^2; // interpolation between 263.15 and 293.15 K after DIN EN 673, table 1
  elseif gas == 3 then // krypton
    value := 1.0115 - 2.4e-3 * T + 4e-6 * T^2; // interpolation between 263.15 and 293.15 K after DIN EN 673, table 1
  elseif gas == 4 then // xenon
    value := 8.573e-1 - 1.3e-3 * T + 2e-6 * T^2; // interpolation between 263.15 and 293.15 K after DIN EN 673, table 1
  elseif gas == 5 then // SF6
    value := 2.6544 - 1.13e2 * T + 2e-5 * T^2; // interpolation between 263.15 and 293.15 K after DIN EN 673, table 1
  end if;

  annotation (Documentation(info="<html>
This function computes the Prandtl number of the gases air, argon, krypton, xenon and SF6, dependent
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
end Pr;
