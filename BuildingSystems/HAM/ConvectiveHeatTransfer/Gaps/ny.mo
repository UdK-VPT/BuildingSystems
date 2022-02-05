within BuildingSystems.HAM.ConvectiveHeatTransfer.Gaps;
function ny
  "Kinematic viscosity of gases as function of the temperature"
  input Integer gas
    "Gas: 1:air, 2:argon, 3:krypton, 4:xenon, 5:SF6";
  input Modelica.Units.SI.Temperature T "Gas temperature";
  output Modelica.Units.SI.KinematicViscosity value "Kinematic viscosity";
algorithm
  if gas == 1 then // air
    value := - 2.968e-6 + 3.226e-8 * T + 1.034e-10 * T^2; // interpolation between 173.15 K and 523.15 K after VDI Waermeatlas Db 16-28
  elseif gas == 2 then // argon
    value := 3.0e-6 - 1.0e-8 * T + 2.0e-10 * T^2; // interpolation between 263.15 and 293.15 K after DIN EN 673, table 1
  elseif gas == 3 then // krypton
    value := 3.0e-6 - 2.0e-8 * T + 1.0e-10 * T^2; // interpolation between 1263.15 and 293.15 K after DIN EN 673, table 1
  elseif gas == 4 then // xenon
    value := - 3e-7 + 3e-9 * T + 4e-11 * T^2; // interpolation between 263.15 and 293.15 K after DIN EN 673, table 1
  elseif gas == 5 then // SF6
    value := 2.0e-6 - 2.0e-8 * T + 5.0e-11 * T^2; // interpolation between 263.15 and 293.15 K after DIN EN 673, table 1
  end if;

  annotation (Documentation(info="<html>
This function computes the kinematic viscosity of the gases air, argon, krypton, xenon and SF6, dependent
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
end ny;
